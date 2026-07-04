-- =============================================================
-- PetroFlow Kenya - Seed Data Script
-- =============================================================
-- Run this AFTER supabase/schema.sql in Supabase SQL Editor
-- 
-- Inserts real fuel stations across Kenya with realistic prices
-- spread over the last 30 days to generate meaningful trends.
-- =============================================================

-- =============================================================
-- PART 1: STATIONS
-- =============================================================

-- Nairobi Stations (13 stations)
INSERT INTO stations (name, address, city, county, brand, latitude, longitude) VALUES
  ('TotalEnergies Kenyatta Avenue', 'Kenyatta Avenue, CBD', 'Nairobi', 'Nairobi', 'TotalEnergies', -1.2833, 36.8219),
  ('Shell Moi Avenue', 'Moi Avenue, CBD', 'Nairobi', 'Nairobi', 'Shell', -1.2864, 36.8214),
  ('Vivo Energy Ngong Road', 'Ngong Road, Adams', 'Nairobi', 'Nairobi', 'Vivo Energy', -1.3019, 36.7778),
  ('Rubis Thika Road', 'Thika Road, Kasarani', 'Nairobi', 'Nairobi', 'Rubis', -1.2350, 36.8831),
  ('Kenol Kobil Waiyaki Way', 'Waiyaki Way, Westlands', 'Nairobi', 'Nairobi', 'Kenol Kobil', -1.2681, 36.8097),
  ('National Oil Langata', 'Langata Road, Karen', 'Nairobi', 'Nairobi', 'National Oil', -1.3197, 36.7561),
  ('Shell Jogoo Road', 'Jogoo Road, Makadara', 'Nairobi', 'Nairobi', 'Shell', -1.2964, 36.8572),
  ('TotalEnergies Mombasa Road', 'Mombasa Road, South B', 'Nairobi', 'Nairobi', 'TotalEnergies', -1.3119, 36.8281),
  ('Hashi Energy Outering Road', 'Outering Road, Kariobangi', 'Nairobi', 'Nairobi', 'Hashi Energy', -1.2597, 36.8869),
  ('Rubis Limuru Road', 'Limuru Road, Gigiri', 'Nairobi', 'Nairobi', 'Rubis', -1.2300, 36.8075),
  ('Petrocity Donholm', 'Donholm, Outer Ring Road', 'Nairobi', 'Nairobi', 'Petrocity', -1.2786, 36.8906),
  ('Vivo Energy Langata', 'Langata Road, Langata', 'Nairobi', 'Nairobi', 'Vivo Energy', -1.3519, 36.7375),
  ('Kenol Kobil Uhuru Highway', 'Uhuru Highway, City Centre', 'Nairobi', 'Nairobi', 'Kenol Kobil', -1.2917, 36.8236);

-- Mombasa Stations (8 stations)
INSERT INTO stations (name, address, city, county, brand, latitude, longitude) VALUES
  ('TotalEnergies Moi Avenue Mombasa', 'Moi Avenue', 'Mombasa', 'Mombasa', 'TotalEnergies', -4.0546, 39.6686),
  ('Shell Digo Road', 'Digo Road, Nyali', 'Mombasa', 'Mombasa', 'Shell', -4.0436, 39.6894),
  ('Vivo Energy Malindi Road', 'Malindi Road, Bamburi', 'Mombasa', 'Mombasa', 'Vivo Energy', -3.9931, 39.7397),
  ('Rubis Changamwe', 'Changamwe, Mombasa Highway', 'Mombasa', 'Mombasa', 'Rubis', -4.0222, 39.6375),
  ('Kenol Kobil Nyali Bridge', 'Nyali Road, Nyali', 'Mombasa', 'Mombasa', 'Kenol Kobil', -4.0483, 39.6819),
  ('National Oil Likoni', 'Likoni Ferry Road', 'Mombasa', 'Mombasa', 'National Oil', -4.0806, 39.6603),
  ('Hashi Energy Shimanzi', 'Shimanzi Road, Industrial Area', 'Mombasa', 'Mombasa', 'Hashi Energy', -4.0469, 39.6514),
  ('Petrocity Mkomani', 'Mkomani Road, Nyali', 'Mombasa', 'Mombasa', 'Petrocity', -4.0408, 39.6958);

