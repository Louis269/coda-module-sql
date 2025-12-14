--
-- PostgreSQL database dump
--

\restrict KxA7sWhyen9nckDBveunIxLTm2OG3dm2XZ3A1mKrGc1dPqt1tC3SCckrP4znmcd

-- Dumped from database version 17.7 (178558d)
-- Dumped by pg_dump version 18.0

-- Started on 2025-12-12 17:44:32

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
-- TOC entry 6 (class 2615 OID 16487)
-- Name: student; Type: SCHEMA; Schema: -; Owner: neondb_owner
--



--
-- TOC entry 231 (class 1259 OID 32769)
-- Name: bars; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.bars (
    id_bars integer NOT NULL,
    nom character varying(255) NOT NULL,
    adresse character varying(255) NOT NULL,
    quartier character varying(255) NOT NULL
);


ALTER TABLE public.bars OWNER TO neondb_owner;

--
-- TOC entry 230 (class 1259 OID 32768)
-- Name: bars_id_bars_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.bars_id_bars_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bars_id_bars_seq OWNER TO neondb_owner;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 230
-- Name: bars_id_bars_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.bars_id_bars_seq OWNED BY public.bars.id_bars;


--
-- TOC entry 233 (class 1259 OID 40961)
-- Name: bière; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public."bière" (
    "id_bières" integer NOT NULL,
    nom character varying(255),
    "catégorie" character varying(255),
    "type_bières" character varying(20)
);


ALTER TABLE public."bière" OWNER TO neondb_owner;

--
-- TOC entry 232 (class 1259 OID 40960)
-- Name: bière_id_bières_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public."bière_id_bières_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."bière_id_bières_seq" OWNER TO neondb_owner;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 232
-- Name: bière_id_bières_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public."bière_id_bières_seq" OWNED BY public."bière"."id_bières";


--
-- TOC entry 235 (class 1259 OID 49201)
-- Name: prix; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.prix (
    id_prix integer NOT NULL,
    prix numeric(5,2),
    id_bars integer NOT NULL,
    "id_bières" integer NOT NULL
);


ALTER TABLE public.prix OWNER TO neondb_owner;

--
-- TOC entry 234 (class 1259 OID 49200)
-- Name: prix_id_prix_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.prix_id_prix_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prix_id_prix_seq OWNER TO neondb_owner;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 234
-- Name: prix_id_prix_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.prix_id_prix_seq OWNED BY public.prix.id_prix;

--

ALTER TABLE ONLY public.bars ALTER COLUMN id_bars SET DEFAULT nextval('public.bars_id_bars_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 40964)
-- Name: bière id_bières; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."bière" ALTER COLUMN "id_bières" SET DEFAULT nextval('public."bière_id_bières_seq"'::regclass);


--
-- TOC entry 3238 (class 2604 OID 49204)
-- Name: prix id_prix; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.prix ALTER COLUMN id_prix SET DEFAULT nextval('public.prix_id_prix_seq'::regclass);

--

ALTER TABLE ONLY public.bars
    ADD CONSTRAINT bars_pkey PRIMARY KEY (id_bars);


--
-- TOC entry 3259 (class 2606 OID 40968)
-- Name: bière bière_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public."bière"
    ADD CONSTRAINT "bière_pkey" PRIMARY KEY ("id_bières");


--
-- TOC entry 3261 (class 2606 OID 49206)
-- Name: prix prix_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.prix
    ADD CONSTRAINT prix_pkey PRIMARY KEY (id_prix);


--
-- TOC entry 3247 (class 2606 OID 16519)
-- Name: cours cours_pkey; Type: CONSTRAINT; Schema: student; Owner: neondb_owner
--


ALTER TABLE ONLY public.prix
    ADD CONSTRAINT prix_id_bars_fkey FOREIGN KEY (id_bars) REFERENCES public.bars(id_bars);


--
-- TOC entry 3268 (class 2606 OID 49212)
-- Name: prix prix_id_bières_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.prix
    ADD CONSTRAINT "prix_id_bières_fkey" FOREIGN KEY ("id_bières") REFERENCES public."bière"("id_bières");


--
-- TOC entry 3262 (class 2606 OID 16508)
-- Name: etudiant etudiant_id_etablissement_fkey; Type: FK CONSTRAINT; Schema: student; Owner: neondb_owner
--



ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2085 (class 826 OID 16393)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2025-12-12 17:44:34

--
-- PostgreSQL database dump complete
--

\unrestrict KxA7sWhyen9nckDBveunIxLTm2OG3dm2XZ3A1mKrGc1dPqt1tC3SCckrP4znmcd

