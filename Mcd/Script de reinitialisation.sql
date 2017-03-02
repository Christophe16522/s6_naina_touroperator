--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.5
-- Started on 2017-03-02 13:29:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.voyage_confirmer DROP CONSTRAINT fk_voyage_c_associati_voyage;
ALTER TABLE ONLY public.voyage DROP CONSTRAINT fk_voyage_associati_pack_voy;
ALTER TABLE ONLY public.voyage DROP CONSTRAINT fk_voyage_associati_client;
ALTER TABLE ONLY public.pack_voyage DROP CONSTRAINT fk_pack_voy_associati_voiture;
ALTER TABLE ONLY public.pack_voyage DROP CONSTRAINT fk_pack_voy_associati_tarif_vo;
DROP INDEX public.voyage_pk;
DROP INDEX public.voyage_confirmer_pk;
DROP INDEX public.voiture_pk;
DROP INDEX public.tarif_voyage_pk;
DROP INDEX public.super_admin_pk;
DROP INDEX public.pack_voyage_pk;
DROP INDEX public.client_pk;
DROP INDEX public.association_5_fk;
DROP INDEX public.association_4_fk;
DROP INDEX public.association_3_fk;
DROP INDEX public.association_2_fk;
DROP INDEX public.association_1_fk;
ALTER TABLE ONLY public.voyage_confirmer DROP CONSTRAINT pk_voyage_confirmer;
ALTER TABLE ONLY public.voyage DROP CONSTRAINT pk_voyage;
ALTER TABLE ONLY public.voiture DROP CONSTRAINT pk_voiture;
ALTER TABLE ONLY public.tarif_voyage DROP CONSTRAINT pk_tarif_voyage;
ALTER TABLE ONLY public.super_admin DROP CONSTRAINT pk_super_admin;
ALTER TABLE ONLY public.pack_voyage DROP CONSTRAINT pk_pack_voyage;
ALTER TABLE ONLY public.client DROP CONSTRAINT pk_client;
ALTER TABLE public.voyage_confirmer ALTER COLUMN idvoyageconfirmer DROP DEFAULT;
ALTER TABLE public.voyage ALTER COLUMN idvoyage DROP DEFAULT;
ALTER TABLE public.voiture ALTER COLUMN idvoiture DROP DEFAULT;
ALTER TABLE public.tarif_voyage ALTER COLUMN idtarifvoyage DROP DEFAULT;
ALTER TABLE public.super_admin ALTER COLUMN idsuperadmin DROP DEFAULT;
ALTER TABLE public.pack_voyage ALTER COLUMN idpackvoyage DROP DEFAULT;
ALTER TABLE public.client ALTER COLUMN idclient DROP DEFAULT;
DROP SEQUENCE public.voyage_idvoyage_seq;
DROP SEQUENCE public.voyage_confirmer_idvoyageconfirmer_seq;
DROP TABLE public.voyage_confirmer;
DROP TABLE public.voyage;
DROP SEQUENCE public.voiture_idvoiture_seq;
DROP TABLE public.voiture;
DROP SEQUENCE public.tarif_voyage_idtarifvoyage_seq;
DROP TABLE public.tarif_voyage;
DROP SEQUENCE public.super_admin_idsuperadmin_seq;
DROP TABLE public.super_admin;
DROP SEQUENCE public.pack_voyage_idpackvoyage_seq;
DROP TABLE public.pack_voyage;
DROP SEQUENCE public.client_idclient_seq;
DROP TABLE public.client;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2069 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 186 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2071 (class 0 OID 0)
-- Dependencies: 186
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 24579)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE client (
    idclient integer NOT NULL,
    nomclient character varying(50),
    emailclient character varying(50),
    passclient character varying(255)
);


ALTER TABLE client OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 24577)
-- Name: client_idclient_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_idclient_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client_idclient_seq OWNER TO postgres;

--
-- TOC entry 2072 (class 0 OID 0)
-- Dependencies: 172
-- Name: client_idclient_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_idclient_seq OWNED BY client.idclient;


--
-- TOC entry 175 (class 1259 OID 24588)
-- Name: pack_voyage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pack_voyage (
    idpackvoyage integer NOT NULL,
    idvoiture integer NOT NULL,
    idtarifvoyage integer NOT NULL,
    decription character varying(50)
);


ALTER TABLE pack_voyage OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 24586)
-- Name: pack_voyage_idpackvoyage_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pack_voyage_idpackvoyage_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pack_voyage_idpackvoyage_seq OWNER TO postgres;

--
-- TOC entry 2073 (class 0 OID 0)
-- Dependencies: 174
-- Name: pack_voyage_idpackvoyage_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pack_voyage_idpackvoyage_seq OWNED BY pack_voyage.idpackvoyage;


--
-- TOC entry 177 (class 1259 OID 24599)
-- Name: super_admin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE super_admin (
    idsuperadmin integer NOT NULL,
    loginsuperadmin character varying(30),
    passsuperadmin character varying(30),
    niveauaccreditation smallint
);


