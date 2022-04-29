--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(60) NOT NULL,
    constellation_description text,
    size integer,
    bayer_value integer,
    right_ascent numeric,
    has_messier_object boolean NOT NULL,
    has_shinning_stars boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_types character varying(30),
    galaxy_description text,
    has_planet boolean NOT NULL,
    has_stars boolean NOT NULL,
    giant_stars_number integer,
    age_in_millions_of_years integer,
    diameter numeric
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
    name character varying(60) NOT NULL,
    moon_description text,
    diameter integer,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_gravity boolean NOT NULL,
    has_water boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(60) NOT NULL,
    planet_types character varying(30),
    planet_description text,
    diameter integer,
    mass numeric,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    habitants_number integer,
    star_id integer NOT NULL
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
    name character varying(60) NOT NULL,
    star_description text,
    diameter integer,
    mass integer,
    distance_from_earth numeric,
    is_supernova boolean NOT NULL,
    is_black_hole boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'constallation 1', 'description of constellation 1', NULL, NULL, NULL, true, true);
INSERT INTO public.constellation VALUES (2, 'constallation 2', 'description of constellation 2', NULL, NULL, NULL, true, true);
INSERT INTO public.constellation VALUES (3, 'constallation 3', 'description of constellation 3', NULL, NULL, NULL, false, true);
INSERT INTO public.constellation VALUES (4, 'constallation 4', 'description of constellation 4', NULL, NULL, NULL, true, false);
INSERT INTO public.constellation VALUES (5, 'constallation 5', 'description of constellation 5', NULL, NULL, NULL, false, false);
INSERT INTO public.constellation VALUES (6, 'constallation 6', 'description of constellation 6', NULL, NULL, NULL, true, true);
INSERT INTO public.constellation VALUES (7, 'constallation 7', 'description of constellation 7', NULL, NULL, NULL, false, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'NGC 3923', NULL, 'NGC is an elliptical galaxy located in the constellation of hydra', true, true, NULL, 15000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Messier 82', NULL, 'Messier is a starbust galaxy', true, true, NULL, 12000000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Galaxy 3', NULL, 'Description of the third galaxy', true, true, NULL, 36000, 1250.36);
INSERT INTO public.galaxy VALUES (4, 'Galaxy 4', NULL, 'Description of the fourth galaxy', true, true, NULL, 9877555, NULL);
INSERT INTO public.galaxy VALUES (5, 'Galaxy 5', NULL, 'Description of the fifth galaxy', true, true, NULL, 125, 36998.01);
INSERT INTO public.galaxy VALUES (6, 'Galaxy 6', NULL, 'Description of the sixth galaxy', true, true, NULL, 360, 6458);
INSERT INTO public.galaxy VALUES (7, 'Galaxy 7', NULL, 'Description of the seventh galaxy', true, true, NULL, NULL, 17850.96);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon 1', 'description of the moon 1', NULL, NULL, NULL, false, true, 1);
INSERT INTO public.moon VALUES (2, 'moon 2', 'description of the moon 2', NULL, NULL, NULL, false, false, 2);
INSERT INTO public.moon VALUES (3, 'moon 3', 'description of the moon 3', NULL, NULL, NULL, true, false, 3);
INSERT INTO public.moon VALUES (4, 'moon 4', 'description of the moon 4', NULL, NULL, NULL, true, true, 4);
INSERT INTO public.moon VALUES (5, 'moon 5', 'description of the moon 5', NULL, NULL, NULL, false, false, 5);
INSERT INTO public.moon VALUES (6, 'moon 6', 'description of the moon 6', NULL, NULL, NULL, true, false, 7);
INSERT INTO public.moon VALUES (7, 'moon 7', 'description of the moon 7', NULL, NULL, NULL, false, true, 6);
INSERT INTO public.moon VALUES (8, 'moon 8', 'description of the moon 8', NULL, NULL, NULL, false, true, 8);
INSERT INTO public.moon VALUES (9, 'moon 9', 'description of the moon 9', NULL, NULL, NULL, false, false, 9);
INSERT INTO public.moon VALUES (10, 'moon 10', 'description of the moon 10', NULL, NULL, NULL, true, false, 10);
INSERT INTO public.moon VALUES (11, 'moon 11', 'description of the moon 11', NULL, NULL, NULL, true, true, 11);
INSERT INTO public.moon VALUES (12, 'moon 12', 'description of the moon 12', NULL, NULL, NULL, false, false, 12);
INSERT INTO public.moon VALUES (13, 'moon 13', 'description of the moon 13', NULL, NULL, NULL, true, false, 13);
INSERT INTO public.moon VALUES (14, 'moon 14', 'description of the moon 14', NULL, NULL, NULL, true, true, 14);
INSERT INTO public.moon VALUES (15, 'moon 15', 'description of the moon 15', NULL, NULL, NULL, false, false, 15);
INSERT INTO public.moon VALUES (16, 'moon 16', 'description of the moon 16', NULL, NULL, NULL, true, false, 16);
INSERT INTO public.moon VALUES (17, 'moon 17', 'description of the moon 17', NULL, NULL, NULL, false, false, 17);
INSERT INTO public.moon VALUES (18, 'moon 18', 'description of the moon 18', NULL, NULL, NULL, false, true, 18);
INSERT INTO public.moon VALUES (19, 'moon 19', 'description of the moon 19', NULL, NULL, NULL, false, true, 19);
INSERT INTO public.moon VALUES (20, 'moon 20', 'description of the moon 20', NULL, NULL, NULL, false, true, 20);
INSERT INTO public.moon VALUES (21, 'moon 21', 'description of the moon 21', NULL, NULL, NULL, false, true, 21);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'viable planet', 'planet with human and animal species', NULL, NULL, true, true, NULL, 2);
INSERT INTO public.planet VALUES (2, 'Pluton', NULL, NULL, NULL, NULL, false, true, NULL, 3);
INSERT INTO public.planet VALUES (3, 'Saturne', NULL, 'The most recognizable planet with a system of icy rings', NULL, NULL, false, true, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', NULL, 'Jupiter is a massive planet, twice the size of all other planets combined', NULL, NULL, false, true, NULL, 7);
INSERT INTO public.planet VALUES (5, 'Mercure', NULL, 'planet with human and animal species', NULL, NULL, false, false, NULL, 4);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Dwarf', 'planet with human and animal species', NULL, NULL, false, true, NULL, 5);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Dwarf', 'planet with human and animal species', NULL, NULL, false, false, NULL, 7);
INSERT INTO public.planet VALUES (8, 'Planet 8', 'Another type', 'Description planet 8', NULL, NULL, true, true, NULL, 2);
INSERT INTO public.planet VALUES (9, 'Planet 9', 'Diffrent type', 'Description planet 9', NULL, NULL, false, true, NULL, 3);
INSERT INTO public.planet VALUES (10, 'Planet 10', NULL, 'Description planet 10', NULL, NULL, true, false, NULL, 6);
INSERT INTO public.planet VALUES (11, 'Planet 11', 'Planet', 'Description planet 11', NULL, NULL, false, false, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Planet 12', 'Viable', 'Description planet 12', NULL, NULL, true, true, NULL, 4);
INSERT INTO public.planet VALUES (13, 'Planet 13', 'Moonlight', 'Description planet 13', NULL, NULL, false, true, NULL, 4);
INSERT INTO public.planet VALUES (14, 'Planet 14', NULL, 'Description planet 14', NULL, NULL, true, false, NULL, 2);
INSERT INTO public.planet VALUES (15, 'Planet 15', 'Non Viable', 'Description planet 15', NULL, NULL, false, false, NULL, 5);
INSERT INTO public.planet VALUES (16, 'Planet 16', 'Viable', 'Description planet 16', NULL, NULL, false, true, NULL, 6);
INSERT INTO public.planet VALUES (17, 'Planet 17', 'Planet', 'Description planet 17', NULL, NULL, true, false, NULL, 1);
INSERT INTO public.planet VALUES (18, 'Planet 18', NULL, 'Description planet 18', NULL, NULL, false, false, NULL, 1);
INSERT INTO public.planet VALUES (19, 'Planet 19', 'Stylish', 'Description planet 19', NULL, NULL, true, true, NULL, 3);
INSERT INTO public.planet VALUES (20, 'Planet 20', NULL, 'Description planet 20', NULL, NULL, false, true, NULL, 3);
INSERT INTO public.planet VALUES (21, 'Planet 21', NULL, 'Description planet 21', NULL, NULL, true, false, NULL, 2);
INSERT INTO public.planet VALUES (22, 'Planet 22', NULL, 'Description planet 22', NULL, NULL, false, true, NULL, 5);
INSERT INTO public.planet VALUES (23, 'Planet 23', NULL, 'Description planet 23', NULL, NULL, false, false, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star 1', 'description of star one', 35662, 6984445, NULL, true, false, 1);
INSERT INTO public.star VALUES (2, 'star 2', 'description of star two', 58991, NULL, NULL, false, false, 2);
INSERT INTO public.star VALUES (3, 'star 3', 'description of star three', NULL, 45882, NULL, false, false, 3);
INSERT INTO public.star VALUES (4, 'star 4', 'description of star four', NULL, NULL, NULL, false, true, 4);
INSERT INTO public.star VALUES (5, 'star 5', 'description of star five', 2566112, 32551, NULL, true, false, 6);
INSERT INTO public.star VALUES (6, 'star 6', 'description of star six', 111111, 120552, NULL, true, true, 5);
INSERT INTO public.star VALUES (7, 'star 7', 'description of star seven', NULL, NULL, NULL, true, true, 7);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


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

