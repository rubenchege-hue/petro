-- =============================================================
-- PetroFlow Kenya - Expanded Seed Data
-- =============================================================
-- Adds stations in uncovered counties across Kenya
-- =============================================================

-- =============================================================
-- EXPANDED STATIONS
-- =============================================================

INSERT INTO stations (name, address, city, county, brand, latitude, longitude) VALUES
  ('TotalEnergies Malindi', 'Malindi Town, Lamu Road', 'Malindi', 'Kilifi', 'TotalEnergies', -3.2236, 40.1267),
  ('Shell Malindi', 'Malindi-Mombasa Highway', 'Malindi', 'Kilifi', 'Shell', -3.23, 40.1167),
  ('Vivo Energy Kilifi', 'Kilifi Town, Mombasa-Malindi Rd', 'Kilifi', 'Kilifi', 'Vivo Energy', -3.6333, 39.85),
  ('Rubis Ukunda', 'Ukunda, Diani Beach Road', 'Ukunda', 'Kwale', 'Rubis', -4.2867, 39.5714),
  ('TotalEnergies Lamu', 'Lamu Town', 'Lamu', 'Lamu', 'TotalEnergies', -2.2694, 40.9022),
  ('Kenol Kobil Watamu', 'Watamu, Malindi Road', 'Watamu', 'Kilifi', 'Kenol Kobil', -3.3536, 39.9969),
  ('TotalEnergies Kakamega', 'Kakamega Town, Mumias Road', 'Kakamega', 'Kakamega', 'TotalEnergies', 0.2828, 34.7519),
  ('Shell Kakamega', 'Kakamega-Kisumu Highway', 'Kakamega', 'Kakamega', 'Shell', 0.2861, 34.7594),
  ('Rubis Bungoma', 'Bungoma Town, Webuye Road', 'Bungoma', 'Bungoma', 'Rubis', 0.5681, 34.5603),
  ('Vivo Energy Busia', 'Busia Town, Malaba Road', 'Busia', 'Busia', 'Vivo Energy', 0.4572, 34.1144),
  ('National Oil Mumias', 'Mumias Town, Kakamega Road', 'Mumias', 'Kakamega', 'National Oil', 0.3333, 34.4889),
  ('TotalEnergies Kitale', 'Kitale Town, Kenyatta Avenue', 'Kitale', 'Trans-Nzoia', 'TotalEnergies', 1.0167, 35),
  ('Shell Kitale', 'Kitale-Eldoret Highway', 'Kitale', 'Trans-Nzoia', 'Shell', 1.025, 34.9917),
  ('TotalEnergies Kericho', 'Kericho Town, Kisumu Highway', 'Kericho', 'Kericho', 'TotalEnergies', -0.3689, 35.2831),
  ('Rubis Kericho', 'Kericho-Nakuru Highway', 'Kericho', 'Kericho', 'Rubis', -0.3619, 35.2919),
  ('Shell Narok', 'Narok Town, Mai Mahiu Road', 'Narok', 'Narok', 'Shell', -1.0833, 35.8667),
  ('Vivo Energy Nanyuki', 'Nanyuki Town, Nyeri Road', 'Nanyuki', 'Laikipia', 'Vivo Energy', 0.0167, 37.0736),
  ('TotalEnergies Nanyuki', 'Nanyuki-Meru Highway', 'Nanyuki', 'Laikipia', 'TotalEnergies', 0.0083, 37.0667),
  ('TotalEnergies Kajiado', 'Kajiado Town, Namanga Road', 'Kajiado', 'Kajiado', 'TotalEnergies', -1.85, 36.7833),
  ('Kenol Kobil Kapsabet', 'Kapsabet Town, Nandi Hills Road', 'Kapsabet', 'Nandi', 'Kenol Kobil', 0.2, 35.1),
  ('Shell Lodwar', 'Lodwar Town', 'Lodwar', 'Turkana', 'Shell', 3.1167, 35.6),
  ('TotalEnergies Meru', 'Meru Town, Makutano', 'Meru', 'Meru', 'TotalEnergies', 0.0486, 37.6444),
  ('Shell Meru', 'Meru-Nanyuki Highway', 'Meru', 'Meru', 'Shell', 0.0556, 37.6556),
  ('TotalEnergies Embu', 'Embu Town, Nairobi Highway', 'Embu', 'Embu', 'TotalEnergies', -0.5389, 37.4583),
  ('Rubis Embu', 'Embu-Meru Road', 'Embu', 'Embu', 'Rubis', -0.5319, 37.4667),
  ('Vivo Energy Isiolo', 'Isiolo Town, Nanyuki Road', 'Isiolo', 'Isiolo', 'Vivo Energy', 0.3547, 37.5833),
  ('TotalEnergies Kisii', 'Kisii Town, Kisumu Road', 'Kisii', 'Kisii', 'TotalEnergies', -0.6769, 34.7731),
  ('Shell Kisii', 'Kisii-Migori Highway', 'Kisii', 'Kisii', 'Shell', -0.6833, 34.7667),
  ('Rubis Homa Bay', 'Homa Bay Town, Kisumu Road', 'Homa Bay', 'Homa Bay', 'Rubis', -0.5278, 34.4583),
  ('Vivo Energy Migori', 'Migori Town, Kisii Road', 'Migori', 'Migori', 'Vivo Energy', -1.0667, 34.4667),
  ('TotalEnergies Siaya', 'Siaya Town, Kisumu-Busia Road', 'Siaya', 'Siaya', 'TotalEnergies', -0.0606, 34.2858),
  ('Shell Muranga', 'Muranga Town, Thika Road', 'Muranga', 'Muranga', 'Shell', -0.7167, 37.15),
  ('TotalEnergies Ruiru', 'Ruiru, Thika Superhighway', 'Ruiru', 'Kiambu', 'TotalEnergies', -1.15, 36.9667),
  ('Vivo Energy Juja', 'Juja, Thika Road', 'Juja', 'Kiambu', 'Vivo Energy', -1.1167, 37.0167),
  ('Rubis Kiambu', 'Kiambu Town, Nairobi Road', 'Kiambu', 'Kiambu', 'Rubis', -1.1833, 36.8333),
  ('Kobil Nyeri', 'Nyeri-Nanyuki Highway, Kiganjo', 'Nyeri', 'Nyeri', 'Kenol Kobil', -0.4, 36.9333),
  ('TotalEnergies Garissa', 'Garissa Town, Nairobi Road', 'Garissa', 'Garissa', 'TotalEnergies', -0.4569, 39.6583),
  ('Shell Westlands', 'Westlands, Waiyaki Way', 'Nairobi', 'Nairobi', 'Shell', -1.2669, 36.8086),
  ('National Oil Eastleigh', 'Eastleigh, 1st Avenue', 'Nairobi', 'Nairobi', 'National Oil', -1.2722, 36.8556),
  ('Petrocity Nakuru', 'Nakuru-Eldoret Highway', 'Nakuru', 'Nakuru', 'Petrocity', -0.2881, 36.0417),
  ('Hashi Energy Kisumu', 'Kisumu-Airport Road', 'Kisumu', 'Kisumu', 'Hashi Energy', -0.1081, 34.7397);

