--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

drop table updates;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: updates; Type: TABLE; Schema: public; Owner: ec2-user
--

CREATE TABLE updates (
    day integer,
    formattedid character varying(100),
    newvalue character varying(100),
    field character varying(100),
    itemtype character varying(100),
    parent character varying(100),
    parent_type character varying(100),
    work_type character varying(100),
    project character varying(100),
    child character varying(100)
);


ALTER TABLE updates OWNER TO postgres;

--
-- Data for Name: updates; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

COPY updates (day, formattedid, newvalue, field, itemtype, parent, parent_type, work_type, project, child) FROM stdin;
2	TA63	Completed	State	Task			modify	Shopping Team	
2	Support write API	I1	Parent	PortfolioItem/Feature			modify	Shopping Team	
2	F3	I1	PortfolioItem/Initiative	PortfolioItem/Feature			modify	Shopping Team	
2		My New Task	Name	Task	US116	UserStory	add	API Team	
2		Hello!	Name	Task	As a user I would like to update tickets	UserStory	add	API Team	
2	DE1	Testing	Name	Defect			modify	API Team	
2	DE2	Open	State	Defect			modify	API Team	
2	DE3	6	PlanEstimate	Defect			modify	API Team	
\.


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO readonly;


--
-- Name: updates; Type: ACL; Schema: public; Owner: ec2-user
--

GRANT SELECT ON TABLE updates TO readonly;


--
-- PostgreSQL database dump complete
--

