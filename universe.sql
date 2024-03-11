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
    name character varying(30) NOT NULL,
    description character varying(60),
    diameter_ly integer,
    galaxy_type integer
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
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(60),
    has_life boolean,
    is_spherical boolean,
    diameter_km integer,
    planet_id integer,
    population numeric
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
    name character varying(30) NOT NULL,
    has_life boolean,
    diameter_km integer,
    description text,
    star_id integer
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    name character varying(30) NOT NULL,
    description text,
    friendly boolean,
    species_id integer NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    diameter_km integer,
    galaxy_id integer,
    star_type integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Galaxy we live in', 5000000, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Neighboring galaxy', 6000000, 1);
INSERT INTO public.galaxy VALUES (3, 'Demeter', 'Imaginary galaxy full of dragons', 40000000, 2);
INSERT INTO public.galaxy VALUES (4, 'Eye of Sauron', 'Named after the LoTR characters', 5000000, 2);
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 'Ironically no smoking allowed', 5200000, 2);
INSERT INTO public.galaxy VALUES (6, 'Tadpole Galaxy', 'Home to over 3 billion frogs', 4900000, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Regular old moon', false, true, 3000, 1, 0);
INSERT INTO public.moon VALUES (2, 'Io', 'Silly moon', false, false, 4500, 3, 0);
INSERT INTO public.moon VALUES (3, 'Alex', 'A moon of our own', true, true, 6000, 7, 1000);
INSERT INTO public.moon VALUES (4, 'Froggy moon', 'Extra frog storage', true, true, 4000, 4, 10000);
INSERT INTO public.moon VALUES (5, 'Moontown', 'Fully functioning democracy', true, false, 2000, 8, 50);
INSERT INTO public.moon VALUES (6, 'Mootown', 'Fully functioning cow commune', true, true, 5000, 3, 5000);
INSERT INTO public.moon VALUES (7, 'Motown', 'Detroit but a moon', false, true, 300, 1, 1000);
INSERT INTO public.moon VALUES (8, 'The Real Moon', 'Not a decoy', false, true, 30000, 10, 0);
INSERT INTO public.moon VALUES (9, 'Balenciaga', 'Fashionable moon', false, false, 50, 8, 0);
INSERT INTO public.moon VALUES (10, 'Lil moon', 'A very tiny moon', false, false, 1, 11, 0);
INSERT INTO public.moon VALUES (11, 'Doggy moon', 'Mostly cats', true, true, 1000, 7, 1000);
INSERT INTO public.moon VALUES (12, 'Europa', 'Not part of Europe', false, true, 3000, 3, 0);
INSERT INTO public.moon VALUES (13, 'Ganymede', 'High property taxes', true, true, 4000, 2, 5000);
INSERT INTO public.moon VALUES (14, 'Titan', 'Lots of ice', true, true, 4000, 3, 700);
INSERT INTO public.moon VALUES (15, 'Telesto', 'Once in a blue moon', false, false, 4000, 12, 0);
INSERT INTO public.moon VALUES (16, 'Cordyceps', 'Fungal family', true, true, 6000, 12, 100000);
INSERT INTO public.moon VALUES (17, 'Beebo', 'Nice lil place', false, false, 4000, 11, 0);
INSERT INTO public.moon VALUES (18, 'Moon 2', 'New and improved', false, false, 3000, 1, 0);
INSERT INTO public.moon VALUES (19, 'Friendship moon', 'Nothing scary here', true, true, 5000, 6, 10000);
INSERT INTO public.moon VALUES (20, 'Moon of Dreams', 'So much fun here!', false, false, 80000, 9, 0);
INSERT INTO public.moon VALUES (21, 'Wine moon', 'Lots of vineyards', true, true, 4500, 8, 5000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 45000, 'The planet I live on', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 30000, 'It is red', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', true, 80000, 'Gassy boi', 1);
INSERT INTO public.planet VALUES (4, 'Frog planet', true, 6000, 'Indeed full of frogs', 8);
INSERT INTO public.planet VALUES (5, 'Dog planet', true, 80000, 'Doggy daycare for the stars', 4);
INSERT INTO public.planet VALUES (6, 'LEGO planet', false, 7000, 'Where the LEGO movies were filmed', 6);
INSERT INTO public.planet VALUES (7, 'Venus', false, 45000, 'Consistency of peanut butter', 1);
INSERT INTO public.planet VALUES (8, 'Bloosh', true, 70000, 'Fashionable planet', 5);
INSERT INTO public.planet VALUES (9, 'Heaven', true, 900000, 'Angelic neighborhood', 9);
INSERT INTO public.planet VALUES (10, 'Cranky planet', false, 60000, 'Mostly rubbish', 5);
INSERT INTO public.planet VALUES (11, 'Frog planet 2', false, 50000, 'Old frog planet', 8);
INSERT INTO public.planet VALUES (12, 'Weird planet', true, 5300000, 'Home to a billion funguses', 4);
INSERT INTO public.planet VALUES (13, 'Skyrim', true, 4000, 'By Bethesda', 3);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES ('Human', 'Cute things', true, 1);
INSERT INTO public.species VALUES ('Frog', 'Ribbit', true, 2);
INSERT INTO public.species VALUES ('Heptapods', 'They speak the truth', true, 3);
INSERT INTO public.species VALUES ('Zorbos', 'Avoid these', false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'A familiar star', 100000, 1, 3);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'Neighborly star', 400020, 1, 2);
INSERT INTO public.star VALUES (3, 'The Secret Star', 'Nobody knows where this one is', 3000000, 1, 2);
INSERT INTO public.star VALUES (4, 'Grongus', 'Friendly red giant', 2020020, 2, 3);
INSERT INTO public.star VALUES (5, 'Cool Star', 'Winner of Best Solar System 2 years running', 5000000, 3, 1);
INSERT INTO public.star VALUES (6, 'Little Baby Star', 'A tiny thing', 40000, 5, 1);
INSERT INTO public.star VALUES (7, 'Peaceful star', 'No intergalactic wars since 2000 BC', 800000, 4, 2);
INSERT INTO public.star VALUES (8, 'Frog Star', 'I wonder if there are frogs here', 500000, 6, 2);
INSERT INTO public.star VALUES (9, 'Orions Belt Star', 'What is behind this thing', 600000, 1, 2);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 4, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 9, true);


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
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


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