-- =============================================================
-- EXPANDED PRICE SUBMISSIONS
-- =============================================================

-- TotalEnergies Malindi (Malindi, Kilifi)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Malindi' AND city = 'Malindi';

-- TotalEnergies Malindi - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Malindi' AND city = 'Malindi';

-- Shell Malindi (Malindi, Kilifi)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Malindi' AND city = 'Malindi';

-- Shell Malindi - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Malindi' AND city = 'Malindi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Malindi' AND city = 'Malindi';

-- Vivo Energy Kilifi (Kilifi, Kilifi)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Kilifi' AND city = 'Kilifi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Kilifi' AND city = 'Kilifi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Kilifi' AND city = 'Kilifi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Kilifi' AND city = 'Kilifi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Kilifi' AND city = 'Kilifi';

-- Vivo Energy Kilifi - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Kilifi' AND city = 'Kilifi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Kilifi' AND city = 'Kilifi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Kilifi' AND city = 'Kilifi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Kilifi' AND city = 'Kilifi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Kilifi' AND city = 'Kilifi';

-- Rubis Ukunda (Ukunda, Kwale)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Ukunda' AND city = 'Ukunda';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Ukunda' AND city = 'Ukunda';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Ukunda' AND city = 'Ukunda';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Ukunda' AND city = 'Ukunda';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 188.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Ukunda' AND city = 'Ukunda';

-- Rubis Ukunda - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Ukunda' AND city = 'Ukunda';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Ukunda' AND city = 'Ukunda';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Ukunda' AND city = 'Ukunda';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Ukunda' AND city = 'Ukunda';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 170.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Ukunda' AND city = 'Ukunda';

