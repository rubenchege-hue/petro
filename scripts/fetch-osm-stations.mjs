#!/usr/bin/env node
// Fetch all fuel stations in Kenya from OpenStreetMap via Overpass API
// Generates: SQL seed file + deduplicated GeoJSON for review
//
// Usage: node scripts/fetch-osm-stations.mjs

import { execSync } from 'child_process';
import { writeFileSync } from 'fs';

const OVERPASS_URL = 'https://overpass-api.de/api/interpreter';
const QUERY = `
[out:json][timeout:300];
area["ISO3166-1"="KE"]->.a;
(
  node["amenity"="fuel"](area.a);
  way["amenity"="fuel"](area.a);
);
out center;
`;

const CITY_TO_COUNTY = {
  'nairobi': 'Nairobi', 'mombasa': 'Mombasa', 'kisumu': 'Kisumu',
  'nakuru': 'Nakuru', 'eldoret': 'Uasin Gishu', 'thika': 'Kiambu',
  'malindi': 'Kilifi', 'kitale': 'Trans-Nzoia', 'nyeri': 'Nyeri',
  'machakos': 'Machakos', 'meru': 'Meru', 'nanyuki': 'Laikipia',
  'naivasha': 'Nakuru', 'kakamega': 'Kakamega', 'garissa': 'Garissa',
  'isiolo': 'Isiolo', 'embu': 'Embu', 'lamu': 'Lamu',
  'kiambu': 'Kiambu', 'kilifi': 'Kilifi', 'homa bay': 'Homa Bay',
  'bungoma': 'Bungoma', 'busia': 'Busia', 'kitui': 'Kitui',
  'migori': 'Migori', 'voi': 'Taita-Taveta', 'athi river': 'Machakos',
  'ruaka': 'Kiambu', 'ruiru': 'Kiambu', 'juja': 'Kiambu',
  'limuru': 'Kiambu', 'ngong': 'Kajiado', 'ongata rongai': 'Kajiado',
  'kikuyu': 'Kiambu', 'syokimau': 'Machakos', 'mlolongo': 'Machakos',
  'kitengela': 'Kajiado', 'kericho': 'Kericho', 'narok': 'Narok',
  'kajiado': 'Kajiado', 'muranga': 'Muranga', 'kirinyaga': 'Kirinyaga',
  'nyamira': 'Nyamira', 'nyandarua': 'Nyandarua', 'siaya': 'Siaya',
  'baringo': 'Baringo', 'bomet': 'Bomet', 'elgeyo marakwet': 'Elgeyo-Marakwet',
  'iteen': 'Elgeyo-Marakwet', 'mandera': 'Mandera', 'marsabit': 'Marsabit',
  'makueni': 'Makueni', 'nandi': 'Nandi', 'kapsabet': 'Nandi',
  'lodwar': 'Turkana', 'kisii': 'Kisii', 'ukunda': 'Kwale',
  'diani': 'Kwale', 'kwale': 'Kwale', 'watamu': 'Kilifi',
  'mumias': 'Kakamega', 'wundanyi': 'Taita-Taveta', 'maralal': 'Samburu',
  'kapenguria': 'West Pokot', 'vihiga': 'Vihiga', 'wajir': 'Wajir',
  'west pokot': 'West Pokot', 'tana river': 'Tana River',
  'moyale': 'Marsabit', 'kendu bay': 'Homa Bay', 'awendo': 'Migori',
  'sotik': 'Bomet', 'londiani': 'Kericho', 'molo': 'Nakuru',
  'gilgil': 'Nakuru', 'nyahururu': 'Laikipia', 'kinungi': 'Nakuru',
  'maai mahiu': 'Nakuru', 'suswa': 'Narok', 'namanga': 'Kajiado',
  'loitokitok': 'Kajiado', 'elwak': 'Mandera', 'habaswein': 'Wajir',
  'wajir bor': 'Wajir', 'githunguri': 'Kiambu', 'kangundo': 'Machakos',
  'matuu': 'Machakos', 'kibwezi': 'Makueni', 'mtito andei': 'Makueni',
  'sultan hamud': 'Makueni', 'mariakani': 'Kilifi', 'kaloleni': 'Kilifi',
  'mtwapa': 'Kilifi', 'shanzu': 'Mombasa', 'bamburi': 'Mombasa',
  'nyali': 'Mombasa', 'likoni': 'Mombasa', 'changamwe': 'Mombasa',
  'webuye': 'Bungoma', 'malaba': 'Busia', 'funyula': 'Busia',
  'port victoria': 'Busia', 'butere': 'Kakamega', 'mbale': 'Vihiga',
  'kaimosi': 'Vihiga', 'chavakali': 'Vihiga', 'yala': 'Siaya',
  'bondo': 'Siaya', 'usenge': 'Siaya', 'ngiya': 'Siaya',
  'rarinda': 'Siaya', 'mbita': 'Homa Bay', 'nyilima': 'Homa Bay',
  'tabaka': 'Kisii', 'ogembo': 'Kisii', 'keroka': 'Nyamira',
  'keumbu': 'Kisii', 'nyansiongo': 'Kisii', 'kijauri': 'Nyamira',
  'karatina': 'Nyeri', 'kagio': 'Kirinyaga', 'kutus': 'Kirinyaga',
  'wanguru': 'Kirinyaga', 'sagana': 'Kirinyaga', 'makuyu': 'Muranga',
  'kangari': 'Muranga', 'kenol': 'Muranga', 'kiriaini': 'Muranga',
  'chuka': 'Tharaka-Nithi', 'marima': 'Tharaka-Nithi', 'maragwa': 'Tharaka-Nithi',
  'chogoria': 'Tharaka-Nithi', 'kiutine': 'Meru', 'maua': 'Meru',
  'nkubu': 'Meru', 'mutuati': 'Meru', 'kangeta': 'Meru',
  'laare': 'Meru', 'mikinduri': 'Meru', 'athi': 'Machakos',
  'kathiani': 'Machakos', 'tala': 'Machakos', 'mwingi': 'Kitui',
  'kyuso': 'Kitui', 'katangi': 'Machakos', 'kalawa': 'Machakos',
  'kitui town': 'Kitui', 'mutomo': 'Kitui', 'mashuru': 'Kajiado',
  'kiserian': 'Kajiado', 'rongai': 'Kajiado', 'matasia': 'Kajiado',
  'nairobi national park': 'Nairobi', 'mavoko': 'Machakos',
  'kinanie': 'Machakos', 'lukenya': 'Machakos', 'kangemi': 'Nairobi',
  'westlands': 'Nairobi', 'karen': 'Nairobi', 'langata': 'Nairobi',
  'kasarani': 'Nairobi', 'embakasi': 'Nairobi', 'runda': 'Nairobi',
  'kawangware': 'Nairobi', 'dagoretti': 'Nairobi', 'mathare': 'Nairobi',
  'pumwani': 'Nairobi', 'bahati': 'Nairobi', 'makadara': 'Nairobi',
  'kamukunji': 'Nairobi', 'starehe': 'Nairobi', 'muthaiga': 'Nairobi',
  'gigiri': 'Nairobi', 'lavington': 'Nairobi', 'kilimani': 'Nairobi',
  'kileleshwa': 'Nairobi', 'parklands': 'Nairobi', 'hurlingham': 'Nairobi',
  'upper hill': 'Nairobi', 'milimani': 'Nairobi',
};

