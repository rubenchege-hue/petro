import { NextRequest, NextResponse } from "next/server";
import { callOpenRouter, buildFuelSystemPrompt, MODELS } from "@/lib/openrouter";

interface InsightRequest {
  totalStations?: number;
  totalSubmissions?: number;
  avgPrices?: { name: string; avg: number; min: number; max: number }[];
  cheapestStation?: { name: string; price: number; fuel: string; city: string };
  trendData?: { fuel: string; change: number; direction: string }[];
  cities?: string[];
  userQuery?: string;
  model?: string;
}

export async function POST(request: NextRequest) {
  try {
    const body: InsightRequest = await request.json();

    // Validate API key is configured
    if (!process.env.OPENROUTER_API_KEY) {
      return NextResponse.json(
        {
          error:
            "OpenRouter API key not configured. Add OPENROUTER_API_KEY to your .env.local file.",
          fallback: true,
        },
        { status: 200 }
      );
    }

    const systemPrompt = buildFuelSystemPrompt({
      totalStations: body.totalStations,
      totalSubmissions: body.totalSubmissions,
      avgPrices: body.avgPrices,
      cheapestStation: body.cheapestStation,
      trendData: body.trendData,
      cities: body.cities,
    });

    const userMessage = body.userQuery ||
      "Analyze the current fuel price data and give me 5-7 actionable insights. " +
      "Include: cheapest stations to fill up, any noticeable price trends, " +
      "brand comparisons, fuel type recommendations, and money-saving tips. " +
      "Format each insight as a separate section with a clear title.";

    const response = await callOpenRouter({
      model: body.model || MODELS.SMART,
      messages: [
        { role: "system", content: systemPrompt },
        {
          role: "user",
          content: userMessage,
        },
      ],
      temperature: 0.7,
      max_tokens: 2048,
    });

    const content = response.choices?.[0]?.message?.content || "";

    // Parse insights from AI response
    const insights = parseInsights(content, body);

    return NextResponse.json({
      insights,
      raw: content,
      model: response.model || body.model,
      usage: response.usage,
    });
  } catch (error) {
    console.error("AI Insights error:", error);
    return NextResponse.json(
      {
        error: error instanceof Error ? error.message : "Failed to generate insights",
        fallback: true,
      },
      { status: 200 }
    );
  }
}

/**
 * Parse AI response into structured insight objects
 */
function parseInsights(
  content: string,
  context: InsightRequest
): {
  title: string;
  description: string;
  type: "savings" | "prediction" | "tip" | "comparison" | "alert";
  impact?: string;
}[] {
  const sections = content
    .split(/(?=##|###|\*\*[^*]+\*\*|^\d+\.)/m)
    .filter((s) => s.trim().length > 20);

  if (sections.length < 2) {
    // Fallback: generate rule-based insights if AI response isn't structured
    return generateFallbackInsights(context);
  }

  return sections.slice(0, 7).map((section) => {
    const lines = section
      .split("\n")
      .map((l) => l.trim())
      .filter(Boolean);
    const title = lines[0]
      ?.replace(/^##\s*/, "")
      .replace(/^###\s*/, "")
      .replace(/^\*\*/, "")
      .replace(/\*\*$/, "")
      .replace(/^\d+\.\s*/, "")
      .trim();
    const description = lines.slice(1).join(" ").trim();

    const type = inferType(title + " " + description);
    const impact = extractImpact(description);

    return {
      title: title || "Fuel Insight",
      description:
        description || "AI-generated fuel price insight based on community data.",
      type,
      impact,
    };
  });
}

function inferType(text: string): "savings" | "prediction" | "tip" | "comparison" | "alert" {
  const lower = text.toLowerCase();
  if (lower.includes("save") || lower.includes("cheapest") || lower.includes("best deal") || lower.includes("lowest"))
    return "savings";
  if (lower.includes("trend") || lower.includes("rising") || lower.includes("dropping") || lower.includes("increase") || lower.includes("decrease"))
    return "prediction";
  if (lower.includes("tip") || lower.includes("advice") || lower.includes("recommend") || lower.includes("should") || lower.includes("try"))
    return "tip";
  if (lower.includes("compare") || lower.includes("vs") || lower.includes("versus") || lower.includes("difference"))
    return "comparison";
  if (lower.includes("warning") || lower.includes("alert") || lower.includes("careful") || lower.includes("attention"))
    return "alert";
  return "tip";
}

function extractImpact(text: string): string | undefined {
  const patterns = [
    /save\s+(up\s+to\s+)?(KSh\s*\d+)/i,
    /KSh\s*\d+[\.,]?\d*/,
    /(\d+\.?\d*)\s*%/,
    /(\d+)\s*kilometers?/i,
  ];
  for (const pattern of patterns) {
    const match = text.match(pattern);
    if (match) return match[0];
  }
  return undefined;
}

/**
 * Generate fallback rule-based insights when AI is unavailable
 */
function generateFallbackInsights(context: InsightRequest) {
  const insights: ReturnType<typeof parseInsights> = [];

  if (context.cheapestStation) {
    insights.push({
      type: "savings",
      title: `💪 Cheapest: ${context.cheapestStation.name}`,
      description: `${context.cheapestStation.name} in ${context.cheapestStation.city} offers ${context.cheapestStation.fuel} at KSh ${context.cheapestStation.price.toFixed(2)}/L — the best reported price.`,
      impact: `KSh ${context.cheapestStation.price.toFixed(2)}/L`,
    });
  }

  if (context.trendData?.length) {
    context.trendData.slice(0, 2).forEach((t) => {
      insights.push({
        type: t.direction === "up" ? "alert" : "prediction",
        title: `${t.direction === "up" ? "📈" : "📉"} ${t.fuel} ${t.direction === "up" ? "Rising" : "Dropping"}`,
        description: `${t.fuel} prices have moved ${t.direction} by ${Math.abs(t.change).toFixed(1)}% over 30 days. ${t.direction === "up" ? "Consider filling up soon." : "Good time to fill up."}`,
        impact: `${t.change > 0 ? "+" : ""}${t.change.toFixed(1)}%`,
      });
    });
  }

  if (context.avgPrices?.length) {
    const diesel = context.avgPrices.find((p) => p.name.toLowerCase().includes("diesel"));
    const petrol = context.avgPrices.find((p) => p.name.toLowerCase().includes("petrol"));
    if (diesel && petrol) {
      const diff = petrol.avg - diesel.avg;
      insights.push({
        type: "comparison",
        title: "⚡ Diesel vs Petrol",
        description: `Diesel is KSh ${Math.abs(diff).toFixed(2)} ${diff > 0 ? "cheaper" : "more expensive"} than Super Petrol on average. Diesel users save significantly per litre.`,
        impact: `Diff: KSh ${Math.abs(diff).toFixed(2)}/L`,
      });
    }
  }

  insights.push({
    type: "tip",
    title: "💡 Fuel Saving Tip",
    description: "Check your tyre pressure monthly — under-inflated tyres increase fuel consumption by up to 3%. Also, avoid aggressive acceleration and maintain steady speeds on highways.",
    impact: "Save up to 3%",
  });

  if (insights.length < 3) {
    insights.push({
      type: "tip",
      title: "📊 Help Improve AI Insights",
      description: "The more fuel prices our community reports, the smarter AI insights become. Share prices you see at the pump!",
      impact: "Community power",
    });
  }

  return insights;
}
