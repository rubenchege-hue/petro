"use client";

import { useState, useEffect, useCallback } from "react";
import dynamic from "next/dynamic";
import { clsx } from "clsx";
import {
  MapPin,
  Star,
  Fuel,
  Navigation,
  Crosshair,
  Loader2,
  LocateFixed,
} from "lucide-react";
import type { LatestPrice } from "@/types";
import { formatKES } from "@/types";

// Dynamically import map to avoid SSR issues
const MapContainer = dynamic(
  () => import("react-leaflet").then((m) => m.MapContainer),
  { ssr: false }
);
const TileLayer = dynamic(
  () => import("react-leaflet").then((m) => m.TileLayer),
  { ssr: false }
);
const Marker = dynamic(
  () => import("react-leaflet").then((m) => m.Marker),
  { ssr: false }
);
const Popup = dynamic(
  () => import("react-leaflet").then((m) => m.Popup),
  { ssr: false }
);
const Circle = dynamic(
  () => import("react-leaflet").then((m) => m.Circle),
  { ssr: false }
);

interface StationMapProps {
  prices: LatestPrice[];
  userLocation?: { lat: number; lng: number } | null;
  onLocationFound?: (lat: number, lng: number) => void;
  className?: string;
}

// Nairobi center
const KENYA_CENTER: [number, number] = [-0.0236, 37.9062];