const COUNTY_ALIASES = {
  'nairobi': 'Nairobi', 'nairobi city': 'Nairobi', 'nairobi county': 'Nairobi',
  'mombasa': 'Mombasa', 'mombasa county': 'Mombasa',
  'kisumu': 'Kisumu', 'kisumu county': 'Kisumu',
  'nakuru': 'Nakuru', 'nakuru county': 'Nakuru',
  'uasin gishu': 'Uasin Gishu', 'uasin gishu county': 'Uasin Gishu',
  'kiambu': 'Kiambu', 'kiambu county': 'Kiambu',
  'machakos': 'Machakos', 'machakos county': 'Machakos',
  'kilifi': 'Kilifi', 'kilifi county': 'Kilifi',
  'kajiado': 'Kajiado', 'kajiado county': 'Kajiado',
  'kakamega': 'Kakamega', 'kakamega county': 'Kakamega',
  'meru': 'Meru', 'meru county': 'Meru',
  'nyeri': 'Nyeri', 'nyeri county': 'Nyeri',
  'muranga': 'Muranga', 'muranga county': 'Muranga',
  'busia': 'Busia', 'busia county': 'Busia',
  'bungoma': 'Bungoma', 'bungoma county': 'Bungoma',
  'homa bay': 'Homa Bay', 'homa bay county': 'Homa Bay',
  'migori': 'Migori', 'migori county': 'Migori',
  'kisii': 'Kisii', 'kisii county': 'Kisii',
  'nyamira': 'Nyamira', 'nyamira county': 'Nyamira',
  'siaya': 'Siaya', 'siaya county': 'Siaya',
  'trans nzoia': 'Trans-Nzoia', 'trans nzoia county': 'Trans-Nzoia',
  'elgeyo marakwet': 'Elgeyo-Marakwet',
  'laikipia': 'Laikipia', 'laikipia county': 'Laikipia',
  'nandi': 'Nandi', 'nandi county': 'Nandi',
  'kericho': 'Kericho', 'kericho county': 'Kericho',
  'bomet': 'Bomet', 'bomet county': 'Bomet',
  'narok': 'Narok', 'narok county': 'Narok',
  'turkana': 'Turkana', 'turkana county': 'Turkana',
  'west pokot': 'West Pokot', 'west pokot county': 'West Pokot',
  'samburu': 'Samburu', 'samburu county': 'Samburu',
  'baringo': 'Baringo', 'baringo county': 'Baringo',
  'garissa': 'Garissa', 'garissa county': 'Garissa',
  'wajir': 'Wajir', 'wajir county': 'Wajir',
  'mandera': 'Mandera', 'mandera county': 'Mandera',
  'isiolo': 'Isiolo', 'isiolo county': 'Isiolo',
  'marsabit': 'Marsabit', 'marsabit county': 'Marsabit',
  'kitui': 'Kitui', 'kitui county': 'Kitui',
  'makueni': 'Makueni', 'makueni county': 'Makueni',
  'embu': 'Embu', 'embu county': 'Embu',
  'tharaka nithi': 'Tharaka-Nithi', 'tharaka nithi county': 'Tharaka-Nithi',
  'kirinyaga': 'Kirinyaga', 'kirinyaga county': 'Kirinyaga',
  'taita taveta': 'Taita-Taveta', 'taita taveta county': 'Taita-Taveta',
  'tana river': 'Tana River', 'tana river county': 'Tana River',
  'kwale': 'Kwale', 'kwale county': 'Kwale',
  'lamu': 'Lamu', 'lamu county': 'Lamu',
  'vihiga': 'Vihiga', 'vihiga county': 'Vihiga',
  'nyandarua': 'Nyandarua', 'nyandarua county': 'Nyandarua',
};

