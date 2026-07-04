"use client";

import { useState } from "react";
import { clsx } from "clsx";
import {
  Navigation,
  Crosshair,
  Fuel,
  MapPin,
  Loader2,
  Building2,
  ChevronsRight,
  Star,
} from "lucide-react";
import { formatKES } from "@/types";
import type { LatestPrice } from "@/types";
import { calcDistance } from "./StationMap";

interface NearbyStationsProps {
  prices: LatestPrice[];
  className?: string;
}

export default function NearbyStations({
  prices,
  className,
}: NearbyStationsProps) {
  const [userLocation, setUserLocation] = useState<{
    lat: number;
    lng: number;
  } | null>(null);
  const [gettingLocation, setGettingLocation] = useState(false);
  const [locationError, setLocationError] = useState<string | null>(null);

  const findNearest = () => {
    if (!navigator.geolocation) {
      setLocationError("Geolocation not supported in your browser.");
      return;
    }

    setGettingLocation(true);
    setLocationError(null);

    navigator.geolocation.getCurrentPosition(
      (pos) => {
        setUserLocation({
          lat: pos.coords.latitude,
          lng: pos.coords.longitude,
        });
        setGettingLocation(false);
      },
      (err) => {
        setGettingLocation(false);
        setLocationError(
          err.code === 1
            ? "Location access denied. Please enable location services."
            : "Could not determine your location. Try again."
        );
      },
      { enableHighAccuracy: true, timeout: 10000 }
    );
  };

  // Calculate nearest stations
  const getNearestStations = () => {
    if (!userLocation || !prices.length) return [];

    // Filter to stations with coordinates
    const withCoords = prices.filter(
      (p) => p.latitude && p.longitude
    );

    // Deduplicate by station
    const stationMap = new Map<
      string,
      { station: LatestPrice; fuels: LatestPrice[] }
    >();

    withCoords.forEach((p) => {
      const existing = stationMap.get(p.station_id);
      if (existing) {
        existing.fuels.push(p);
        if (p.price < existing.station.price) {
          existing.station = p;
        }
      } else {
        stationMap.set(p.station_id, { station: p, fuels: [p] });
      }
    });

    // Calculate distances and sort
    const stations = Array.from(stationMap.values());
    return stations
      .map((s) => ({
        ...s,
        distance_km: calcDistance(
          userLocation.lat,
          userLocation.lng,
          s.station.latitude!,
          s.station.longitude!
        ),
        cheapest_fuel: s.station.fuel_type_name,
        cheapest_price: s.station.price,
      }))
      .sort((a, b) => a.distance_km - b.distance_km)
      .slice(0, 10);
  };

  const nearestStations = getNearestStations();

  return (
    <div className={clsx("glass-card", className)}>
      <div className="p-5 border-b border-surface-700/30">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2.5">
            <Navigation className="w-5 h-5 text-fuel-400" />
            <div>
              <h3 className="font-semibold text-surface-200">Nearest Stations</h3>
              <p className="text-xs text-surface-500">
                {userLocation
                  ? `${nearestStations.length} stations near you`
                  : "Find fuel stations around you"}
              </p>
            </div>
          </div>

          {!userLocation && (
            <button
              onClick={findNearest}
              disabled={gettingLocation}
              className="btn-primary !py-2 !px-4 text-xs"
            >
              {gettingLocation ? (
                <>
                  <Loader2 className="w-3.5 h-3.5 animate-spin" />
                  Locating...
                </>
              ) : (
                <>
                  <Crosshair className="w-3.5 h-3.5" />
                  Near Me
                </>
              )}
            </button>
          )}

          {userLocation && (
            <button
              onClick={findNearest}
              disabled={gettingLocation}
              className="btn-secondary !py-2 !px-3 text-xs"
            >
              <Crosshair className="w-3.5 h-3.5" />
              Refresh
            </button>
          )}
        </div>
      </div>

      {locationError && (
        <div className="p-4 bg-red-500/5 border-b border-red-500/10">
          <p className="text-xs text-red-400">{locationError}</p>
        </div>
      )}

      {!userLocation && !locationError && (
        <div className="p-8 text-center">
          <Navigation className="w-12 h-12 text-surface-600 mx-auto mb-3" />
          <p className="text-sm text-surface-400 font-medium mb-1">
            Find stations near you
          </p>
          <p className="text-xs text-surface-500">
            Click "Near Me" to discover the closest fuel stations and their prices
          </p>
        </div>
      )}

      {userLocation && nearestStations.length === 0 && (
        <div className="p-8 text-center">
          <MapPin className="w-12 h-12 text-surface-600 mx-auto mb-3" />
          <p className="text-sm text-surface-400">
            No stations found near your location yet. Be the first to report!
          </p>
        </div>
      )}

      {userLocation && nearestStations.length > 0 && (
        <div className="divide-y divide-surface-700/20">
          {nearestStations.map((item, i) => (
            <div
              key={item.station.station_id}
              className="p-4 hover:bg-surface-800/40 transition-colors group"
            >
              <div className="flex items-start gap-3">
                {/* Rank */}
                <div
                  className={clsx(
                    "w-8 h-8 rounded-lg flex items-center justify-center text-xs font-bold shrink-0 mt-0.5",
                    i === 0
                      ? "bg-yellow-500/15 text-yellow-400 border border-yellow-500/20"
                      : i === 1
                        ? "bg-surface-700/50 text-surface-300 border border-surface-600/30"
                        : i === 2
                          ? "bg-orange-500/10 text-orange-400 border border-orange-500/20"
                          : "bg-surface-800/60 text-surface-500 border border-surface-700/30"
                  )}
                >
                  {i + 1}
                </div>

                <div className="flex-1 min-w-0">
                  <div className="flex items-center justify-between gap-2">
                    <h4 className="font-medium text-surface-200 text-sm truncate">
                      {item.station.station_name}
                    </h4>
                    <span className="text-sm font-bold text-white shrink-0">
                      {formatKES(item.cheapest_price)}
                    </span>
                  </div>

                  <p className="text-xs text-surface-500 mt-0.5">
                    {item.station.address}, {item.station.city}
                  </p>

                  <div className="flex items-center gap-3 mt-1.5">
                    <span className="text-xs font-medium text-fuel-400">
                      {item.distance_km.toFixed(1)} km
                    </span>
                    {item.station.brand && (
                      <span className="text-xs text-surface-500">
                        {item.station.brand}
                      </span>
                    )}
                    <span className="text-xs text-surface-500">
                      {item.cheapest_fuel}
                    </span>
                  </div>

                  {/* All fuel prices */}
                  {item.fuels.length > 1 && (
                    <div className="flex flex-wrap gap-1.5 mt-2">
                      {item.fuels.map((f, fi) => (
                        <span
                          key={fi}
                          className="badge-neutral text-[10px]"
                        >
                          {f.fuel_type_name}: {formatKES(f.price)}
                        </span>
                      ))}
                    </div>
                  )}
                </div>

                {/* Directions */}
                <a
                  href={`https://www.google.com/maps/dir/?api=1&destination=${item.station.latitude},${item.station.longitude}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="w-8 h-8 rounded-lg flex items-center justify-center text-surface-500 hover:text-fuel-400 hover:bg-surface-700/50 transition-all shrink-0 mt-0.5"
                >
                  <ChevronsRight className="w-4 h-4" />
                </a>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