-- Kisumu Stations (6 stations)
INSERT INTO stations (name, address, city, county, brand, latitude, longitude) VALUES
  ('TotalEnergies Kisumu CBD', 'Oginga Odinga Road', 'Kisumu', 'Kisumu', 'TotalEnergies', -0.1003, 34.7575),
  ('Shell Kisumu Airport Road', 'Airport Road, Milimani', 'Kisumu', 'Kisumu', 'Shell', -0.1044, 34.7486),
  ('Vivo Energy Kisumu-Nairobi Hwy', 'Kisumu-Nairobi Highway, Manyatta', 'Kisumu', 'Kisumu', 'Vivo Energy', -0.0847, 34.7714),
  ('Rubis Kisumu Kondele', 'Kondele, Kisumu-Kakamega Road', 'Kisumu', 'Kisumu', 'Rubis', -0.0756, 34.7650),
  ('Kenol Kobil Kisumu', 'Achieng Oneko Road', 'Kisumu', 'Kisumu', 'Kenol Kobil', -0.0950, 34.7567),
  ('National Oil Kisumu', 'Nyalenda, Kisumu', 'Kisumu', 'Kisumu', 'National Oil', -0.1158, 34.7803);

-- Nakuru Stations (5 stations)
INSERT INTO stations (name, address, city, county, brand, latitude, longitude) VALUES
  ('TotalEnergies Nakuru CBD', 'Kenyatta Avenue', 'Nakuru', 'Nakuru', 'TotalEnergies', -0.3036, 36.0669),
  ('Shell Nakuru West', 'Nakuru-Eldoret Highway, West', 'Nakuru', 'Nakuru', 'Shell', -0.2919, 36.0475),
  ('Vivo Energy Nakuru Highway', 'Nairobi-Nakuru Highway, Lanet', 'Nakuru', 'Nakuru', 'Vivo Energy', -0.3225, 36.0786),
  ('Rubis Nakuru East', 'Mburu Gichua Road, East', 'Nakuru', 'Nakuru', 'Rubis', -0.3003, 36.0794),
  ('Kenol Kobil Menengai', 'Menengai Road', 'Nakuru', 'Nakuru', 'Kenol Kobil', -0.2889, 36.0567);

-- Eldoret Stations (5 stations)
INSERT INTO stations (name, address, city, county, brand, latitude, longitude) VALUES
  ('TotalEnergies Eldoret', 'Uganda Road, Eldoret CBD', 'Eldoret', 'Uasin Gishu', 'TotalEnergies', 0.5156, 35.2736),
  ('Shell Eldoret', 'Iten Road, Eldoret', 'Eldoret', 'Uasin Gishu', 'Shell', 0.5256, 35.2639),
  ('Vivo Energy Eldoret Hwy', 'Eldoret-Nakuru Highway, Kapsoya', 'Eldoret', 'Uasin Gishu', 'Vivo Energy', 0.5044, 35.2556),
  ('Rubis Eldoret West', 'Eldoret-Kitale Road, West', 'Eldoret', 'Uasin Gishu', 'Rubis', 0.5319, 35.2564),
  ('National Oil Eldoret', 'Nandi Road, Eldoret', 'Eldoret', 'Uasin Gishu', 'National Oil', 0.5081, 35.2786);

-- Thika Stations (4 stations)
INSERT INTO stations (name, address, city, county, brand, latitude, longitude) VALUES
  ('TotalEnergies Thika', 'Thika CBD, Kenyatta Highway', 'Thika', 'Kiambu', 'TotalEnergies', -1.0397, 37.0758),
  ('Shell Thika Bypass', 'Thika Bypass, Kiganjo', 'Thika', 'Kiambu', 'Shell', -1.0461, 37.0847),
  ('Vivo Energy Thika Road', 'Old Thika Road, Makongeni', 'Thika', 'Kiambu', 'Vivo Energy', -1.0308, 37.0686),
  ('Rubis Thika North', 'Garissa Road, Thika North', 'Thika', 'Kiambu', 'Rubis', -1.0231, 37.0903);