function normalizeCounty(val) {
  if (!val) return null;
  const key = val.trim().toLowerCase().replace(/\s+/g, ' ');
  return COUNTY_ALIASES[key] || null;
}

function inferCountyFromCity(city) {
  if (!city) return null;
  const key = city.trim().toLowerCase();
  return CITY_TO_COUNTY[key] || null;
}

function esc(val) {
  if (val === null || val === undefined) return 'NULL';
  return `'${String(val).replace(/'/g, "''")}'`;
}

const BRAND_NORMALIZE = {
  'total': 'TotalEnergies', 'totalenergies': 'TotalEnergies', 'total kenya': 'TotalEnergies',
  'shell': 'Shell',
  'rubis': 'Rubis', 'rubis- port reitz': 'Rubis',
  'vivo energy': 'Vivo Energy', 'vivo': 'Vivo Energy',
  'kenol kobil': 'Kenol Kobil', 'kenolkobil': 'Kenol Kobil', 'kenolkobil plc': 'Kenol Kobil',
  'kenol': 'Kenol Kobil', 'kobil': 'Kenol Kobil',
  'national oil': 'National Oil', 'national oil corporation': 'National Oil', 'nock': 'National Oil',
  'hashi energy': 'Hashi Energy', 'hashi': 'Hashi Energy',
  'petrocity': 'Petrocity',
  'gapco': 'Gapco',
  'oil com': 'Oilcom', 'oilcom': 'Oilcom', 'oIlcom': 'Oilcom', 'ollcom': 'Oilcom',
  'engen': 'Engen',
  'bp': 'BP', 'bp ': 'BP',
  'caltex': 'Caltex',
  'esso': 'Esso',
  'mobil': 'Mobil',
  'agip': 'Agip',
  'lake oil': 'Lake Oil', 'lake oil group': 'Lake Oil', 'lakeoil': 'Lake Oil',
  'gulf': 'Gulf', 'gulf energy': 'Gulf',
  'olibya': 'Oilibya', 'oilibya': 'Oilibya',
  'ola energy': 'OLA Energy', 'ola energy kenya': 'OLA Energy', 'ola': 'OLA Energy',
  'hasha': 'Hasha Energy',
  'fossil oil': 'Fossil Oil',
  'one petroleum': 'One Petroleum',
  'royal oil': 'Royal Oil',
  'star oil': 'Star Oil',
  'multi oil': 'Multi Oil',
  'baraka petroleum': 'Baraka Petroleum',
  'delight oil': 'Delight Oil',
  'fahari oil': 'Fahari Oil',
  'jamin oil': 'Jamin Oil',
  'kibos oil': 'Kibos Oil',
  'east african oil': 'East African Oil',
  'dalbit': 'Dalbit',
  'hass': 'Hass Petroleum', 'hass petroleum': 'Hass Petroleum',
  'petro': 'Petro Oil', 'petro oil kenya': 'Petro Oil Kenya',
  'africa fuels': 'Africa Fuels',
  'tosha petroleum ltd': 'Tosha Petroleum',
  'oryx': 'Oryx',
  'noble oil': 'Noble Oil',
  'safeway': 'Safeway',
  'delta': 'Delta',
  'astrol': 'Astrol',
  'pluto': 'Pluto',
  'twin city': 'Twin City',
  'symal': 'Symal',
  '2nk': '2NK',
  'lexo': 'Lexo',
  'riva': 'Riva',
  'prai': 'Praj',
  'millenium dealers limited': 'Millenium Dealers',
  'sekabal petrol station': 'Sekabal',
  'diani': 'Diani',
  'wairimu': 'Wairimu',
  'steagro': 'Steggro',
  'parkview petrol': 'Parkview',
  'eppic': 'EPPIC',
  'sagal petrol': 'Sagal Petrol',
  'questa': 'Questa',
};