ALTER TABLE super_admin OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 24597)
-- Name: super_admin_idsuperadmin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE super_admin_idsuperadmin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE super_admin_idsuperadmin_seq OWNER TO postgres;

--
-- TOC entry 2074 (class 0 OID 0)
-- Dependencies: 176
-- Name: super_admin_idsuperadmin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE super_admin_idsuperadmin_seq OWNED BY super_admin.idsuperadmin;


--
-- TOC entry 179 (class 1259 OID 24608)
-- Name: tarif_voyage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tarif_voyage (
    idtarifvoyage integer NOT NULL,
    trajetvoyage character varying(50),
    prixvoyage money
);


ALTER TABLE tarif_voyage OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 24606)
-- Name: tarif_voyage_idtarifvoyage_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tarif_voyage_idtarifvoyage_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tarif_voyage_idtarifvoyage_seq OWNER TO postgres;

--
-- TOC entry 2075 (class 0 OID 0)
-- Dependencies: 178
-- Name: tarif_voyage_idtarifvoyage_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tarif_voyage_idtarifvoyage_seq OWNED BY tarif_voyage.idtarifvoyage;


--
-- TOC entry 181 (class 1259 OID 24617)
-- Name: voiture; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE voiture (
    idvoiture integer NOT NULL,
    matriculevoiture character varying(8),
    imagevoiture character varying(255),
    prixlocationvoiture money,
    modelvoiture character varying(50)
);


ALTER TABLE voiture OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 24615)
-- Name: voiture_idvoiture_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE voiture_idvoiture_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voiture_idvoiture_seq OWNER TO postgres;

--
-- TOC entry 2076 (class 0 OID 0)
-- Dependencies: 180
-- Name: voiture_idvoiture_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE voiture_idvoiture_seq OWNED BY voiture.idvoiture;


--
-- TOC entry 183 (class 1259 OID 24626)
-- Name: voyage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE voyage (
    idvoyage integer NOT NULL,
    idpackvoyage integer NOT NULL,
    idclient integer NOT NULL,
    datedebutvoyage date,
    datefinvoyage date
);


ALTER TABLE voyage OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 24637)
-- Name: voyage_confirmer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE voyage_confirmer (
    idvoyageconfirmer integer NOT NULL,
    idvoyage integer NOT NULL
);


ALTER TABLE voyage_confirmer OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 24635)
-- Name: voyage_confirmer_idvoyageconfirmer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE voyage_confirmer_idvoyageconfirmer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voyage_confirmer_idvoyageconfirmer_seq OWNER TO postgres;

--
-- TOC entry 2077 (class 0 OID 0)
-- Dependencies: 184
-- Name: voyage_confirmer_idvoyageconfirmer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE voyage_confirmer_idvoyageconfirmer_seq OWNED BY voyage_confirmer.idvoyageconfirmer;


--
-- TOC entry 182 (class 1259 OID 24624)
-- Name: voyage_idvoyage_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE voyage_idvoyage_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voyage_idvoyage_seq OWNER TO postgres;

--
-- TOC entry 2078 (class 0 OID 0)
-- Dependencies: 182
-- Name: voyage_idvoyage_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE voyage_idvoyage_seq OWNED BY voyage.idvoyage;


--
-- TOC entry 1917 (class 2604 OID 24582)
-- Name: idclient; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client ALTER COLUMN idclient SET DEFAULT nextval('client_idclient_seq'::regclass);


--
-- TOC entry 1918 (class 2604 OID 24591)
-- Name: idpackvoyage; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pack_voyage ALTER COLUMN idpackvoyage SET DEFAULT nextval('pack_voyage_idpackvoyage_seq'::regclass);


--
-- TOC entry 1919 (class 2604 OID 24602)
-- Name: idsuperadmin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY super_admin ALTER COLUMN idsuperadmin SET DEFAULT nextval('super_admin_idsuperadmin_seq'::regclass);


--
-- TOC entry 1920 (class 2604 OID 24611)
-- Name: idtarifvoyage; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarif_voyage ALTER COLUMN idtarifvoyage SET DEFAULT nextval('tarif_voyage_idtarifvoyage_seq'::regclass);


--
-- TOC entry 1921 (class 2604 OID 24620)
-- Name: idvoiture; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY voiture ALTER COLUMN idvoiture SET DEFAULT nextval('voiture_idvoiture_seq'::regclass);


--
-- TOC entry 1922 (class 2604 OID 24629)
-- Name: idvoyage; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY voyage ALTER COLUMN idvoyage SET DEFAULT nextval('voyage_idvoyage_seq'::regclass);


--
-- TOC entry 1923 (class 2604 OID 24640)
-- Name: idvoyageconfirmer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY voyage_confirmer ALTER COLUMN idvoyageconfirmer SET DEFAULT nextval('voyage_confirmer_idvoyageconfirmer_seq'::regclass);


