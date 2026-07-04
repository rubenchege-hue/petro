"use client";

import { useState, useEffect } from "react";
import { MapPin, Building2, Fuel, Search, Navigation } from "lucide-react";
import { clsx } from "clsx";
import StationMap from "@/components/StationMap";
import NearbyStations from "@/components/NearbyStations";
import { getLatestPrices } from "@/lib/supabase";
import type { LatestPrice } from "@/types";
import { formatKES } from "@/types";

export default function StationsPage() {
  const [prices, setPrices] = useState<LatestPrice[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [viewMode, setViewMode] = useState<"map" | "grid">("map");
  const [userLocation, setUserLocation] = useState<{
    lat: number;
    lng: number;
  } | null>(null);

  useEffect(() => {
    async function load() {
      try {
        const data = await getLatestPrices();
        setPrices(data);
      } catch (err) {
        console.error("Failed to load stations:", err);
      } finally {
        setLoading(false);
      }
    }
    load();
  }, []);

  // If on grid view, detect location
  useEffect(() => {
    if (viewMode === "grid" && !userLocation && navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (pos) => {
          setUserLocation({
            lat: pos.coords.latitude,
            lng: pos.coords.longitude,
          });
        },
        () => {},
        { enableHighAccuracy: true, timeout: 5000 }
      );
    }
  }, [viewMode, userLocation]);

  // Handle location found from map
  const handleLocationFound = (lat: number, lng: number) => {
    setUserLocation({ lat, lng });
  };

  // Deduplicate stations
  const stations = Array.from(
    prices
      .reduce((map, p) => {
        if (!map.has(p.station_id)) {
          map.set(p.station_id, {
            id: p.station_id,
            name: p.station_name,
            address: p.address,
            city: p.city,
            county: p.county,
            brand: p.brand,
            latitude: p.latitude,
            longitude: p.longitude,
            cheapest_price: p.price,
            cheapest_fuel: p.fuel_type_name,
            fuels: [{ type: p.fuel_type_name, price: p.price }],
          });
        } else {
          const existing = map.get(p.station_id)!;
          if (p.price < existing.cheapest_price) {
            existing.cheapest_price = p.price;
            existing.cheapest_fuel = p.fuel_type_name;
          }
          existing.fuels.push({ type: p.fuel_type_name, price: p.price });
        }
        return map;
      }, new Map<string, {
        id: string;
        name: string;
        address: string;
        city: string;
        county: string;
        brand: string | null;
        latitude: number | null;
        longitude: number | null;
        cheapest_price: number;
        cheapest_fuel: string;
        fuels: { type: string; price: number }[];
      }>())
      .values()
  );

  const filtered = stations.filter(
    (s) =>
      s.name.toLowerCase().includes(search.toLowerCase()) ||
      s.city.toLowerCase().includes(search.toLowerCase()) ||
      s.county.toLowerCase().includes(search.toLowerCase()) ||
      s.brand?.toLowerCase().includes(search.toLowerCase())
  );

  if (loading) {
    return (
      <div className="page-container flex items-center justify-center min-h-[60vh]">
        <div className="flex flex-col items-center gap-4">
          <div className="w-12 h-12 border-2 border-fuel-500/30 border-t-fuel-500 rounded-full animate-spin" />
          <p className="text-surface-400 text-sm animate-pulse">
            Loading stations...
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
              <MapPin className="w-4.5 h-4.5 text-fuel-400" />
            </div>
            <span className="text-xs font-semibold text-fuel-400 uppercase tracking-wider">
              Stations
            </span>
          </div>
          <h1 className="page-title">Kenya Fuel Stations</h1>
          <p className="page-subtitle">
            {stations.length} stations tracked across {new Set(prices.map(p => p.county)).size} counties
          </p>
        </div>

        {/* View toggle */}
        <div className="flex items-center gap-2 bg-surface-800/60 rounded-xl p-1 border border-surface-700/30">
          <button
            onClick={() => setViewMode("map")}
            className={clsx(
              "px-4 py-2 rounded-lg text-sm font-medium transition-all",
              viewMode === "map"
                ? "bg-fuel-500/15 text-fuel-400 border border-fuel-500/20"
                : "text-surface-400 hover:text-surface-200"
            )}
          >
            Map
          </button>
          <button
            onClick={() => setViewMode("grid")}
            className={clsx(
              "px-4 py-2 rounded-lg text-sm font-medium transition-all",
              viewMode === "grid"
                ? "bg-fuel-500/15 text-fuel-400 border border-fuel-500/20"
                : "text-surface-400 hover:text-surface-200"
            )}
          >
            Near Me
          </button>
        </div>
      </div>

      {/* Search */}
      <div className="relative max-w-md">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-surface-500" />
        <input
          type="text"
          placeholder="Search stations, towns, or brands..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="input-field pl-9"
        />
      </div>

      {/* Map View */}
      {viewMode === "map" && (
        <StationMap
          prices={prices}
          userLocation={userLocation}
          onLocationFound={handleLocationFound}
        />
      )}

      {/* Grid View with nearby stations */}
      {viewMode === "grid" && (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          <div className="lg:col-span-2">
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              {filtered.map((station) => (
                <div
                  key={station.id}
                  className="glass-card-hover p-5 group"
                >
                  <div className="flex items-start justify-between mb-3">
                    <div className="flex items-center gap-2.5">
                      <div className="w-10 h-10 rounded-xl bg-surface-800/60 border border-surface-700/30 flex items-center justify-center group-hover:border-fuel-500/20 transition-colors">
                        <Building2 className="w-5 h-5 text-surface-400" />
                      </div>
                      <div>
                        <h3 className="font-semibold text-surface-200 text-sm">
                          {station.name}
                        </h3>
                        {station.brand && (
                          <p className="text-xs text-surface-500">{station.brand}</p>
                        )}
                      </div>
                    </div>
                  </div>

                  <div className="flex items-start gap-1.5 mb-3">
                    <MapPin className="w-3.5 h-3.5 text-surface-500 mt-0.5 shrink-0" />
                    <p className="text-xs text-surface-400">
                      {station.address}, {station.city}, {station.county}
                    </p>
                  </div>

                  <div className="flex items-center gap-2 mb-3">
                    <Fuel className="w-3.5 h-3.5 text-petro-400" />
                    <span className="text-xs text-surface-400">From </span>
                    <span className="text-lg font-bold text-white">
                      {formatKES(station.cheapest_price)}
                    </span>
                    <span className="text-xs text-surface-500">
                      / {station.cheapest_fuel}
                    </span>
                  </div>

                  {station.fuels.length > 1 && (
                    <div className="flex flex-wrap gap-1.5">
                      {station.fuels.map((f, i) => (
                        <span key={i} className="badge-neutral text-[10px]">
                          {f.type}: {formatKES(f.price)}
                        </span>
                      ))}
                    </div>
                  )}

                  {station.latitude && station.longitude && (
                    <a
                      href={`https://www.google.com/maps/dir/?api=1&destination=${station.latitude},${station.longitude}`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1.5 text-xs text-fuel-400 hover:text-fuel-300 mt-3 transition-colors"
                    >
                      <Navigation className="w-3.5 h-3.5" />
                      Get Directions
                    </a>
                  )}
                </div>
              ))}
            </div>
          </div>

          {/* Nearby sidebar */}
          <div className="lg:col-span-1">
            <NearbyStations prices={prices} />
          </div>
        </div>
      )}

      {stations.length === 0 && (
        <div className="glass-card p-12 text-center">
          <MapPin className="w-16 h-16 text-surface-600 mx-auto mb-4" />
          <h2 className="text-xl font-semibold text-surface-300 mb-2">
            No stations yet
          </h2>
          <p className="text-surface-500">
            Stations will appear once prices are reported.
          </p>
        </div>
      )}
    </div>
  );
}
