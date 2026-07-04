"use client";

import { useState, useEffect } from "react";
import {
  Brain,
  Sparkles,
  TrendingUp,
  Fuel,
  MapPin,
  Crosshair,
  Loader2,
  ChevronRight,
  MessageSquare,
} from "lucide-react";
import AISuggestions from "@/components/AISuggestions";
import AIChat from "@/components/AIChat";
import StatsCard from "@/components/StatsCard";
import {
  getLatestPrices,
  getAvgPricesRecent,
  getDailyPriceTrends,
} from "@/lib/supabase";
import type { LatestPrice, AvgPriceRecent, DailyPriceTrend } from "@/types";
import { formatKES } from "@/types";
import Link from "next/link";

export default function AIPage() {
  const [prices, setPrices] = useState<LatestPrice[]>([]);
  const [avgPrices, setAvgPrices] = useState<AvgPriceRecent[]>([]);
  const [trends, setTrends] = useState<DailyPriceTrend[]>([]);
  const [loading, setLoading] = useState(true);
  const [userLocation, setUserLocation] = useState<{
    lat: number;
    lng: number;
  } | null>(null);
  const [userCity, setUserCity] = useState<string>("");
  const [userCounty, setUserCounty] = useState<string>("");
  const [gettingLocation, setGettingLocation] = useState(false);

  useEffect(() => {
    async function load() {
      try {
        const [pricesData, avgData, trendsData] = await Promise.all([
          getLatestPrices({ limit: 500 }),
          getAvgPricesRecent(),
          getDailyPriceTrends(),
        ]);
        setPrices(pricesData);
        setAvgPrices(avgData);
        setTrends(trendsData);
      } catch (err) {
        console.error("Failed to load AI data:", err);
      } finally {
        setLoading(false);
      }
    }
    load();
  }, []);

  const handleGetLocation = () => {
    if (!navigator.geolocation) return;
    setGettingLocation(true);
    navigator.geolocation.getCurrentPosition(
      async (pos) => {
        setUserLocation({
          lat: pos.coords.latitude,
          lng: pos.coords.longitude,
        });
        // Reverse geocode for city/county
        try {
          const res = await fetch(
            `https://nominatim.openstreetmap.org/reverse?format=json&lat=${pos.coords.latitude}&lon=${pos.coords.longitude}&addressdetails=1`,
            { headers: { "Accept-Language": "en" } }
          );
          const data = await res.json();
          const addr = data.address || {};
          setUserCity(addr.city || addr.town || addr.village || "");
          setUserCounty(addr.county || addr.state || "");
        } catch {
          // Silently fail for reverse geocoding
        }
        setGettingLocation(false);
      },
      () => setGettingLocation(false),
      { enableHighAccuracy: true, timeout: 10000 }
    );
  };

  if (loading) {
    return (
      <div className="page-container flex items-center justify-center min-h-screen">
        <div className="flex flex-col items-center gap-4">
          <div className="w-12 h-12 border-2 border-fuel-500/30 border-t-fuel-500 rounded-full animate-spin" />
          <p className="text-surface-400 text-sm animate-pulse">
            Loading AI insights...
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="page-container space-y-8 animate-fade-in pb-16">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2.5 mb-2">
            <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-fuel-500/20 to-purple-500/20 border border-fuel-500/20 flex items-center justify-center">
              <Brain className="w-4.5 h-4.5 text-fuel-400" />
            </div>
            <span className="text-xs font-semibold text-fuel-400 uppercase tracking-wider">
              AI Powered
            </span>
          </div>
          <h1 className="page-title">Smart Fuel Insights</h1>
          <p className="page-subtitle">
            AI-powered analysis via OpenRouter · Ask questions, get insights,
            save money
          </p>
        </div>
        <div className="flex items-center gap-2">
          <button
            onClick={handleGetLocation}
            disabled={gettingLocation}
            className="btn-primary shrink-0"
          >
            {gettingLocation ? (
              <>
                <Loader2 className="w-4 h-4 animate-spin" />
                Detecting...
              </>
            ) : userLocation ? (
              <>
                <MapPin className="w-4 h-4" />
                {userCity || "Location Active"}
              </>
            ) : (
              <>
                <Crosshair className="w-4 h-4" />
                Enable Location
              </>
            )}
          </button>
        </div>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <StatsCard
          title="Data Points Analyzed"
          value={prices.length}
          subtitle="price reports"
          icon={Fuel}
          iconColor="text-fuel-400"
        />
        <StatsCard
          title="Fuel Types"
          value={avgPrices.length}
          subtitle="different fuels tracked"
          icon={Sparkles}
          iconColor="text-purple-400"
        />
        <StatsCard
          title="AI Model"
          value="OpenRouter"
          subtitle="Llama 3.3 + Mistral"
          icon={Brain}
          iconColor="text-blue-400"
        />
        <StatsCard
          title="Potential Savings"
          value={prices.length > 0 ? "Up to KSh 50/L" : "—"}
          subtitle="by choosing cheapest"
          icon={TrendingUp}
          iconColor="text-petro-400"
        />
      </div>

      {/* AI-Generated Insights */}
      <AISuggestions
        prices={prices}
        avgPrices={avgPrices}
        trends={trends}
        userLocation={userLocation}
      />

      {/* Chat + Location Side by Side */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Chat */}
        <div className="lg:col-span-2">
          <AIChat
            prices={prices}
            avgPrices={avgPrices}
            trends={trends}
            userLocation={userLocation}
            userCity={userCity}
            userCounty={userCounty}
          />
        </div>

        {/* Right sidebar */}
        <div className="space-y-4">
          {/* Location info */}
          {userLocation && (
            <div className="glass-card p-5">
              <div className="flex items-center gap-2.5 mb-3">
                <MapPin className="w-5 h-5 text-petro-400" />
                <div>
                  <p className="text-sm font-medium text-surface-200">
                    Your Location
                  </p>
                  <p className="text-xs text-surface-500">
                    {[userCity, userCounty].filter(Boolean).join(", ") ||
                      `${userLocation.lat.toFixed(4)}, ${userLocation.lng.toFixed(4)}`}
                  </p>
                </div>
              </div>
              <p className="text-xs text-surface-400">
                AI responses will consider stations near you for personalized
                recommendations.
              </p>
            </div>
          )}

          {/* API Status */}
          <div className="glass-card p-5">
            <h3 className="font-semibold text-surface-200 text-sm mb-3">
              AI Configuration
            </h3>
            <div className="space-y-2 text-xs">
              <div className="flex items-center justify-between">
                <span className="text-surface-400">API Provider</span>
                <span className="text-surface-200 font-medium">
                  OpenRouter
                </span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-surface-400">Free Models</span>
                <span className="text-surface-200 font-medium">Yes</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-surface-400">Status</span>
                <span className="font-medium text-petro-400">
                  Ready
                </span>
              </div>
            </div>
          </div>

          {/* Quick actions */}
          <div className="glass-card p-5 space-y-2">
            <h3 className="font-semibold text-surface-200 text-sm mb-2">
              Quick Actions
            </h3>
            <Link
              href="/prices"
              className="flex items-center justify-between p-2.5 rounded-lg hover:bg-surface-800/40 transition-colors text-surface-400 hover:text-surface-200 text-sm"
            >
              <span>Browse all prices</span>
              <ChevronRight className="w-4 h-4" />
            </Link>
            <Link
              href="/stations"
              className="flex items-center justify-between p-2.5 rounded-lg hover:bg-surface-800/40 transition-colors text-surface-400 hover:text-surface-200 text-sm"
            >
              <span>Find nearby stations</span>
              <ChevronRight className="w-4 h-4" />
            </Link>
            <Link
              href="/contribute"
              className="flex items-center justify-between p-2.5 rounded-lg hover:bg-surface-800/40 transition-colors text-surface-400 hover:text-surface-200 text-sm"
            >
              <span>Report a price</span>
              <ChevronRight className="w-4 h-4" />
            </Link>
          </div>
        </div>
      </div>

      {/* Call to action for more data */}
      {prices.length < 10 && (
        <div className="glass-card p-6 text-center">
          <Sparkles className="w-8 h-8 text-fuel-400 mx-auto mb-2" />
          <h3 className="text-lg font-semibold text-surface-200 mb-1">
            Help improve AI Insights
          </h3>
          <p className="text-sm text-surface-400 mb-4">
            More data means smarter suggestions. Contribute fuel prices to
            unlock better AI-powered recommendations for everyone.
          </p>
          <Link href="/contribute" className="btn-primary">
            <Fuel className="w-4 h-4" />
            Contribute a Price
            <ChevronRight className="w-4 h-4" />
          </Link>
        </div>
      )}
    </div>
  );
}
