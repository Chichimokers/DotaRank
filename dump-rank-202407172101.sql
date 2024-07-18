--
-- PostgreSQL database cluster dump
--

-- Started on 2024-07-17 21:01:34

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2024-07-17 21:01:35

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

-- Completed on 2024-07-17 21:01:35

--
-- PostgreSQL database dump complete
--

--
-- Database "TaskManager" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2024-07-17 21:01:36

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

--
-- TOC entry 3344 (class 1262 OID 16592)
-- Name: TaskManager; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "TaskManager" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE "TaskManager" OWNER TO postgres;

\connect "TaskManager"

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
-- TOC entry 210 (class 1259 OID 16594)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16593)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 214 (class 1259 OID 16612)
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    description character varying NOT NULL,
    estado character varying NOT NULL,
    responsable integer NOT NULL,
    conmtract_type character varying NOT NULL,
    clasficacion character varying NOT NULL,
    servicio character varying NOT NULL
);


ALTER TABLE public.project OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16611)
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO postgres;

--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 213
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- TOC entry 212 (class 1259 OID 16603)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    description character varying NOT NULL,
    estado character varying NOT NULL,
    fecha_expira timestamp without time zone NOT NULL,
    prioridad character varying NOT NULL,
    proyecto integer NOT NULL,
    user_id integer
);


ALTER TABLE public.task OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16602)
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO postgres;

--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 211
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- TOC entry 216 (class 1259 OID 16621)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16620)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 3179 (class 2604 OID 16597)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3181 (class 2604 OID 16615)
-- Name: project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- TOC entry 3180 (class 2604 OID 16606)
-- Name: task id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- TOC entry 3182 (class 2604 OID 16624)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3332 (class 0 OID 16594)
-- Dependencies: 210
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
\.


--
-- TOC entry 3336 (class 0 OID 16612)
-- Dependencies: 214
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project (id, nombre, description, estado, responsable, conmtract_type, clasficacion, servicio) FROM stdin;
\.


--
-- TOC entry 3334 (class 0 OID 16603)
-- Dependencies: 212
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task (id, nombre, description, estado, fecha_expira, prioridad, proyecto, user_id) FROM stdin;
4	23	23	23	2006-03-03 00:00:00	erer	2332	\N
\.


--
-- TOC entry 3338 (class 0 OID 16621)
-- Dependencies: 216
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, nombre, password) FROM stdin;
23	lla	$2a$10$5Ge27z3P0HY2lVX0hvU7ZOTYHw9l8JfuGW/BhrzJhfV31CVieMiyi
24	lla	$2a$10$5Ad6bqdovQZO2hz6GoRzMOHdQGNIE1dnqJn13DvDoeVKV8BZQpVmi
25	lla	$2a$10$f.P4W9mtbVxg.hs.luIekeVRv9gFhN/konCEqyCiGEw1nQ8GAvV8S
26	lla	$2a$10$.oMk/sdlmiYQqC//prx/se2vvALh6J5UOngq3mXEJyTsD/dgPcqT2
27	lla	$2a$10$o7BC4QTZXnRNvhl6GHm6Se8cmUhWrDdCY.JQYSLzaXSMWFJo1wpGS
28	lla	$2a$10$hdDkq70Kd3UYZrr7/mohw.DHbQrM26pNNd5mVLef5qtQqAr0QWe3u
29	lla	$2a$10$a3NSLhN2Ia3lGmKjn1kvHuSm9.ALICHRyu8aOz/pTmH6t7XYVs0lu
30	lla	$2a$10$hblJFE2NoDapYIBwSs0yX.fDMSTxjCIU.yS5OJFPWMGcwZv2Prf4S
31	llak	$2a$10$/9DSkmiUdGknltlEicbRpeCdZymHYmBD1yfcfGhbD.thLuZlTNGK6
\.


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 213
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 1, false);


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 211
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_id_seq', 4, true);


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 215
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 31, true);


--
-- TOC entry 3188 (class 2606 OID 16619)
-- Name: project PK_4d68b1358bb5b766d3e78f32f57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT "PK_4d68b1358bb5b766d3e78f32f57" PRIMARY KEY (id);


--
-- TOC entry 3184 (class 2606 OID 16601)
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 16628)
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- TOC entry 3186 (class 2606 OID 16610)
-- Name: task PK_fb213f79ee45060ba925ecd576e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT "PK_fb213f79ee45060ba925ecd576e" PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 16644)
-- Name: task FK_6ea2c1c13f01b7a383ebbeaebb0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT "FK_6ea2c1c13f01b7a383ebbeaebb0" FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2024-07-17 21:01:37