-- Machakos/Athi River Stations (3 stations)
INSERT INTO stations (name, address, city, county, brand, latitude, longitude) VALUES
  ('TotalEnergies Machakos', 'Machakos Town, Mombasa Road', 'Machakos', 'Machakos', 'TotalEnergies', -1.5175, 37.2675),
  ('Shell Athi River', 'Mombasa Highway, Athi River', 'Athi River', 'Machakos', 'Shell', -1.4369, 36.9850),
  ('Vivo Energy Mlolongo', 'Mombasa Road, Mlolongo', 'Mlolongo', 'Machakos', 'Vivo Energy', -1.3964, 36.9169);

-- Naivasha Stations (2 stations)
INSERT INTO stations (name, address, city, county, brand, latitude, longitude) VALUES
  ('TotalEnergies Naivasha', 'Naivasha Town, Moi South Lake Rd', 'Naivasha', 'Nakuru', 'TotalEnergies', -0.7169, 36.4344),
  ('Shell Naivasha', 'Nairobi-Nakuru Highway, Naivasha', 'Naivasha', 'Nakuru', 'Shell', -0.7253, 36.4267);

-- Nyeri Stations (2 stations)
INSERT INTO stations (name, address, city, county, brand, latitude, longitude) VALUES
  ('TotalEnergies Nyeri', 'Nyeri Town, Kimathi Way', 'Nyeri', 'Nyeri', 'TotalEnergies', -0.4200, 36.9500),
  ('Rubis Nyeri', 'Nyeri-Nanyuki Highway', 'Nyeri', 'Nyeri', 'Rubis', -0.4106, 36.9494);

-- =============================================================
-- PART 2: PRICE SUBMISSIONS
-- =============================================================
-- Generate prices over the last 30 days with realistic trends
-- Super Petrol: KSh 176-195 (trending slightly up in recent days)
-- Diesel: KSh 162-175 (stable with slight increase)
-- Premium Petrol: KSh 187-205
-- Kerosene: KSh 155-170

-- The prices below simulate daily/weekly reporting patterns
-- that real crowdsourced data would show.

-- Helper: Assign a "day offset" to spread submissions over 30 days
-- We'll use explicit timestamps for clarity

-- =============================================================
-- NAIROBI STATIONS - Price Submissions
-- =============================================================

-- TotalEnergies Kenyatta Avenue (id 1) - Super Petrol & Diesel trends
-- Station 1
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 1, 179.50, NOW() - INTERVAL '28 days', 'Morning price'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 1, 180.00, NOW() - INTERVAL '24 days', 'Price adjusted'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 1, 181.20, NOW() - INTERVAL '20 days', 'Weekly increase'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 1, 182.50, NOW() - INTERVAL '16 days', 'Mid-month update'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 1, 184.00, NOW() - INTERVAL '12 days', 'Slight rise'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 1, 185.50, NOW() - INTERVAL '8 days', 'Prices going up'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 1, 186.00, NOW() - INTERVAL '5 days', 'Current week'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 1, 187.50, NOW() - INTERVAL '2 days', 'Latest - expensive in CBD'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 2, 165.00, NOW() - INTERVAL '28 days', 'Diesel stable'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 2, 165.50, NOW() - INTERVAL '21 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 2, 166.00, NOW() - INTERVAL '14 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 2, 167.00, NOW() - INTERVAL '7 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 2, 168.50, NOW() - INTERVAL '2 days', 'Diesel creeping up');

-- Shell Moi Avenue (id 2)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 1, 179.00, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 1, 180.50, NOW() - INTERVAL '22 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 1, 182.00, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 1, 183.00, NOW() - INTERVAL '13 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 1, 185.00, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 1, 186.50, NOW() - INTERVAL '4 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 1, 188.00, NOW() - INTERVAL '1 day', 'Latest CBD price'),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 2, 164.50, NOW() - INTERVAL '25 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 2, 165.00, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 2, 166.50, NOW() - INTERVAL '10 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 2, 168.00, NOW() - INTERVAL '3 days', 'Diesel current');

-- Vivo Energy Ngong Road (id 3) - slightly cheaper (less premium location)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 1, 177.50, NOW() - INTERVAL '29 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 1, 178.00, NOW() - INTERVAL '23 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 1, 179.50, NOW() - INTERVAL '19 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 1, 181.00, NOW() - INTERVAL '15 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 1, 182.50, NOW() - INTERVAL '11 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 1, 184.00, NOW() - INTERVAL '6 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 1, 185.50, NOW() - INTERVAL '2 days', 'Adams current'),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 2, 163.00, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 2, 163.50, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 2, 164.00, NOW() - INTERVAL '12 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Ngong Road'), 2, 165.50, NOW() - INTERVAL '4 days', 'Ngong Rd diesel');

