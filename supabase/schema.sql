-- PetroFlow Kenya - Database Schema
-- Run this in your Supabase SQL Editor

-- Fuel Types (Kenya-specific)
CREATE TABLE fuel_types (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  category TEXT NOT NULL DEFAULT 'petrol'
);

INSERT INTO fuel_types (name, slug, category) VALUES
  ('Super Petrol', 'super-petrol', 'petrol'),
  ('Diesel', 'diesel', 'diesel'),
  ('Premium Petrol', 'premium-petrol', 'petrol'),
  ('Kerosene', 'kerosene', 'kerosene'),
  ('LPG (Cooking Gas)', 'lpg', 'lpg'),
  ('Biofuels', 'biofuel', 'alternative');

-- Stations (Kenya fuel stations)
CREATE TABLE stations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  address TEXT NOT NULL,
  city TEXT NOT NULL,
  county TEXT NOT NULL,
  brand TEXT,
  latitude DOUBLE PRECISION,
  longitude DOUBLE PRECISION,
  phone TEXT,
  hours TEXT,
  amenities TEXT[] DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Price Submissions (in KES)
CREATE TABLE price_submissions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  station_id UUID REFERENCES stations(id) ON DELETE CASCADE,
  fuel_type_id INTEGER REFERENCES fuel_types(id) ON DELETE CASCADE,
  price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
  submitted_at TIMESTAMPTZ DEFAULT NOW(),
  notes TEXT,
  submitter_ip TEXT
);

-- Indexes for performance
CREATE INDEX idx_submissions_station_id ON price_submissions(station_id);
CREATE INDEX idx_submissions_fuel_type_id ON price_submissions(fuel_type_id);
CREATE INDEX idx_submissions_submitted_at ON price_submissions(submitted_at DESC);
CREATE INDEX idx_submissions_price ON price_submissions(price);
CREATE INDEX idx_stations_city ON stations(city);
CREATE INDEX idx_stations_county ON stations(county);
CREATE INDEX idx_stations_brand ON stations(brand);

-- View: Latest price for each station + fuel type combo
CREATE VIEW latest_prices AS
SELECT DISTINCT ON (ps.station_id, ps.fuel_type_id)
  ps.id,
  ps.station_id,
  s.name AS station_name,
  s.address,
  s.city,
  s.county,
  s.brand,
  s.latitude,
  s.longitude,
  ps.fuel_type_id,
  ft.name AS fuel_type_name,
  ft.slug AS fuel_type_slug,
  ft.category AS fuel_type_category,
  ps.price,
  ps.submitted_at
FROM price_submissions ps
JOIN stations s ON s.id = ps.station_id
JOIN fuel_types ft ON ft.id = ps.fuel_type_id
ORDER BY ps.station_id, ps.fuel_type_id, ps.submitted_at DESC;

-- View: Avg price by fuel type (last 7 days)
CREATE VIEW avg_prices_recent AS
SELECT
  ft.id AS fuel_type_id,
  ft.name AS fuel_type_name,
  ft.slug AS fuel_type_slug,
  ROUND(AVG(ps.price)::numeric, 2) AS avg_price,
  MIN(ps.price) AS min_price,
  MAX(ps.price) AS max_price,
  COUNT(*) AS submission_count
FROM price_submissions ps
JOIN fuel_types ft ON ft.id = ps.fuel_type_id
WHERE ps.submitted_at > NOW() - INTERVAL '7 days'
GROUP BY ft.id, ft.name, ft.slug
ORDER BY ft.name;

-- View: Price trends (daily avg by fuel type, last 30 days)
CREATE VIEW daily_price_trends AS
SELECT
  ft.id AS fuel_type_id,
  ft.name AS fuel_type_name,
  ft.slug AS fuel_type_slug,
  DATE(ps.submitted_at) AS date,
  ROUND(AVG(ps.price)::numeric, 2) AS avg_price,
  MIN(ps.price) AS min_price,
  MAX(ps.price) AS max_price,
  COUNT(*) AS submissions
FROM price_submissions ps
JOIN fuel_types ft ON ft.id = ps.fuel_type_id
WHERE ps.submitted_at > NOW() - INTERVAL '30 days'
GROUP BY ft.id, ft.name, ft.slug, DATE(ps.submitted_at)
ORDER BY date;

-- Enable Row Level Security (open for public submissions, no auth needed)
ALTER TABLE stations ENABLE ROW LEVEL SECURITY;
ALTER TABLE price_submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE fuel_types ENABLE ROW LEVEL SECURITY;

-- Permissive policies for anonymous contributions
CREATE POLICY "Allow public read on stations"
  ON stations FOR SELECT USING (true);

CREATE POLICY "Allow public insert on stations"
  ON stations FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public read on price_submissions"
  ON price_submissions FOR SELECT USING (true);

CREATE POLICY "Allow public insert on price_submissions"
  ON price_submissions FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public read on fuel_types"
  ON fuel_types FOR SELECT USING (true);
