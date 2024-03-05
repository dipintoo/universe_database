-- TABLE STRUCTURES

-- Tabel Galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    galaxy_name VARCHAR(100) UNIQUE NOT NULL,
    constellation VARCHAR(100),
    description TEXT,
    interesting_fact TEXT
);

-- Tabel Star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    star_name VARCHAR(100) UNIQUE NOT NULL,
    distance_to_earth VARCHAR(100) NOT NULL,
    habitable BOOLEAN NOT NULL,
    galaxy_id INTEGER REFERENCES galaxy(galaxy_id)
);

-- Tabel Planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    planet_name VARCHAR(100) UNIQUE NOT NULL,
    has_satellite BOOLEAN NOT NULL,
    revolution_days INTEGER,
    planet_category VARCHAR(100),
    diameter_km INTEGER,
    atmosphere_content TEXT,
    star_id INTEGER REFERENCES star(star_id)
);

-- Tabel Visibility
CREATE TABLE planet_visibility (
    planet_visibility_id SERIAL PRIMARY KEY,
    planet_id INTEGER NOT NULL,
    planet_name VARCHAR(100) UNIQUE NOT NULL,
    apparent_magnitude NUMERIC NOT NULL,
    visibility VARCHAR(100),
    colors TEXT NOT NULL,
    planet_id INTEGER REFERENCES planet(planet_id)
);

-- Tabel Moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    moon_name VARCHAR(100) UNIQUE NOT NULL,
    discovery VARCHAR(100),
    revolution_period_days NUMERIC,
    diameter_km INTEGER NOT NULL,
    planet_id INTEGER REFERENCES planet(planet_id)
);


-- INPUT DATA

-- Input Galaxy
INSERT INTO galaxy (galaxy_name, constellation, description, interesting_fact) VALUES
  ('Andromeda', 'Andromeda', 'In mythology, Andromeda is the daughter of the kings of Ethiopia and is said to be more beautiful than the Nereids. She becomes queen of Greece when she marries Perseus.', 'Andromeda is on a collision course with the Milky Way.'),
  ('Antennae Galaxy', 'Corvus', 'This is a dual galaxy. It gets its name because it is said to look like a pair of insect antennae.', 'The Antennae Galaxies are in the midst of a merger.'),
  ('Backward Galaxy', 'Centaurus', 'It seems to rotate in the opposite direction to what it should according to its shape.', 'NGC 4622 has a rare backward-facing spiral arm.'),
  ('Milky Way', NULL, 'Our own galaxy. It is said to look like a band of light.', 'The Milky Way is a barred spiral galaxy with a supermassive black hole at its center.'),
  ('Black Eye Galaxy', 'Coma Berenices', 'It looks like an eye with a dark stripe underneath.', 'M64 has a dark band of absorbing dust in front of it.'),
  ('Bode’s Galaxy', 'Ursa Major', 'Named after the astronomer who discovered it, Johann Elert Bode.', 'M81 is a grand design spiral galaxy.');

-- Input Star
INSERT INTO star (name, distance_to_earth, galaxy_id, habitable) VALUES
  ('Sun', '1 AU (approximately 149.6 million km)', 4, false),
  ('Proxima Centauri', 'Approximately 0.0485 light-years', 4, true),
  ('Gliese 581', 'Approximately 20.3 light-years', 4, true),
  ('TRAPPIST-1', 'Approximately 39.6 light-years', 4, true),
  ('Kepler-186', 'Approximately 500 light-years', 4, false),
  ('HD 219134', 'Approximately 21 light-years', 4, true),
  ('Wolf 1061', 'Approximately 14 light-years', 4, true),
  ('Gliese 667 C', 'Approximately 23.6 light-years', 4, true),
  ('Kapteyn''s Star', 'Approximately 12.8 light-years', 4, true),
  ('LHS 1140', 'Approximately 40 light-years', 4, true);

-- Input Planet
INSERT INTO planet (name, has_satellite, revolution_days, planet_category, diameter_km, atmosphere_content, star_id) VALUES
  ('Earth', true, NULL, 'Terrestrial', 12742, 'Nitrogen, Oxygen', 1),
  ('Mars', true, 687, 'Terrestrial', 6779, 'Carbon Dioxide', 1),
  ('Jupiter', true, 4333, 'Gas Giant', 139820, 'Hydrogen, Helium', 1),
  ('Saturn', true, 10759, 'Gas Giant', 116460, 'Hydrogen, Helium', 1),
  ('Uranus', true, 30687, 'Ice Giant', 50724, 'Hydrogen, Helium, Methane', 1),
  ('Neptune', true, 60190, 'Ice Giant', 49244, 'Hydrogen, Helium, Methane', 1),
  ('Pluto', true, 90560, 'Dwarf Planet', 2376, 'Nitrogen, Methane', 1),
  ('Eris', true, 203830, 'Dwarf Planet', 2326, 'Methane', 1),
  ('Makemake', true, NULL, 'Dwarf Planet', 1434, 'Methane, Ethane', 1),
  ('Haumea', true, NULL, 'Dwarf Planet', 620, 'Water Vapor', 1),
  ('Mercury', false, 88, 'Terrestrial', 4879, 'None', 1),
  ('Venus', false, 225, 'Terrestrial', 12104, 'Carbon Dioxide, Sulfuric Acid', 1),
  ('Ceres', true, 1681, 'Dwarf Planet', 590, 'Water Vapor', 1);

  -- Input Visibility