--
-- TOC entry 1926 (class 2606 OID 24584)
-- Name: pk_client; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT pk_client PRIMARY KEY (idclient);


--
-- TOC entry 1931 (class 2606 OID 24593)
-- Name: pk_pack_voyage; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pack_voyage
    ADD CONSTRAINT pk_pack_voyage PRIMARY KEY (idpackvoyage);


--
-- TOC entry 1933 (class 2606 OID 24604)
-- Name: pk_super_admin; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY super_admin
    ADD CONSTRAINT pk_super_admin PRIMARY KEY (idsuperadmin);


--
-- TOC entry 1936 (class 2606 OID 24613)
-- Name: pk_tarif_voyage; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tarif_voyage
    ADD CONSTRAINT pk_tarif_voyage PRIMARY KEY (idtarifvoyage);


--
-- TOC entry 1939 (class 2606 OID 24622)
-- Name: pk_voiture; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY voiture
    ADD CONSTRAINT pk_voiture PRIMARY KEY (idvoiture);


--
-- TOC entry 1944 (class 2606 OID 24631)
-- Name: pk_voyage; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY voyage
    ADD CONSTRAINT pk_voyage PRIMARY KEY (idvoyage);


--
-- TOC entry 1948 (class 2606 OID 24642)
-- Name: pk_voyage_confirmer; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY voyage_confirmer
    ADD CONSTRAINT pk_voyage_confirmer PRIMARY KEY (idvoyageconfirmer);


--
-- TOC entry 1927 (class 1259 OID 24595)
-- Name: association_1_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association_1_fk ON pack_voyage USING btree (idtarifvoyage);


--
-- TOC entry 1928 (class 1259 OID 24596)
-- Name: association_2_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association_2_fk ON pack_voyage USING btree (idvoiture);


--
-- TOC entry 1941 (class 1259 OID 24633)
-- Name: association_3_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association_3_fk ON voyage USING btree (idclient);


--
-- TOC entry 1942 (class 1259 OID 24634)
-- Name: association_4_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association_4_fk ON voyage USING btree (idpackvoyage);


--
-- TOC entry 1946 (class 1259 OID 24644)
-- Name: association_5_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association_5_fk ON voyage_confirmer USING btree (idvoyage);


--
-- TOC entry 1924 (class 1259 OID 24585)
-- Name: client_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX client_pk ON client USING btree (idclient);


--
-- TOC entry 1929 (class 1259 OID 24594)
-- Name: pack_voyage_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pack_voyage_pk ON pack_voyage USING btree (idpackvoyage);


--
-- TOC entry 1934 (class 1259 OID 24605)
-- Name: super_admin_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX super_admin_pk ON super_admin USING btree (idsuperadmin);


--
-- TOC entry 1937 (class 1259 OID 24614)
-- Name: tarif_voyage_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tarif_voyage_pk ON tarif_voyage USING btree (idtarifvoyage);


--
-- TOC entry 1940 (class 1259 OID 24623)
-- Name: voiture_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX voiture_pk ON voiture USING btree (idvoiture);


--
-- TOC entry 1949 (class 1259 OID 24643)
-- Name: voyage_confirmer_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX voyage_confirmer_pk ON voyage_confirmer USING btree (idvoyageconfirmer);


--
-- TOC entry 1945 (class 1259 OID 24632)
-- Name: voyage_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX voyage_pk ON voyage USING btree (idvoyage);


--
-- TOC entry 1950 (class 2606 OID 24645)
-- Name: fk_pack_voy_associati_tarif_vo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pack_voyage
    ADD CONSTRAINT fk_pack_voy_associati_tarif_vo FOREIGN KEY (idtarifvoyage) REFERENCES tarif_voyage(idtarifvoyage) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1951 (class 2606 OID 24650)
-- Name: fk_pack_voy_associati_voiture; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pack_voyage
    ADD CONSTRAINT fk_pack_voy_associati_voiture FOREIGN KEY (idvoiture) REFERENCES voiture(idvoiture) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1952 (class 2606 OID 24655)
-- Name: fk_voyage_associati_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY voyage
    ADD CONSTRAINT fk_voyage_associati_client FOREIGN KEY (idclient) REFERENCES client(idclient) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1953 (class 2606 OID 24660)
-- Name: fk_voyage_associati_pack_voy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY voyage
    ADD CONSTRAINT fk_voyage_associati_pack_voy FOREIGN KEY (idpackvoyage) REFERENCES pack_voyage(idpackvoyage) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1954 (class 2606 OID 24665)
-- Name: fk_voyage_c_associati_voyage; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY voyage_confirmer
    ADD CONSTRAINT fk_voyage_c_associati_voyage FOREIGN KEY (idvoyage) REFERENCES voyage(idvoyage) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2070 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-03-02 13:29:03

--
-- PostgreSQL database dump complete
--

