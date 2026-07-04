import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

// Browser client
export const supabase = createClient(supabaseUrl, supabaseAnonKey);

// Helper: fetch all fuel types
export async function getFuelTypes() {
  const { data, error } = await supabase
    .from("fuel_types")
    .select("*")
    .order("id");
  if (error) throw error;
  return data;
}

// Helper: fetch all stations
export async function getStations() {
  const { data, error } = await supabase
    .from("stations")
    .select("*")
    .order("name");
  if (error) throw error;
  return data;
}

// Helper: fetch latest prices (with station & fuel type info)
export async function getLatestPrices(options?: {
  fuelTypeSlug?: string;
  county?: string;
  city?: string;
  brand?: string;
  orderBy?: string;
  orderDir?: "asc" | "desc";
  limit?: number;
}) {
  let query = supabase.from("latest_prices").select("*");

  if (options?.fuelTypeSlug) {
    query = query.eq("fuel_type_slug", options.fuelTypeSlug);
  }
  if (options?.county) {
    query = query.eq("county", options.county);
  }
  if (options?.city) {
    query = query.ilike("city", `%${options.city}%`);
  }
  if (options?.brand) {
    query = query.ilike("brand", `%${options.brand}%`);
  }

  const orderCol = options?.orderBy || "submitted_at";
  const orderDir = options?.orderDir || "desc";
  query = query.order(orderCol, { ascending: orderDir === "asc" });

  if (options?.limit) {
    query = query.limit(options.limit);
  }

  const { data, error } = await query;
  if (error) throw error;
  return data;
}

// Helper: get average prices by fuel type (last 7 days)
export async function getAvgPricesRecent() {
  const { data, error } = await supabase.from("avg_prices_recent").select("*");
  if (error) throw error;
  return data;
}

// Helper: get daily price trends (last 30 days)
export async function getDailyPriceTrends() {
  const { data, error } = await supabase
    .from("daily_price_trends")
    .select("*")
    .order("date");
  if (error) throw error;
  return data;
}

// Helper: get all stations with their cheapest price (for map/nearby)
export async function getStationsWithPrices() {
  const { data, error } = await supabase
    .from("latest_prices")
    .select("*")
    .order("price", { ascending: true });

  if (error) throw error;
  return data || [];
}

// Helper: get dashboard stats
export async function getDashboardStats() {
  const [
    { count: total_submissions },
    { count: total_stations },
    { data: avgData },
    { data: cheapestData },
    { data: priciestData },
  ] = await Promise.all([
    supabase
      .from("price_submissions")
      .select("*", { count: "exact", head: true }),
    supabase.from("stations").select("*", { count: "exact", head: true }),
    supabase
      .from("avg_prices_recent")
      .select("avg_price")
      .limit(1)
      .single(),
    supabase
      .from("latest_prices")
      .select("station_name, price, fuel_type_name")
      .order("price", { ascending: true })
      .limit(1)
      .single(),
    supabase
      .from("latest_prices")
      .select("station_name, price, fuel_type_name")
      .order("price", { ascending: false })
      .limit(1)
      .single(),
  ]);

  return {
    total_submissions: total_submissions ?? 0,
    total_stations: total_stations ?? 0,
    avg_price_all: avgData?.avg_price ?? 0,
    cheapest_station: cheapestData
      ? {
          name: cheapestData.station_name,
          price: cheapestData.price,
          fuel_type: cheapestData.fuel_type_name,
        }
      : null,
    priciest_station: priciestData
      ? {
          name: priciestData.station_name,
          price: priciestData.price,
          fuel_type: priciestData.fuel_type_name,
        }
      : null,
  };
}