-- Rubis Thika Road (id 4) - competitive pricing
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 1, 176.00, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 1, 176.50, NOW() - INTERVAL '22 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 1, 178.00, NOW() - INTERVAL '17 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 1, 179.50, NOW() - INTERVAL '13 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 1, 181.00, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 1, 183.00, NOW() - INTERVAL '5 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 1, 184.00, NOW() - INTERVAL '1 day', 'Kasarani - Rubis competitive'),
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 2, 161.50, NOW() - INTERVAL '27 days', 'Cheapest diesel'),
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 2, 162.00, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 2, 163.50, NOW() - INTERVAL '12 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Thika Road'), 2, 165.00, NOW() - INTERVAL '3 days', 'Kasarani diesel');

-- Kenol Kobil Waiyaki Way (id 5)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Kenol Kobil Waiyaki Way'), 1, 181.00, NOW() - INTERVAL '26 days', ''),
  ((SELECT id FROM stations WHERE name = 'Kenol Kobil Waiyaki Way'), 1, 182.50, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'Kenol Kobil Waiyaki Way'), 1, 184.00, NOW() - INTERVAL '15 days', ''),
  ((SELECT id FROM stations WHERE name = 'Kenol Kobil Waiyaki Way'), 1, 185.50, NOW() - INTERVAL '10 days', ''),
  ((SELECT id FROM stations WHERE name = 'Kenol Kobil Waiyaki Way'), 1, 187.00, NOW() - INTERVAL '6 days', ''),
  ((SELECT id FROM stations WHERE name = 'Kenol Kobil Waiyaki Way'), 1, 188.50, NOW() - INTERVAL '2 days', 'Westlands premium location'),
  ((SELECT id FROM stations WHERE name = 'Kenol Kobil Waiyaki Way'), 2, 166.00, NOW() - INTERVAL '25 days', ''),
  ((SELECT id FROM stations WHERE name = 'Kenol Kobil Waiyaki Way'), 2, 167.00, NOW() - INTERVAL '16 days', ''),
  ((SELECT id FROM stations WHERE name = 'Kenol Kobil Waiyaki Way'), 2, 168.50, NOW() - INTERVAL '8 days', ''),
  ((SELECT id FROM stations WHERE name = 'Kenol Kobil Waiyaki Way'), 2, 170.00, NOW() - INTERVAL '1 day', 'Westlands diesel');

-- National Oil Langata (id 6) - budget friendly
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 1, 176.00, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 1, 177.00, NOW() - INTERVAL '21 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 1, 178.50, NOW() - INTERVAL '16 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 1, 180.00, NOW() - INTERVAL '11 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 1, 181.50, NOW() - INTERVAL '7 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 1, 183.00, NOW() - INTERVAL '3 days', 'Karen - National Oil cheaper'),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 2, 162.00, NOW() - INTERVAL '28 days', 'National Oil budget diesel'),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 2, 162.50, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 2, 163.50, NOW() - INTERVAL '12 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 2, 165.00, NOW() - INTERVAL '4 days', 'Karen diesel');

-- Shell Jogoo Road (id 7)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Shell Jogoo Road'), 1, 178.50, NOW() - INTERVAL '26 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Jogoo Road'), 1, 180.00, NOW() - INTERVAL '19 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Jogoo Road'), 1, 181.50, NOW() - INTERVAL '14 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Jogoo Road'), 1, 183.00, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Jogoo Road'), 1, 185.00, NOW() - INTERVAL '4 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Jogoo Road'), 2, 164.00, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Jogoo Road'), 2, 165.00, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Jogoo Road'), 2, 166.50, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Jogoo Road'), 2, 167.50, NOW() - INTERVAL '2 days', 'Makadara diesel');

-- TotalEnergies Mombasa Road (id 8)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 1, 178.00, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 1, 179.50, NOW() - INTERVAL '23 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 1, 181.00, NOW() - INTERVAL '17 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 1, 182.50, NOW() - INTERVAL '11 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 1, 184.00, NOW() - INTERVAL '6 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 1, 185.50, NOW() - INTERVAL '2 days', 'South B'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 2, 163.50, NOW() - INTERVAL '26 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 2, 164.50, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 2, 166.00, NOW() - INTERVAL '10 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 2, 167.00, NOW() - INTERVAL '3 days', 'South B diesel');