const NOT_BRANDS = new Set(['private', 'owner', 'state government', 'goverment of kenya',
  'indipend.', 'independent', 'kerosene', 'maras' ]);

function parseBrand(tags) {
  const raw = (tags.brand || tags.operator || '').trim();
  if (!raw) return null;
  const lower = raw.toLowerCase().trim();
  if (NOT_BRANDS.has(lower)) return null;
  for (const [key, val] of Object.entries(BRAND_NORMALIZE)) {
    if (lower === key || lower === key + ' ' || lower.startsWith(key + ',')) return val;
  }
  // Try partial match
  for (const [key, val] of Object.entries(BRAND_NORMALIZE)) {
    if (lower.startsWith(key) && (lower.length === key.length || lower[key.length] === ' ' || lower[key.length] === ',')) return val;
    if (lower.includes(' ' + key + ' ') || lower.endsWith(' ' + key)) {
      // Check it's a word boundary
      const idx = lower.indexOf(' ' + key + ' ');
      if (idx >= 0 || lower.endsWith(' ' + key)) return val;
    }
  }
  return rawBrand(raw);
}

function normalizeBrand(raw) {
  if (!raw) return null;
  const lower = raw.toLowerCase().trim();
  if (NOT_BRANDS.has(lower)) return null;
  if (BRAND_NORMALIZE[lower]) return BRAND_NORMALIZE[lower];
  // Fuzzy: check if raw starts with a known brand
  for (const [key, val] of Object.entries(BRAND_NORMALIZE)) {
    if (lower.startsWith(key) && (lower.length === key.length || lower[key.length] === ' ' || lower[key.length] === ',' || lower[key.length] === '-')) return val;
  }
  return rawBrand(raw);
}

