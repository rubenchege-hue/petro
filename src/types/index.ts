export interface FuelType {
  id: number;
  name: string;
  slug: string;
  category: string;
}

export interface Station {
  id: string;
  name: string;
  address: string;
  city: string;
  county: string;
  brand: string | null;
  latitude: number | null;
  longitude: number | null;
  phone: string | null;
  hours: string | null;
  amenities: string[];
  created_at: string;
}

export interface PriceSubmission {
  id: string;
  station_id: string;
  fuel_type_id: number;
  price: number;
  submitted_at: string;
  notes: string | null;
}

export interface LatestPrice {
  id: string;
  station_id: string;
  station_name: string;
  address: string;
  city: string;
  county: string;
  brand: string | null;
  latitude: number | null;
  longitude: number | null;
  fuel_type_id: number;
  fuel_type_name: string;
  fuel_type_slug: string;
  fuel_type_category: string;
  price: number;
  submitted_at: string;
}

export interface AvgPriceRecent {
  fuel_type_id: number;
  fuel_type_name: string;
  fuel_type_slug: string;
  avg_price: number;
  min_price: number;
  max_price: number;
  submission_count: number;
}

export interface DailyPriceTrend {
  fuel_type_id: number;
  fuel_type_name: string;
  fuel_type_slug: string;
  date: string;
  avg_price: number;
  min_price: number;
  max_price: number;
  submissions: number;
}

export interface DashboardStats {
  total_submissions: number;
  total_stations: number;
  avg_price_all: number;
  cheapest_station: { name: string; price: number; fuel_type: string } | null;
  priciest_station: { name: string; price: number; fuel_type: string } | null;
}

export interface PriceSubmissionForm {
  station_name: string;
  station_address: string;
  city: string;
  county: string;
  brand: string;
  fuel_type_id: number;
  price: number;
  notes: string;
}

export interface AISuggestion {
  type: "savings" | "prediction" | "tip" | "comparison" | "alert";
  title: string;
  description: string;
  impact?: string;
  icon?: string;
}

export interface NearbyStation {
  id: string;
  name: string;
  address: string;
  city: string;
  county: string;
  brand: string | null;
  latitude: number;
  longitude: number;
  distance_km: number;
  cheapest_price: number;
  cheapest_fuel: string;
  fuels: { type: string; price: number }[];
}

// Kenya counties list
export const KENYA_COUNTIES = [
  "Baringo", "Bomet", "Bungoma", "Busia", "Elgeyo-Marakwet",
  "Embu", "Garissa", "Homa Bay", "Isiolo", "Kajiado",
  "Kakamega", "Kericho", "Kiambu", "Kilifi", "Kirinyaga",
  "Kisii", "Kisumu", "Kitui", "Kwale", "Laikipia",
  "Lamu", "Machakos", "Makueni", "Mandera", "Marsabit",
  "Meru", "Migori", "Mombasa", "Muranga", "Nairobi",
  "Nakuru", "Nandi", "Narok", "Nyamira", "Nyandarua",
  "Nyeri", "Samburu", "Siaya", "Taita-Taveta", "Tana River",
  "Tharaka-Nithi", "Trans-Nzoia", "Turkana", "Uasin Gishu",
  "Vihiga", "Wajir", "West Pokot",
];

// Major Kenya cities/towns
export const KENYA_CITIES = [
  "Nairobi", "Mombasa", "Kisumu", "Nakuru", "Eldoret",
  "Thika", "Malindi", "Kitale", "Nyeri", "Machakos",
  "Meru", "Nanyuki", "Naivasha", "Kakamega", "Garissa",
  "Isiolo", "Embu", "Lamu", "Kiambu", "Kilifi",
  "Homa Bay", "Bungoma", "Busia", "Kitui", "Migori",
  "Malaba", "Voi", "Athi River", "Ruaka", "Ruiru",
  "Juja", "Limuru", "Ngong", "Ongata Rongai", "Kikuyu",
  "Syokimau", "Mlolongo", "Utawala", "Kitengela", "Athi River",
];

export const formatKES = (amount: number) => {
  return `KSh ${amount.toLocaleString("en-KE", {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  })}`;
};