-- Hashi Energy Outering (id 9) - budget brand
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Hashi Energy Outering Road'), 1, 175.50, NOW() - INTERVAL '27 days', 'Hashi cheapest'),
  ((SELECT id FROM stations WHERE name = 'Hashi Energy Outering Road'), 1, 176.00, NOW() - INTERVAL '21 days', ''),
  ((SELECT id FROM stations WHERE name = 'Hashi Energy Outering Road'), 1, 177.50, NOW() - INTERVAL '15 days', ''),
  ((SELECT id FROM stations WHERE name = 'Hashi Energy Outering Road'), 1, 179.00, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'Hashi Energy Outering Road'), 1, 180.50, NOW() - INTERVAL '4 days', ''),
  ((SELECT id FROM stations WHERE name = 'Hashi Energy Outering Road'), 1, 182.00, NOW() - INTERVAL '1 day', 'Kariobangi - still budget'),
  ((SELECT id FROM stations WHERE name = 'Hashi Energy Outering Road'), 2, 161.00, NOW() - INTERVAL '29 days', 'Best diesel price'),
  ((SELECT id FROM stations WHERE name = 'Hashi Energy Outering Road'), 2, 161.50, NOW() - INTERVAL '22 days', ''),
  ((SELECT id FROM stations WHERE name = 'Hashi Energy Outering Road'), 2, 162.50, NOW() - INTERVAL '14 days', ''),
  ((SELECT id FROM stations WHERE name = 'Hashi Energy Outering Road'), 2, 164.00, NOW() - INTERVAL '5 days', 'Kariobangi diesel');

-- =============================================================
-- MOMBASA STATIONS - Price Submissions
-- =============================================================

-- TotalEnergies Moi Avenue Mombasa (id 14)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Moi Avenue Mombasa'), 1, 180.00, NOW() - INTERVAL '26 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Moi Avenue Mombasa'), 1, 181.50, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Moi Avenue Mombasa'), 1, 183.00, NOW() - INTERVAL '15 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Moi Avenue Mombasa'), 1, 184.50, NOW() - INTERVAL '10 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Moi Avenue Mombasa'), 1, 186.00, NOW() - INTERVAL '5 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Moi Avenue Mombasa'), 1, 187.50, NOW() - INTERVAL '1 day', 'Mombasa CBD price'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Moi Avenue Mombasa'), 2, 164.50, NOW() - INTERVAL '25 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Moi Avenue Mombasa'), 2, 165.50, NOW() - INTERVAL '17 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Moi Avenue Mombasa'), 2, 167.00, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Moi Avenue Mombasa'), 2, 168.50, NOW() - INTERVAL '2 days', 'Mombasa diesel');

-- Shell Digo Road (id 15)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Shell Digo Road'), 1, 179.50, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Digo Road'), 1, 181.00, NOW() - INTERVAL '22 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Digo Road'), 1, 182.50, NOW() - INTERVAL '16 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Digo Road'), 1, 184.00, NOW() - INTERVAL '11 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Digo Road'), 1, 185.50, NOW() - INTERVAL '6 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Digo Road'), 1, 186.50, NOW() - INTERVAL '2 days', 'Nyali premium'),
  ((SELECT id FROM stations WHERE name = 'Shell Digo Road'), 2, 165.00, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Digo Road'), 2, 166.00, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Digo Road'), 2, 167.50, NOW() - INTERVAL '11 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Digo Road'), 2, 169.00, NOW() - INTERVAL '3 days', 'Nyali diesel');

-- Vivo Energy Malindi Road (id 16)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Malindi Road'), 1, 178.00, NOW() - INTERVAL '26 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Malindi Road'), 1, 179.50, NOW() - INTERVAL '19 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Malindi Road'), 1, 181.00, NOW() - INTERVAL '13 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Malindi Road'), 1, 182.50, NOW() - INTERVAL '8 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Malindi Road'), 1, 184.00, NOW() - INTERVAL '3 days', 'Bamburi'),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Malindi Road'), 2, 163.50, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Malindi Road'), 2, 164.50, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Malindi Road'), 2, 166.00, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Malindi Road'), 2, 167.00, NOW() - INTERVAL '2 days', 'Bamburi diesel');