-- TotalEnergies Lamu (Lamu, Lamu)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 190, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Lamu' AND city = 'Lamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 191.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Lamu' AND city = 'Lamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 193.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Lamu' AND city = 'Lamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 194.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Lamu' AND city = 'Lamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 195.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Lamu' AND city = 'Lamu';

-- TotalEnergies Lamu - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 173, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Lamu' AND city = 'Lamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 174.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Lamu' AND city = 'Lamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 175.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Lamu' AND city = 'Lamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 176.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Lamu' AND city = 'Lamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 177.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Lamu' AND city = 'Lamu';

-- Kenol Kobil Watamu (Watamu, Kilifi)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Kenol Kobil Watamu' AND city = 'Watamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Kenol Kobil Watamu' AND city = 'Watamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Kenol Kobil Watamu' AND city = 'Watamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Kenol Kobil Watamu' AND city = 'Watamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Kenol Kobil Watamu' AND city = 'Watamu';

-- Kenol Kobil Watamu - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Kenol Kobil Watamu' AND city = 'Watamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Kenol Kobil Watamu' AND city = 'Watamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Kenol Kobil Watamu' AND city = 'Watamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Kenol Kobil Watamu' AND city = 'Watamu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Kenol Kobil Watamu' AND city = 'Watamu';

-- TotalEnergies Kakamega (Kakamega, Kakamega)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Kakamega' AND city = 'Kakamega';

-- TotalEnergies Kakamega - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Kakamega' AND city = 'Kakamega';

-- Shell Kakamega (Kakamega, Kakamega)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Kakamega' AND city = 'Kakamega';

-- Shell Kakamega - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Kakamega' AND city = 'Kakamega';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Kakamega' AND city = 'Kakamega';

-- Rubis Bungoma (Bungoma, Bungoma)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Bungoma' AND city = 'Bungoma';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Bungoma' AND city = 'Bungoma';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Bungoma' AND city = 'Bungoma';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Bungoma' AND city = 'Bungoma';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Bungoma' AND city = 'Bungoma';

-- Rubis Bungoma - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Bungoma' AND city = 'Bungoma';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Bungoma' AND city = 'Bungoma';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Bungoma' AND city = 'Bungoma';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Bungoma' AND city = 'Bungoma';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Bungoma' AND city = 'Bungoma';

-- Vivo Energy Busia (Busia, Busia)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Busia' AND city = 'Busia';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Busia' AND city = 'Busia';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Busia' AND city = 'Busia';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Busia' AND city = 'Busia';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 188.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Busia' AND city = 'Busia';

-- Vivo Energy Busia - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Busia' AND city = 'Busia';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Busia' AND city = 'Busia';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Busia' AND city = 'Busia';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Busia' AND city = 'Busia';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 170.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Busia' AND city = 'Busia';

-- National Oil Mumias (Mumias, Kakamega)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'National Oil Mumias' AND city = 'Mumias';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'National Oil Mumias' AND city = 'Mumias';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'National Oil Mumias' AND city = 'Mumias';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'National Oil Mumias' AND city = 'Mumias';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'National Oil Mumias' AND city = 'Mumias';

-- National Oil Mumias - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'National Oil Mumias' AND city = 'Mumias';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'National Oil Mumias' AND city = 'Mumias';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'National Oil Mumias' AND city = 'Mumias';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'National Oil Mumias' AND city = 'Mumias';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'National Oil Mumias' AND city = 'Mumias';

-- TotalEnergies Kitale (Kitale, Trans-Nzoia)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Kitale' AND city = 'Kitale';

-- TotalEnergies Kitale - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Kitale' AND city = 'Kitale';

-- Shell Kitale (Kitale, Trans-Nzoia)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Kitale' AND city = 'Kitale';

-- Shell Kitale - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Kitale' AND city = 'Kitale';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Kitale' AND city = 'Kitale';

-- TotalEnergies Kericho (Kericho, Kericho)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Kericho' AND city = 'Kericho';

-- TotalEnergies Kericho - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Kericho' AND city = 'Kericho';

-- Rubis Kericho (Kericho, Kericho)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Kericho' AND city = 'Kericho';

-- Rubis Kericho - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Kericho' AND city = 'Kericho';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Kericho' AND city = 'Kericho';

