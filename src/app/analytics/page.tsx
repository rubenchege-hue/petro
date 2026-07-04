"use client";

import { useState, useEffect } from "react";
import {
  TrendingUp,
  BarChart3,
  PieChart,
  Activity,
  CalendarDays,
  Fuel,
  DollarSign,
  MapPin,
} from "lucide-react";
import { format } from "date-fns";
import PriceChart from "@/components/PriceChart";
import StatsCard from "@/components/StatsCard";
import {
  getLatestPrices,
  getAvgPricesRecent,
  getDailyPriceTrends,
} from "@/lib/supabase";
import type { LatestPrice, AvgPriceRecent, DailyPriceTrend } from "@/types";
import { formatKES } from "@/types";

export default function AnalyticsPage() {
  const [allPrices, setAllPrices] = useState<LatestPrice[]>([]);
  const [avgPrices, setAvgPrices] = useState<AvgPriceRecent[]>([]);
  const [trends, setTrends] = useState<DailyPriceTrend[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedFuel, setSelectedFuel] = useState<string>("all");

  useEffect(() => {
    async function load() {
      try {
        const [pricesData, avgData, trendsData] = await Promise.all([
          getLatestPrices({ limit: 500 }),
          getAvgPricesRecent(),
          getDailyPriceTrends(),
        ]);
        setAllPrices(pricesData);
        setAvgPrices(avgData);
        setTrends(trendsData);
      } catch (err) {
        console.error("Failed to load analytics data:", err);
      } finally {
        setLoading(false);
      }
    }
    load();
  }, []);

  // Get unique fuel types from trends
  const fuelTypes = Array.from(new Set(trends.map((t) => t.fuel_type_slug)));

  // Filter trends by selected fuel type
  const filteredTrends =
    selectedFuel === "all"
      ? trends
      : trends.filter((t) => t.fuel_type_slug === selectedFuel);

  // Prepare multi-line chart data for trends comparison
  const trendComparisonData = (() => {
    if (selectedFuel !== "all") {
      return filteredTrends.map((t) => ({
        date: format(new Date(t.date), "MMM d"),
        avg_price: t.avg_price,
        min_price: t.min_price,
        max_price: t.max_price,
      }));
    }

    // Group by date, show each fuel type as a series
    const dateMap = new Map<string, Record<string, number>>();
    trends.forEach((t) => {
      const key = format(new Date(t.date), "MMM d");
      if (!dateMap.has(key)) dateMap.set(key, {});
      dateMap.get(key)![t.fuel_type_name] = t.avg_price;
    });
    return Array.from(dateMap.entries())
      .map(([date, fuels]) => ({ date, ...fuels }))
      .sort((a, b) => {
        const aDate = new Date(a.date);
        const bDate = new Date(b.date);
        return aDate.getTime() - bDate.getTime();
      });
  })();

  // Price distribution data (in KES)
  const distributionData = (() => {
    const buckets: Record<string, number> = {};
    const prices = allPrices.map((p) => Number(p.price));
    prices.forEach((price) => {
      const bucket = Math.floor(price / 10) * 10; // KES 10 buckets
      const key = `KSh ${bucket}`;
      buckets[key] = (buckets[key] || 0) + 1;
    });
    return Object.entries(buckets)
      .map(([range, count]) => ({ range, count }))
      .sort((a, b) => a.range.localeCompare(b.range));
  })();

  // Station comparison (top 10 cheapest super petrol)
  const cheapestStations = [...allPrices]
    .filter((p) => p.fuel_type_slug === "super-petrol")
    .sort((a, b) => a.price - b.price)
    .slice(0, 10);

  if (loading) {
    return (
      <div className="page-container flex items-center justify-center min-h-[60vh]">
        <div className="flex flex-col items-center gap-4">
          <div className="w-12 h-12 border-2 border-fuel-500/30 border-t-fuel-500 rounded-full animate-spin" />
          <p className="text-surface-400 text-sm animate-pulse">
            Loading analytics...
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="page-container space-y-8 animate-fade-in">
      {/* Header */}
      <div>
        <div className="flex items-center gap-2.5 mb-2">
          <div className="w-8 h-8 rounded-lg bg-fuel-500/15 border border-fuel-500/20 flex items-center justify-center">
            <TrendingUp className="w-4.5 h-4.5 text-fuel-400" />
          </div>
          <span className="text-xs font-semibold text-fuel-400 uppercase tracking-wider">
            Analytics
          </span>
        </div>
        <h1 className="page-title">Kenya Price Analysis & Trends</h1>
        <p className="page-subtitle">
          Deep dive into fuel price data with trend analysis across all Kenyan counties
        </p>
      </div>

      {/* Stats Overview */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <StatsCard
          title="Data Points"
          value={allPrices.length}
          subtitle="total price submissions"
          icon={BarChart3}
          iconColor="text-fuel-400"
        />
        <StatsCard
          title="Avg Fuel Price"
          value={
            avgPrices.length > 0
              ? formatKES(
                  avgPrices.reduce((s, a) => s + Number(a.avg_price), 0) /
                    avgPrices.length
                )
              : "—"
          }
          subtitle="all fuel types"
          icon={DollarSign}
          iconColor="text-petro-400"
        />
        <StatsCard
          title="30-Day Trend"
          value={
            trends.length > 0
              ? (() => {
                  const byFuel = trends.reduce(
                    (map, t) => {
                      map[t.fuel_type_slug] = map[t.fuel_type_slug] || [];
                      map[t.fuel_type_slug].push(t.avg_price);
                      return map;
                    },
                    {} as Record<string, number[]>
                  );
                  const first = Object.values(byFuel)[0]?.[0] || 0;
                  const last =
                    Object.values(byFuel)[0]?.slice(-1)[0] || 0;
                  const change = ((last - first) / first) * 100;
                  return `${change >= 0 ? "+" : ""}${change.toFixed(1)}%`;
                })()
              : "—"
          }
          subtitle="price change"
          icon={Activity}
          iconColor="text-blue-400"
        />
        <StatsCard
          title="Counties"
          value={new Set(allPrices.map(p => p.county)).size}
          subtitle="active counties"
          icon={MapPin}
          iconColor="text-purple-400"
        />
      </div>

      {/* Fuel Type Filter */}
      <div className="flex items-center gap-3 flex-wrap">
        <span className="text-sm text-surface-400 font-medium">Filter:</span>
        <button
          onClick={() => setSelectedFuel("all")}
          className={`px-4 py-1.5 rounded-lg text-xs font-medium transition-all ${
            selectedFuel === "all"
              ? "bg-fuel-500/15 text-fuel-400 border border-fuel-500/20"
              : "text-surface-400 hover:text-surface-200 bg-surface-800/40 border border-surface-700/30"
          }`}
        >
          All Fuels
        </button>
        {fuelTypes.map((slug) => (
          <button
            key={slug}
            onClick={() => setSelectedFuel(slug)}
            className={`px-4 py-1.5 rounded-lg text-xs font-medium transition-all ${
              selectedFuel === slug
                ? "bg-fuel-500/15 text-fuel-400 border border-fuel-500/20"
                : "text-surface-400 hover:text-surface-200 bg-surface-800/40 border border-surface-700/30"
            }`}
          >
            {slug.replace("-", " ").replace(/\b\w/g, (c) => c.toUpperCase())}
          </button>
        ))}
      </div>

      {/* Charts Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* 30-Day Price Trends */}
        <div>
          <div className="flex items-center gap-2 mb-3">
            <CalendarDays className="w-4 h-4 text-fuel-400" />
            <h2 className="section-title">30-Day Price Trends</h2>
          </div>
          {selectedFuel === "all" ? (
            <PriceChart
              data={trendComparisonData}
              type="line"
              xKey="date"
              yKey={
                fuelTypes.length > 0 ? fuelTypes.map(
                  (slug) =>
                    slug.replace("-", " ").replace(/\b\w/g, (c) =>
                      c.toUpperCase()
                    )
                )[0] : "avg_price"
              }
              yKey2={
                fuelTypes.length > 1
                  ? fuelTypes.map((slug) =>
                      slug
                        .replace("-", " ")
                        .replace(/\b\w/g, (c) => c.toUpperCase())
                    )[1]
                  : undefined
              }
              yKey3={
                fuelTypes.length > 2
                  ? fuelTypes.map((slug) =>
                      slug
                        .replace("-", " ")
                        .replace(/\b\w/g, (c) => c.toUpperCase())
                    )[2]
                  : undefined
              }
              label="Price (KSh)"
              color="#f97316"
              color2="#22c55e"
              color3="#3b82f6"
              height={300}
              syncId="trends"
              formatY={(v) => `KSh ${v.toFixed(2)}`}
            />
          ) : (
            <PriceChart
              data={trendComparisonData}
              type="area"
              xKey="date"
              yKey="avg_price"
              yKey2="min_price"
              yKey3="max_price"
              label="Avg Price"
              label2="Min"
              label3="Max"
              color="#f97316"
              color2="#22c55e"
              color3="#3b82f6"
              height={300}
              syncId="trends"
              formatY={(v) => `KSh ${v.toFixed(2)}`}
            />
          )}
        </div>

        {/* Price Distribution */}
        <div>
          <div className="flex items-center gap-2 mb-3">
            <PieChart className="w-4 h-4 text-fuel-400" />
            <h2 className="section-title">Price Distribution (KES)</h2>
          </div>
          <PriceChart
            data={distributionData}
            type="bar"
            xKey="range"
            yKey="count"
            label="Number of Reports"
            color="#22c55e"
            height={300}
            formatY={(v) => `${v}`}
          />
        </div>
      </div>

      {/* Avg Prices by Fuel Type */}
      <div>
        <div className="flex items-center gap-2 mb-3">
          <Fuel className="w-4 h-4 text-fuel-400" />
          <h2 className="section-title">Average Prices by Fuel Type</h2>
        </div>
        <PriceChart
          data={avgPrices}
          type="bar"
          xKey="fuel_type_name"
          yKey="avg_price"
          label="Avg Price (KSh)"
          color="#f97316"
          height={320}
          formatY={(v) => `KSh ${v.toFixed(2)}`}
        />
      </div>

      {/* Cheapest Super Petrol Stations */}
      {cheapestStations.length > 0 && (
        <div>
          <div className="flex items-center gap-2 mb-3">
            <DollarSign className="w-4 h-4 text-petro-400" />
            <h2 className="section-title">Top 10 Cheapest Super Petrol in Kenya</h2>
          </div>
          <div className="glass-card overflow-hidden">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-surface-700/30">
                  <th className="px-4 py-3 text-left text-xs font-semibold text-surface-400 uppercase tracking-wider">
                    Rank
                  </th>
                  <th className="px-4 py-3 text-left text-xs font-semibold text-surface-400 uppercase tracking-wider">
                    Station
                  </th>
                  <th className="px-4 py-3 text-left text-xs font-semibold text-surface-400 uppercase tracking-wider">
                    Location
                  </th>
                  <th className="px-4 py-3 text-left text-xs font-semibold text-surface-400 uppercase tracking-wider">
                    Price
                  </th>
                  <th className="px-4 py-3 text-left text-xs font-semibold text-surface-400 uppercase tracking-wider">
                    Reported
                  </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-surface-700/20">
                {cheapestStations.map((station, i) => (
                  <tr
                    key={station.id}
                    className="hover:bg-surface-800/40 transition-colors"
                  >
                    <td className="px-4 py-3">
                      <span
                        className={`inline-flex items-center justify-center w-7 h-7 rounded-lg text-xs font-bold ${
                          i === 0
                            ? "bg-yellow-500/15 text-yellow-400"
                            : i === 1
                              ? "bg-surface-700/50 text-surface-300"
                              : i === 2
                                ? "bg-orange-500/10 text-orange-400"
                                : "text-surface-500"
                        }`}
                      >
                        {i + 1}
                      </span>
                    </td>
                    <td className="px-4 py-3 font-medium text-surface-200">
                      {station.station_name}
                    </td>
                    <td className="px-4 py-3 text-surface-400">
                      {station.city}, {station.county}
                    </td>
                    <td className="px-4 py-3">
                      <span className="text-lg font-bold text-petro-400">
                        {formatKES(station.price)}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-xs text-surface-500">
                      {format(new Date(station.submitted_at), "MMM d, h:mm a")}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {allPrices.length === 0 && (
        <div className="glass-card p-12 text-center">
          <TrendingUp className="w-16 h-16 text-surface-600 mx-auto mb-4" />
          <h2 className="text-xl font-semibold text-surface-300 mb-2">
            Not enough data yet
          </h2>
          <p className="text-surface-500">
            Analytics will become available as more fuel prices are reported by
            the community across Kenya.
          </p>
        </div>
      )}
    </div>
  );
}
