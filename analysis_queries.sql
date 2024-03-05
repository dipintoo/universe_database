-- Menampilkan Planet yang Paling Terang pada Malam Hari

SELECT pv.planet_id, p.planet_name, pv.apparent_magnitude
FROM PlanetVisibility pv
JOIN planet p ON pv.planet_id = p.planet_id
WHERE pv.apparent_magnitude = (SELECT MIN(apparent_magnitude) FROM PlanetVisibility);


-- Menampilkan Jumlah Bintang yang Berpotensi Dihuni di Setiap Galaksi

SELECT g.galaxy_name, COUNT(s.star_id) AS jumlah_bintang_berpotensi_dihuni
FROM galaxy g
LEFT JOIN star s ON g.galaxy_id = s.galaxy_id AND s.habitable = true
GROUP BY g.galaxy_name;


-- Menampilkan Rata-rata Diameter Planet Berdasarkan Kategori:

SELECT planet_category, ROUND(AVG(diameter_km), 2) AS rata_rata_diameter
FROM planet
GROUP BY planet_category;


-- Menampilkan Galaksi yang Memiliki Bintang dengan Jarak Terdekat ke Bumi:

SELECT g.galaxy_name, s.star_name, s.distance_to_earth
FROM galaxy g
JOIN star s ON g.galaxy_id = s.galaxy_id
ORDER BY s.distance_to_earth ASC
LIMIT 1;


-- Menampilkan Planet dengan Atmosfer Mengandung Methane dan Diameter Di Bawah Rata-rata:

SELECT p.planet_name, p.atmosphere_content, p.diameter_km
FROM planet p
WHERE p.atmosphere_content LIKE '%Methane%' AND p.diameter_km < (SELECT AVG(diameter_km) FROM planet);


-- Menampilkan Bulan dengan Diameter Terbesar untuk Setiap Planet:

SELECT p.planet_name, m.moon_name, m.diameter_km
FROM planet p
JOIN moon m ON p.planet_id = m.planet_id
ORDER BY m.diameter_km DESC
LIMIT 1;