function inferBrandFromName(name) {
  if (!name) return null;
  const lower = name.toLowerCase();
  for (const [key, val] of Object.entries(BRAND_NORMALIZE)) {
    if (lower.startsWith(key) || lower.includes(' ' + key + ' ') || lower.endsWith(' ' + key)) {
      return val;
    }
  }
  return null;
}

function rawBrand(b) {
  return b.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
}

function extractCityFromName(name) {
  if (!name) return null;
  const nameLower = name.toLowerCase();
  for (const [city, _county] of Object.entries(CITY_TO_COUNTY)) {
    if (nameLower.includes(city)) {
      return city;
    }
  }
  return null;
}

function haversineDist(lat1, lon1, lat2, lon2) {
  const R = 6371000;
  const dLat = (lat2 - lat1) * Math.PI / 180;
  const dLon = (lon2 - lon1) * Math.PI / 180;
  const a = Math.sin(dLat/2)**2 + Math.cos(lat1*Math.PI/180) * Math.cos(lat2*Math.PI/180) * Math.sin(dLon/2)**2;
  return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
}

function scoreStation(s) {
  let score = 0;
  if (s.name) score += 10;
  if (s.brand) score += 5;
  if (s.city) score += 3;
  if (s.address) score += 2;
  if (s.phone) score += 1;
  if (s.hours) score += 1;
  return score;
}