-- Shell Narok (Narok, Narok)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Narok' AND city = 'Narok';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Narok' AND city = 'Narok';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Narok' AND city = 'Narok';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Narok' AND city = 'Narok';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 188.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Narok' AND city = 'Narok';

-- Shell Narok - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Narok' AND city = 'Narok';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Narok' AND city = 'Narok';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Narok' AND city = 'Narok';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Narok' AND city = 'Narok';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 170.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Narok' AND city = 'Narok';

-- Vivo Energy Nanyuki (Nanyuki, Laikipia)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Nanyuki' AND city = 'Nanyuki';

-- Vivo Energy Nanyuki - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Nanyuki' AND city = 'Nanyuki';

-- TotalEnergies Nanyuki (Nanyuki, Laikipia)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Nanyuki' AND city = 'Nanyuki';

-- TotalEnergies Nanyuki - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Nanyuki' AND city = 'Nanyuki';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Nanyuki' AND city = 'Nanyuki';

-- TotalEnergies Kajiado (Kajiado, Kajiado)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Kajiado' AND city = 'Kajiado';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Kajiado' AND city = 'Kajiado';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Kajiado' AND city = 'Kajiado';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Kajiado' AND city = 'Kajiado';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Kajiado' AND city = 'Kajiado';

-- TotalEnergies Kajiado - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Kajiado' AND city = 'Kajiado';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Kajiado' AND city = 'Kajiado';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Kajiado' AND city = 'Kajiado';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Kajiado' AND city = 'Kajiado';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Kajiado' AND city = 'Kajiado';

-- Kenol Kobil Kapsabet (Kapsabet, Nandi)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Kenol Kobil Kapsabet' AND city = 'Kapsabet';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Kenol Kobil Kapsabet' AND city = 'Kapsabet';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Kenol Kobil Kapsabet' AND city = 'Kapsabet';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Kenol Kobil Kapsabet' AND city = 'Kapsabet';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Kenol Kobil Kapsabet' AND city = 'Kapsabet';

-- Kenol Kobil Kapsabet - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Kenol Kobil Kapsabet' AND city = 'Kapsabet';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Kenol Kobil Kapsabet' AND city = 'Kapsabet';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Kenol Kobil Kapsabet' AND city = 'Kapsabet';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Kenol Kobil Kapsabet' AND city = 'Kapsabet';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Kenol Kobil Kapsabet' AND city = 'Kapsabet';

-- Shell Lodwar (Lodwar, Turkana)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 195, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Lodwar' AND city = 'Lodwar';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 196.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Lodwar' AND city = 'Lodwar';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 198.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Lodwar' AND city = 'Lodwar';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 199.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Lodwar' AND city = 'Lodwar';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 200.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Lodwar' AND city = 'Lodwar';

-- Shell Lodwar - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 178, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Lodwar' AND city = 'Lodwar';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 179.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Lodwar' AND city = 'Lodwar';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 180.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Lodwar' AND city = 'Lodwar';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 181.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Lodwar' AND city = 'Lodwar';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 182.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Lodwar' AND city = 'Lodwar';

-- TotalEnergies Meru (Meru, Meru)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Meru' AND city = 'Meru';

-- TotalEnergies Meru - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Meru' AND city = 'Meru';

-- Shell Meru (Meru, Meru)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Meru' AND city = 'Meru';

-- Shell Meru - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Meru' AND city = 'Meru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Meru' AND city = 'Meru';

-- TotalEnergies Embu (Embu, Embu)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Embu' AND city = 'Embu';

-- TotalEnergies Embu - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Embu' AND city = 'Embu';

-- Rubis Embu (Embu, Embu)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Embu' AND city = 'Embu';

-- Rubis Embu - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Embu' AND city = 'Embu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Embu' AND city = 'Embu';

-- Vivo Energy Isiolo (Isiolo, Isiolo)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 188, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Isiolo' AND city = 'Isiolo';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 189.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Isiolo' AND city = 'Isiolo';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 191.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Isiolo' AND city = 'Isiolo';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 192.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Isiolo' AND city = 'Isiolo';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 193.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Isiolo' AND city = 'Isiolo';

-- Vivo Energy Isiolo - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 171, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Isiolo' AND city = 'Isiolo';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 172.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Isiolo' AND city = 'Isiolo';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 173.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Isiolo' AND city = 'Isiolo';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 174.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Isiolo' AND city = 'Isiolo';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 175.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Isiolo' AND city = 'Isiolo';

