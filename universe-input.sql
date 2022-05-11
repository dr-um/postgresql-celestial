DROP TABLE IF EXISTS galaxy, star, planet, moon, continent;

CREATE TABLE galaxy(

  galaxy_id serial PRIMARY KEY,
  name varchar(75) not null unique,
  age_years_in_billions numeric(3,1) not null,
  total_stars_billions int not null,
  type_by_hubble text

);

INSERT INTO galaxy(
  name, age_years_in_billions, total_stars_billions, type_by_hubble
)
 VALUES(
   'Milky Way', 13.1, 400, 'SBc'
  ),(
   'Whirlpool Galaxy', 0.4, 100, 'SA(s)bc pec'
  ),(
   'Andromeda Galaxy', 10.0, 1000, 'SA(s)b'
  ),(
   'Black Eye Galaxy', 13.28, 100, '(R)SA(rs)ab'
  ),(
   'Messier 81', 13.31, 250, 'SA(s)ab'
  ),(
   'Messier 82', 13.3, 30, 'I0'
  );

CREATE TABLE star(

  star_id serial PRIMARY KEY,
  galaxy_id serial,
  name varchar(75) not null unique,
  age_in_millions int,
  type char(3),
  has_planets boolean,
  CONSTRAINT fk_galaxy
   FOREIGN KEY(galaxy_id) 
    REFERENCES galaxy(galaxy_id)
     ON DELETE SET NULL

);

INSERT INTO star(
  galaxy_id, name, age_in_millions, type, has_planets
)
 VALUES(
   1, 'SUN', 4603, 'G2V', true
  ),(
   2, 'M51-ULS-1', null, null, true
  ),(
   3, 'Alpheratz', 60, 'A3V', true
  ),(
   1, 'Yses 2', 14, 'K1V', true
  ),(
   1, 'Alpha Centauri', 4853, 'K1V', true
  ),(
   1, 'Rigel', 8, 'B9V', true
  );
CREATE TABLE planet(

  planet_id serial PRIMARY KEY,
  star_id serial,
  name varchar(75) not null unique,
  age_in_billions int,
  type_mass varchar(50),
  has_moons boolean,
  CONSTRAINT fk_star
   FOREIGN KEY(star_id) 
    REFERENCES star(star_id)
     ON DELETE SET NULL

);

INSERT INTO planet(
  star_id, name, age_in_billions, type_mass, has_moons
)
 VALUES(
   1, 'Earth', 4.643, 'Earth', true
  ),(
   2, 'M51-ULS-1b', 0.4, null, null
  ),(
   1, 'Mercury', 4.603, '0.055 M⊕', false
  ),(
   1, 'Venus', 4.603, '0.815 M⊕', false
  ),(
   1, 'Mars', 4.603, '0.107 M⊕', true
  ),(
   1, 'Jupiter', 4.603, '318 M⊕', true
  ),(
   1, 'Saturn', 4.603, '95 M⊕', true
  ),(
   1, 'Uranus', 4.603, '14 M⊕', true
  ),(
   1, 'Neptune', 4.603, '17 M⊕', true
  ),(
   1, 'Pluto', 4.603, '0.002 M⊕', true
  ),(
   5, 'Candidate 1', 5.4, '20-50 M⊕', true
  ),(
   4, 'YSES 2 b', 0.014, '2003 M⊕', true
  );
CREATE TABLE moon(

  moon_id serial PRIMARY KEY,
  planet_id serial,
  name varchar(75) not null unique,
  orbital_speed_kms int,
  orbital_radius_km int,
  CONSTRAINT fk_planet
   FOREIGN KEY(planet_id) 
    REFERENCES planet(planet_id)
     ON DELETE SET NULL
);

INSERT INTO moon(
  planet_id, name, orbital_speed_kms, orbital_radius_km
)
 VALUES(
   1, 'Moon', 1, 384000
  ),(
   5, 'Deimos', 1.35, 6.2
  ),(
   5, 'Phobos', 2.14, 11
  ),(
   8, 'Ariel', null, null
  ),(
   8, 'Belinda', null, null
  ),(
   8, 'Bianca', null, null
  ),(
   8, 'Caliban', null, null
  ),(
   8, 'Cordelia', null, null
  ),(
   8, 'Cressida', null, null
  ),(
   8, 'Cupid', null, null
  ),(
   8, 'Desdemona', null, null
  ),(
   8, 'Ferdinand', null, null
  ),(
   8, 'Francisco', null, null
  ),(
   8, 'Juliet', null, null
  ),(
   8, 'Mab', null, null
  ),(
   8, 'Margaret', null, null
  ),(
   8, 'Miranda', null, null
  ),(
   8, 'Oberon', null, null
  ),(
   8, 'Ophelia', null, null
  ),(
   8, 'Perdita', null, null
  );

CREATE TABLE continent(

  continent_id serial PRIMARY KEY,
  planet_id serial,
  name varchar(75) not null unique,
  CONSTRAINT fk_planet
   FOREIGN KEY(planet_id) 
    REFERENCES planet(planet_id)
     ON DELETE SET NULL

);

INSERT INTO continent(
  planet_id, name
)
  VALUES(
    1, 'Europe'
  ),(
    1, 'Africa'
  ),(
    1, 'North America'
  ),(
    1, 'South America'
  ),(
    1, 'Asia'
  ),(
    1, 'Antarctica'
  ),(
    1, 'Australia'
  );