"use client";

import { useState, useEffect } from "react";
import {
  Fuel,
  Building2,
  TrendingUp,
  DollarSign,
  Droplets,
  ArrowRight,
  Brain,
  MapPin,
} from "lucide-react";
import { format } from "date-fns";
import StatsCard from "@/components/StatsCard";
import PriceChart from "@/components/PriceChart";
import PriceTable from "@/components/PriceTable";
import AISuggestions from "@/components/AISuggestions";
import {
  getLatestPrices,
  getAvgPricesRecent,
  getDailyPriceTrends,
  getDashboardStats,
} from "@/lib/supabase";
import type { LatestPrice, AvgPriceRecent, DailyPriceTrend, DashboardStats } from "@/types";
import { formatKES } from "@/types";
import Link from "next/link";

export default function Dashboard() {
  const [stats, setStats] = useState<DashboardStats | null>(null);
  const [recentPrices, setRecentPrices] = useState<LatestPrice[]>([]);
  const [avgPrices, setAvgPrices] = useState<AvgPriceRecent[]>([]);
  const [trends, setTrends] = useState<DailyPriceTrend[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function load() {
      try {
        const [statsData, pricesData, avgData, trendsData] = await Promise.all([
          getDashboardStats(),
          getLatestPrices({ limit: 8 }),
          getAvgPricesRecent(),
          getDailyPriceTrends(),
        ]);
        setStats(statsData);
        setRecentPrices(pricesData);
        setAvgPrices(avgData);
        setTrends(trendsData);
      } catch (err) {
        console.error("Failed to load dashboard data:", err);
      } finally {
        setLoading(false);
      }
    }
    load();
  }, []);

  if (loading) {
    return (
      <div className="page-container flex items-center justify-center min-h-screen">
        <div className="flex flex-col items-center gap-4">
          <div className="w-12 h-12 border-2 border-fuel-500/30 border-t-fuel-500 rounded-full animate-spin" />
          <p className="text-surface-400 text-sm animate-pulse">
            Loading fuel data...
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="page-container space-y-8 animate-fade-in">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2.5 mb-2">
            <div className="w-8 h-8 rounded-lg bg-fuel-500/15 border border-fuel-500/20 flex items-center justify-center">
              <Droplets className="w-4.5 h-4.5 text-fuel-400" />
            </div>
            <span className="text-xs font-semibold text-fuel-400 uppercase tracking-wider">
              Dashboard
            </span>
          </div>
          <h1 className="page-title">Kenya Fuel Price Overview</h1>
          <p className="page-subtitle">
            Community-driven fuel price intelligence across all 47 counties
          </p>
        </div>
        <div className="flex items-center gap-2">
          <Link href="/ai" className="btn-secondary shrink-0">
            <Brain className="w-4 h-4" />
            AI Insights
          </Link>
          <Link href="/contribute" className="btn-primary shrink-0">
            <Fuel className="w-4 h-4" />
            Report Price
          </Link>
        </div>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <StatsCard
          title="Total Submissions"
          value={stats?.total_submissions ?? 0}
          subtitle="price reports"
          icon={Fuel}
          iconColor="text-fuel-400"
          trend={recentPrices.length > 0 ? { direction: "up", value: "from community" } : undefined}
        />
        <StatsCard
          title="Tracked Stations"
          value={stats?.total_stations ?? 0}
          subtitle="across all counties"
          icon={Building2}
          iconColor="text-blue-400"
        />
        <StatsCard
          title="Avg Super Petrol"
          value={(() => {
            const superPetrol = avgPrices.find(a => a.fuel_type_slug === "super-petrol");
            return superPetrol ? formatKES(superPetrol.avg_price) : "—";
          })()}
          subtitle="per litre (KSh)"
          icon={DollarSign}
          iconColor="text-petro-400"
        />
        <StatsCard
          title="Avg Diesel"
          value={(() => {
            const diesel = avgPrices.find(a => a.fuel_type_slug === "diesel");
            return diesel ? formatKES(diesel.avg_price) : "—";
          })()}
          subtitle="per litre (KSh)"
          icon={TrendingUp}
          iconColor="text-purple-400"
        />
      </div>

      {/* AI Insights Section */}
      <AISuggestions
        prices={recentPrices}
        avgPrices={avgPrices}
        trends={trends}
      />

      {/* Charts Row */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Price Trends */}
        <div>
          <div className="flex items-center justify-between mb-3">
            <h2 className="section-title">30-Day Price Trends</h2>
            <Link href="/analytics" className="text-xs text-fuel-400 hover:text-fuel-300 transition-colors font-medium">
              View details <ArrowRight className="w-3 h-3 inline" />
            </Link>
          </div>
          {trends.length > 0 ? (
            <PriceChart
              data={trends.map((t) => ({
                ...t,
                date: format(new Date(t.date), "MMM d"),
              }))}
              type="area"
              xKey="date"
              yKey="avg_price"
              label="Price"
              color="#f97316"
              height={280}
              formatY={(v) => `KSh ${v.toFixed(2)}`}
            />
          ) : (
            <div className="glass-card flex items-center justify-center h-[280px]">
              <p className="text-surface-500 text-sm">No trend data yet</p>
            </div>
          )}
        </div>

        {/* Avg Prices by Fuel Type */}
        <div>
          <div className="flex items-center justify-between mb-3">
            <h2 className="section-title">Avg Prices by Fuel Type</h2>
          </div>
          {avgPrices.length > 0 ? (
            <PriceChart
              data={avgPrices}
              type="bar"
              xKey="fuel_type_name"
              yKey="avg_price"
              label="Avg Price"
              color="#22c55e"
              height={280}
              formatY={(v) => `KSh ${v.toFixed(2)}`}
            />
          ) : (
            <div className="glass-card flex items-center justify-center h-[280px]">
              <p className="text-surface-500 text-sm">No price data yet</p>
            </div>
          )}
        </div>
      </div>

      {/* Recent Prices */}
      <div>
        <div className="flex items-center justify-between mb-4">
          <div>
            <h2 className="section-title">Recent Price Reports</h2>
            <p className="text-xs text-surface-500 mt-0.5">
              Latest community-contributed fuel prices across Kenya
            </p>
          </div>
          <Link
            href="/prices"
            className="text-sm text-fuel-400 hover:text-fuel-300 flex items-center gap-1 transition-colors font-medium"
          >
            View all
            <ArrowRight className="w-4 h-4" />
          </Link>
        </div>
        <PriceTable prices={recentPrices} itemsPerPage={8} />
      </div>
    </div>
  );
}
