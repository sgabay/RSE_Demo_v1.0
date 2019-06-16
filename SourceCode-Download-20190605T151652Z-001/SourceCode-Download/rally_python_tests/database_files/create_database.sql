--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: defect; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE defect (
    name text NOT NULL,
    kanbanstate text,
    schedulestate text,
    owner text,
    requirement text,
    project text,
    iteration text,
    release text,
    planestimate text,
    severity text,
    state text,
    environment text,
    priority text,
    ready text,
    resolution text,
    blocked text,
    blockedreason text,
    description text,
    notes text,
    displaycolor text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.defect OWNER TO postgres;

--
-- Name: feature; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE feature (
    name text NOT NULL,
    investmentcategory text,
    project text,
    owner text,
    parent text,
    release text,
    plannedstartdate timestamp without time zone,
    plannedenddate timestamp without time zone,
    description text,
    displaycolor text,
    notes text,
    ready text,
    riskscore text,
    valuescore text,
    preliminaryestimate text,
    state text,
    listing_order integer,
    dataset character varying(100) NOT NULL,
    timecriticality integer,
    rroevalue integer,
    jobsize integer,
    refinedestimate text
);


ALTER TABLE public.feature OWNER TO postgres;

--
-- Name: fundingincrement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fundingincrement (
    name character varying(100) NOT NULL,
    amount integer,
    dataset character varying(100) NOT NULL,
    listing_order integer
);


ALTER TABLE public.fundingincrement OWNER TO postgres;

--
-- Name: initiative; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE initiative (
    name text NOT NULL,
    plannedstartdate timestamp without time zone,
    plannedenddate timestamp without time zone,
    parent text,
    description text,
    displaycolor text,
    investmentcategory text,
    notes text,
    ready text,
    riskscore integer,
    valuescore integer,
    project text,
    state text,
    owner text,
    listing_order integer,
    dataset character varying(100) NOT NULL,
    rroevalue integer,
    jobsize integer,
    timecriticality integer
);


ALTER TABLE public.initiative OWNER TO postgres;

--
-- Name: investment; Type: TABLE; Schema: public; Owner: ec2-user; Tablespace: 
--

CREATE TABLE investment (
    name text NOT NULL,
    amount integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.investment OWNER TO "ec2-user";

--
-- Name: iteration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE iteration (
    project text,
    name text NOT NULL,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    plannedvelocity integer,
    state text,
    theme text,
    notes text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.iteration OWNER TO postgres;

--
-- Name: preliminaryestimate; Type: TABLE; Schema: public; Owner: ec2-user; Tablespace: 
--

CREATE TABLE preliminaryestimate (
    name text NOT NULL,
    value integer NOT NULL,
    dataset text NOT NULL,
    listing_order integer
);


ALTER TABLE public.preliminaryestimate OWNER TO "ec2-user";

--
-- Name: release; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE release (
    project text,
    name text NOT NULL,
    plannedvelocity integer,
    releasedate timestamp without time zone,
    releasestartdate timestamp without time zone,
    state text,
    theme text,
    grossestimateconversionratio integer,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.release OWNER TO postgres;

--
-- Name: risk; Type: TABLE; Schema: public; Owner: ec2-user; Tablespace: 
--

CREATE TABLE risk (
    name text NOT NULL,
    release text,
    iteration text,
    schedulestate text,
    project text,
    owner text,
    accepteddate timestamp without time zone,
    taskactualtotal integer,
    blocked text,
    blockedreason text,
    calculatedrisk integer,
    displaycolor text,
    createdby text,
    description text,
    exposure integer,
    impact text,
    milestones text,
    notes text,
    plannedestimate text,
    probability text,
    ready text,
    resolution text,
    response text,
    sizeofloss text,
    state text,
    submittedby text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.risk OWNER TO "ec2-user";

--
-- Name: story; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE story (
    name text NOT NULL,
    schedulestate text,
    kanbanstate text,
    portfolioitem text,
    project text,
    iteration text,
    owner text,
    planestimate integer,
    release text,
    description text,
    ready text,
    blocked text,
    blockedreason text,
    displaycolor text,
    notes text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.story OWNER TO postgres;

--
-- Name: task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task (
    name text NOT NULL,
    workproduct text,
    state text,
    owner text,
    estimate text,
    todo text,
    actuals text,
    blocked text,
    blockedreason text,
    description text,
    displaycolor text,
    ready text,
    taskindex text,
    project text,
    listing_order integer,
    dataset character varying(100) NOT NULL,
    notes text
);


ALTER TABLE public.task OWNER TO postgres;

--
-- Name: testcase; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE testcase (
    name text NOT NULL,
    owner text,
    project text,
    testfolder text,
    workproduct text,
    method text,
    description text,
    objective text,
    postconditions text,
    preconditions text,
    priority text,
    ready text,
    risk text,
    type text,
    validationexpectedresult text,
    validationinput text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.testcase OWNER TO postgres;

--
-- Name: testcaseresult; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE testcaseresult (
    build text,
    date timestamp without time zone,
    duration text,
    notes text,
    verdict text,
    testcase text,
    testset text,
    tester text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.testcaseresult OWNER TO postgres;

--
-- Name: testcasestep; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE testcasestep (
    expectedresult text,
    input text,
    stepindex text,
    testcase text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.testcasestep OWNER TO postgres;

--
-- Name: testfolder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE testfolder (
    name text,
    project text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.testfolder OWNER TO postgres;

--
-- Name: testset; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE testset (
    description text,
    name text NOT NULL,
    planestimate text,
    ready text,
    schedulestate text,
    project text,
    iteration text,
    release text,
    owner text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.testset OWNER TO postgres;

--
-- Name: theme; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE theme (
    name text NOT NULL,
    owner text,
    plannedstartdate timestamp without time zone,
    plannedenddate timestamp without time zone,
    description text,
    displaycolor text,
    investmentcategory text,
    ready text,
    riskscore integer,
    valuescore integer,
    project text,
    preliminaryestimate text,
    state text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE public.theme OWNER TO postgres;

--
-- Name: updates; Type: TABLE; Schema: public; Owner: ec2-user; Tablespace: 
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
    dataset text
);


ALTER TABLE public.updates OWNER TO "ec2-user";

--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT USAGE ON SCHEMA public TO readonly;


--
-- Name: defect; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE defect FROM PUBLIC;
REVOKE ALL ON TABLE defect FROM postgres;
GRANT ALL ON TABLE defect TO postgres;
GRANT ALL ON TABLE defect TO readonly;


--
-- Name: feature; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE feature FROM PUBLIC;
REVOKE ALL ON TABLE feature FROM postgres;
GRANT ALL ON TABLE feature TO postgres;
GRANT ALL ON TABLE feature TO readonly;


--
-- Name: fundingincrement; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE fundingincrement FROM PUBLIC;
REVOKE ALL ON TABLE fundingincrement FROM postgres;
GRANT ALL ON TABLE fundingincrement TO postgres;
GRANT SELECT ON TABLE fundingincrement TO readonly;


--
-- Name: initiative; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE initiative FROM PUBLIC;
REVOKE ALL ON TABLE initiative FROM postgres;
GRANT ALL ON TABLE initiative TO postgres;
GRANT ALL ON TABLE initiative TO readonly;


--
-- Name: iteration; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE iteration FROM PUBLIC;
REVOKE ALL ON TABLE iteration FROM postgres;
GRANT ALL ON TABLE iteration TO postgres;
GRANT ALL ON TABLE iteration TO readonly;


--
-- Name: release; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE release FROM PUBLIC;
REVOKE ALL ON TABLE release FROM postgres;
GRANT ALL ON TABLE release TO postgres;
GRANT ALL ON TABLE release TO readonly;


--
-- Name: story; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE story FROM PUBLIC;
REVOKE ALL ON TABLE story FROM postgres;
GRANT ALL ON TABLE story TO postgres;
GRANT ALL ON TABLE story TO readonly;


--
-- Name: task; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE task FROM PUBLIC;
REVOKE ALL ON TABLE task FROM postgres;
GRANT ALL ON TABLE task TO postgres;
GRANT ALL ON TABLE task TO readonly;


--
-- Name: testcase; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE testcase FROM PUBLIC;
REVOKE ALL ON TABLE testcase FROM postgres;
GRANT ALL ON TABLE testcase TO postgres;
GRANT ALL ON TABLE testcase TO readonly;


--
-- Name: testcaseresult; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE testcaseresult FROM PUBLIC;
REVOKE ALL ON TABLE testcaseresult FROM postgres;
GRANT ALL ON TABLE testcaseresult TO postgres;
GRANT ALL ON TABLE testcaseresult TO readonly;


--
-- Name: testcasestep; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE testcasestep FROM PUBLIC;
REVOKE ALL ON TABLE testcasestep FROM postgres;
GRANT ALL ON TABLE testcasestep TO postgres;
GRANT ALL ON TABLE testcasestep TO readonly;


--
-- Name: testfolder; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE testfolder FROM PUBLIC;
REVOKE ALL ON TABLE testfolder FROM postgres;
GRANT ALL ON TABLE testfolder TO postgres;
GRANT ALL ON TABLE testfolder TO readonly;


--
-- Name: testset; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE testset FROM PUBLIC;
REVOKE ALL ON TABLE testset FROM postgres;
GRANT ALL ON TABLE testset TO postgres;
GRANT ALL ON TABLE testset TO readonly;


--
-- Name: theme; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE theme FROM PUBLIC;
REVOKE ALL ON TABLE theme FROM postgres;
GRANT ALL ON TABLE theme TO postgres;
GRANT ALL ON TABLE theme TO readonly;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO readonly;


--
-- PostgreSQL database dump complete
--

