/**
 * OpenRouter API Client
 * Provides typed helpers for calling OpenRouter LLM endpoints.
 */

const OPENROUTER_BASE = "https://openrouter.ai/api/v1";

export interface OpenRouterMessage {
  role: "system" | "user" | "assistant";
  content: string;
}

export interface OpenRouterRequest {
  model?: string;
  messages: OpenRouterMessage[];
  temperature?: number;
  max_tokens?: number;
  stream?: boolean;
}

export interface OpenRouterResponse {
  id: string;
  model?: string;
  choices: {
    index: number;
    message: {
      role: string;
      content: string;
    };
    finish_reason: string;
  }[];
  usage: {
    prompt_tokens: number;
    completion_tokens: number;
    total_tokens: number;
  };
}

// Free / low-cost models good for fuel analysis
// See available free models at https://openrouter.ai/models?order=newest&q=free
export const MODELS = {
  FAST: "meta-llama/llama-3.3-70b-instruct:free",
  SMART: "deepseek/deepseek-chat:free",
  CHEAP: "google/gemini-2.0-flash-exp:free",
} as const;

/**
 * Call OpenRouter chat completions endpoint
 */
export async function callOpenRouter(
  request: OpenRouterRequest,
  options?: { signal?: AbortSignal }
): Promise<OpenRouterResponse> {
  const apiKey = process.env.OPENROUTER_API_KEY;
  if (!apiKey) {
    throw new Error(
      "OPENROUTER_API_KEY is not configured. Get your key at https://openrouter.ai/keys"
    );
  }

  const response = await fetch(`${OPENROUTER_BASE}/chat/completions`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${apiKey}`,
      "HTTP-Referer": "https://petroflow.ke",
      "X-OpenRouter-Title": "PetroFlow Kenya",
    },
    body: JSON.stringify({
      model: request.model || MODELS.SMART,
      messages: request.messages,
      temperature: request.temperature ?? 0.7,
      max_tokens: request.max_tokens ?? 1024,
      stream: false,
    }),
    signal: options?.signal,
  });

  if (!response.ok) {
    const errorBody = await response.text().catch(() => "unknown error");
    throw new Error(
      `OpenRouter API error (${response.status}): ${errorBody}`
    );
  }

  return response.json();
}

/**
 * Build the system prompt for fuel analysis context
 */
export function buildFuelSystemPrompt(
  context: {
    totalStations?: number;
    totalSubmissions?: number;
    avgPrices?: { name: string; avg: number; min: number; max: number }[];
    cheapestStation?: { name: string; price: number; fuel: string; city: string };
    trendData?: { fuel: string; change: number; direction: string }[];
    cities?: string[];
  }
): string {
  return `You are PetroFlow AI, a fuel price analysis assistant for Kenya. You help users understand fuel prices, find the best deals, and make informed decisions about where to fill up.

Kenya fuel pricing context:
- Prices are in KSh (Kenyan Shillings) per litre
- Common fuel types: Super Petrol, Diesel, Premium Petrol, Kerosene, LPG
- Major brands: TotalEnergies, Shell, Vivo Energy, Rubis, Kenol/Kobil, National Oil, Hashi Energy
- Kenya has 47 counties with varying fuel prices
- Fuel prices in Kenya are influenced by global oil prices, taxes, transport costs, and local competition

Current data snapshot:
${context.totalStations ? `- ${context.totalStations} stations tracked` : ""}
${context.totalSubmissions ? `- ${context.totalSubmissions} price reports submitted` : ""}
${context.cities?.length ? `- Active cities: ${context.cities.join(", ")}` : ""}
${
  context.avgPrices?.length
    ? `- Average prices:\n${context.avgPrices
        .map(
          (p) =>
            `  * ${p.name}: KSh ${p.avg.toFixed(2)} (range: KSh ${p.min.toFixed(2)} - KSh ${p.max.toFixed(2)})`
        )
        .join("\n")}`
    : ""
}
${
  context.cheapestStation
    ? `- Cheapest reported: ${context.cheapestStation.name} (${context.cheapestStation.city}) - ${context.cheapestStation.fuel} at KSh ${context.cheapestStation.price.toFixed(2)}/L`
    : ""
}
${
  context.trendData?.length
    ? `- Price trends (30 days):\n${context.trendData
        .map((t) => `  * ${t.fuel}: ${t.direction} ${t.change.toFixed(1)}%`)
        .join("\n")}`
    : ""
}

When giving advice:
- Provide specific, actionable recommendations
- Mention actual station names and locations when available
- Consider the user's location if provided
- Keep responses concise but informative (2-4 paragraphs)
- Be friendly and helpful, like a knowledgeable local
- Use KSh for all prices
- Suggest specific fuel-saving tips relevant to Kenya`;
}
