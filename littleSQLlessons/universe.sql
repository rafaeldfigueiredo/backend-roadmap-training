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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
    name character varying(50) NOT NULL,
    planet_id integer,
    has_life boolean,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', true, false, 200, 2000);
INSERT INTO public.galaxy VALUES (2, 'The Fig Galaxy', 'Fig galaxy', true, false, 200, 2000);
INSERT INTO public.galaxy VALUES (3, 'Jump Galaxy', 'Jump Galaxy from Heroes', true, true, 100, 10);
INSERT INTO public.galaxy VALUES (4, '3rd Galaxy', 'I gave up', false, false, 10, 2000);
INSERT INTO public.galaxy VALUES (5, '4rd Galaxy', 'I gave up 4th', false, false, 10, 2000);
INSERT INTO public.galaxy VALUES (6, '5rd Galaxy', 'I gave up 5th', false, false, 10, 2000);
INSERT INTO public.galaxy VALUES (7, '6rd Galaxy', 'I gave up 6th', false, true, 10, 2000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'bruhmoon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'bruhmoon2', 1, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'bruhmoon3', 2, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'bruhmoon4', 3, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'bruhmoon5', 3, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'bruhmoon6', 3, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'bruhmoon7', 3, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'bruhmoon8', 3, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'bruhmoon9', 3, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'bruhmoon10', 3, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'bruhmoon11', 3, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'bruhmoon12', 3, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'bruhmoon13', 3, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'bruhmoon14', 3, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'bruhmoon15', 3, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'bruhmoon16', 3, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'bruhmoon18', 3, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'bruhmoon17', 3, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'bruhmoon19', 3, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'bruhmoon20', 4, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'bruhmoon21', 5, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'bruhmoon22', 5, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'bruhmoon23', 6, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'bruhmoon24', 6, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Figs', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, 'Jumper', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, '', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (5, '', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (6, '', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (7, '', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (8, '', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (9, '', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (10, '', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (11, '', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (12, 'bruh', NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'life', true);
INSERT INTO public.planet_types VALUES (2, 'death', false);
INSERT INTO public.planet_types VALUES (3, 'toxic', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Fig', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'Capt', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (4, '3rd', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (5, '4th', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES (6, '5th', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.star VALUES (7, '5th.1', NULL, NULL, NULL, NULL, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_planet_types_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_types_id_key UNIQUE (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

