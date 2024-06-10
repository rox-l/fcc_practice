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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES ('user_1718000502907', 2, 452);
INSERT INTO public.games VALUES ('user_1718000502908', 5, 131);
INSERT INTO public.games VALUES ('user_1718000795214', 2, 38);
INSERT INTO public.games VALUES ('user_1718000795215', 5, 163);
INSERT INTO public.games VALUES ('user_1718000919288', 2, 246);
INSERT INTO public.games VALUES ('user_1718000919289', 5, 273);
INSERT INTO public.games VALUES ('Max', 5, 2);
INSERT INTO public.games VALUES ('Alex', 2, 2);
INSERT INTO public.games VALUES ('user_1718000981037', 2, 799);
INSERT INTO public.games VALUES ('user_1718000981038', 5, 357);
INSERT INTO public.games VALUES ('user_1718001045861', 2, 739);
INSERT INTO public.games VALUES ('user_1718001045862', 5, 102);


--
-- PostgreSQL database dump complete
--

