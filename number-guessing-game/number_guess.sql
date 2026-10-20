--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 277);
INSERT INTO public.games VALUES (2, 2, 855);
INSERT INTO public.games VALUES (3, 1, 402);
INSERT INTO public.games VALUES (4, 1, 601);
INSERT INTO public.games VALUES (5, 1, 164);
INSERT INTO public.games VALUES (6, 3, 143);
INSERT INTO public.games VALUES (7, 4, 445);
INSERT INTO public.games VALUES (8, 3, 602);
INSERT INTO public.games VALUES (9, 3, 758);
INSERT INTO public.games VALUES (10, 3, 356);
INSERT INTO public.games VALUES (11, 5, 215);
INSERT INTO public.games VALUES (12, 6, 547);
INSERT INTO public.games VALUES (13, 5, 315);
INSERT INTO public.games VALUES (14, 5, 486);
INSERT INTO public.games VALUES (15, 5, 869);
INSERT INTO public.games VALUES (16, 7, 799);
INSERT INTO public.games VALUES (17, 8, 572);
INSERT INTO public.games VALUES (18, 7, 616);
INSERT INTO public.games VALUES (19, 7, 339);
INSERT INTO public.games VALUES (20, 7, 440);
INSERT INTO public.games VALUES (21, 9, 118);
INSERT INTO public.games VALUES (22, 10, 36);
INSERT INTO public.games VALUES (23, 9, 939);
INSERT INTO public.games VALUES (24, 9, 105);
INSERT INTO public.games VALUES (25, 9, 147);
INSERT INTO public.games VALUES (26, 11, 566);
INSERT INTO public.games VALUES (27, 12, 19);
INSERT INTO public.games VALUES (28, 11, 327);
INSERT INTO public.games VALUES (29, 11, 137);
INSERT INTO public.games VALUES (30, 11, 708);
INSERT INTO public.games VALUES (31, 13, 931);
INSERT INTO public.games VALUES (32, 14, 816);
INSERT INTO public.games VALUES (33, 13, 350);
INSERT INTO public.games VALUES (34, 13, 772);
INSERT INTO public.games VALUES (35, 13, 603);
INSERT INTO public.games VALUES (36, 15, 885);
INSERT INTO public.games VALUES (37, 16, 327);
INSERT INTO public.games VALUES (38, 15, 939);
INSERT INTO public.games VALUES (39, 15, 877);
INSERT INTO public.games VALUES (40, 15, 421);
INSERT INTO public.games VALUES (41, 17, 251);
INSERT INTO public.games VALUES (42, 17, 607);
INSERT INTO public.games VALUES (43, 18, 238);
INSERT INTO public.games VALUES (44, 18, 831);
INSERT INTO public.games VALUES (45, 17, 787);
INSERT INTO public.games VALUES (46, 17, 269);
INSERT INTO public.games VALUES (47, 17, 197);
INSERT INTO public.games VALUES (48, 19, 364);
INSERT INTO public.games VALUES (49, 19, 513);
INSERT INTO public.games VALUES (50, 20, 151);
INSERT INTO public.games VALUES (51, 20, 707);
INSERT INTO public.games VALUES (52, 19, 399);
INSERT INTO public.games VALUES (53, 19, 511);
INSERT INTO public.games VALUES (54, 19, 985);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1792486791696');
INSERT INTO public.users VALUES (2, 'user_1792486791695');
INSERT INTO public.users VALUES (3, 'user_1792487713796');
INSERT INTO public.users VALUES (4, 'user_1792487713795');
INSERT INTO public.users VALUES (5, 'user_1792487775778');
INSERT INTO public.users VALUES (6, 'user_1792487775777');
INSERT INTO public.users VALUES (7, 'user_1792487797538');
INSERT INTO public.users VALUES (8, 'user_1792487797537');
INSERT INTO public.users VALUES (9, 'user_1792487930056');
INSERT INTO public.users VALUES (10, 'user_1792487930055');
INSERT INTO public.users VALUES (11, 'user_1792488485959');
INSERT INTO public.users VALUES (12, 'user_1792488485958');
INSERT INTO public.users VALUES (13, 'user_1792488963926');
INSERT INTO public.users VALUES (14, 'user_1792488963925');
INSERT INTO public.users VALUES (15, 'user_1792488982158');
INSERT INTO public.users VALUES (16, 'user_1792488982157');
INSERT INTO public.users VALUES (17, 'user_1792489453306');
INSERT INTO public.users VALUES (18, 'user_1792489453305');
INSERT INTO public.users VALUES (19, 'user_1792489943041');
INSERT INTO public.users VALUES (20, 'user_1792489943040');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 54, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

