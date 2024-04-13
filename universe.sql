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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    has_life boolean,
    spherical boolean,
    dist_earth numeric,
    name character varying(40) NOT NULL,
    age_mya integer,
    diameter integer,
    units text
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_id_seq OWNER TO freecodecamp;

--
-- Name: description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    description_id integer,
    discovered date,
    type text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    description_id integer,
    discovered date
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
    name character varying(40) NOT NULL,
    star_id integer,
    planet_id integer NOT NULL,
    description_id integer,
    discovered date,
    type text
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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    description_id integer,
    discovered date,
    type text
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
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


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
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (1, true, false, 0, 'Milky Way', 13500, 87400, 'lightyears');
INSERT INTO public.description VALUES (2, false, false, 2500000, 'Andromeda', 3000, 157000, 'lightyears');
INSERT INTO public.description VALUES (3, false, false, 163000, 'Large Magellanic Cloud', NULL, 32200, 'lightyears');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 4, 1, '-infinity', 'barred spiral');
INSERT INTO public.galaxy VALUES ('Andromeda', 5, 2, '-infinity', 'barred spiral');
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 6, 3, '-infinity', 'spiral');
INSERT INTO public.galaxy VALUES ('Sagittarius Dwarf Spheroidal', 7, 4, '1994-01-01', 'elliptical');
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 8, 5, '-infinity', 'dwarf irregular');
INSERT INTO public.galaxy VALUES ('Triangulum', 9, 6, '1654-01-01', 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('The Moon', 3, 1, 25, '-infinity');
INSERT INTO public.moon VALUES ('Phobos', 4, 2, 26, '1877-08-12');
INSERT INTO public.moon VALUES ('Deimos', 4, 3, 27, '1877-08-18');
INSERT INTO public.moon VALUES ('Io', 5, 4, 28, '1610-01-01');
INSERT INTO public.moon VALUES ('Europa', 5, 5, 29, '1610-01-01');
INSERT INTO public.moon VALUES ('Ganymede', 5, 6, 30, '1610-01-01');
INSERT INTO public.moon VALUES ('Callisto', 5, 7, 31, '1610-01-01');
INSERT INTO public.moon VALUES ('Himalia', 5, 8, 32, '1905-01-01');
INSERT INTO public.moon VALUES ('Elara', 5, 9, 33, '1905-01-01');
INSERT INTO public.moon VALUES ('Amalthea', 5, 10, 34, '1892-01-01');
INSERT INTO public.moon VALUES ('Thebe', 5, 11, 35, '1979-01-01');
INSERT INTO public.moon VALUES ('Titan', 7, 12, 36, '1655-01-01');
INSERT INTO public.moon VALUES ('Rhea', 7, 13, 37, '1672-01-01');
INSERT INTO public.moon VALUES ('Iapetus', 7, 14, 38, '1671-01-01');
INSERT INTO public.moon VALUES ('Dione', 7, 15, 39, '1684-01-01');
INSERT INTO public.moon VALUES ('Tethys', 7, 16, 40, '1684-01-01');
INSERT INTO public.moon VALUES ('Enceladus', 7, 17, 41, '1789-01-01');
INSERT INTO public.moon VALUES ('Mimas', 7, 18, 42, '1789-01-01');
INSERT INTO public.moon VALUES ('Titania', 8, 19, 43, '1787-01-11');
INSERT INTO public.moon VALUES ('Oberon', 8, 20, 44, '1787-01-11');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Venus', 1, 1, 13, '-infinity', 'terrestrial');
INSERT INTO public.planet VALUES ('Mercury', 1, 2, 14, '-infinity', 'terrestrial');
INSERT INTO public.planet VALUES ('Earth', 1, 3, 15, '-infinity', 'terrestrial');
INSERT INTO public.planet VALUES ('Mars', 1, 4, 16, '-infinity', 'terrestrial');
INSERT INTO public.planet VALUES ('Jupiter', 1, 5, 17, '-infinity', 'gas giant');
INSERT INTO public.planet VALUES ('Saturn', 1, 7, 18, '-infinity', 'gas giant');
INSERT INTO public.planet VALUES ('Uranus', 1, 8, 19, '1781-03-13', 'ice giant');
INSERT INTO public.planet VALUES ('Neptune', 1, 9, 20, '1846-09-23', 'giant');
INSERT INTO public.planet VALUES ('Pluto', 1, 10, 21, '1930-02-18', 'dwarf');
INSERT INTO public.planet VALUES ('HD 37124 b', 6, 11, 22, '1999-11-01', 'extrasolar Jovian');
INSERT INTO public.planet VALUES ('Proxima Centauri b', 2, 12, 23, '2016-08-24', 'exoplanet');
INSERT INTO public.planet VALUES ('Proxima Centauri c', 2, 13, 24, '2020-01-01', 'extrasolar super-Earth');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 4, 1, 7, '-infinity', 'yellow dwarf');
INSERT INTO public.star VALUES ('Proxima Centauri', 4, 2, 8, '1915-01-01', 'red dwarf');
INSERT INTO public.star VALUES ('Sirius', 4, 3, 9, '-infinity', 'binary');
INSERT INTO public.star VALUES ('WISE J004945.61+215120.0', 5, 4, 10, '2012-01-01', 'brown dwarf');
INSERT INTO public.star VALUES ('S Doradus', 6, 5, 11, '1897-01-01', 'luminous blue variable');
INSERT INTO public.star VALUES ('HD 37124', 4, 6, 12, NULL, 'subgiant');


--
-- Name: description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 9, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: description description_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_id_key UNIQUE (description_id);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: galaxy galaxy_desc_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_desc_id_key UNIQUE (description_id);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_desc_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_desc_id_key UNIQUE (description_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_desc_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_desc_id_key UNIQUE (description_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_desc_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_desc_id_key UNIQUE (description_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


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

