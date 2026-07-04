"use client";

import { useState, useEffect } from "react";
import { clsx } from "clsx";
import {
  Building2,
  MapPin,
  Fuel,
  DollarSign,
  StickyNote,
  Send,
  CheckCircle2,
  AlertCircle,
  Loader2,
  Crosshair,
  Navigation,
} from "lucide-react";
import { supabase } from "@/lib/supabase";
import type { FuelType } from "@/types";
import { KENYA_COUNTIES } from "@/types";

export default function SubmitPriceForm() {
  const [fuelTypes, setFuelTypes] = useState<FuelType[]>([]);
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [status, setStatus] = useState<"idle" | "success" | "error">("idle");
  const [statusMsg, setStatusMsg] = useState("");
  const [gettingLocation, setGettingLocation] = useState(false);

  const [form, setForm] = useState({
    station_name: "",
    station_address: "",
    city: "",
    county: "",
    brand: "",
    fuel_type_id: 1,
    price: "",
    notes: "",
  });

  useEffect(() => {
    supabase
      .from("fuel_types")
      .select("*")
      .order("id")
      .then(({ data, error }) => {
        if (data) setFuelTypes(data);
        setLoading(false);
      });
  }, []);

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>
  ) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
    setStatus("idle");
  };

  const getCurrentLocation = () => {
    if (!navigator.geolocation) {
      setStatus("error");
      setStatusMsg("Geolocation is not supported by your browser.");
      return;
    }

    setGettingLocation(true);
    navigator.geolocation.getCurrentPosition(
      async (position) => {
        try {
          const { latitude, longitude } = position.coords;
          // Use reverse geocoding to get location details
          const res = await fetch(
            `https://nominatim.openstreetmap.org/reverse?format=json&lat=${latitude}&lon=${longitude}&addressdetails=1`,
            { headers: { "Accept-Language": "en" } }
          );
          const data = await res.json();
          const addr = data.address || {};

          setForm((prev) => ({
            ...prev,
            city: addr.city || addr.town || addr.village || addr.county || "",
            county: addr.county || addr.state || "",
            station_address: addr.road
              ? `${addr.road}${addr.house_number ? `, ${addr.house_number}` : ""}`
              : `${latitude.toFixed(4)}, ${longitude.toFixed(4)}`,
          }));
          setStatus("idle");
        } catch {
          setStatus("error");
          setStatusMsg("Could not determine your location. Please fill in manually.");
        } finally {
          setGettingLocation(false);
        }
      },
      () => {
        setGettingLocation(false);
        setStatus("error");
        setStatusMsg("Could not get your location. Please enable location access or fill in manually.");
      },
      { enableHighAccuracy: true, timeout: 10000 }
    );
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSubmitting(true);
    setStatus("idle");

    try {
      // 1. Find or create station
      let stationId: string;

      const { data: existingStations } = await supabase
        .from("stations")
        .select("id")
        .ilike("name", form.station_name.trim())
        .ilike("city", form.city.trim())
        .ilike("county", form.county.trim())
        .limit(1);

      if (existingStations && existingStations.length > 0) {
        stationId = existingStations[0].id;
      } else {
        const { data: newStation, error: stationError } = await supabase
          .from("stations")
          .insert({
            name: form.station_name.trim(),
            address: form.station_address.trim(),
            city: form.city.trim(),
            county: form.county,
            brand: form.brand || null,
          })
          .select("id")
          .single();

        if (stationError) throw stationError;
        stationId = newStation!.id;
      }

      // 2. Submit price
      const { error: priceError } = await supabase
        .from("price_submissions")
        .insert({
          station_id: stationId,
          fuel_type_id: form.fuel_type_id,
          price: parseFloat(form.price),
          notes: form.notes || null,
        });

      if (priceError) throw priceError;

      setStatus("success");
      setStatusMsg("Price submitted successfully! Thank you for contributing.");
      setForm({
        station_name: "",
        station_address: "",
        city: "",
        county: "",
        brand: "",
        fuel_type_id: 1,
        price: "",
        notes: "",
      });
    } catch (err) {
      setStatus("error");
      setStatusMsg(
        err instanceof Error ? err.message : "Failed to submit price. Please try again."
      );
    } finally {
      setSubmitting(false);
    }
  };

  if (loading) {
    return (
      <div className="glass-card p-8 flex items-center justify-center">
        <Loader2 className="w-6 h-6 text-fuel-400 animate-spin" />
      </div>
    );
  }

  return (
    <div className="glass-card p-6 sm:p-8">
      <div className="mb-6">
        <h2 className="text-xl font-bold text-white">Report Fuel Price</h2>
        <p className="text-sm text-surface-400 mt-1">
          Help Kenyans find the best fuel prices by sharing what you see at the pump
        </p>
      </div>

      {status === "success" && (
        <div className="mb-6 p-4 rounded-xl bg-petro-500/10 border border-petro-500/20 flex items-start gap-3">
          <CheckCircle2 className="w-5 h-5 text-petro-400 mt-0.5 flex-shrink-0" />
          <div>
            <p className="text-sm font-medium text-petro-300">{statusMsg}</p>
          </div>
        </div>
      )}

      {status === "error" && (
        <div className="mb-6 p-4 rounded-xl bg-red-500/10 border border-red-500/20 flex items-start gap-3">
          <AlertCircle className="w-5 h-5 text-red-400 mt-0.5 flex-shrink-0" />
          <div>
            <p className="text-sm font-medium text-red-300">{statusMsg}</p>
          </div>
        </div>
      )}

      <form onSubmit={handleSubmit} className="space-y-5">
        {/* Quick location button */}
        <button
          type="button"
          onClick={getCurrentLocation}
          disabled={gettingLocation}
          className="btn-secondary w-full text-sm"
        >
          {gettingLocation ? (
            <>
              <Loader2 className="w-4 h-4 animate-spin" />
              Detecting your location...
            </>
          ) : (
            <>
              <Crosshair className="w-4 h-4" />
              Use My Current Location
            </>
          )}
        </button>

        {/* Station Name */}
        <div>
          <label className="block text-sm font-medium text-surface-300 mb-1.5">
            <Building2 className="w-4 h-4 inline mr-1.5 text-surface-500" />
            Station Name *
          </label>
          <input
            type="text"
            name="station_name"
            value={form.station_name}
            onChange={handleChange}
            required
            placeholder="e.g. TotalEnergies, Shell, Vivo Energy, Rubis..."
            className="input-field"
          />
        </div>

        {/* Address */}
        <div>
          <label className="block text-sm font-medium text-surface-300 mb-1.5">
            <MapPin className="w-4 h-4 inline mr-1.5 text-surface-500" />
            Street / Landmark *
          </label>
          <input
            type="text"
            name="station_address"
            value={form.station_address}
            onChange={handleChange}
            required
            placeholder="e.g. Moi Avenue, Kenyatta Highway, or landmark"
            className="input-field"
          />
        </div>

        {/* City + County */}
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-surface-300 mb-1.5">
              City / Town *
            </label>
            <input
              type="text"
              name="city"
              value={form.city}
              onChange={handleChange}
              required
              placeholder="e.g. Nairobi, Mombasa, Kisumu"
              className="input-field"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-surface-300 mb-1.5">
              County *
            </label>
            <select
              name="county"
              value={form.county}
              onChange={handleChange}
              required
              className="select-field"
            >
              <option value="">Select county</option>
              {KENYA_COUNTIES.map((county) => (
                <option key={county} value={county}>
                  {county}
                </option>
              ))}
            </select>
          </div>
        </div>

        {/* Brand + Fuel Type */}
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-surface-300 mb-1.5">
              Brand
            </label>
            <input
              type="text"
              name="brand"
              value={form.brand}
              onChange={handleChange}
              placeholder="e.g. TotalEnergies, Shell, Rubis, Kenol"
              className="input-field"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-surface-300 mb-1.5">
              <Fuel className="w-4 h-4 inline mr-1.5 text-surface-500" />
              Fuel Type *
            </label>
            <select
              name="fuel_type_id"
              value={form.fuel_type_id}
              onChange={handleChange}
              required
              className="select-field"
            >
              {fuelTypes.map((ft) => (
                <option key={ft.id} value={ft.id}>
                  {ft.name}
                </option>
              ))}
            </select>
          </div>
        </div>

        {/* Price in KES */}
        <div>
          <label className="block text-sm font-medium text-surface-300 mb-1.5">
            <DollarSign className="w-4 h-4 inline mr-1.5 text-surface-500" />
            Price per Litre (KSh) *
          </label>
          <div className="relative">
            <span className="absolute left-3 top-1/2 -translate-y-1/2 text-surface-400 font-medium">
              KSh
            </span>
            <input
              type="number"
              name="price"
              value={form.price}
              onChange={handleChange}
              required
              step="0.01"
              min="0"
              max="999.99"
              placeholder="0.00"
              className="input-field pl-14 font-mono text-lg"
            />
          </div>
          <p className="text-xs text-surface-500 mt-1">
            Price in Kenyan Shillings (KSh) per litre
          </p>
        </div>

        {/* Notes */}
        <div>
          <label className="block text-sm font-medium text-surface-300 mb-1.5">
            <StickyNote className="w-4 h-4 inline mr-1.5 text-surface-500" />
            Notes (optional)
          </label>
          <textarea
            name="notes"
            value={form.notes}
            onChange={handleChange}
            rows={3}
            placeholder="e.g. Cash price, card price, loyalty discount available"
            className="input-field resize-none"
          />
        </div>

        {/* Submit */}
        <button
          type="submit"
          disabled={submitting}
          className="btn-primary w-full text-base py-3"
        >
          {submitting ? (
            <>
              <Loader2 className="w-5 h-5 animate-spin" />
              Submitting...
            </>
          ) : (
            <>
              <Send className="w-5 h-5" />
              Submit Price
            </>
          )}
        </button>

        <p className="text-xs text-surface-500 text-center">
          Prices are publicly visible immediately. No account required. Help your community save!
        </p>
      </form>
    </div>
  );
}