function StationMapInner({
  prices,
  userLocation,
  onLocationFound,
  className,
}: StationMapProps) {
  const [mapReady, setMapReady] = useState(false);
  const [gettingLocation, setGettingLocation] = useState(false);

  // Filter to stations with coordinates
  const stationsWithCoords = prices.filter(
    (p) => p.latitude && p.longitude
  );

  // Deduplicate by station_id, keeping cheapest price
  const uniqueStations = Array.from(
    stationsWithCoords
      .reduce((map, p) => {
        const existing = map.get(p.station_id);
        if (!existing || p.price < existing.price) {
          map.set(p.station_id, p);
        }
        return map;
      }, new Map<string, LatestPrice>())
      .values()
  );

  useEffect(() => {
    setMapReady(true);
  }, []);

  const getPriceColor = (price: number) => {
    if (price > 200) return "text-red-400";
    if (price > 180) return "text-fuel-400";
    if (price > 150) return "text-fuel-300";
    return "text-petro-400";
  };

  const getMarkerIcon = (price: number) => {
    if (price > 200) return "red";
    if (price > 180) return "orange";
    if (price > 150) return "yellow";
    return "green";
  };

  const handleLocateMe = () => {
    if (!navigator.geolocation) return;
    setGettingLocation(true);
    navigator.geolocation.getCurrentPosition(
      (pos) => {
        onLocationFound?.(pos.coords.latitude, pos.coords.longitude);
        setGettingLocation(false);
      },
      () => {
        setGettingLocation(false);
      },
      { enableHighAccuracy: true, timeout: 10000 }
    );
  };

  if (!mapReady) {
    return (
      <div
        className={clsx(
          "glass-card flex items-center justify-center",
          className
        )}
        style={{ height: 500 }}
      >
        <div className="flex flex-col items-center gap-2">
          <div className="w-8 h-8 border-2 border-fuel-500/30 border-t-fuel-500 rounded-full animate-spin" />
          <p className="text-sm text-surface-400">Loading map...</p>
        </div>
      </div>
    );
  }

  return (
    <div className={clsx("glass-card overflow-hidden", className)}>
      {/* Header */}
      <div className="p-4 border-b border-surface-700/30 flex items-center justify-between">
        <div className="flex items-center gap-2.5">
          <MapPin className="w-5 h-5 text-fuel-400" />
          <div>
            <h3 className="font-semibold text-surface-200">Kenya Fuel Stations</h3>
            <p className="text-xs text-surface-500">
              {uniqueStations.length} stations mapped{userLocation ? " · Showing nearest stations" : ""}
            </p>
          </div>
        </div>
        <button
          onClick={handleLocateMe}
          disabled={gettingLocation}
          className="btn-secondary !px-3 !py-1.5 text-xs"
        >
          {gettingLocation ? (
            <Loader2 className="w-3.5 h-3.5 animate-spin" />
          ) : (
            <Crosshair className="w-3.5 h-3.5" />
          )}
          <span className="hidden sm:inline">Find Near Me</span>
        </button>
      </div>

      {/* Map */}
      <div className="h-[500px] w-full z-0">
        <MapContainer
          center={userLocation ? [userLocation.lat, userLocation.lng] : KENYA_CENTER}
          zoom={userLocation ? 12 : 6}
          className="h-full w-full"
          scrollWheelZoom={true}
        >
          <TileLayer
            attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> | <a href="https://petroflow.ke">PetroFlow Kenya</a>'
            url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          />

          {/* User location */}
          {userLocation && (
            <>
              <Circle
                center={[userLocation.lat, userLocation.lng]}
                radius={500}
                pathOptions={{
                  color: "#f97316",
                  fillColor: "#f97316",
                  fillOpacity: 0.1,
                  weight: 2,
                }}
              />
              <Marker position={[userLocation.lat, userLocation.lng]}>
                <Popup>
                  <div className="text-center">
                    <LocateFixed className="w-5 h-5 text-fuel-500 mx-auto mb-1" />
                    <p className="text-sm font-semibold">Your Location</p>
                  </div>
                </Popup>
              </Marker>
            </>
          )}

          {/* Station markers */}
          {uniqueStations.map((station) => (
            <Marker
              key={station.station_id}
              position={[station.latitude!, station.longitude!]}
            >
              <Popup>
                <div className="min-w-[220px] p-1">
                  <div className="flex items-center gap-2 mb-2">
                    <Fuel className="w-4 h-5 text-fuel-500" />
                    <span className="font-semibold text-sm">
                      {station.station_name}
                    </span>
                  </div>
                  <p className="text-xs text-gray-500 mb-1">
                    {station.address}, {station.city}
                  </p>
                  {station.brand && (
                    <p className="text-xs text-gray-400 mb-2">
                      {station.brand}
                    </p>
                  )}
                  <div
                    className={clsx(
                      "text-lg font-bold",
                      getPriceColor(station.price)
                    )}
                  >
                    {formatKES(station.price)}
                    <span className="text-xs font-normal text-gray-400 ml-1">
                      /L - {station.fuel_type_name}
                    </span>
                  </div>
                  {userLocation && station.latitude && station.longitude && (
                    <p className="text-xs text-gray-400 mt-1">
                      {calcDistance(
                        userLocation.lat,
                        userLocation.lng,
                        station.latitude,
                        station.longitude
                      ).toFixed(1)}{" "}
                      km away
                    </p>
                  )}
                  <a
                    href={`https://www.google.com/maps/dir/?api=1&destination=${station.latitude},${station.longitude}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center gap-1 text-xs text-fuel-500 hover:text-fuel-400 mt-2"
                  >
                    <Navigation className="w-3 h-3" />
                    Get Directions
                  </a>
                </div>
              </Popup>
            </Marker>
          ))}
        </MapContainer>
      </div>
    </div>
  );
}

// Haversine distance calculation
function calcDistance(
  lat1: number,
  lng1: number,
  lat2: number,
  lng2: number
): number {
  const R = 6371; // Earth's radius in km
  const dLat = ((lat2 - lat1) * Math.PI) / 180;
  const dLng = ((lng2 - lng1) * Math.PI) / 180;
  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos((lat1 * Math.PI) / 180) *
      Math.cos((lat2 * Math.PI) / 180) *
      Math.sin(dLng / 2) *
      Math.sin(dLng / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  return R * c;
}

export default function StationMap(props: StationMapProps) {
  return <StationMapInner {...props} />;
}

export { calcDistance };
