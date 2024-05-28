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
-- Name: federation_species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.federation_species (
    federation_species_id integer NOT NULL,
    description text NOT NULL,
    threat_level integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.federation_species OWNER TO freecodecamp;

--
-- Name: federation_species_federation_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.federation_species_federation_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.federation_species_federation_species_id_seq OWNER TO freecodecamp;

--
-- Name: federation_species_federation_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.federation_species_federation_species_id_seq OWNED BY public.federation_species.federation_species_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_types character varying(60) NOT NULL,
    age_million_years numeric,
    num_species integer,
    will_explore boolean,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    colony_num integer,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    num_species integer,
    age_million_years integer,
    name character varying(40) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    num_species integer,
    is_problematic boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: federation_species federation_species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.federation_species ALTER COLUMN federation_species_id SET DEFAULT nextval('public.federation_species_federation_species_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: federation_species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.federation_species VALUES (1, 'A danger to themselves', 10, 'Human');
INSERT INTO public.federation_species VALUES (2, 'Too smart', 7, 'Vulcan');
INSERT INTO public.federation_species VALUES (3, 'Need to respect boundaries', 6, 'Klingons');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13610, 42, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 5000, 0, true, false);
INSERT INTO public.galaxy VALUES (3, 'NGC 4886', 'Lenticular', NULL, 78, false, true);
INSERT INTO public.galaxy VALUES (4, 'NGC 2865', 'Elliptical', 1000, 48, false, false);
INSERT INTO public.galaxy VALUES (5, 'NGC 5728', 'Seyfert', NULL, 0, false, false);
INSERT INTO public.galaxy VALUES (6, 'Markarian 231', 'Quasar', NULL, 0, false, false);
INSERT INTO public.galaxy VALUES (7, 'DD 242', 'Irregular', NULL, 0, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 0, true);
INSERT INTO public.moon VALUES (2, 4, 'Deimos', 1, true);
INSERT INTO public.moon VALUES (3, 4, 'Phobos', 2, true);
INSERT INTO public.moon VALUES (4, 5, 'Callisto', 3, false);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 4, true);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 5, true);
INSERT INTO public.moon VALUES (7, 5, 'Io', 6, false);
INSERT INTO public.moon VALUES (8, 5, 'Amalthea', 7, true);
INSERT INTO public.moon VALUES (9, 6, 'Dione', 8, true);
INSERT INTO public.moon VALUES (10, 6, 'Hyperion', 9, false);
INSERT INTO public.moon VALUES (11, 6, 'Mimas', 10, true);
INSERT INTO public.moon VALUES (12, 6, 'Phoebe', 11, true);
INSERT INTO public.moon VALUES (13, 6, 'Rhea', 12, false);
INSERT INTO public.moon VALUES (14, 6, 'Titan', 13, true);
INSERT INTO public.moon VALUES (15, 7, 'Ariel', 14, true);
INSERT INTO public.moon VALUES (16, 7, 'Miranda', 15, true);
INSERT INTO public.moon VALUES (17, 7, 'Oberon', 16, false);
INSERT INTO public.moon VALUES (18, 7, 'Titania', 17, false);
INSERT INTO public.moon VALUES (19, 7, 'Umbriel', 18, false);
INSERT INTO public.moon VALUES (20, 7, 'Triton', 19, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 98, 4503, 'Mercury');
INSERT INTO public.planet VALUES (2, 1, 72, 4503, 'Venus');
INSERT INTO public.planet VALUES (3, 1, 2987, 4542, 'Earth');
INSERT INTO public.planet VALUES (4, 1, 323, 3242, 'Mars');
INSERT INTO public.planet VALUES (5, 1, 321, 2414, 'Jupiter');
INSERT INTO public.planet VALUES (6, 1, 21, 4603, 'Saturn');
INSERT INTO public.planet VALUES (7, 1, 23, 4503, 'Uranus');
INSERT INTO public.planet VALUES (8, 1, 21, 9068, 'Neptune');
INSERT INTO public.planet VALUES (9, 2, 98, 89, 'AC Bb');
INSERT INTO public.planet VALUES (10, 2, 67, 1287, 'AC Bc');
INSERT INTO public.planet VALUES (11, 2, 12, 986, 'PC.b');
INSERT INTO public.planet VALUES (12, 2, 89, 675, 'PC.c');
INSERT INTO public.planet VALUES (13, 2, 456, 87, 'PC.d');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 200, true);
INSERT INTO public.star VALUES (2, 1, 'Alpha Centurion', 42, true);
INSERT INTO public.star VALUES (3, 1, 'VV Cephei A', 10000, false);
INSERT INTO public.star VALUES (4, 1, 'UY Scuti', 200, true);
INSERT INTO public.star VALUES (5, 2, 'Alpheratz', 0, false);
INSERT INTO public.star VALUES (6, 2, 'Mirach', 1000, true);


--
-- Name: federation_species_federation_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.federation_species_federation_species_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: federation_species federation_species_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.federation_species
    ADD CONSTRAINT federation_species_description_key UNIQUE (description);


--
-- Name: federation_species federation_species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.federation_species
    ADD CONSTRAINT federation_species_name_key UNIQUE (name);


--
-- Name: federation_species federation_species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.federation_species
    ADD CONSTRAINT federation_species_pkey PRIMARY KEY (federation_species_id);


--
-- Name: galaxy galaxy_age_million_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_age_million_years_key UNIQUE (age_million_years);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

