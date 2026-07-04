"use client";

import { useState, useEffect, useCallback } from "react";
import { clsx } from "clsx";
import {
  Lightbulb,
  TrendingDown,
  AlertTriangle,
  Fuel,
  Zap,
  BarChart3,
  Brain,
  Star,
  RefreshCw,
  Sparkles,
  Loader2,
  WifiOff,
} from "lucide-react";
import type { LatestPrice, AvgPriceRecent, DailyPriceTrend, AISuggestion } from "@/types";
import { formatKES } from "@/types";

interface AISuggestionsProps {
  prices: LatestPrice[];
  avgPrices: AvgPriceRecent[];
  trends: DailyPriceTrend[];
  userLocation?: { lat: number; lng: number } | null;
  className?: string;
}

interface Insight {
  title: string;
  description: string;
  type: "savings" | "prediction" | "tip" | "comparison" | "alert";
  impact?: string;
}

export default function AISuggestions({
  prices,
  avgPrices,
  trends,
  userLocation,
  className,
}: AISuggestionsProps) {
  const [insights, setInsights] = useState<Insight[]>([]);
  const [loading, setLoading] = useState(true);
  const [usingAI, setUsingAI] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchInsights = useCallback(async () => {
    setLoading(true);
    setError(null);

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
          const change = ((last - first) / first) * 100;
          return {
            fuel: sorted[0]?.fuel_type_name || slug,
            change,
            direction: change >= 0 ? "up" : "down",
          };
        });
      })();

      const cities = [...new Set(prices.map((p) => p.city))].slice(0, 10);

      // Call our API route (which uses OpenRouter)
      const response = await fetch("/api/ai/insights", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
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
          cities,
        }),
      });

      const data = await response.json();

      if (data.insights?.length) {
        setInsights(data.insights);
        setUsingAI(!data.fallback);
      } else {
        // Fallback to client-side rule-based insights
        setInsights(generateFallbackInsights(prices, avgPrices, trends, userLocation));
        setUsingAI(false);
      }
    } catch (err) {
      console.error("Failed to fetch AI insights:", err);
      setError("Could not reach AI service");
      // Fallback to rule-based
      setInsights(generateFallbackInsights(prices, avgPrices, trends, userLocation));
      setUsingAI(false);
    } finally {
      setLoading(false);
    }
  }, [prices, avgPrices, trends, userLocation]);

  useEffect(() => {
    fetchInsights();
  }, [fetchInsights]);

  const getTypeIcon = (type: Insight["type"]) => {
    switch (type) {
      case "savings":
        return TrendingDown;
      case "prediction":
        return BarChart3;
      case "tip":
        return Lightbulb;
      case "comparison":
        return Zap;
      case "alert":
        return AlertTriangle;
    }
  };

  const getTypeColor = (type: Insight["type"]) => {
    switch (type) {
      case "savings":
        return "text-petro-400 bg-petro-500/10 border-petro-500/20";
      case "prediction":
        return "text-blue-400 bg-blue-500/10 border-blue-500/20";
      case "tip":
        return "text-fuel-400 bg-fuel-500/10 border-fuel-500/20";
      case "comparison":
        return "text-purple-400 bg-purple-500/10 border-purple-500/20";
      case "alert":
        return "text-red-400 bg-red-500/10 border-red-500/20";
    }
  };

  return (
    <div className={clsx("space-y-4", className)}>
      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2.5">
          <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-fuel-500/20 to-purple-500/20 border border-fuel-500/20 flex items-center justify-center">
            <Brain className="w-4.5 h-4.5 text-fuel-400" />
          </div>
          <div>
            <div className="flex items-center gap-2">
              <h2 className="section-title">AI Fuel Insights</h2>
              {usingAI && (
                <span className="badge-blue text-[10px] px-1.5 py-0.5">
                  <Sparkles className="w-3 h-3 inline mr-0.5" />
                  AI
                </span>
              )}
              {!usingAI && !loading && (
                <span className="badge-neutral text-[10px] px-1.5 py-0.5">
                  <BarChart3 className="w-3 h-3 inline mr-0.5" />
                  Data
                </span>
              )}
            </div>
            <p className="text-xs text-surface-500">
              {usingAI
                ? "AI-powered analysis via OpenRouter"
                : "Smart recommendations based on community data"}
            </p>
          </div>
        </div>
        <button
          onClick={fetchInsights}
          disabled={loading}
          className="btn-secondary !px-3 !py-1.5 text-xs"
        >
          <RefreshCw className={clsx("w-3.5 h-3.5", loading && "animate-spin")} />
          Refresh
        </button>
      </div>

      {/* Loading state */}
      {loading && (
        <div className="glass-card p-8 text-center">
          <Loader2 className="w-8 h-8 text-fuel-400 animate-spin mx-auto mb-3" />
          <p className="text-sm text-surface-400">Generating AI insights...</p>
          <p className="text-xs text-surface-500 mt-1">
            Analyzing {prices.length} price reports
          </p>
        </div>
      )}

      {/* Error notice */}
      {error && !loading && (
        <div className="p-3 rounded-xl bg-yellow-500/10 border border-yellow-500/20 flex items-start gap-2">
          <WifiOff className="w-4 h-4 text-yellow-400 mt-0.5 shrink-0" />
          <p className="text-xs text-yellow-300">
            {error}. Showing data-driven insights instead.
          </p>
        </div>
      )}

      {/* Insights */}
      {!loading && insights.length === 0 && (
        <div className="glass-card p-8 text-center">
          <Brain className="w-12 h-12 text-surface-600 mx-auto mb-3" />
          <p className="text-sm text-surface-400">
            Not enough data for analysis yet.
          </p>
          <p className="text-xs text-surface-500 mt-1">
            More price reports will unlock smarter insights.
          </p>
        </div>
      )}

      {!loading && insights.length > 0 && (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {insights.map((insight, i) => {
            const Icon = getTypeIcon(insight.type);
            return (
              <div
                key={i}
                className={clsx(
                  "glass-card-hover p-5 border-l-2 transition-all duration-300",
                  insight.type === "savings" && "border-l-petro-500",
                  insight.type === "prediction" && "border-l-blue-500",
                  insight.type === "tip" && "border-l-fuel-500",
                  insight.type === "comparison" && "border-l-purple-500",
                  insight.type === "alert" && "border-l-red-500"
                )}
              >
                <div className="flex items-start gap-3">
                  <div
                    className={clsx(
                      "w-10 h-10 rounded-xl flex items-center justify-center shrink-0 border",
                      getTypeColor(insight.type)
                    )}
                  >
                    <Icon className="w-5 h-5" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <h3 className="font-semibold text-surface-200 text-sm mb-1">
                      {insight.title}
                    </h3>
                    <p className="text-xs text-surface-400 leading-relaxed">
                      {insight.description}
                    </p>
                    {insight.impact && (
                      <div className="flex items-center gap-1.5 mt-2">
                        <Star className="w-3 h-3 text-fuel-400" />
                        <span className="text-xs font-medium text-fuel-400">
                          {insight.impact}
                        </span>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}

/**
 * Fallback rule-based insights when OpenRouter API is unavailable
 */
function generateFallbackInsights(
  prices: LatestPrice[],
  avgPrices: AvgPriceRecent[],
  trends: DailyPriceTrend[],
  userLocation?: { lat: number; lng: number } | null
): Insight[] {
  const result: Insight[] = [];

  if (!prices.length) {
    result.push({
      type: "tip",
      title: "No Data Yet — Be the First!",
      description:
        "There are no fuel price reports yet. Contribute the first price report and help your community!",
      impact: "Community building",
    });
    return result;
  }

  // Cheapest station overall
  const cheapest = [...prices].sort((a, b) => a.price - b.price)[0];
  if (cheapest) {
    result.push({
      type: "savings",
      title: `🔥 Lowest Price: ${cheapest.station_name}`,
      description: `${cheapest.station_name} in ${cheapest.city} offers ${cheapest.fuel_type_name} at ${formatKES(cheapest.price)}/L — the cheapest reported price nationwide.`,
      impact: `KSh ${cheapest.price.toFixed(2)}/L`,
    });
  }

  // Price trend predictions
  if (trends.length >= 5) {
    const byFuel = trends.reduce(
      (acc, t) => {
        if (!acc[t.fuel_type_slug]) acc[t.fuel_type_slug] = [];
        acc[t.fuel_type_slug].push(t);
        return acc;
      },
      {} as Record<string, DailyPriceTrend[]>
    );

    Object.entries(byFuel).forEach(([slug, fuelTrends]) => {
      const sorted = fuelTrends.sort(
        (a, b) => new Date(a.date).getTime() - new Date(b.date).getTime()
      );
      const first = sorted[0]?.avg_price || 0;
      const last = sorted[sorted.length - 1]?.avg_price || 0;
      const change = ((last - first) / first) * 100;
      const name = sorted[0]?.fuel_type_name || slug;

      if (Math.abs(change) > 1) {
        result.push({
          type: change > 0 ? "alert" : "prediction",
          title: `${change > 0 ? "📈" : "📉"} ${name} ${change > 0 ? "Rising" : "Dropping"}`,
          description: `${name} has ${change > 0 ? "increased" : "dropped"} by ${Math.abs(change).toFixed(1)}% over ${sorted.length} days. ${change > 0 ? "Consider filling up soon." : "Good time to fill up."}`,
          impact: `${change > 0 ? "+" : ""}${change.toFixed(1)}%`,
        });
      }
    });
  }

  // Diesel vs Petrol
  const diesel = avgPrices.find((a) => a.fuel_type_slug === "diesel");
  const petrol = avgPrices.find((a) => a.fuel_type_slug === "super-petrol");
  if (diesel && petrol) {
    const diff = petrol.avg_price - diesel.avg_price;
    result.push({
      type: "comparison",
      title: "⚡ Diesel vs Petrol Analysis",
      description: `Diesel is ${formatKES(Math.abs(diff))} ${diff > 0 ? "cheaper" : "more expensive"} than Super Petrol on average. ${diff > 0 ? "Diesel users are saving significantly!" : ""}`,
      impact: `Diff: ${formatKES(Math.abs(diff))}/L`,
    });
  }

  // Brand comparison
  const brandPrices = prices.reduce(
    (acc, p) => {
      const brand = p.brand || "Other";
      if (!acc[brand]) acc[brand] = [];
      acc[brand].push(p.price);
      return acc;
    },
    {} as Record<string, number[]>
  );
  const brandAvgs = Object.entries(brandPrices)
    .map(([brand, ps]) => ({
      brand,
      avg: ps.reduce((s, p) => s + p, 0) / ps.length,
      count: ps.length,
    }))
    .filter((b) => b.count >= 3)
    .sort((a, b) => a.avg - b.avg);

  if (brandAvgs.length >= 2) {
    const diff = brandAvgs[brandAvgs.length - 1].avg - brandAvgs[0].avg;
    if (diff > 5) {
      result.push({
        type: "comparison",
        title: "🏪 Brand Price Comparison",
        description: `${brandAvgs[0].brand} averages ${formatKES(brandAvgs[0].avg)}/L — ${formatKES(diff)} less than ${brandAvgs[brandAvgs.length - 1].brand}.`,
        impact: `Save ${formatKES(diff)}/L`,
      });
    }
  }

  // Fuel tip
  result.push({
    type: "tip",
    title: "💡 Fuel Saving Tip",
    description: "Check tyre pressure monthly — under-inflated tyres can increase fuel consumption by up to 3%. Also avoid speeding above 80 km/h on highways.",
    impact: "Save up to 3%",
  });

  return result;
}
