--
-- PostgreSQL database dump
--

\restrict qN2KFF14lOZHgcq01POlv9wqLaICA89EItYF5bwO0RModfFeMEUeJbgENLr7PzS

-- Dumped from database version 17.7 (178558d)
-- Dumped by pg_dump version 18.0

-- Started on 2025-12-12 17:46:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3415 (class 0 OID 32769)
-- Dependencies: 231
-- Data for Name: bars; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.bars (id_bars, nom, adresse, quartier) FROM stdin;
1	Trinidad	Place du Théâtre, 21000 Dijon	Aucune donné
2	Restaurant Rich Bar	14 Place de la Libération, 21000 Dijon	Aucune donnée
3	Pub l ours pimpant	40 Rue Amiral Roussin, 21000 Dijon	Aucune donnée
4	Bar Le 19	19 Rue Berbisey, 21000 Dijon	Aucune donnée
5	Les Berthom	32 Rue Monge, 21000 Dijon	Aucune donnée
6	Idéal Bar	59 Rue Monge, 21000 Dijon	Aucune donnée
7	La Roue Libre / Bar	15 Rue Auguste Comte, 21000 Dijon	Aucune donnée
8	Pub Mac Callaghan	8 Rue Bannelier, 21000 Dijon	Aucune donnée
9	AMERICAN SPORT BAR	16 Boulevard de Strasbourg, 21000 Dijon	Aucune donnée
10	Semeia Bar	23 Rue Jean-Jacques Rousseau, 21000 Dijon	Aucune donnée
\.


--
-- TOC entry 3417 (class 0 OID 40961)
-- Dependencies: 233
-- Data for Name: bière; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public."bière" ("id_bières", nom, "catégorie", "type_bières") FROM stdin;
1	AMERICAN SPORTS BAR	Artisan	draft beer
2	Trinidad	Artisan	draft beer
3	Pub Mac Callaghan	Artisan	draft beer
4	Pub l ours pimpant	Artisan	draft beer
5	Bar Le 19	Artisan	draft beer
6	Restaurant Rich Bar	Artisan	draft beer
7	Les Berthom	Artisan	draft beer
9	La Roue Libre / Bar	Artisan	draft beer
10	Idéal Bar	Artisan	draft beer
8	Semeia Bar	Artisan	draft beer
\.


--
-- TOC entry 3419 (class 0 OID 49201)
-- Dependencies: 235
-- Data for Name: prix; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.prix (id_prix, prix, id_bars, "id_bières") FROM stdin;
1	3.90	1	2
2	5.20	1	3
3	4.70	2	2
\.


--
-- TOC entry 3407 (class 0 OID 16514)
-- Dependencies: 223
-- Data for Name: cours; Type: TABLE DATA; Schema: student; Owner: neondb_owner
--




--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 230
-- Name: bars_id_bars_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.bars_id_bars_seq', 1, false);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 232
-- Name: bière_id_bières_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public."bière_id_bières_seq"', 1, false);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 234
-- Name: prix_id_prix_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.prix_id_prix_seq', 3, true);




-- Completed on 2025-12-12 17:46:55

--
-- PostgreSQL database dump complete
--

\unrestrict qN2KFF14lOZHgcq01POlv9wqLaICA89EItYF5bwO0RModfFeMEUeJbgENLr7PzS

