"use client";

import { useState, useRef, useEffect } from "react";
import { clsx } from "clsx";
import {
  Send,
  Bot,
  User,
  Loader2,
  AlertCircle,
  MessageSquare,
  Sparkles,
  Fuel,
  MapPin,
} from "lucide-react";
import type { LatestPrice, AvgPriceRecent, DailyPriceTrend } from "@/types";

interface Message {
  role: "user" | "assistant";
  content: string;
  id: string;
}

interface AIChatProps {
  prices: LatestPrice[];
  avgPrices: AvgPriceRecent[];
  trends: DailyPriceTrend[];
  userLocation?: { lat: number; lng: number } | null;
  userCity?: string;
  userCounty?: string;
  className?: string;
}

const SUGGESTED_QUESTIONS = [
  "Where is the cheapest Super Petrol right now?",
  "Are fuel prices going up or down?",
  "Which brand has the best prices?",
  "Give me tips to save on fuel",
  "Compare diesel vs petrol prices",
  "What's the fuel price trend this month?",
];

export default function AIChat({
  prices,
  avgPrices,
  trends,
  userLocation,
  userCity,
  userCounty,
  className,
}: AIChatProps) {
  const [messages, setMessages] = useState<Message[]>([
    {
      role: "assistant",
      content:
        "👋 Hey! I'm PetroFlow AI, your fuel price assistant for Kenya. Ask me anything about fuel prices, stations, or saving money on fuel!",
      id: "welcome",
    },
  ]);
  const [input, setInput] = useState("");
  const [sending, setSending] = useState(false);
  const [showSuggestions, setShowSuggestions] = useState(true);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  const handleSend = async (message?: string) => {
    const text = (message || input).trim();
    if (!text || sending) return;

    setInput("");
    setShowSuggestions(false);

    const userMsg: Message = {
      role: "user",
      content: text,
      id: `user-${Date.now()}`,
    };
    setMessages((prev) => [...prev, userMsg]);
    setSending(true);

    try {
      // Build context from data
      const avgPriceData = avgPrices.map((a) => ({
        name: a.fuel_type_name,
        avg: Number(a.avg_price),
        min: Number(a.min_price),
        max: Number(a.max_price),
      }));

      const cheapest = [...prices].sort((a, b) => a.price - b.price)[0];

      const trendData = (() => {
        const byFuel = trends.reduce(
          (acc, t) => {
            if (!acc[t.fuel_type_slug]) acc[t.fuel_type_slug] = [];
            acc[t.fuel_type_slug].push(t);
            return acc;
          },
          {} as Record<string, DailyPriceTrend[]>
        );
        return Object.entries(byFuel).map(([slug, vals]) => {
          const sorted = vals.sort(
            (a, b) => new Date(a.date).getTime() - new Date(b.date).getTime()
          );
          const first = sorted[0]?.avg_price || 0;
          const last = sorted[sorted.length - 1]?.avg_price || 0;
          return {
            fuel: sorted[0]?.fuel_type_name || slug,
            change: ((last - first) / first) * 100,
            direction: last >= first ? "up" : "down",
          };
        });
      })();

      const response = await fetch("/api/ai/chat", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          message: text,
          history: messages
            .filter((m) => m.id !== "welcome")
            .slice(-6)
            .map((m) => ({ role: m.role, content: m.content })),
          context: {
            totalStations: new Set(prices.map((p) => p.station_id)).size,
            totalSubmissions: prices.length,
            avgPrices: avgPriceData,
            cheapestStation: cheapest
              ? {
                  name: cheapest.station_name,
                  price: cheapest.price,
                  fuel: cheapest.fuel_type_name,
                  city: cheapest.city,
                }
              : undefined,
            trendData,
            cities: [...new Set(prices.map((p) => p.city))].slice(0, 10),
            userCity: userCity,
            userCounty: userCounty,
          },
        }),
      });

      const data = await response.json();

      const assistantMsg: Message = {
        role: "assistant",
        content:
          data.reply ||
          "Sorry, I couldn't process that. Please try asking differently.",
        id: `ai-${Date.now()}`,
      };
      setMessages((prev) => [...prev, assistantMsg]);
    } catch (err) {
      setMessages((prev) => [
        ...prev,
        {
          role: "assistant",
          content:
            "Sorry, I encountered an error. Please check your OpenRouter API key configuration.",
          id: `error-${Date.now()}`,
        },
      ]);
    } finally {
      setSending(false);
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  };

  return (
    <div className={clsx("glass-card flex flex-col overflow-hidden", className)}>
      {/* Header */}
      <div className="p-4 border-b border-surface-700/30 flex items-center gap-3">
        <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-fuel-500/20 to-purple-500/20 border border-fuel-500/20 flex items-center justify-center">
          <Bot className="w-5 h-5 text-fuel-400" />
        </div>
        <div>
          <div className="flex items-center gap-2">
            <h3 className="font-semibold text-surface-200 text-sm">
              PetroFlow AI Chat
            </h3>
            <span className="badge-blue text-[10px] px-1.5 py-0.5">
              <Sparkles className="w-3 h-3 inline mr-0.5" />
              OpenRouter
            </span>
          </div>
          <p className="text-xs text-surface-500">
            Ask anything about fuel prices in Kenya
          </p>
        </div>
      </div>

      {/* Messages */}
      <div className="flex-1 overflow-y-auto custom-scrollbar p-4 space-y-4 min-h-[300px] max-h-[500px]">
        {messages.map((msg) => (
          <div
            key={msg.id}
            className={clsx(
              "flex items-start gap-3 animate-fade-in",
              msg.role === "user" ? "flex-row-reverse" : ""
            )}
          >
            {/* Avatar */}
            <div
              className={clsx(
                "w-8 h-8 rounded-xl flex items-center justify-center shrink-0 mt-0.5",
                msg.role === "user"
                  ? "bg-fuel-500/15 border border-fuel-500/20"
                  : "bg-purple-500/15 border border-purple-500/20"
              )}
            >
              {msg.role === "user" ? (
                <User className="w-4 h-4 text-fuel-400" />
              ) : (
                <Bot className="w-4 h-4 text-purple-400" />
              )}
            </div>

            {/* Message bubble */}
            <div
              className={clsx(
                "max-w-[80%] rounded-2xl px-4 py-3 text-sm leading-relaxed",
                msg.role === "user"
                  ? "bg-fuel-500/10 border border-fuel-500/20 text-surface-200"
                  : "bg-surface-800/60 border border-surface-700/30 text-surface-300"
              )}
            >
              <p className="whitespace-pre-wrap">{msg.content}</p>
            </div>
          </div>
        ))}

        {sending && (
          <div className="flex items-start gap-3">
            <div className="w-8 h-8 rounded-xl bg-purple-500/15 border border-purple-500/20 flex items-center justify-center shrink-0">
              <Bot className="w-4 h-4 text-purple-400" />
            </div>
            <div className="bg-surface-800/60 border border-surface-700/30 rounded-2xl px-4 py-3">
              <Loader2 className="w-4 h-4 text-fuel-400 animate-spin" />
            </div>
          </div>
        )}

        <div ref={messagesEndRef} />
      </div>

      {/* Suggested questions */}
      {showSuggestions && messages.length <= 1 && (
        <div className="px-4 pb-2">
          <p className="text-xs text-surface-500 mb-2 flex items-center gap-1">
            <MessageSquare className="w-3 h-3" />
            Try asking:
          </p>
          <div className="flex flex-wrap gap-2">
            {SUGGESTED_QUESTIONS.map((q) => (
              <button
                key={q}
                onClick={() => handleSend(q)}
                className="text-xs bg-surface-800/60 hover:bg-surface-700/60 border border-surface-700/30 rounded-lg px-3 py-1.5 text-surface-400 hover:text-surface-200 transition-all"
              >
                {q}
              </button>
            ))}
          </div>
        </div>
      )}

      {/* Input */}
      <div className="p-4 border-t border-surface-700/30">
        <div className="flex items-center gap-2">
          <input
            type="text"
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="Ask about fuel prices..."
            disabled={sending}
            className="input-field flex-1"
          />
          <button
            onClick={() => handleSend()}
            disabled={!input.trim() || sending}
            className="btn-primary !py-2.5 !px-3"
          >
            {sending ? (
              <Loader2 className="w-4 h-4 animate-spin" />
            ) : (
              <Send className="w-4 h-4" />
            )}
          </button>
        </div>
        <p className="text-[10px] text-surface-600 mt-1.5 text-center">
          Powered by OpenRouter AI · Responses are AI-generated
        </p>
      </div>
    </div>
  );
}
