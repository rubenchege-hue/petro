"use client";

import { useState, useMemo } from "react";
import { clsx } from "clsx";
import {
  Search,
  ArrowUpDown,
  ArrowUp,
  ArrowDown,
  Fuel,
  MapPin,
  Building2,
  ChevronLeft,
  ChevronRight,
} from "lucide-react";
import type { LatestPrice } from "@/types";
import { formatKES } from "@/types";

interface PriceTableProps {
  prices: LatestPrice[];
  itemsPerPage?: number;
  className?: string;
}

export default function PriceTable({
  prices,
  itemsPerPage = 15,
  className,
}: PriceTableProps) {
  const [search, setSearch] = useState("");
  const [fuelFilter, setFuelFilter] = useState<string>("all");
  const [sortKey, setSortKey] = useState<keyof LatestPrice>("submitted_at");
  const [sortDir, setSortDir] = useState<"asc" | "desc">("desc");
  const [page, setPage] = useState(1);

  // Get unique fuel types from data
  const fuelTypes = useMemo(() => {
    const types = new Set(prices.map((p) => p.fuel_type_slug));
    return Array.from(types);
  }, [prices]);

  // Filter and sort
  const filtered = useMemo(() => {
    let result = [...prices];

    if (search) {
      const q = search.toLowerCase();
      result = result.filter(
        (p) =>
          p.station_name.toLowerCase().includes(q) ||
          p.city.toLowerCase().includes(q) ||
          p.county?.toLowerCase().includes(q) ||
          p.brand?.toLowerCase().includes(q) ||
          p.fuel_type_name.toLowerCase().includes(q)
      );
    }

    if (fuelFilter !== "all") {
      result = result.filter((p) => p.fuel_type_slug === fuelFilter);
    }

    result.sort((a, b) => {
      const aVal = a[sortKey] ?? "";
      const bVal = b[sortKey] ?? "";
      const cmp =
        typeof aVal === "number"
          ? (aVal as number) - (bVal as number)
          : String(aVal).localeCompare(String(bVal));
      return sortDir === "asc" ? cmp : -cmp;
    });

    return result;
  }, [prices, search, fuelFilter, sortKey, sortDir]);

  const totalPages = Math.ceil(filtered.length / itemsPerPage);
  const paginated = filtered.slice(
    (page - 1) * itemsPerPage,
    page * itemsPerPage
  );

  const handleSort = (key: keyof LatestPrice) => {
    if (sortKey === key) {
      setSortDir((d) => (d === "asc" ? "desc" : "asc"));
    } else {
      setSortKey(key);
      setSortDir("asc");
    }
    setPage(1);
  };

  const SortIcon = ({ colKey }: { colKey: keyof LatestPrice }) => {
    if (sortKey !== colKey) return <ArrowUpDown className="w-3.5 h-3.5" />;
    return sortDir === "asc" ? (
      <ArrowUp className="w-3.5 h-3.5" />
    ) : (
      <ArrowDown className="w-3.5 h-3.5" />
    );
  };

  const formatDate = (dateStr: string) => {
    const d = new Date(dateStr);
    return d.toLocaleDateString("en-KE", {
      month: "short",
      day: "numeric",
      hour: "2-digit",
      minute: "2-digit",
    });
  };

  return (
    <div className={clsx("glass-card overflow-hidden", className)}>
      {/* Filters */}
      <div className="p-4 border-b border-surface-700/30 space-y-3">
        <div className="flex flex-col sm:flex-row gap-3">
          {/* Search */}
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-surface-500" />
            <input
              type="text"
              placeholder="Search stations, towns, counties, brands..."
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                setPage(1);
              }}
              className="input-field pl-9"
            />
          </div>

          {/* Fuel type filter */}
          <select
            value={fuelFilter}
            onChange={(e) => {
              setFuelFilter(e.target.value);
              setPage(1);
            }}
            className="select-field min-w-[160px]"
          >
            <option value="all">All Fuel Types</option>
            {fuelTypes.map((slug) => (
              <option key={slug} value={slug}>
                {slug.replace("-", " ").replace(/\b\w/g, (c) => c.toUpperCase())}
              </option>
            ))}
          </select>
        </div>
      </div>

      {/* Table */}
      <div className="overflow-x-auto custom-scrollbar">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-surface-700/30">
              {[
                { key: "station_name", label: "Station" },
                { key: "city", label: "Location" },
                { key: "brand", label: "Brand" },
                { key: "fuel_type_name", label: "Fuel" },
                { key: "price", label: "Price (KSh)" },
                { key: "submitted_at", label: "Reported" },
              ].map(({ key, label }) => (
                <th
                  key={key}
                  onClick={() => handleSort(key as keyof LatestPrice)}
                  className="px-4 py-3 text-left text-xs font-semibold text-surface-400 uppercase tracking-wider cursor-pointer hover:text-surface-200 transition-colors"
                >
                  <div className="flex items-center gap-1">
                    {label}
                    <SortIcon colKey={key as keyof LatestPrice} />
                  </div>
                </th>
              ))}
            </tr>
          </thead>
          <tbody className="divide-y divide-surface-700/20">
            {paginated.map((price) => (
              <tr
                key={price.id}
                className="hover:bg-surface-800/40 transition-colors group"
              >
                <td className="px-4 py-3">
                  <div className="flex items-center gap-2">
                    <div className="w-8 h-8 rounded-lg bg-surface-800/60 border border-surface-700/30 flex items-center justify-center group-hover:border-fuel-500/20 transition-colors">
                      <Building2 className="w-4 h-4 text-surface-400" />
                    </div>
                    <span className="font-medium text-surface-200">
                      {price.station_name}
                    </span>
                  </div>
                </td>
                <td className="px-4 py-3">
                  <div className="flex items-center gap-1.5">
                    <MapPin className="w-3.5 h-3.5 text-surface-500" />
                    <span className="text-surface-300">
                      {price.city}, {price.county}
                    </span>
                  </div>
                </td>
                <td className="px-4 py-3">
                  <span className="text-surface-400">
                    {price.brand || "—"}
                  </span>
                </td>
                <td className="px-4 py-3">
                  <div className="flex items-center gap-1.5">
                    <Fuel className="w-3.5 h-3.5 text-surface-500" />
                    <span
                      className={clsx(
                        "badge",
                        price.fuel_type_slug === "diesel" ||
                          price.fuel_type_slug === "premium-diesel"
                          ? "badge-green"
                          : price.fuel_type_slug === "lpg"
                            ? "badge-blue"
                            : "badge-orange"
                      )}
                    >
                      {price.fuel_type_name}
                    </span>
                  </div>
                </td>
                <td className="px-4 py-3">
                  <span className="text-base font-bold text-white tabular-nums">
                    {formatKES(price.price)}
                  </span>
                </td>
                <td className="px-4 py-3">
                  <span className="text-xs text-surface-500">
                    {formatDate(price.submitted_at)}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>

        {paginated.length === 0 && (
          <div className="flex flex-col items-center justify-center py-12 text-surface-500">
            <Fuel className="w-12 h-12 mb-3 opacity-30" />
            <p className="text-sm font-medium">No prices found</p>
            <p className="text-xs mt-1">
              Try adjusting your search or filters
            </p>
          </div>
        )}
      </div>

      {/* Pagination */}
      {totalPages > 1 && (
        <div className="flex items-center justify-between px-4 py-3 border-t border-surface-700/30">
          <span className="text-xs text-surface-500">
            Showing {(page - 1) * itemsPerPage + 1}–{Math.min(page * itemsPerPage, filtered.length)} of{" "}
            {filtered.length} results
          </span>
          <div className="flex items-center gap-1">
            <button
              onClick={() => setPage((p) => Math.max(1, p - 1))}
              disabled={page === 1}
              className="btn-secondary !px-2.5 !py-1.5 disabled:opacity-30"
            >
              <ChevronLeft className="w-4 h-4" />
            </button>
            {Array.from({ length: Math.min(totalPages, 5) }, (_, i) => {
              const start = Math.max(1, page - 2);
              const pg = start + i;
              if (pg > totalPages) return null;
              return (
                <button
                  key={pg}
                  onClick={() => setPage(pg)}
                  className={clsx(
                    "w-8 h-8 rounded-lg text-xs font-medium transition-all",
                    pg === page
                      ? "bg-fuel-500/15 text-fuel-400 border border-fuel-500/20"
                      : "text-surface-400 hover:text-surface-200 hover:bg-surface-800/50"
                  )}
                >
                  {pg}
                </button>
              );
            })}
            <button
              onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
              disabled={page === totalPages}
              className="btn-secondary !px-2.5 !py-1.5 disabled:opacity-30"
            >
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