-- TotalEnergies Kisii (Kisii, Kisii)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Kisii' AND city = 'Kisii';

-- TotalEnergies Kisii - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Kisii' AND city = 'Kisii';

-- Shell Kisii (Kisii, Kisii)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Kisii' AND city = 'Kisii';

-- Shell Kisii - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Kisii' AND city = 'Kisii';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Kisii' AND city = 'Kisii';

-- Rubis Homa Bay (Homa Bay, Homa Bay)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Homa Bay' AND city = 'Homa Bay';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Homa Bay' AND city = 'Homa Bay';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Homa Bay' AND city = 'Homa Bay';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Homa Bay' AND city = 'Homa Bay';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Homa Bay' AND city = 'Homa Bay';

-- Rubis Homa Bay - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Homa Bay' AND city = 'Homa Bay';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Homa Bay' AND city = 'Homa Bay';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Homa Bay' AND city = 'Homa Bay';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Homa Bay' AND city = 'Homa Bay';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Homa Bay' AND city = 'Homa Bay';

-- Vivo Energy Migori (Migori, Migori)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Migori' AND city = 'Migori';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Migori' AND city = 'Migori';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Migori' AND city = 'Migori';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Migori' AND city = 'Migori';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Migori' AND city = 'Migori';

-- Vivo Energy Migori - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Migori' AND city = 'Migori';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Migori' AND city = 'Migori';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Migori' AND city = 'Migori';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Migori' AND city = 'Migori';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Migori' AND city = 'Migori';

-- TotalEnergies Siaya (Siaya, Siaya)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Siaya' AND city = 'Siaya';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Siaya' AND city = 'Siaya';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Siaya' AND city = 'Siaya';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Siaya' AND city = 'Siaya';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Siaya' AND city = 'Siaya';

-- TotalEnergies Siaya - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Siaya' AND city = 'Siaya';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Siaya' AND city = 'Siaya';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Siaya' AND city = 'Siaya';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Siaya' AND city = 'Siaya';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Siaya' AND city = 'Siaya';

-- Shell Muranga (Muranga, Muranga)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Muranga' AND city = 'Muranga';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Muranga' AND city = 'Muranga';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Muranga' AND city = 'Muranga';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Muranga' AND city = 'Muranga';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Muranga' AND city = 'Muranga';

-- Shell Muranga - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Muranga' AND city = 'Muranga';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Muranga' AND city = 'Muranga';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Muranga' AND city = 'Muranga';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Muranga' AND city = 'Muranga';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Muranga' AND city = 'Muranga';

-- TotalEnergies Ruiru (Ruiru, Kiambu)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 178, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Ruiru' AND city = 'Ruiru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Ruiru' AND city = 'Ruiru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Ruiru' AND city = 'Ruiru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Ruiru' AND city = 'Ruiru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Ruiru' AND city = 'Ruiru';

-- TotalEnergies Ruiru - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 161, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Ruiru' AND city = 'Ruiru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Ruiru' AND city = 'Ruiru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Ruiru' AND city = 'Ruiru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Ruiru' AND city = 'Ruiru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Ruiru' AND city = 'Ruiru';

-- Vivo Energy Juja (Juja, Kiambu)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 178, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Juja' AND city = 'Juja';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Juja' AND city = 'Juja';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Juja' AND city = 'Juja';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Juja' AND city = 'Juja';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Juja' AND city = 'Juja';

-- Vivo Energy Juja - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 161, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Vivo Energy Juja' AND city = 'Juja';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Vivo Energy Juja' AND city = 'Juja';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Vivo Energy Juja' AND city = 'Juja';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Vivo Energy Juja' AND city = 'Juja';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Vivo Energy Juja' AND city = 'Juja';

-- Rubis Kiambu (Kiambu, Kiambu)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 178, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Kiambu' AND city = 'Kiambu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Kiambu' AND city = 'Kiambu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 181.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Kiambu' AND city = 'Kiambu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Kiambu' AND city = 'Kiambu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Kiambu' AND city = 'Kiambu';

-- Rubis Kiambu - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 161, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Rubis Kiambu' AND city = 'Kiambu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Rubis Kiambu' AND city = 'Kiambu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Rubis Kiambu' AND city = 'Kiambu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Rubis Kiambu' AND city = 'Kiambu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Rubis Kiambu' AND city = 'Kiambu';