--
-- PostgreSQL database dump complete
--

--
-- Database "rank" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2024-07-17 21:01:37

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

--
-- TOC entry 3323 (class 1262 OID 33246)
-- Name: rank; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE rank WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE rank OWNER TO postgres;

\connect rank

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
-- TOC entry 210 (class 1259 OID 33248)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 33247)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 212 (class 1259 OID 33257)
-- Name: player_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_profiles (
    id integer NOT NULL,
    solo_competitive_rank integer,
    competitive_rank integer,
    rank_tier integer,
    leaderboard_rank integer,
    profile_personaname character varying,
    profile_name character varying,
    profile_plus boolean,
    profile_cheese integer,
    profile_steamid character varying,
    profile_avatar character varying,
    profile_avatarmedium character varying,
    profile_avatarfull character varying,
    profile_profileurl character varying,
    profile_last_login character varying,
    profile_loccountrycode character varying,
    profile_is_contributor boolean,
    profile_is_subscriber boolean,
    profile_account_id character varying
);


ALTER TABLE public.player_profiles OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33256)
-- Name: player_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_profiles_id_seq OWNER TO postgres;

--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 211
-- Name: player_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_profiles_id_seq OWNED BY public.player_profiles.id;


--
-- TOC entry 3169 (class 2604 OID 33251)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3170 (class 2604 OID 33260)
-- Name: player_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_profiles ALTER COLUMN id SET DEFAULT nextval('public.player_profiles_id_seq'::regclass);


--
-- TOC entry 3315 (class 0 OID 33248)
-- Dependencies: 210
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
\.


--
-- TOC entry 3317 (class 0 OID 33257)
-- Dependencies: 212
-- Data for Name: player_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_profiles (id, solo_competitive_rank, competitive_rank, rank_tier, leaderboard_rank, profile_personaname, profile_name, profile_plus, profile_cheese, profile_steamid, profile_avatar, profile_avatarmedium, profile_avatarfull, profile_profileurl, profile_last_login, profile_loccountrycode, profile_is_contributor, profile_is_subscriber, profile_account_id) FROM stdin;
4	\N	\N	21	\N	NeoxaFS.Chichimokers Repeat.gg	\N	f	0	76561199064856637	https://avatars.steamstatic.com/b957f6ebf21ddd31783997bf16ea6aa54bed6b78.jpg	https://avatars.steamstatic.com/b957f6ebf21ddd31783997bf16ea6aa54bed6b78_medium.jpg	https://avatars.steamstatic.com/b957f6ebf21ddd31783997bf16ea6aa54bed6b78_full.jpg	https://steamcommunity.com/profiles/76561199064856637/	2024-07-15T19:19:19.548Z	US	f	f	1104590909
5	\N	\N	44	\N	Kiri18.PMA.Neoxa	\N	t	0	76561199147829616	https://avatars.steamstatic.com/131b2c3bb366a4353727d6fd65e8fec78edfb4b7.jpg	https://avatars.steamstatic.com/131b2c3bb366a4353727d6fd65e8fec78edfb4b7_medium.jpg	https://avatars.steamstatic.com/131b2c3bb366a4353727d6fd65e8fec78edfb4b7_full.jpg	https://steamcommunity.com/profiles/76561199147829616/	\N	CU	f	f	1187563888
6	\N	\N	53	\N	KyuVan	\N	t	0	76561198285057039	https://avatars.steamstatic.com/0c575cafb5f5f51a2e632eeabca458e96e610539.jpg	https://avatars.steamstatic.com/0c575cafb5f5f51a2e632eeabca458e96e610539_medium.jpg	https://avatars.steamstatic.com/0c575cafb5f5f51a2e632eeabca458e96e610539_full.jpg	https://steamcommunity.com/profiles/76561198285057039/	2023-10-30T19:10:50.413Z	BR	f	f	324791311
\.


--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 211
-- Name: player_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_profiles_id_seq', 6, true);


--
-- TOC entry 3174 (class 2606 OID 33264)
-- Name: player_profiles PK_60488bbe49c4612fce78e0a1875; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_profiles
    ADD CONSTRAINT "PK_60488bbe49c4612fce78e0a1875" PRIMARY KEY (id);


--
-- TOC entry 3172 (class 2606 OID 33255)
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


-- Completed on 2024-07-17 21:01:37

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-07-17 21:01:37

--
-- PostgreSQL database cluster dump complete
--

