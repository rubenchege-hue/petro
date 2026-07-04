import { NextRequest, NextResponse } from "next/server";
import { callOpenRouter, buildFuelSystemPrompt, MODELS } from "@/lib/openrouter";

interface ChatRequest {
  message: string;
  history?: { role: "user" | "assistant"; content: string }[];
  context?: {
    totalStations?: number;
    totalSubmissions?: number;
    avgPrices?: { name: string; avg: number; min: number; max: number }[];
    cheapestStation?: { name: string; price: number; fuel: string; city: string };
    trendData?: { fuel: string; change: number; direction: string }[];
    cities?: string[];
    userCity?: string;
    userCounty?: string;
  };
  model?: string;
}

export async function POST(request: NextRequest) {
  try {
    const body: ChatRequest = await request.json();

    if (!body.message?.trim()) {
      return NextResponse.json(
        { error: "Message is required" },
        { status: 400 }
      );
    }

    // Check API key
    if (!process.env.OPENROUTER_API_KEY) {
      return NextResponse.json(
        {
          error:
            "OpenRouter API key not configured. Add OPENROUTER_API_KEY to your .env.local file.",
          reply:
            "I can't connect to my AI backend right now. Once you add your OpenRouter API key, I'll be able to give you personalized fuel insights! In the meantime, check the AI Insights section for data-driven recommendations.",
        },
        { status: 200 }
      );
    }

    const systemPrompt = buildFuelSystemPrompt({
      totalStations: body.context?.totalStations,
      totalSubmissions: body.context?.totalSubmissions,
      avgPrices: body.context?.avgPrices,
      cheapestStation: body.context?.cheapestStation,
      trendData: body.context?.trendData,
      cities: body.context?.cities,
    });

    // Add user location context if available
    const locationContext =
      body.context?.userCity || body.context?.userCounty
        ? `\n\nThe user is located in ${[
            body.context?.userCity,
            body.context?.userCounty,
          ]
            .filter(Boolean)
            .join(", ")}. Consider nearby options when relevant.`
        : "";

    const messages = [
      { role: "system" as const, content: systemPrompt + locationContext },
      ...(body.history?.slice(-6) || []).map((m) => ({
        role: m.role as "user" | "assistant",
        content: m.content,
      })),
      { role: "user" as const, content: body.message },
    ];

    const response = await callOpenRouter({
      model: body.model || MODELS.FAST,
      messages,
      temperature: 0.7,
      max_tokens: 1024,
    });

    const reply = response.choices?.[0]?.message?.content || "";

    return NextResponse.json({
      reply,
      model: response.model || body.model,
      usage: response.usage,
    });
  } catch (error) {
    console.error("AI Chat error:", error);
    return NextResponse.json(
      {
        error: error instanceof Error ? error.message : "Chat failed",
        reply:
          "Sorry, I hit an error processing your request. Please try again or check your OpenRouter configuration.",
      },
      { status: 200 }
    );
  }
}