-- Rubis Changamwe (id 17) - competitive pricing
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Rubis Changamwe'), 1, 177.00, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Changamwe'), 1, 178.50, NOW() - INTERVAL '21 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Changamwe'), 1, 180.00, NOW() - INTERVAL '14 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Changamwe'), 1, 181.50, NOW() - INTERVAL '8 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Changamwe'), 1, 183.00, NOW() - INTERVAL '3 days', 'Changamwe Rubis price'),
  ((SELECT id FROM stations WHERE name = 'Rubis Changamwe'), 2, 162.00, NOW() - INTERVAL '28 days', 'Changamwe cheap diesel'),
  ((SELECT id FROM stations WHERE name = 'Rubis Changamwe'), 2, 163.00, NOW() - INTERVAL '19 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Changamwe'), 2, 164.50, NOW() - INTERVAL '10 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Changamwe'), 2, 166.00, NOW() - INTERVAL '4 days', 'Changamwe diesel');

-- =============================================================
-- KISUMU STATIONS - Price Submissions
-- =============================================================

-- TotalEnergies Kisumu CBD (id 22)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 1, 179.00, NOW() - INTERVAL '26 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 1, 180.50, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 1, 182.00, NOW() - INTERVAL '14 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 1, 183.50, NOW() - INTERVAL '8 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 1, 185.00, NOW() - INTERVAL '3 days', 'Kisumu CBD'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 2, 164.00, NOW() - INTERVAL '25 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 2, 165.00, NOW() - INTERVAL '17 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 2, 166.50, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 2, 168.00, NOW() - INTERVAL '2 days', 'Kisumu diesel');

-- Shell Kisumu Airport Road (id 23)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Shell Kisumu Airport Road'), 1, 178.50, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Kisumu Airport Road'), 1, 180.00, NOW() - INTERVAL '22 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Kisumu Airport Road'), 1, 181.50, NOW() - INTERVAL '15 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Kisumu Airport Road'), 1, 183.00, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Kisumu Airport Road'), 1, 184.50, NOW() - INTERVAL '4 days', 'Milimani'),
  ((SELECT id FROM stations WHERE name = 'Shell Kisumu Airport Road'), 2, 163.50, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Kisumu Airport Road'), 2, 164.50, NOW() - INTERVAL '19 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Kisumu Airport Road'), 2, 166.00, NOW() - INTERVAL '10 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Kisumu Airport Road'), 2, 167.50, NOW() - INTERVAL '2 days', 'Milimani diesel');

-- Rubis Kisumu Kondele (id 25) - competitive
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Rubis Kisumu Kondele'), 1, 177.00, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Kisumu Kondele'), 1, 178.50, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Kisumu Kondele'), 1, 180.00, NOW() - INTERVAL '13 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Kisumu Kondele'), 1, 181.50, NOW() - INTERVAL '7 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Kisumu Kondele'), 1, 183.00, NOW() - INTERVAL '2 days', 'Kondele - competitive'),
  ((SELECT id FROM stations WHERE name = 'Rubis Kisumu Kondele'), 2, 162.50, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Kisumu Kondele'), 2, 163.50, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Kisumu Kondele'), 2, 165.00, NOW() - INTERVAL '11 days', ''),
  ((SELECT id FROM stations WHERE name = 'Rubis Kisumu Kondele'), 2, 166.50, NOW() - INTERVAL '3 days', 'Kondele diesel');

-- =============================================================
-- NAKURU STATIONS - Price Submissions
-- =============================================================

-- TotalEnergies Nakuru CBD (id 28)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 1, 178.00, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 1, 179.50, NOW() - INTERVAL '21 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 1, 181.00, NOW() - INTERVAL '15 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 1, 182.50, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 1, 184.00, NOW() - INTERVAL '4 days', 'Nakuru town'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 2, 163.00, NOW() - INTERVAL '26 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 2, 164.00, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 2, 165.50, NOW() - INTERVAL '10 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 2, 167.00, NOW() - INTERVAL '3 days', 'Nakuru diesel');

