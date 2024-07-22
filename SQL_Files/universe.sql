--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    distance_from_earth numeric(10,2),
    galaxy_type character varying(20),
    age_in_millions_of_years integer,
    name character varying(20) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_star_planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star_planet_moon (
    galaxy_star_planet_moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.galaxy_star_planet_moon OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_junction_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_planet_moon_junction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_planet_moon_junction_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_junction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_planet_moon_junction_id_seq OWNED BY public.galaxy_star_planet_moon.galaxy_star_planet_moon_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    description text,
    surface_area character varying(25),
    mass character varying(25),
    volume character varying(25),
    name character varying(20) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    has_life boolean,
    planet_type character varying(15),
    is_spherical boolean,
    is_dwarf_planet boolean,
    volume character varying(25),
    mass character varying(25),
    star_id integer,
    name character varying(20) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    age_in_millions_of_years integer,
    description text,
    color character varying(10),
    size character varying(25),
    mass character varying(25),
    surface_temperature character varying(25),
    galaxy_id integer,
    name character varying(20) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon ALTER COLUMN galaxy_star_planet_moon_id SET DEFAULT nextval('public.galaxy_star_planet_moon_junction_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Spiral galaxy containing our Solar System', 0.00, 'Spiral', 13600, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Nearest major galaxy to the Milky Way', 2537000.00, 'Spiral', 10000, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Third largest member of the Local Group', 3000000.00, 'Spiral', 13000, 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 'Classic spiral galaxy', 23000000.00, 'Spiral', 400, 'Whirlpool');
INSERT INTO public.galaxy VALUES (5, 'Galaxy with a bright nucleus', 31000000.00, 'Spiral', 8900, 'Sombrero');
INSERT INTO public.galaxy VALUES (6, 'Large galaxy in the constellation Ursa Major', 21000000.00, 'Spiral', 14000, 'Pinwheel');


--
-- Data for Name: galaxy_star_planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star_planet_moon VALUES (61, 'Milky Way - Sun - Earth - Moon', 1, 1, 1, 1);
INSERT INTO public.galaxy_star_planet_moon VALUES (62, 'Andromeda - Proxima Centauri - Proxima b - Phobos', 2, 2, 2, 2);
INSERT INTO public.galaxy_star_planet_moon VALUES (63, 'Triangulum - Alpha Centauri A - Alpha Centauri Bb - Deimos', 3, 3, 3, 3);
INSERT INTO public.galaxy_star_planet_moon VALUES (64, 'Whirlpool - Sirius A - Kepler-22b - Io', 4, 4, 4, 4);
INSERT INTO public.galaxy_star_planet_moon VALUES (65, 'Sombrero - Epsilon Eridani - Gliese 581g - Europa', 5, 5, 5, 5);
INSERT INTO public.galaxy_star_planet_moon VALUES (66, 'Pinwheel - Tau Ceti - Tau Ceti e - Ganymede', 6, 6, 6, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth''s natural satellite', '3.793e7 km²', '7.35e22 kg', '2.1958e10 km³', 'Moon', 1);
INSERT INTO public.moon VALUES (2, 'One of Mars'' moons', '1.5427e4 km²', '1.0659e16 kg', '7.091e8 km³', 'Phobos', 2);
INSERT INTO public.moon VALUES (3, 'One of Mars'' moons', '4.1e3 km²', '1.4762e15 kg', '1.8e7 km³', 'Deimos', 2);
INSERT INTO public.moon VALUES (4, 'One of Jupiter''s moons', '4.19e7 km²', '8.9319e22 kg', '2.53e10 km³', 'Io', 3);
INSERT INTO public.moon VALUES (5, 'One of Jupiter''s moons', '3.09e7 km²', '4.7998e22 kg', '1.593e10 km³', 'Europa', 3);
INSERT INTO public.moon VALUES (6, 'One of Jupiter''s moons', '8.72e7 km²', '1.4819e23 kg', '7.66e10 km³', 'Ganymede', 3);
INSERT INTO public.moon VALUES (7, 'One of Jupiter''s moons', '7.3e7 km²', '1.0759e23 kg', '5.9e10 km³', 'Callisto', 3);
INSERT INTO public.moon VALUES (8, 'Largest moon of Saturn', '8.33e7 km²', '1.3452e23 kg', '7.16e10 km³', 'Titan', 4);
INSERT INTO public.moon VALUES (9, 'One of Saturn''s moons', '7.92e5 km²', '1.08022e20 kg', '7.18e8 km³', 'Enceladus', 4);
INSERT INTO public.moon VALUES (10, 'Largest moon of Neptune', '2.3e7 km²', '2.14e22 kg', '6.2e9 km³', 'Triton', 5);
INSERT INTO public.moon VALUES (11, 'Largest moon of Pluto', '4.6e6 km²', '1.52e21 kg', '1.0e9 km³', 'Charon', 6);
INSERT INTO public.moon VALUES (12, 'One of Eris'' moons', '4.2e6 km²', '1.5e21 kg', '8.0e8 km³', 'Dysnomia', 7);
INSERT INTO public.moon VALUES (13, 'One of Saturn''s moons', '4.2e5 km²', '3.7493e19 kg', '6.2e7 km³', 'Mimas', 4);
INSERT INTO public.moon VALUES (14, 'One of Saturn''s moons', '7.3e6 km²', '2.3065e21 kg', '1.8e9 km³', 'Rhea', 4);
INSERT INTO public.moon VALUES (15, 'One of Saturn''s moons', '2.8e6 km²', '1.0955e21 kg', '7.5e8 km³', 'Dione', 4);
INSERT INTO public.moon VALUES (16, 'One of Saturn''s moons', '4.1e6 km²', '6.1745e20 kg', '2.2e8 km³', 'Tethys', 4);
INSERT INTO public.moon VALUES (17, 'One of Saturn''s moons', '6.8e6 km²', '1.8056e21 kg', '1.6e9 km³', 'Iapetus', 4);
INSERT INTO public.moon VALUES (18, 'One of Uranus'' moons', '7.6e6 km²', '3.0149e21 kg', '2.9e9 km³', 'Oberon', 8);
INSERT INTO public.moon VALUES (19, 'One of Uranus'' moons', '7.2e6 km²', '3.5278e21 kg', '3.4e9 km³', 'Titania', 8);
INSERT INTO public.moon VALUES (20, 'One of Uranus'' moons', '5.8e6 km²', '1.3532e21 kg', '1.2e9 km³', 'Ariel', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, true, 'Terrestrial', true, false, '1.08321e12 km³', '5.972e24 kg', 1, 'Earth');
INSERT INTO public.planet VALUES (2, false, 'Terrestrial', true, false, '1.6318e11 km³', '6.4171e23 kg', 1, 'Mars');
INSERT INTO public.planet VALUES (3, false, 'Gas Giant', true, false, '1.43128e15 km³', '1.898e27 kg', 1, 'Jupiter');
INSERT INTO public.planet VALUES (4, false, 'Gas Giant', true, false, '8.2713e14 km³', '5.683e26 kg', 1, 'Saturn');
INSERT INTO public.planet VALUES (5, false, 'Terrestrial', true, false, '7.8571e11 km³', '5.97e24 kg', 2, 'Proxima b');
INSERT INTO public.planet VALUES (6, false, 'Terrestrial', true, false, '7.8591e11 km³', '5.95e24 kg', 2, 'Alpha Centauri Bb');
INSERT INTO public.planet VALUES (7, false, 'Super-Earth', true, false, '2.6e12 km³', '2.4e25 kg', 3, 'Kepler-22b');
INSERT INTO public.planet VALUES (8, false, 'Super-Earth', true, false, '2.7e12 km³', '2.5e25 kg', 3, 'Kepler-69c');
INSERT INTO public.planet VALUES (9, false, 'Super-Earth', true, false, '2.5e12 km³', '2.3e25 kg', 3, 'Kepler-442b');
INSERT INTO public.planet VALUES (10, false, 'Terrestrial', true, false, '1.08321e12 km³', '5.972e24 kg', 3, 'Kepler-186f');
INSERT INTO public.planet VALUES (11, false, 'Super-Earth', true, false, '1.08321e12 km³', '6.1e24 kg', 2, 'Gliese 581g');
INSERT INTO public.planet VALUES (12, false, 'Super-Earth', true, false, '1.08321e12 km³', '6.3e24 kg', 2, 'Gliese 667 Cc');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 4600, 'Our own star', 'Yellow', '1392700 km', '1.989e30 kg', '5778 K', 1, 'Sun');
INSERT INTO public.star VALUES (2, 8000, 'A red supergiant', 'Red', '887000000 km', '2.0e31 kg', '3500 K', 1, 'Betelgeuse');
INSERT INTO public.star VALUES (3, 300, 'Brightest star in the night sky', 'White', '2380000 km', '4.018e30 kg', '9940 K', 2, 'Sirius');
INSERT INTO public.star VALUES (4, 450, 'Second brightest star in the northern celestial hemisphere', 'Blue', '2030000 km', '4.2e30 kg', '9600 K', 2, 'Vega');
INSERT INTO public.star VALUES (5, 6200, 'Closest star system to the Solar System', 'Yellow', '1690000 km', '4.5e30 kg', '5790 K', 1, 'Alpha Centauri');
INSERT INTO public.star VALUES (6, 870, 'Brightest star in the constellation Orion', 'Blue', '78000000 km', '1.4e31 kg', '12100 K', 3, 'Rigel');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_planet_moon_junction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_planet_moon_junction_id_seq', 66, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_name_key UNIQUE (name);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_pkey PRIMARY KEY (galaxy_star_planet_moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star_planet_moon fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star_planet_moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: galaxy_star_planet_moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy_star_planet_moon fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