-- Kobil Nyeri (Nyeri, Nyeri)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Kobil Nyeri' AND city = 'Nyeri';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Kobil Nyeri' AND city = 'Nyeri';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Kobil Nyeri' AND city = 'Nyeri';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Kobil Nyeri' AND city = 'Nyeri';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 188.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Kobil Nyeri' AND city = 'Nyeri';

-- Kobil Nyeri - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Kobil Nyeri' AND city = 'Nyeri';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Kobil Nyeri' AND city = 'Nyeri';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Kobil Nyeri' AND city = 'Nyeri';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Kobil Nyeri' AND city = 'Nyeri';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 170.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Kobil Nyeri' AND city = 'Nyeri';

-- TotalEnergies Garissa (Garissa, Garissa)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 192, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Garissa' AND city = 'Garissa';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 193.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Garissa' AND city = 'Garissa';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 195.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Garissa' AND city = 'Garissa';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 196.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Garissa' AND city = 'Garissa';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 197.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Garissa' AND city = 'Garissa';

-- TotalEnergies Garissa - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 175, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'TotalEnergies Garissa' AND city = 'Garissa';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 176.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'TotalEnergies Garissa' AND city = 'Garissa';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 177.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'TotalEnergies Garissa' AND city = 'Garissa';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 178.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'TotalEnergies Garissa' AND city = 'Garissa';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 179.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'TotalEnergies Garissa' AND city = 'Garissa';

-- Shell Westlands (Nairobi, Nairobi)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Westlands' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Westlands' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Westlands' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Westlands' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Westlands' AND city = 'Nairobi';

-- Shell Westlands - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Shell Westlands' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Shell Westlands' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Shell Westlands' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Shell Westlands' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Shell Westlands' AND city = 'Nairobi';

-- National Oil Eastleigh (Nairobi, Nairobi)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'National Oil Eastleigh' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'National Oil Eastleigh' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 185.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'National Oil Eastleigh' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 186.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'National Oil Eastleigh' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 187.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'National Oil Eastleigh' AND city = 'Nairobi';

-- National Oil Eastleigh - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'National Oil Eastleigh' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'National Oil Eastleigh' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 167.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'National Oil Eastleigh' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 168.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'National Oil Eastleigh' AND city = 'Nairobi';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 169.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'National Oil Eastleigh' AND city = 'Nairobi';

-- Petrocity Nakuru (Nakuru, Nakuru)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Petrocity Nakuru' AND city = 'Nakuru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Petrocity Nakuru' AND city = 'Nakuru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Petrocity Nakuru' AND city = 'Nakuru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Petrocity Nakuru' AND city = 'Nakuru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Petrocity Nakuru' AND city = 'Nakuru';

-- Petrocity Nakuru - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Petrocity Nakuru' AND city = 'Nakuru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Petrocity Nakuru' AND city = 'Nakuru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Petrocity Nakuru' AND city = 'Nakuru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Petrocity Nakuru' AND city = 'Nakuru';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Petrocity Nakuru' AND city = 'Nakuru';

-- Hashi Energy Kisumu (Kisumu, Kisumu)
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 179, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Hashi Energy Kisumu' AND city = 'Kisumu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 180.50, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Hashi Energy Kisumu' AND city = 'Kisumu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 182.00, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Hashi Energy Kisumu' AND city = 'Kisumu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 183.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Hashi Energy Kisumu' AND city = 'Kisumu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 1, 184.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Hashi Energy Kisumu' AND city = 'Kisumu';

-- Hashi Energy Kisumu - Diesel
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 162, NOW() - INTERVAL '30 days' FROM stations WHERE name = 'Hashi Energy Kisumu' AND city = 'Kisumu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 163.00, NOW() - INTERVAL '20 days' FROM stations WHERE name = 'Hashi Energy Kisumu' AND city = 'Kisumu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 164.50, NOW() - INTERVAL '10 days' FROM stations WHERE name = 'Hashi Energy Kisumu' AND city = 'Kisumu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 165.50, NOW() - INTERVAL '3 days' FROM stations WHERE name = 'Hashi Energy Kisumu' AND city = 'Kisumu';
INSERT INTO price_submissions (station_id, fuel_type_id, price, submitted_at)
SELECT id, 2, 166.00, NOW() - INTERVAL '1 day' FROM stations WHERE name = 'Hashi Energy Kisumu' AND city = 'Kisumu';