INSERT INTO planet_visibility (planet_id, planet_name, apparent_magnitude, visibility, colors)VALUES
  (12, 'Venus', -5, 'Early Morning/Evening', 'Light Yellow and White'),
  (2,'Mars', -3, 'Early Morning/Evening','Red, Brown, and Orange'),
  (3,'Jupiter', -3, 'Early Morning/Evening', 'Stripes of Light Orange, White, Brown, and Dark Orange'),
  (11,'Mercury', -2, 'Early Morning/Evening', 'Grey'),
  (4,'Saturn', 0, 'Nighttime', 'Stripes of Yellow and Brown'),
  (5,'Uranus', 5, 'Nighttime', 'Light pale Blue'),
  (13,'Ceres', 7, 'Nighttime', 'Grayish'),
  (6,'Neptune', 8, 'Nighttime', 'Royal blue with other shades of blue'),
  (7,'Pluto', 14, 'Nighttime', 'Varied Hues of Brown and White'),
  (9,'Makemake', 17, 'Telescope Required', 'Reddish/Orange-Tinted'),
  (10,'Haumea', 17.3, 'Telescope Required', 'White/Gray'),
  (8,'Eris', 18.7, 'Telescope Required', 'Dark/Reddish');

-- Input Moon
INSERT INTO moon (planet_id, moon_name, discovery, revolution_period_days, diameter_km) VALUES
  (1, 'Moon', NULL, 27.32, 3476),
  (2, 'Phobos', 'Hall (1877)', 0.32, 23),
  (2, 'Deimos', 'Hall (1877)', 1.26, 13),
  (3, 'Amalthea', 'Barnard (1892)', 0.50, 200),
  (3, 'Thebe', 'Voyager (1979)', 0.67, 90),
  (3, 'Io', 'Galileo (1610)', 1.77, 3630),
  (3, 'Europa', 'Galileo (1610)', 3.55, 3138),
  (3, 'Ganymede', 'Galileo (1610)', 7.16, 5262),
  (3, 'Callisto', 'Galileo (1610)', 16.69, 4800),
  (3, 'Himalia', 'Perrine (1904)', 251, 170),
  (4, 'Pan', 'Voyager (1985)', 0.58, 20),
  (4, 'Atlas', 'Voyager (1980)', 0.60, 40),
  (4, 'Prometheus', 'Voyager (1980)', 0.61, 80),
  (4, 'Pandora', 'Voyager (1980)', 0.63, 100),
  (4, 'Janus', 'Dollfus (1966)', 0.69, 190),
  (4, 'Epimetheus', 'Fountain, Larson (1980)', 0.69, 120),
  (4, 'Mimas', 'Herschel (1789)', 0.94, 394),
  (4, 'Enceladus', 'Herschel (1789)', 1.37, 502),
  (4, 'Tethys', 'Cassini (1684)', 1.89, 1048),
  (4, 'Dione', 'Cassini (1684)', 2.74, 1120),
  (4, 'Rhea', 'Cassini (1672)', 4.52, 1530),
  (4, 'Titan', 'Huygens (1655)', 15.95, 5150),
  (4, 'Hyperion', 'Bond, Lassell (1848)', 21.3, 270),
  (4, 'Iapetus', 'Cassini (1671)', 79.3, 1435),
  (4, 'Phoebe', 'Pickering (1898)', 550, 220),
  (5, 'Puck', 'Voyager (1985)', 0.76, 170),
  (5, 'Miranda', 'Kuiper (1948)', 1.41, 485),
  (5, 'Ariel', 'Lassell (1851)', 2.52, 1160),
  (5, 'Umbriel', 'Lassell (1851)', 4.14, 1190),
  (5, 'Titania', 'Herschel (1787)', 8.71, 1610),
  (5, 'Oberon', 'Herschel (1787)', 13.5, 1550),
  (6, 'Despina', 'Voyager (1989)', 0.33, 150),
  (6, 'Galatea', 'Voyager (1989)', 0.40, 150),
  (6, 'Larissa', 'Voyager (1989)', 1.12, 400),
  (6, 'Triton', 'Lassell (1846)', 5.88, 2720),
  (6, 'Nereid', 'Kuiper (1949)', 360, 340),
  (7, 'Charon', 'Christy (1978)', 6.39, 1200),
  (7, 'Styx', 'Showalter et al (2012)', 20, 20),
  (7, 'Nix', 'Weaver et al (2005)', 24, 46),
  (7, 'Kerberos', 'Showalter et al (2011)', 24, 28),
  (7, 'Hydra', 'Weaver et al (2005)', 38, 61),
  (8, 'Dysnomea', 'Brown et al (2005)', 16, 684),
  (9, 'MK2', 'Parker et al (2016)', NULL, 160),
  (10, 'Hi’iaka', 'Brown et al (2005)', 49, 400),
  (10, 'Namaka', 'Brown et al (2005)', 35, 200);
