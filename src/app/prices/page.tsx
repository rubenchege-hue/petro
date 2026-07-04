"use client";

import { useState, useEffect } from "react";
import { Fuel, Filter, ArrowRight } from "lucide-react";
import PriceTable from "@/components/PriceTable";
import { getLatestPrices, getAvgPricesRecent } from "@/lib/supabase";
import type { LatestPrice, AvgPriceRecent } from "@/types";
import { formatKES } from "@/types";
import Link from "next/link";

export default function PricesPage() {
  const [prices, setPrices] = useState<LatestPrice[]>([]);
  const [avgPrices, setAvgPrices] = useState<AvgPriceRecent[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function load() {
      try {
        const [pricesData, avgData] = await Promise.all([
          getLatestPrices(),
          getAvgPricesRecent(),
        ]);
        setPrices(pricesData);
        setAvgPrices(avgData);
      } catch (err) {
        setError(
          err instanceof Error ? err.message : "Failed to load prices"
        );
      } finally {
        setLoading(false);
      }
    }
    load();
  }, []);

  if (loading) {
    return (
      <div className="page-container flex items-center justify-center min-h-[60vh]">
        <div className="flex flex-col items-center gap-4">
          <div className="w-12 h-12 border-2 border-fuel-500/30 border-t-fuel-500 rounded-full animate-spin" />
          <p className="text-surface-400 text-sm animate-pulse">
            Loading prices...
          </p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="page-container flex items-center justify-center min-h-[60vh]">
        <div className="glass-card p-8 text-center max-w-md">
          <Fuel className="w-12 h-12 text-red-400 mx-auto mb-3" />
          <h2 className="text-lg font-semibold text-surface-200 mb-2">
            Unable to load prices
          </h2>
          <p className="text-sm text-surface-400 mb-4">{error}</p>
          <button
            onClick={() => window.location.reload()}
            className="btn-primary"
          >
            Try Again
          </button>
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
              <Fuel className="w-4.5 h-4.5 text-fuel-400" />
            </div>
            <span className="text-xs font-semibold text-fuel-400 uppercase tracking-wider">
              Prices
            </span>
          </div>
          <h1 className="page-title">Kenya Fuel Price Directory</h1>
          <p className="page-subtitle">
            Browse all community-reported fuel prices across Kenya
            {prices.length > 0 && (
              <span className="text-surface-500">
                {" · "}
                {prices.length} listings
              </span>
            )}
          </p>
        </div>
        <Link href="/contribute" className="btn-primary shrink-0">
          <Filter className="w-4 h-4" />
          Report New Price
        </Link>
      </div>

      {/* Avg Prices Summary */}
      {avgPrices.length > 0 && (
        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-3">
          {avgPrices.map((avg) => (
            <div
              key={avg.fuel_type_id}
              className="glass-card p-3 text-center hover:border-fuel-500/20 transition-all duration-300"
            >
              <p className="text-xs text-surface-400 font-medium mb-1">
                {avg.fuel_type_name}
              </p>
              <p className="text-lg font-bold text-white">
                {formatKES(avg.avg_price)}
              </p>
              <p className="text-xs text-surface-500 mt-0.5">
                {avg.submission_count} reports
              </p>
            </div>
          ))}
        </div>
      )}

      {/* Price Table */}
      <PriceTable prices={prices} />

      {prices.length === 0 && !loading && (
        <div className="glass-card p-12 text-center">
          <Fuel className="w-16 h-16 text-surface-600 mx-auto mb-4" />
          <h2 className="text-xl font-semibold text-surface-300 mb-2">
            No prices yet
          </h2>
          <p className="text-surface-500 mb-6 max-w-md mx-auto">
            Be the first to contribute! Submit a fuel price at a station near
            you to help Kenyans find the best deals.
          </p>
          <Link href="/contribute" className="btn-primary">
            <Fuel className="w-4 h-4" />
            Report First Price
          </Link>
        </div>
      )}
    </div>
  );
}