-- Vivo Energy Nakuru Highway (id 30)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Nakuru Highway'), 1, 177.00, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Nakuru Highway'), 1, 178.50, NOW() - INTERVAL '22 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Nakuru Highway'), 1, 180.00, NOW() - INTERVAL '16 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Nakuru Highway'), 1, 181.50, NOW() - INTERVAL '10 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Nakuru Highway'), 1, 183.00, NOW() - INTERVAL '4 days', 'Lanet highway price'),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Nakuru Highway'), 2, 162.50, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Nakuru Highway'), 2, 163.50, NOW() - INTERVAL '19 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Nakuru Highway'), 2, 165.00, NOW() - INTERVAL '11 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Nakuru Highway'), 2, 166.50, NOW() - INTERVAL '2 days', 'Lanet diesel');

-- =============================================================
-- ELDORET STATIONS - Price Submissions
-- =============================================================

-- TotalEnergies Eldoret (id 33)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Eldoret'), 1, 178.50, NOW() - INTERVAL '26 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Eldoret'), 1, 180.00, NOW() - INTERVAL '19 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Eldoret'), 1, 181.50, NOW() - INTERVAL '12 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Eldoret'), 1, 183.00, NOW() - INTERVAL '6 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Eldoret'), 1, 184.50, NOW() - INTERVAL '2 days', 'Eldoret CBD'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Eldoret'), 2, 163.50, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Eldoret'), 2, 164.50, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Eldoret'), 2, 166.00, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Eldoret'), 2, 167.50, NOW() - INTERVAL '2 days', 'Eldoret diesel');

-- National Oil Eldoret (id 37) - budget option
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 1, 176.50, NOW() - INTERVAL '27 days', 'National Oil cheaper'),
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 1, 178.00, NOW() - INTERVAL '21 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 1, 179.50, NOW() - INTERVAL '14 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 1, 181.00, NOW() - INTERVAL '8 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 1, 182.50, NOW() - INTERVAL '3 days', 'Eldoret budget'),
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 2, 161.50, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 2, 162.50, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 2, 164.00, NOW() - INTERVAL '10 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 2, 165.50, NOW() - INTERVAL '2 days', 'Eldoret cheap diesel');

-- =============================================================
-- THIKA STATIONS - Price Submissions
-- =============================================================

-- TotalEnergies Thika (id 38)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Thika'), 1, 177.50, NOW() - INTERVAL '26 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Thika'), 1, 179.00, NOW() - INTERVAL '19 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Thika'), 1, 180.50, NOW() - INTERVAL '12 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Thika'), 1, 182.00, NOW() - INTERVAL '6 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Thika'), 1, 183.50, NOW() - INTERVAL '2 days', 'Thika town'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Thika'), 2, 162.50, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Thika'), 2, 163.50, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Thika'), 2, 165.00, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Thika'), 2, 166.50, NOW() - INTERVAL '2 days', 'Thika diesel');

-- Shell Thika Bypass (id 39)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Shell Thika Bypass'), 1, 177.00, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Thika Bypass'), 1, 178.50, NOW() - INTERVAL '22 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Thika Bypass'), 1, 180.00, NOW() - INTERVAL '15 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Thika Bypass'), 1, 181.50, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Thika Bypass'), 1, 183.00, NOW() - INTERVAL '3 days', 'Kiganjo bypass'),
  ((SELECT id FROM stations WHERE name = 'Shell Thika Bypass'), 2, 162.00, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Thika Bypass'), 2, 163.00, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Thika Bypass'), 2, 164.50, NOW() - INTERVAL '9 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Thika Bypass'), 2, 166.00, NOW() - INTERVAL '2 days', 'Kiganjo diesel');

-- =============================================================
-- ATHI RIVER / MLOLONGO - Price Submissions
-- =============================================================

-- Shell Athi River (id 43)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Shell Athi River'), 1, 177.00, NOW() - INTERVAL '26 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Athi River'), 1, 178.50, NOW() - INTERVAL '19 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Athi River'), 1, 180.00, NOW() - INTERVAL '12 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Athi River'), 1, 181.50, NOW() - INTERVAL '6 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Athi River'), 1, 183.00, NOW() - INTERVAL '2 days', 'Athi River'),
  ((SELECT id FROM stations WHERE name = 'Shell Athi River'), 2, 162.00, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Athi River'), 2, 163.00, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Athi River'), 2, 164.50, NOW() - INTERVAL '11 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Athi River'), 2, 166.00, NOW() - INTERVAL '3 days', 'Athi River diesel');