async function main() {
  console.error('Fetching data from Overpass API (this may take a while)...');
  const startTime = Date.now();

  // Use curl because Node.js http/https has TLS compatibility issues with this server
  const tmpFile = '/tmp/overpass_query.txt';
  writeFileSync(tmpFile, `data=${encodeURIComponent(QUERY)}`);
  const curlCmd = `curl -s -X POST -d @${tmpFile} -H "Content-Type: application/x-www-form-urlencoded" "${OVERPASS_URL}"`;

  let body;
  try {
    body = execSync(curlCmd, { timeout: 300000, maxBuffer: 50 * 1024 * 1024 }).toString();
  } catch (e) {
    console.error('curl failed:', e.stderr?.toString() || e.message);
    process.exit(1);
  }

  let data;
  try {
    data = JSON.parse(body);
  } catch {
    console.error('Failed to parse JSON response. First 500 chars:', body.slice(0, 500));
    process.exit(1);
  }
  console.error(`Fetched ${data.elements.length} elements in ${((Date.now()-startTime)/1000).toFixed(1)}s`);

  const rawStations = [];
  const seenKeys = new Set();

  for (const el of data.elements) {
    const tags = el.tags || {};
    const lat = el.lat ?? el.center?.lat;
    const lon = el.lon ?? el.center?.lon;
    if (!lat || !lon) continue;

    const rawName = (tags.name || '').trim();
    const rawBrand = parseBrand(tags);
    const normalizedBrand = normalizeBrand(rawBrand);

    const name = rawName;
    const brand = normalizedBrand || inferBrandFromName(name);
    const displayName = name || (brand ? `${brand} Station` : 'Fuel Station');

    const city = (tags['addr:city'] || tags['addr:town'] || tags['addr:village'] || '').trim();
    const street = (tags['addr:street'] || '').trim();
    const housenumber = (tags['addr:housenumber'] || '').trim();
    const fullAddr = tags['addr:full'] || '';

    let address;
    if (fullAddr) {
      address = fullAddr;
    } else if (street && city) {
      address = `${street}${housenumber ? ', ' + housenumber : ''}, ${city}`;
    } else if (city) {
      address = `${displayName}, ${city}`;
    } else if (street) {
      address = `${displayName}, ${street}`;
    } else {
      address = displayName;
    }

    let county = normalizeCounty(tags['addr:county'] || tags['addr:state'] || '');
    if (!county && city) county = inferCountyFromCity(city);
    if (!county) {
      const extractedCity = extractCityFromName(displayName);
      if (extractedCity) county = inferCountyFromCity(extractedCity);
    }
    if (!county) county = null;

    const phone = tags.phone || tags['contact:phone'] || tags.mobile || null;
    const hours = tags.opening_hours || tags['service_hours:fuel'] || null;

    // Dedup key: rounded to ~100m precision (3 decimal places ≈ 111m)
    const dedupKey = `${lat.toFixed(3)},${lon.toFixed(3)}`;
    if (seenKeys.has(dedupKey)) continue;
    seenKeys.add(dedupKey);

    const finalCity = city || (extractCityFromName(displayName) ? capitalizeCity(extractCityFromName(displayName)) : '');
    const finalCounty = county || (finalCity ? inferCountyFromCity(finalCity.toLowerCase()) : null) || 'Nairobi';

    rawStations.push({
      name: displayName,
      address,
      city: finalCity,
      county: finalCounty,
      brand,
      latitude: lat,
      longitude: lon,
      phone,
      hours,
      _score: scoreStation({ name: displayName, brand, city: finalCity, address, phone, hours }),
    });
  }

  console.error(`After basic dedup: ${rawStations.length} stations`);

  // Secondary dedup: within 200m keep the highest scored
  const kept = [];
  const consumed = new Array(rawStations.length).fill(false);

  for (let i = 0; i < rawStations.length; i++) {
    if (consumed[i]) continue;
    let best = i;
    const cluster = [i];
    consumed[i] = true;

    for (let j = i + 1; j < rawStations.length; j++) {
      if (consumed[j]) continue;
      const dist = haversineDist(
        rawStations[i].latitude, rawStations[i].longitude,
        rawStations[j].latitude, rawStations[j].longitude
      );
      if (dist < 200) {
        cluster.push(j);
        consumed[j] = true;
        if (rawStations[j]._score > rawStations[best]._score) {
          best = j;
        }
      }
    }
    kept.push(rawStations[best]);
  }

  // Sort: by county, then city, then name
  kept.sort((a, b) => {
    if (a.county !== b.county) return a.county.localeCompare(b.county);
    if (a.city !== b.city) return a.city.localeCompare(b.city);
    return a.name.localeCompare(b.name);
  });

  console.error(`After proximity dedup: ${kept.length} stations`);

  // ===== Generate SQL =====
  const now = new Date().toISOString();
  const lines = [
    '-- =============================================================',
    '-- PetroFlow Kenya - OSM Imported Stations',
    '-- Source: OpenStreetMap (Overpass API)',
    `-- Generated: ${now}`,
    `-- Total stations: ${kept.length}`,
    '-- =============================================================',
    '',
    'INSERT INTO stations (name, address, city, county, brand, latitude, longitude, phone, hours) VALUES',
  ];

  for (let i = 0; i < kept.length; i++) {
    const s = kept[i];
    const comma = i < kept.length - 1 ? ',' : ';';
    lines.push(`  (${esc(s.name)}, ${esc(s.address)}, ${esc(s.city)}, ${esc(s.county)}, ${esc(s.brand)}, ${s.latitude}, ${s.longitude}, ${esc(s.phone)}, ${esc(s.hours)})${comma}`);
  }

  const sql = lines.join('\n');

  // Write SQL
  const sqlPath = 'supabase/migrations/20260704073900_osm_stations.sql';
  writeFileSync(sqlPath, sql + '\n');
  console.error(`\nWrote ${sqlPath} (${kept.length} stations)`);

  // Write JSON for review
  const jsonPath = 'scripts/osm-stations.json';
  writeFileSync(jsonPath, JSON.stringify(kept.map(({ _score, ...s }) => s), null, 2));
  console.error(`Wrote ${jsonPath} for review`);
  console.error(`\nDone! ${kept.length} stations ready.`);
}

function capitalizeCity(city) {
  if (!city) return '';
  return city.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
}

main().catch(err => {
  console.error('Fatal:', err);
  process.exit(1);
});
