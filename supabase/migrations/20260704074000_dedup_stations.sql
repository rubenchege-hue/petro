-- =============================================================
-- PetroFlow Kenya - Deduplicate Stations
-- Removes OSM stations that are within ~150m of existing stations
-- (same brand/same name, same county). Keeps the station that
-- has price submissions or the more descriptive name.
-- =============================================================

DELETE FROM stations WHERE id IN (
  -- Shell on Ngong Rd (duplicate OSM entry, same name 64m apart)
  '25106a6f-1ed4-44a9-abeb-7fe02aef70f2',
  -- Total petrol station (OSM) next to TotalEnergies Nyeri (seed)
  'e63da42e-c850-46d5-b7ab-e6eb00b72f74',
  -- Total (OSM) next to TotalEnergies Kenyatta Avenue (seed, 16 subs)
  '6ce4231a-36b2-4c87-b433-07321cec95ef',
  -- Total (OSM) next to another Total (OSM), 75m apart
  'c79cda4b-2f27-43af-b560-f655f19aaa2d',
  -- Total (OSM) next to TotalEnergies Kericho (seed, 10 subs)
  '2d71faca-dcdb-4912-b120-62227d274a83',
  -- Total (OSM) next to TotalEnergies Mombasa Road (seed, 12 subs)
  'a3e553c6-d16f-415b-8b1c-c3c04cb52717',
  -- Fuel Station (duplicate unnamed OSM entry, 144m apart)
  'e213d550-7ab1-49e5-b182-5e925fdf35de',
  -- kerosene Pump (duplicate unnamed OSM entry, 146m apart)
  'fef9bf98-52d1-49f5-8e21-a6a4325c68e9'
);