-- Vivo Energy Mlolongo (id 44)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Mlolongo'), 1, 176.50, NOW() - INTERVAL '27 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Mlolongo'), 1, 178.00, NOW() - INTERVAL '21 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Mlolongo'), 1, 179.50, NOW() - INTERVAL '14 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Mlolongo'), 1, 181.00, NOW() - INTERVAL '8 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Mlolongo'), 1, 182.50, NOW() - INTERVAL '2 days', 'Mlolongo'),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Mlolongo'), 2, 161.50, NOW() - INTERVAL '28 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Mlolongo'), 2, 162.50, NOW() - INTERVAL '19 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Mlolongo'), 2, 164.00, NOW() - INTERVAL '10 days', ''),
  ((SELECT id FROM stations WHERE name = 'Vivo Energy Mlolongo'), 2, 165.50, NOW() - INTERVAL '3 days', 'Mlolongo diesel');

-- =============================================================
-- PREMIUM PETROL & KEROSENE samples
-- =============================================================

-- Some stations also sell Premium Petrol (fuel_type_id 3)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 3, 194.00, NOW() - INTERVAL '20 days', 'Premium available'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 3, 196.50, NOW() - INTERVAL '10 days', 'Premium price'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kenyatta Avenue'), 3, 198.00, NOW() - INTERVAL '2 days', 'Premium latest'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 3, 193.00, NOW() - INTERVAL '18 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Mombasa Road'), 3, 195.00, NOW() - INTERVAL '8 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 3, 195.00, NOW() - INTERVAL '15 days', ''),
  ((SELECT id FROM stations WHERE name = 'Shell Moi Avenue'), 3, 197.00, NOW() - INTERVAL '5 days', 'Shell premium'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 3, 193.50, NOW() - INTERVAL '14 days', ''),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 3, 195.50, NOW() - INTERVAL '3 days', 'Kisumu premium');

-- Some stations with Kerosene (fuel_type_id 4) and LPG (fuel_type_id 5)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at, notes) VALUES
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 4, 158.00, NOW() - INTERVAL '22 days', 'Kerosene - National Oil'),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 4, 160.00, NOW() - INTERVAL '12 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Langata'), 4, 162.00, NOW() - INTERVAL '3 days', 'Kerosene current'),
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 4, 157.00, NOW() - INTERVAL '20 days', ''),
  ((SELECT id FROM stations WHERE name = 'National Oil Eldoret'), 4, 159.50, NOW() - INTERVAL '8 days', 'Kerosene'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 5, 2150.00, NOW() - INTERVAL '15 days', 'LPG 13kg cylinder'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Nakuru CBD'), 5, 2180.00, NOW() - INTERVAL '3 days', 'LPG current price'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 5, 2130.00, NOW() - INTERVAL '10 days', 'LPG Kisumu'),
  ((SELECT id FROM stations WHERE name = 'TotalEnergies Kisumu CBD'), 5, 2160.00, NOW() - INTERVAL '2 days', 'LPG current');

-- =============================================================
-- VERIFICATION QUERIES (run these to verify data was inserted)
-- =============================================================

-- SELECT 'Stations' AS section, COUNT(*) AS count FROM stations
-- UNION ALL
-- SELECT 'Price Submissions' AS section, COUNT(*) AS count FROM price_submissions;

-- SELECT ft.name, ROUND(AVG(ps.price)::numeric, 2) AS avg_price,
--        MIN(ps.price) AS min_price, MAX(ps.price) AS max_price, COUNT(*) AS reports
-- FROM price_submissions ps
-- JOIN fuel_types ft ON ft.id = ps.fuel_type_id
-- GROUP BY ft.name
-- ORDER BY ft.name;

-- SELECT s.name, s.city, s.county, s.brand,
--        ROUND(AVG(CASE WHEN ft.slug = 'super-petrol' THEN ps.price END)::numeric, 2) AS super_petrol,
--        ROUND(AVG(CASE WHEN ft.slug = 'diesel' THEN ps.price END)::numeric, 2) AS diesel
-- FROM stations s
-- JOIN price_submissions ps ON ps.station_id = s.id
-- JOIN fuel_types ft ON ft.id = ps.fuel_type_id
-- GROUP BY s.id, s.name, s.city, s.county, s.brand
-- ORDER BY s.county, s.city;
