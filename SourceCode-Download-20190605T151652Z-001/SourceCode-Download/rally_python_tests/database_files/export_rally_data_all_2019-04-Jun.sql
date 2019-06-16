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
-- Data for Name: defect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY defect (name, kanbanstate, schedulestate, owner, requirement, project, iteration, release, planestimate, severity, state, environment, priority, ready, resolution, blocked, blockedreason, description, notes, displaycolor, listing_order, dataset) FROM stdin;
Logoff: No warning when user clicks Logout link	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	When the Logout link is clicked, the application should display a message asking whether the user is sure he/she wants to continue logging out.	\N	\N	1	Standard
System Performance suffers for constant loads of only 1,000 users	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	The system experiences noticeable degradation in performance for loads of only 1,000 concurrent users.	\N	\N	2	Standard
Language Support:  Special Characters	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Special characters in both Japanese and French are not being displayed properly.	\N	\N	3	Standard
Customer is not able to choose Japanese as their display language	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Japanese is not appearing in the 'Select Language' drop down.	\N	\N	4	Standard
Login 404 Issue	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Closed	Development	Resolve Immediately	FALSE	None	FALSE	\N	Received an Error 404 warning on entrance to the application.	\N	\N	5	Standard
Authentication Hyperlink is broken	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	Currently, the authentication hyperlink provided to the customer via email is broken.&nbsp; Following the link brings the customer to the homepage, but the customer has not been validated.<br /><br />Steps:<br /> <ul><li>Created a new customer account</li><li>Received an email that contained a hyperlink to complete authentication</li><li>Clicking the link brought me to the homepage of the app</li><li>On login, I had yet to be authenticated so shopping could proceed<br /></li></ul>	\N	\N	6	Standard
404 on address page	Accepted	Accepted	\N	\N	Shopping Team	Iteration 3	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	7	Standard
Unable to check status of archived orders	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	8	Standard
Unable to open an order from history	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	9	Standard
Found an error when I tried to access my shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	I was taken to the checkout screen prematurely	\N	\N	10	Standard
Problem with User Authentication	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Major Problem	Open	Production	Resolve Immediately	FALSE	None	FALSE	\N	More than one customer is reporting that they are being logged off of the system	\N	\N	11	Standard
BZ: Could not login to app	Prioritized	Defined	\N	\N	Shopping Team	Iteration 7	R2	5	Major Problem	Open	Staging	High Attention	FALSE	None	FALSE	\N	Customer could not login.	\N	\N	12	Standard
Application displays individual shipping costs but total is unchanged	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	The individual estimated shipping costs for each package/destination are displayed, but the Total field only displays the shipping cost for the first destination in the list.&nbsp; Also, once a customer checks out, the total for the entire order only reflects shipping for one destination.	\N	\N	13	Standard
Tax totals for split shipping not calculated properly	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	1	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	14	Standard
UI for split - need more separation on order sections	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	15	Standard
Click on split shipping - nothing displays	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Major Problem	Closed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	16	Standard
Priority shipping options not appearing for multiple destinations	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Having a shopping cart that contained 2 items, I chose to ship the items to two different destinations.&nbsp; The individual destination buckets appeared appropriately, however there were no visible priority shipping options for either destination.	\N	\N	17	Standard
No warning when MAX destinations has been reached	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Once a customer has elected to ship items to the maximum number of different destinations, the add destination button is disabled, but no warning is displayed explaining why.	\N	\N	18	Standard
Too many digits appearing for updated shipping cost	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Total shipping cost should be displayed as '$XXX.XX', but currently the total has 5 digits after the decimal ($23.78352).	\N	\N	19	Standard
Package Tracking Notifications are broken	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	Only one tracking notification is being sent to the customer when they have packages being shipped to multiple destinations.&nbsp; The system should send an email for packages being sent to each destination.	\N	\N	20	Standard
Default selection is Express	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	The default selection for priority shipping is currently Express, it should instead be Ground.	\N	\N	21	Standard
Payment by e-Check failing on submit	\N	Defined	\N	\N	Payment Team	\N	\N	1	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Error message indicating 'Gateway 502' problem.	\N	\N	22	Standard
No warning when 18digits given for credit card	Prioritized	Defined	\N	\N	Payment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Able to add 1 extra digit to credit card input box	\N	\N	23	Standard
Browser shows non-validated security key on payment form page	Prioritized	Defined	\N	\N	Payment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Browser prompts to confirm security exception.	\N	\N	24	Standard
Only one selected item is being added to the cart	Ready for Acceptance	Completed	daniel@acme.com	Purchase Your Items	Shopping Team	Iteration 6	R2	3	Minor Problem	Fixed	Development	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Logged in as a customer</li><li>Selected multiple items to add to cart at once</li><li>Clicked 'Add to Cart'</li><li>Clicked 'View My Cart'</li><li>Only the first item chosen was actually added to the cart<br /></li></ul>	\N	\N	25	Standard
Recurring 'No Address' Warning	Ready for Acceptance	Completed	\N	\N	Shopping Team	\N	\N	3	Minor Problem	Fixed	Staging	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Created a new account, but didn't enter an address</li><li>Logged in as the new user, system displayed a message asking for address information</li><li>Enter a valid address and click save</li><li>For every following action within the same shopping session, the system warned that no address information had been entered, even though it was still saved and visible<br /></li></ul>	\N	\N	26	Standard
Production Defect in accessing shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	Error 404 - Not Found when trying to navigate to the shopping cart.	\N	\N	27	Standard
State drop down doesn't contain any items	Ready for Acceptance	Completed	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Fixed	Development	High Attention	FALSE	None	FALSE	\N	The customer should enter the following shipping information:<br /><br /> <ul><li>Name</li><li>Address</li><li>City</li><li>State (drop down)</li><li>Country (drop down)</li><li>Zip/Country Code</li></ul>	\N	\N	28	Standard
Code verification completely broken!	\N	Defined	\N	\N	Shopping Team	\N	\N	3	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	The application accepts any 6 character long string as a valid promotional code and applies the maximum discount to the order!<br /><br />Steps:<br /> <ul><li>Logged in as a customer, choose a few items to purchase</li><li>Enter an invalid promotional code (of correct length) in the editable field</li><li>Click update</li><li>Maximum discount is applied to the order</li></ul>This occurs for any codes entered that contain 6 characters.	\N	\N	29	Standard
(Auto) Fitnesse Test Failed for GUI - Checkout Button	\N	Defined	daniel@acme.com	Purchase Your Items	Shopping Team	\N	\N	1	Major Problem	Open	Development	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	30	Standard
latest Promo Code is invalid.	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 6	R2	\N	Cosmetic	Closed	Development	Low	FALSE	None	FALSE	\N	On the payment screen, the Promo Code field label formatting is incorrect.&nbsp; Currently it is bold and italic, thought it should just be bold to match the rest of the field labels.<br /><br /><i><b>Promo Code</b></i> -&gt; <b>Promo Code</b>	\N	\N	31	Standard
(Auto) Fitnesse Test Failed for Calculations	Ready for Dev	Defined	daniel@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	32	Standard
Weird formatting -> Totals GUI	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Cosmetic	Submitted	Staging	Low	FALSE	None	FALSE	\N	The formatting for the totals/costs GUI is distorted.&nbsp; The total cost field is appearing on the very left side of the browser, when it should be beneath all of the other calculation fields on the right side of the browser.	\N	\N	33	Standard
Unable to login after entering reset password	Ready for Dev	Defined	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	34	Standard
User's password shown in plain text in recovery email	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 5	R2	3	Major Problem	Fixed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	35	Standard
Button color on checkout page does not match blue hue per design specs	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Cosmetic	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	36	Standard
Old font found on contact us page	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	37	Standard
Unable to login after entering invalid password	In Test	In-Progress	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	38	Standard
"Remember me" cookie not working	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	2	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	39	Standard
Monthly product re-order is duplicating items	In Dev	In-Progress	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	1	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	40	Standard
Unable to check status of past orders	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	41	Standard
Unable to undelete an order from history	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	42	Standard
302 response code on /api page	Accepted	Accepted	dora@acme.com	\N	API Team	Iteration 6	R2	5	Major Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	43	Standard
Unable to connect to staging server with 'v2.0' string	Prioritized	Defined	dora@acme.com	\N	API Team	Iteration 6	R2	3	Minor Problem	Open	Staging	Normal	FALSE	None	FALSE	\N	\N	\N	\N	44	Standard
CCV codes not being verified on checkout path	Prioritized	Defined	dave@acme.com	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	45	Standard
Mastercard not showing in valid CC dropdown list on checkout path	\N	Defined	\N	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	46	Standard
Logoff: No warning when user clicks Logout link	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	When the Logout link is clicked, the application should display a message asking whether the user is sure he/she wants to continue logging out.	\N	\N	1	Extended
System Performance suffers for constant loads of only 1,000 users	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	The system experiences noticeable degradation in performance for loads of only 1,000 concurrent users.	\N	\N	2	Extended
Language Support:  Special Characters	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Special characters in both Japanese and French are not being displayed properly.	\N	\N	3	Extended
Customer is not able to choose Japanese as their display language	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Japanese is not appearing in the 'Select Language' drop down.	\N	\N	4	Extended
Login 404 Issue	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Closed	Development	Resolve Immediately	FALSE	None	FALSE	\N	Received an Error 404 warning on entrance to the application.	\N	\N	5	Extended
Authentication Hyperlink is broken	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	Currently, the authentication hyperlink provided to the customer via email is broken.&nbsp; Following the link brings the customer to the homepage, but the customer has not been validated.<br /><br />Steps:<br /> <ul><li>Created a new customer account</li><li>Received an email that contained a hyperlink to complete authentication</li><li>Clicking the link brought me to the homepage of the app</li><li>On login, I had yet to be authenticated so shopping could proceed<br /></li></ul>	\N	\N	6	Extended
404 on address page	Prioritized	Defined	\N	\N	Shopping Team	Iteration 3	R1	2	Major Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	7	Extended
Unable to check status of archived orders	Accepted	Completed	dudley@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	8	Extended
Unable to open an order from history	In Dev	In-Progress	daniel@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	9	Extended
Found an error when I tried to access my shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	I was taken to the checkout screen prematurely	\N	\N	10	Extended
Problem with User Authentication	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Major Problem	Open	Production	Resolve Immediately	FALSE	None	FALSE	\N	More than one customer is reporting that they are being logged off of the system	\N	\N	11	Extended
BZ: Could not login to app	Prioritized	Defined	\N	\N	Shopping Team	Iteration 7	R2	5	Major Problem	Open	Staging	High Attention	FALSE	None	FALSE	\N	Customer could not login.	\N	\N	12	Extended
Application displays individual shipping costs but total is unchanged	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	The individual estimated shipping costs for each package/destination are displayed, but the Total field only displays the shipping cost for the first destination in the list.&nbsp; Also, once a customer checks out, the total for the entire order only reflects shipping for one destination.	\N	\N	13	Extended
Tax totals for split shipping not calculated properly	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	1	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	14	Extended
UI for split - need more separation on order sections	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	15	Extended
Click on split shipping - nothing displays	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Major Problem	Closed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	16	Extended
Priority shipping options not appearing for multiple destinations	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Having a shopping cart that contained 2 items, I chose to ship the items to two different destinations.&nbsp; The individual destination buckets appeared appropriately, however there were no visible priority shipping options for either destination.	\N	\N	17	Extended
No warning when MAX destinations has been reached	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Once a customer has elected to ship items to the maximum number of different destinations, the add destination button is disabled, but no warning is displayed explaining why.	\N	\N	18	Extended
Too many digits appearing for updated shipping cost	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Total shipping cost should be displayed as '$XXX.XX', but currently the total has 5 digits after the decimal ($23.78352).	\N	\N	19	Extended
Package Tracking Notifications are broken	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	Only one tracking notification is being sent to the customer when they have packages being shipped to multiple destinations.&nbsp; The system should send an email for packages being sent to each destination.	\N	\N	20	Extended
Default selection is Express	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	The default selection for priority shipping is currently Express, it should instead be Ground.	\N	\N	21	Extended
Payment by e-Check failing on submit	\N	Defined	\N	\N	Payment Team	\N	\N	1	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Error message indicating 'Gateway 502' problem.	\N	\N	22	Extended
No warning when 18digits given for credit card	Prioritized	Defined	\N	\N	Payment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Able to add 1 extra digit to credit card input box	\N	\N	23	Extended
Browser shows non-validated security key on payment form page	Prioritized	Defined	\N	\N	Payment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Browser prompts to confirm security exception.	\N	\N	24	Extended
Only one selected item is being added to the cart	Prioritized	Defined	daniel@acme.com	Purchase Your Items	Shopping Team	Iteration 6	R2	3	Minor Problem	Open	Development	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Logged in as a customer</li><li>Selected multiple items to add to cart at once</li><li>Clicked 'Add to Cart'</li><li>Clicked 'View My Cart'</li><li>Only the first item chosen was actually added to the cart<br /></li></ul>	\N	\N	25	Extended
Recurring 'No Address' Warning	Ready for Acceptance	Completed	\N	\N	Shopping Team	\N	\N	3	Minor Problem	Fixed	Staging	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Created a new account, but didn't enter an address</li><li>Logged in as the new user, system displayed a message asking for address information</li><li>Enter a valid address and click save</li><li>For every following action within the same shopping session, the system warned that no address information had been entered, even though it was still saved and visible<br /></li></ul>	\N	\N	26	Extended
Production Defect in accessing shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	Error 404 - Not Found when trying to navigate to the shopping cart.	\N	\N	27	Extended
State drop down doesn't contain any items	Prioritized	Defined	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Development	High Attention	FALSE	None	FALSE	\N	The customer should enter the following shipping information:<br /><br /> <ul><li>Name</li><li>Address</li><li>City</li><li>State (drop down)</li><li>Country (drop down)</li><li>Zip/Country Code</li></ul>	\N	\N	28	Extended
Code verification completely broken!	\N	Defined	\N	\N	Shopping Team	\N	\N	3	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	The application accepts any 6 character long string as a valid promotional code and applies the maximum discount to the order!<br /><br />Steps:<br /> <ul><li>Logged in as a customer, choose a few items to purchase</li><li>Enter an invalid promotional code (of correct length) in the editable field</li><li>Click update</li><li>Maximum discount is applied to the order</li></ul>This occurs for any codes entered that contain 6 characters.	\N	\N	29	Extended
(Auto) Fitnesse Test Failed for GUI - Checkout Button	\N	Defined	daniel@acme.com	Purchase Your Items	Shopping Team	\N	\N	1	Major Problem	Open	Development	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	30	Extended
latest Promo Code is invalid.	Prioritized	Defined	diane@acme.com	\N	Shopping Team	Iteration 6	R2	\N	Cosmetic	Open	Development	Low	FALSE	None	FALSE	\N	On the payment screen, the Promo Code field label formatting is incorrect.&nbsp; Currently it is bold and italic, thought it should just be bold to match the rest of the field labels.<br /><br /><i><b>Promo Code</b></i> -&gt; <b>Promo Code</b>	\N	\N	31	Extended
(Auto) Fitnesse Test Failed for Calculations	Prioritized	Defined	daniel@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	32	Extended
Weird formatting -> Totals GUI	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Cosmetic	Submitted	Staging	Low	FALSE	None	FALSE	\N	The formatting for the totals/costs GUI is distorted.&nbsp; The total cost field is appearing on the very left side of the browser, when it should be beneath all of the other calculation fields on the right side of the browser.	\N	\N	33	Extended
Unable to login after entering reset password	Prioritized	Defined	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	34	Extended
User's password shown in plain text in recovery email	Prioritized	Defined	diane@acme.com	\N	Shopping Team	Iteration 5	R2	3	Major Problem	Open	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	35	Extended
Button color on checkout page does not match blue hue per design specs	Prioritized	Defined	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Cosmetic	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	36	Extended
Old font found on contact us page	Prioritized	Defined	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	37	Extended
Unable to login after entering invalid password	Prioritized	Defined	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	38	Extended
"Remember me" cookie not working	Prioritized	Defined	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	2	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	39	Extended
Monthly product re-order is duplicating items	Prioritized	Defined	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	1	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	40	Extended
Unable to check status of past orders	Prioritized	Defined	diane@acme.com	\N	Fulfillment Team	Iteration 2	R1	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	41	Extended
Unable to undelete an order from history	Prioritized	Defined	diane@acme.com	\N	Shopping Team	Iteration 10	R3	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	42	Extended
302 response code on /api page	Prioritized	Defined	dora@acme.com	\N	API Team	Iteration 6	R2	5	Major Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	43	Extended
Unable to connect to staging server with 'v2.0' string	Prioritized	Defined	dora@acme.com	\N	API Team	Iteration 6	R2	3	Minor Problem	Open	Staging	Normal	FALSE	None	FALSE	\N	\N	\N	\N	44	Extended
CCV codes not being verified on checkout path	Prioritized	Defined	dave@acme.com	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	45	Extended
Mastercard not showing in valid CC dropdown list on checkout path	Prioritized	Defined	\N	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	46	Extended
Unable to login after entering 3 security questions correctly	Prioritized	Defined	dudley@acme.com	\N	Shopping Team	Iteration 10	R3	3	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	47	Extended
State drop down is missing all two word states.	Prioritized	Defined	dudley@acme.com	\N	Shopping Team	Iteration 2	R1	3	Major Problem	Open	Development	High Attention	FALSE	None	FALSE	\N	The customer should enter the following shipping information:<br /><br /> <ul><li>Name</li><li>Address</li><li>City</li><li>State (drop down)</li><li>Country (drop down)</li><li>Zip/Country Code</li></ul>	\N	\N	48	Extended
Re-order invalidated promo code	Prioritized	Defined	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	1	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	49	Extended
\.


--
-- Data for Name: feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY feature (name, investmentcategory, project, owner, parent, release, plannedstartdate, plannedenddate, description, displaycolor, notes, ready, riskscore, valuescore, preliminaryestimate, state, listing_order, dataset, timecriticality, rroevalue, jobsize, refinedestimate) FROM stdin;
Provide link to twitter so users can tweet about products they are researching.	Short Term Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-05-23 10:59:00	2019-06-15 10:59:00	\N	#efab00	\N	FALSE	3	3	M	Discover	31	Standard	\N	\N	\N	\N
Product Listings	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2019-08-10 10:59:00	2019-09-04 10:59:00	\N	#4286f4	\N	FALSE	7	10	M	Propose	25	Standard	\N	\N	\N	\N
Backorder fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Summer	\N	\N	\N	\N
 ========^^^^ R3 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	Color Coded	\N	\N	\N	\N
Credit card error messaging	None	Payment Team	patricia@acme.com	Minimal online shopping site	R3	\N	\N	\N	#4286f4	\N	FALSE	5	5	S	Propose	24	Color Coded	\N	\N	\N	\N
Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2019-05-24 09:48:00	2019-07-18 09:48:00	\N	\N	\N	FALSE	\N	9	M	Develop	\N	Summer	\N	\N	\N	\N
 ========^^^^ UNSCHED ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100	Extended	\N	\N	\N	\N
Refund management	Short Term Growth	Fulfillment Team	pam@acme.com	Modernize customer service portal	R2	2019-07-25 00:00:00	2019-08-25 00:00:00	see business case attached	#4a1d7e	\N	FALSE	3	6	M	Develop	28	Extended	\N	\N	\N	60
Auto social links	Short Term Growth	Shopping Team	peter@acme.com	Build read-write API for handling orders	R2	2019-11-12 00:00:00	2020-01-29 00:00:00	\N	#21a2e0	\N	FALSE	3	3	M	Discover	29	Extended	\N	\N	\N	70
 ========^^^^ R2 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	40	Extended	\N	\N	\N	\N
Backorder fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	#4286f4	\N	\N	\N	\N	\N	\N	37	Color Coded	\N	\N	\N	\N
Rearchitect User Management	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2019-08-03 00:00:00	2019-09-03 00:00:00	\N	#4a1d7e	\N	FALSE	4	5	S	Discover	22	Extended	\N	\N	\N	35
 ========^^^^ R3 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Summer	\N	\N	\N	\N
Purchase confirmation settings in profile	Strategic Growth	Shopping Team	peter@acme.com	MV mobile online shopping site	R4	2019-11-11 00:00:00	2020-02-04 00:00:00	\N	#21a2e0	\N	FALSE	4	3	XL	Done	66	Extended	\N	\N	\N	\N
Knowledgebase	Short Term Growth	Fulfillment Team	pam@acme.com	Integrate into Facebook as Knowledge base	R1	2019-05-30 00:00:00	2019-06-27 00:00:00	\N	#fce205	\N	FALSE	6	1	L	Done	7	Extended	\N	\N	\N	65
Duplcate order fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	#4286f4	\N	\N	\N	\N	L	Discover	38	Color Coded	\N	\N	\N	\N
 ========^^^^ R2 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Summer	\N	\N	\N	\N
Product Listings	Short Term Growth	Shopping Team	peter@acme.com	Re-build primary web app leverage API technology	R3	2019-10-10 00:00:00	2019-11-04 00:00:00	\N	#ee6c19	\N	FALSE	7	10	M	Propose	44	Extended	\N	\N	\N	\N
Implement Fraud Detection	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R3	2019-07-23 10:59:00	2019-08-29 10:59:00	see business case attached	#4286f4	\N	FALSE	5	6	XL	Develop	28	Color Coded	\N	\N	\N	\N
 ========^^^^ R2 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21	Standard	\N	\N	\N	\N
Credit refunds to new purchases	Short Term Growth	Fulfillment Team	pam@acme.com	MV mobile online shopping site	R4	2019-11-14 00:00:00	2019-12-15 00:00:00	see business case attached	#21a2e0	\N	FALSE	3	6	M	Develop	79	Extended	\N	\N	\N	\N
Rearchitect User Management	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2019-06-11 09:48:00	2019-07-12 09:48:00	\N	\N	\N	FALSE	\N	5	S	Discover	\N	Summer	\N	\N	\N	\N
Implement Open API	Strategic Growth	API Team	aaron@acme.com	Ensure Agility Redefine how work is planned, achieve speed to value	R4	\N	\N	\N	#105cab	\N	FALSE	5	1	L	Propose	80	Extended	\N	\N	\N	\N
Sell by rankings	None	Fulfillment Team	pam@acme.com	MV mobile online shopping site	\N	\N	\N	\N	#21a2e0	\N	\N	\N	\N	\N	\N	92	Extended	\N	\N	\N	\N
Product Listings	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2019-08-10 10:59:00	2019-09-04 10:59:00	\N	#4286f4	\N	FALSE	7	10	M	Propose	25	Color Coded	\N	\N	\N	\N
Identify and auto notify duplicate orders	None	Fulfillment Team	pam@acme.com	MV mobile online shopping site	\N	\N	\N	\N	#21a2e0	\N	\N	\N	\N	L	Discover	93	Extended	\N	\N	\N	\N
Realtime chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R3	2019-09-13 00:00:00	2019-10-23 00:00:00	\N	#4a1d7e	\N	FALSE	3	5	S	Discover	45	Extended	\N	\N	\N	\N
Support cash/check by mail	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	#4286f4	\N	FALSE	5	6	\N	Propose	36	Standard	\N	\N	\N	\N
Product purchase confirmation	Strategic Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-03-27 10:59:00	2019-05-06 10:59:00	\N	#4286f4	\N	FALSE	4	3	XL	Done	47	Standard	\N	\N	\N	\N
Online refunds	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-05-16 10:59:00	2019-06-25 10:59:00	see business case attached	#4286f4	\N	FALSE	6	6	M	Develop	17	Standard	\N	\N	\N	\N
Creation of cart	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-05-31 10:59:00	2019-07-10 10:59:00	\N	#e7f298	\N	FALSE	1	0	M	Develop	14	Color Coded	\N	\N	\N	\N
User Profile	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2019-07-11 10:59:00	2019-08-05 10:59:00	\N	#4286f4	\N	FALSE	2	7	M	Discover	23	Standard	\N	\N	\N	\N
Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2019-07-16 00:00:00	2019-09-09 00:00:00	\N	#df1a7b	\N	FALSE	1	9	M	Develop	17	Extended	\N	\N	\N	55
Shopping history	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R2	2019-05-16 10:59:00	2019-07-07 10:59:00	\N	#e7f298	\N	FALSE	4	0	L	Develop	16	Color Coded	\N	\N	\N	\N
Order Status 2.0	Strategic Growth	Shopping Team	peter@acme.com	Modernize customer service portal	R2	2019-05-22 10:59:00	2019-06-25 10:59:00	\N	#df1a7b	\N	FALSE	4	7	M	Develop	12	Color Coded	\N	\N	\N	\N
Online refunds	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-05-16 10:59:00	2019-06-25 10:59:00	see business case attached	#4286f4	\N	FALSE	6	6	M	Develop	17	Color Coded	\N	\N	\N	\N
Credit card payments	Cost Savings	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-05-25 10:59:00	2019-07-01 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	L	Validate	9	Color Coded	\N	\N	\N	\N
Support portal on web	Strategic Growth	API Team	aaron@acme.com	Provide customer service portal for pickup	R4	2019-11-08 00:00:00	2019-12-18 00:00:00	\N	#df1a7b	\N	FALSE	3	5	S	Discover	82	Extended	\N	\N	\N	\N
Provide link to twitter so users can tweet about products they are researching.	Short Term Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-05-23 10:59:00	2019-06-15 10:59:00	\N	#efab00	\N	FALSE	3	3	M	Discover	31	Color Coded	\N	\N	\N	\N
Order history available	Strategic Growth	Fulfillment Team	pam@acme.com	Build location awareness for handling orders	R4	2019-11-11 00:00:00	2020-02-04 00:00:00	\N	#4a1d7e	\N	FALSE	3	4	M	Done	69	Extended	\N	\N	\N	\N
Priority shipping	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2019-06-08 09:48:00	2019-07-06 09:48:00	\N	\N	\N	FALSE	2	5	L	Develop	\N	Summer	5	2	3	\N
Special Offers	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-06-09 10:59:00	2019-07-07 10:59:00	\N	#e7f298	\N	FALSE	3	14	M	Develop	15	Standard	\N	\N	\N	\N
Track orders returned for credit	Strategic Growth	Fulfillment Team	pam@acme.com	MV mobile online shopping site	R4	2019-11-11 00:00:00	2020-02-04 00:00:00	\N	#21a2e0	\N	\N	\N	\N	\N	Develop	67	Extended	\N	\N	\N	\N
Product suggestion settings	Strategic Growth	Fulfillment Team	peter@acme.com	Innovate social selling, buying, rating systems	R3	2019-08-26 00:00:00	2019-12-30 00:00:00	\N	\N	\N	FALSE	1	5	S	Discover	60	Extended	\N	\N	\N	\N
Special Offers	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-08-09 00:00:00	2019-09-06 00:00:00	\N	#107c1e	\N	FALSE	3	14	M	Develop	24	Extended	\N	\N	\N	45
Support ability to attach case and email notification	Cost Savings	API Team	aaron@acme.com	Innovate and develop purchasing system	R3	2019-11-11 00:00:00	2019-12-18 00:00:00	\N	#ee6c19	\N	FALSE	12	4	M	Develop	54	Extended	\N	\N	\N	\N
Product purchase confirmation	Strategic Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-03-27 10:59:00	2019-05-06 10:59:00	\N	#4286f4	\N	FALSE	4	3	XL	Done	47	Color Coded	\N	\N	\N	\N
Product Listings	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2019-08-18 09:48:00	2019-09-12 09:48:00	\N	\N	\N	FALSE	0	10	M	Propose	\N	Summer	3	8	1	\N
Creation of cart	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-05-31 10:59:00	2019-07-10 10:59:00	\N	#e7f298	\N	FALSE	1	0	M	Develop	14	Standard	\N	\N	\N	\N
Support cash/check by mail	None	Payment Team	patricia@acme.com	Minimal online shopping site	R3	\N	\N	see business case attached	#105cab	\N	FALSE	5	6	\N	Propose	50	Extended	\N	\N	\N	\N
Add additional chat platforms	Strategic Growth	Fulfillment Team	aaron@acme.com	Provide customer service portal for pickup	R3	2019-11-08 00:00:00	2019-12-18 00:00:00	\N	#df1a7b	\N	FALSE	5	3	M	Develop	56	Extended	\N	\N	\N	\N
Shopping preferences	Strategic Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	\N	2019-07-25 00:00:00	2019-09-09 00:00:00	\N	#107c1e	\N	FALSE	5	0	L	Develop	30	Extended	\N	\N	\N	85
Allow users to dissassociate suggestions	Short Term Growth	Payment Team	patricia@acme.com	MV mobile online shopping site	R3	2019-11-05 00:00:00	2019-12-15 00:00:00	see business case attached	#21a2e0	\N	FALSE	6	6	M	Develop	59	Extended	\N	\N	\N	\N
AnyMethod payments	Cost Savings	Payment Team	patricia@acme.com	MV mobile online shopping site	R4	2019-11-14 00:00:00	2019-12-21 00:00:00	see business case attached	#21a2e0	\N	FALSE	3	6	L	Validate	72	Extended	\N	\N	\N	\N
Homepage	Cost Savings	Payment Team	peter@acme.com	Integrate in-store and online experience	R1	2019-06-20 00:00:00	2019-07-15 00:00:00	\N	#f9a814	\N	FALSE	5	7	L	Internal Release	8	Extended	\N	\N	\N	70
Cross sell related products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-06-19 10:59:00	2019-07-03 10:59:00	\N	#efab00	\N	FALSE	6	3	M	Propose	33	Color Coded	\N	\N	\N	\N
Realtime chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R3	2019-07-22 09:48:00	2019-08-31 09:48:00	\N	\N	\N	FALSE	\N	5	S	Discover	\N	Summer	\N	\N	\N	\N
Outbound SMS messages for support case updates	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2019-05-25 10:59:00	2019-06-10 10:59:00	\N	#105cab	\N	FALSE	3	5	M	Develop	8	Color Coded	\N	\N	\N	\N
Support write API	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R1	2019-05-24 00:00:00	2019-06-27 00:00:00	\N	#4a1d7e	\N	FALSE	2	0	S	Develop	2	Extended	\N	\N	\N	35
Order Status 4.0	Strategic Growth	Shopping Team	peter@acme.com	Provide customer service portal for pickup	R4	2019-11-11 00:00:00	2019-12-15 00:00:00	\N	#df1a7b	\N	FALSE	4	7	M	Develop	75	Extended	\N	\N	\N	\N
Rearchitect User Management	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2019-06-03 10:59:00	2019-07-04 10:59:00	\N	#df1a7b	\N	FALSE	4	5	S	Discover	13	Standard	\N	\N	\N	\N
Cross sell related products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-06-27 09:48:00	2019-07-11 09:48:00	\N	\N	\N	FALSE	\N	3	M	Propose	\N	Summer	\N	\N	\N	\N
API for Shipping	Strategic Growth	API Team	aaron@acme.com	Create a read-only API	R3	\N	\N	\N	#c6b893	\N	FALSE	5	1	L	Propose	22	Color Coded	\N	\N	\N	\N
Realtime chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R3	2019-07-14 10:59:00	2019-08-23 10:59:00	\N	#df1a7b	\N	FALSE	3	5	S	Discover	26	Standard	\N	\N	\N	\N
Allow users to reset purchase history	Strategic Growth	Fulfillment Team	pam@acme.com	Build location awareness for handling orders	R3	2019-11-05 00:00:00	2019-12-27 00:00:00	\N	#4a1d7e	\N	FALSE	4	0	L	Develop	58	Extended	\N	\N	\N	\N
Search for products	Short Term Growth	Payment Team	peter@acme.com	Minimal online shopping site	R1	2019-06-14 00:00:00	2019-06-27 00:00:00	\N	#105cab	\N	FALSE	0	5	XS	Open Beta	11	Extended	\N	\N	\N	15
Login with text codes	Strategic Growth	API Team	aaron@acme.com	Embed Security designed from the outside it.	\N	2019-11-05 00:00:00	2019-12-23 00:00:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#107c1e	\N	FALSE	1	8	L	Discover	88	Extended	\N	\N	\N	\N
Security layer for read-write API	None	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2019-06-23 09:48:00	2019-07-11 09:48:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	\N	8	S	Discover	\N	Summer	\N	\N	\N	\N
Online chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2019-05-27 09:48:00	2019-07-06 09:48:00	\N	\N	\N	FALSE	\N	3	M	Develop	\N	Summer	\N	\N	\N	\N
Users get authentication codes for API	None	API Team	aaron@acme.com	Embed Security designed from the outside it.	R4	2019-12-05 00:00:00	2019-12-23 00:00:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#107c1e	\N	FALSE	1	8	S	Discover	85	Extended	\N	\N	\N	\N
Error checking of profiles	Strategic Growth	API Team	peter@acme.com	Build read-write API for handling orders	R2	2019-08-19 00:00:00	2019-12-30 00:00:00	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Allow 3rd party integrators to access our data.</span>	#21a2e0	\N	FALSE	3	3	L	Discover	34	Extended	\N	\N	\N	\N
Security layer for read-write API	None	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2019-06-15 10:59:00	2019-07-03 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	S	Discover	42	Color Coded	\N	\N	\N	\N
Shopping preferences	Strategic Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-05-25 10:59:00	2019-07-10 10:59:00	\N	#e7f298	\N	FALSE	5	0	L	Develop	27	Color Coded	\N	\N	\N	\N
Single product purchase click	Short Term Growth	Shopping Team	peter@acme.com	MV mobile online shopping site	R4	2019-11-05 00:00:00	2020-01-29 00:00:00	\N	#21a2e0	\N	FALSE	13	10	M	Open Beta	63	Extended	\N	\N	\N	\N
User Profile	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2019-07-11 10:59:00	2019-08-05 10:59:00	\N	#4286f4	\N	FALSE	2	7	M	Discover	23	Color Coded	\N	\N	\N	\N
Order history API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2019-05-30 10:59:00	2019-06-26 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	M	Discover	41	Color Coded	\N	\N	\N	\N
Purchase single product	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-03-29 09:48:00	2019-05-08 09:48:00	\N	\N	\N	FALSE	\N	10	M	Open Beta	\N	Summer	\N	\N	\N	\N
Archive packing slips	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R1	2019-04-04 09:48:00	2019-05-14 09:48:00	\N	\N	\N	FALSE	\N	4	M	Done	\N	Summer	\N	\N	\N	\N
Order purchase API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2019-05-16 10:59:00	2019-07-03 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	L	Discover	40	Standard	\N	\N	\N	\N
Online refunds	Short Term Growth	Fulfillment Team	patricia@acme.com	Modernize customer service portal	R2	2019-07-16 00:00:00	2019-08-25 00:00:00	see business case attached	#4a1d7e	\N	FALSE	6	6	M	Develop	25	Extended	\N	\N	\N	50
API for Shipping	Strategic Growth	API Team	aaron@acme.com	Create a read-only API	R3	\N	\N	\N	#c6b893	\N	FALSE	5	1	L	Propose	22	Standard	\N	\N	\N	\N
Order Status 2.0	Strategic Growth	Shopping Team	peter@acme.com	Modernize customer service portal	R2	2019-05-22 10:59:00	2019-06-25 10:59:00	\N	#df1a7b	\N	FALSE	4	7	M	Develop	12	Standard	\N	\N	\N	\N
Search based on profile attributes	Short Term Growth	Shopping Team	peter@acme.com	MV mobile online shopping site	R4	2019-11-29 00:00:00	2020-01-26 00:00:00	\N	#21a2e0	\N	FALSE	0	5	M	Open Beta	68	Extended	\N	\N	\N	\N
Toms Test	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-04-20 10:59:00	2019-05-15 10:59:00	\N	#4286f4	\N	FALSE	5	7	L	Internal Release	46	Color Coded	\N	\N	\N	\N
Build "As-U-Shop" cart	Short Term Growth	Shopping Team	peter@acme.com	Build location awareness for handling orders	\N	2019-11-20 00:00:00	2019-12-30 00:00:00	\N	#4a1d7e	\N	FALSE	1	0	M	Develop	95	Extended	\N	\N	\N	\N
Support write API	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2019-05-19 10:59:00	2019-06-22 10:59:00	\N	#df1a7b	\N	FALSE	2	0	S	Develop	2	Standard	\N	\N	\N	\N
Integrate User Management with Profile Management	Strategic Growth	API Team	aaron@acme.com	Provide customer service portal for pickup	R4	2019-11-23 00:00:00	2019-12-24 00:00:00	\N	#df1a7b	\N	FALSE	4	5	S	Discover	76	Extended	\N	\N	\N	\N
Security layer for read-write API	None	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2019-06-15 10:59:00	2019-07-03 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	S	Discover	42	Standard	\N	\N	\N	\N
Credit card processing with realtime feedback	None	Payment Team	patricia@acme.com	MV mobile online shopping site	R4	\N	\N	\N	#21a2e0	\N	FALSE	5	5	S	Propose	81	Extended	\N	\N	\N	\N
API for Shipping	Strategic Growth	API Team	aaron@acme.com	Create a read-only API	R3	\N	\N	\N	\N	\N	FALSE	\N	1	L	Propose	\N	Summer	\N	\N	\N	\N
Knowledgebase	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2019-04-07 09:48:00	2019-05-05 09:48:00	\N	\N	\N	FALSE	1	1	L	Done	\N	Summer	2	2	5	\N
Allow customization of Profiles	Short Term Growth	Shopping Team	peter@acme.com	MV mobile online shopping site	\N	2019-11-05 00:00:00	2019-11-30 00:00:00	\N	#21a2e0	\N	FALSE	2	7	M	Discover	94	Extended	\N	\N	\N	\N
Integrate with WePay	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-05-28 10:59:00	2019-07-10 10:59:00	see business case attached	#4286f4	\N	FALSE	6	6	M	Develop	19	Standard	\N	\N	\N	\N
API for Shipping	Strategic Growth	API Team	aaron@acme.com	Create a read-only API	R3	\N	\N	\N	\N	\N	FALSE	5	1	L	Propose	41	Extended	\N	\N	\N	\N
Realtime notifications	Strategic Growth	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2019-06-19 10:59:00	2019-07-10 10:59:00	All users should be able to easily login, logout, and safely store their relevant information with us<br /><br />Acceptance Criteria <ul> <li>Login requires username in email format and password</li> <li>One-click logout</li> <li>Logout provides link to login again</li> <li><b>Non-functional: https data transfer</b></li> <li><b>Non-functional: passwords stored encrypted in database</b></li> </ul>	#efab00	\N	FALSE	6	20	L	Develop	6	Color Coded	\N	\N	\N	\N
Realtime notifications	Strategic Growth	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2019-06-19 10:59:00	2019-07-10 10:59:00	All users should be able to easily login, logout, and safely store their relevant information with us<br /><br />Acceptance Criteria <ul> <li>Login requires username in email format and password</li> <li>One-click logout</li> <li>Logout provides link to login again</li> <li><b>Non-functional: https data transfer</b></li> <li><b>Non-functional: passwords stored encrypted in database</b></li> </ul>	#efab00	\N	FALSE	6	20	L	Develop	6	Standard	\N	\N	\N	\N
Integrate with coupon.com site to match *popular* items in shopping cart	Cost Savings	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2019-05-24 09:48:00	2019-06-27 09:48:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	2	8	L	Discover	\N	Summer	1	1	1	\N
Suggest products purchased by friends	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-06-26 10:59:00	2019-07-10 10:59:00	\N	#efab00	\N	FALSE	1	5	XL	Discover	32	Color Coded	\N	\N	\N	\N
Outbound SMS messages for support case updates	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	\N	2019-07-25 00:00:00	2019-08-10 00:00:00	\N	#df1a7b	\N	FALSE	3	5	M	Develop	18	Extended	\N	\N	\N	\N
Add web services for API write and delete	Strategic Growth	API Team	aaron@acme.com	Provide customer service portal for pickup	R3	2019-11-08 00:00:00	2019-12-12 00:00:00	\N	#df1a7b	\N	FALSE	2	0	S	Develop	53	Extended	\N	\N	\N	\N
Implement Fraud Detection	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R3	2019-07-23 10:59:00	2019-08-29 10:59:00	see business case attached	#4286f4	\N	FALSE	5	6	XL	Develop	28	Standard	\N	\N	\N	\N
Search for products	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-04-14 10:59:00	2019-04-27 10:59:00	\N	#4286f4	\N	FALSE	0	5	M	Open Beta	49	Standard	\N	\N	\N	\N
Realtime chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R3	2019-07-14 10:59:00	2019-08-23 10:59:00	\N	#df1a7b	\N	FALSE	3	5	S	Discover	26	Color Coded	\N	\N	\N	\N
Integrate with Amex Gateway	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	\N	\N	FALSE	\N	6	XL	Discover	\N	Summer	\N	\N	\N	\N
Support cash/check by mail	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	#4286f4	\N	FALSE	5	6	\N	Propose	36	Color Coded	\N	\N	\N	\N
Credit card error messaging	None	Payment Team	patricia@acme.com	Minimal online shopping site	R3	\N	\N	\N	\N	\N	FALSE	\N	5	S	Propose	\N	Summer	\N	\N	\N	\N
Shopping history	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R2	2019-05-16 10:59:00	2019-07-07 10:59:00	\N	#e7f298	\N	FALSE	4	0	L	Develop	16	Standard	\N	\N	\N	\N
Cross sell related products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-06-19 10:59:00	2019-07-03 10:59:00	\N	#efab00	\N	FALSE	6	3	M	Propose	33	Standard	\N	\N	\N	\N
Integrate with coupon.com site to match *popular* items in shopping cart	Cost Savings	Payment Team	aaron@acme.com	Integrate social into shopping experience	R2	2019-07-16 00:00:00	2019-08-19 00:00:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#848689	\N	FALSE	1	8	XS	Discover	37	Extended	\N	\N	\N	\N
Integrate with WePay	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-05-28 10:59:00	2019-07-10 10:59:00	see business case attached	#4286f4	\N	FALSE	6	6	M	Develop	19	Color Coded	\N	\N	\N	\N
Simplify special orders	Short Term Growth	Shopping Team	peter@acme.com	Build location awareness for handling orders	\N	2019-11-29 00:00:00	2019-12-27 00:00:00	\N	#4a1d7e	\N	FALSE	3	14	M	Develop	96	Extended	\N	\N	\N	\N
Purchase single product	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-05-21 00:00:00	2019-06-30 00:00:00	\N	#105cab	\N	FALSE	13	10	M	Open Beta	6	Extended	\N	\N	\N	55
Order history API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2019-05-30 10:59:00	2019-06-26 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	M	Discover	41	Standard	\N	\N	\N	\N
Credit card error messaging	None	Payment Team	patricia@acme.com	Maintain legacy purchasing system	R3	\N	\N	\N	#df1a7b	\N	FALSE	5	5	S	Propose	43	Extended	\N	\N	\N	\N
Allow user to vote on products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-05-30 10:59:00	2019-06-15 10:59:00	\N	#efab00	\N	FALSE	2	4	L	Discover	34	Color Coded	\N	\N	\N	\N
Provide re-purchase options	Cost Savings	API Team	aaron@acme.com	Innovate social selling, buying, rating systems	\N	2019-11-05 00:00:00	2019-12-09 00:00:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	1	8	L	Discover	87	Extended	\N	\N	\N	\N
Integrate with coupon.com site to match *popular* items in shopping cart	Cost Savings	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2019-05-16 10:59:00	2019-06-19 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#efab00	\N	FALSE	1	8	L	Discover	39	Standard	\N	\N	\N	\N
Integrate with WePay	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-06-05 09:48:00	2019-07-18 09:48:00	see business case attached	\N	\N	FALSE	\N	6	M	Develop	\N	Summer	\N	\N	\N	\N
Eliminate batch process to notification	Strategic Growth	API Team	aaron@acme.com	Innovate social selling, buying, rating systems	R3	2019-08-19 00:00:00	2019-12-30 00:00:00	All users should be able to easily login, logout, and safely store their relevant information with us<br /><br />Acceptance Criteria <ul> <li>Login requires username in email format and password</li> <li>One-click logout</li> <li>Logout provides link to login again</li> <li><b>Non-functional: https data transfer</b></li> <li><b>Non-functional: passwords stored encrypted in database</b></li> </ul>	\N	\N	FALSE	6	20	L	Develop	57	Extended	\N	\N	\N	\N
Integrate with Paypal	Short Term Growth	Payment Team	patricia@acme.com	Re-build primary web app leverage API technology	R2	2019-07-25 00:00:00	2019-08-25 00:00:00	see business case attached	#ee6c19	\N	FALSE	3	6	M	Develop	26	Extended	\N	\N	\N	45
Suggest products purchased by friends	Strategic Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2019-08-26 00:00:00	2019-09-09 00:00:00	\N	#105cab	\N	FALSE	1	5	S	Discover	33	Extended	\N	\N	\N	\N
Order purchase API	Strategic Growth	API Team	aaron@acme.com	Minimal online shopping site	R2	2019-07-16 00:00:00	2019-09-02 00:00:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#105cab	\N	FALSE	1	8	L	Discover	38	Extended	\N	\N	\N	\N
Returned shipments	Strategic Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2019-03-27 10:59:00	2019-05-06 10:59:00	\N	#4286f4	\N	\N	\N	\N	\N	Develop	48	Color Coded	\N	\N	\N	\N
Credit card payments	Cost Savings	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-06-02 09:48:00	2019-07-09 09:48:00	see business case attached	\N	\N	FALSE	3	6	L	Validate	\N	Summer	5	5	3	\N
Realtime notifications	Strategic Growth	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2019-06-27 09:48:00	2019-07-18 09:48:00	All users should be able to easily login, logout, and safely store their relevant information with us<br /><br />Acceptance Criteria <ul> <li>Login requires username in email format and password</li> <li>One-click logout</li> <li>Logout provides link to login again</li> <li><b>Non-functional: https data transfer</b></li> <li><b>Non-functional: passwords stored encrypted in database</b></li> </ul>	\N	\N	FALSE	\N	20	L	Develop	\N	Summer	\N	\N	\N	\N
Archive packing slips	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R1	2019-03-27 10:59:00	2019-05-06 10:59:00	\N	#e7f298	\N	FALSE	3	4	M	Done	50	Color Coded	\N	\N	\N	\N
Extended Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2019-05-30 09:48:00	2019-07-06 09:48:00	\N	\N	\N	FALSE	0	4	M	Develop	\N	Summer	13	13	2	\N
Refund management	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2019-05-25 10:59:00	2019-06-25 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	M	Develop	20	Standard	\N	\N	\N	\N
Integrate with coupon.com site to match *popular* items in shopping cart	Cost Savings	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2019-05-16 10:59:00	2019-06-19 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#efab00	\N	FALSE	1	8	L	Discover	39	Color Coded	\N	\N	\N	\N
Provide link to twitter so users can tweet about products they are researching.	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2019-07-23 00:00:00	2019-08-15 00:00:00	\N	#105cab	\N	FALSE	3	3	M	Discover	32	Extended	\N	\N	\N	\N
Shopping history	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R1	2019-05-21 00:00:00	2019-07-12 00:00:00	\N	#107c1e	\N	FALSE	4	0	L	Develop	14	Extended	\N	\N	\N	70
Shopping preferences	Strategic Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-06-02 09:48:00	2019-07-18 09:48:00	\N	\N	\N	FALSE	\N	0	L	Develop	\N	Summer	\N	\N	\N	\N
Integrate with WePay	Strategic Growth	Payment Team	patricia@acme.com	Re-build primary web app leverage API technology	R2	2019-07-25 00:00:00	2019-08-25 00:00:00	see business case attached	#ee6c19	\N	FALSE	6	6	M	Develop	27	Extended	\N	\N	\N	60
Allow user to vote on products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-06-07 09:48:00	2019-06-23 09:48:00	\N	\N	\N	FALSE	0	4	L	Discover	\N	Summer	1	1	1	\N
re-establish logins every 60 days	Strategic Growth	API Team	aaron@acme.com	Embed Security designed from the outside it.	R4	2019-11-19 00:00:00	2019-12-16 00:00:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#107c1e	\N	FALSE	1	8	M	Discover	84	Extended	\N	\N	\N	\N
Online refunds	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-05-24 09:48:00	2019-07-03 09:48:00	see business case attached	\N	\N	FALSE	\N	6	M	Develop	\N	Summer	\N	\N	\N	\N
Backorder fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	#4286f4	\N	\N	\N	\N	\N	\N	37	Standard	\N	\N	\N	\N
Support cash/check by mail	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	\N	\N	FALSE	\N	6	\N	Propose	\N	Summer	\N	\N	\N	\N
Extended Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2019-05-22 10:59:00	2019-06-28 10:59:00	\N	#105cab	\N	FALSE	12	4	M	Develop	3	Standard	\N	\N	\N	\N
Homepage	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-04-28 09:48:00	2019-05-23 09:48:00	\N	\N	\N	FALSE	\N	7	L	Internal Release	\N	Summer	\N	\N	\N	\N
Purchase single product	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-03-21 10:59:00	2019-04-30 10:59:00	\N	#4286f4	\N	FALSE	13	10	M	Open Beta	44	Standard	\N	\N	\N	\N
Search for products	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-04-22 09:48:00	2019-05-05 09:48:00	\N	\N	\N	FALSE	\N	5	M	Open Beta	\N	Summer	\N	\N	\N	\N
Backorder fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	\N	\N	\N	#105cab	\N	\N	\N	\N	\N	\N	36	Extended	\N	\N	\N	\N
Outbound SMS messages for support case updates	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2019-05-25 10:59:00	2019-06-10 10:59:00	\N	#105cab	\N	FALSE	3	5	M	Develop	8	Standard	\N	\N	\N	\N
Provide public API to support 3rd party integrations	Strategic Growth	API Team	peter@acme.com	Integrate social into shopping experience	R2	2019-06-27 09:48:00	2019-07-18 09:48:00	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Allow 3rd party integrators to access our data.</span>	\N	\N	FALSE	\N	3	L	Discover	\N	Summer	\N	\N	\N	\N
Allow users to save carts	Strategic Growth	Payment Team	patricia@acme.com	MV mobile online shopping site	R4	2019-11-14 00:00:00	2019-12-15 00:00:00	see business case attached	#21a2e0	\N	FALSE	6	6	M	Develop	78	Extended	\N	\N	\N	\N
Outbound SMS messages for support case updates	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2019-06-02 09:48:00	2019-06-18 09:48:00	\N	\N	\N	FALSE	3	5	M	Develop	\N	Summer	1	1	1	\N
Duplcate order fulfillment	None	Fulfillment Team	pam@acme.com	Build read-write API for handling orders	R1	\N	\N	\N	#21a2e0	\N	\N	\N	\N	\N	Discover	51	Extended	\N	\N	\N	\N
Render product images on mobile platforms	Short Term Growth	Payment Team	patricia@acme.com	MV mobile online shopping site	R4	2019-11-14 00:00:00	2019-12-15 00:00:00	see business case attached	#21a2e0	\N	FALSE	3	6	M	Develop	77	Extended	\N	\N	\N	\N
Realtime notifications	Strategic Growth	API Team	aaron@acme.com	Integrate social into shopping experience	\N	2019-08-19 00:00:00	2019-09-09 00:00:00	All users should be able to easily login, logout, and safely store their relevant information with us<br /><br />Acceptance Criteria <ul> <li>Login requires username in email format and password</li> <li>One-click logout</li> <li>Logout provides link to login again</li> <li><b>Non-functional: https data transfer</b></li> <li><b>Non-functional: passwords stored encrypted in database</b></li> </ul>	#848689	\N	FALSE	6	20	L	Develop	16	Extended	\N	\N	\N	75
Order purchase API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2019-05-16 10:59:00	2019-07-03 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	L	Discover	40	Color Coded	\N	\N	\N	\N
Priority shipping	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2019-05-31 10:59:00	2019-06-28 10:59:00	\N	#4286f4	\N	FALSE	7	5	L	Develop	11	Standard	\N	\N	\N	\N
Modify profile sharing with popular platforms	Maintenance	Shopping Team	peter@acme.com	Build location awareness for handling orders	R3	2019-11-11 00:00:00	2019-11-30 00:00:00	\N	#4a1d7e	\N	FALSE	2	0	M	Develop	55	Extended	\N	\N	\N	\N
Support write API	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2019-05-19 10:59:00	2019-06-22 10:59:00	\N	#df1a7b	\N	FALSE	2	0	S	Develop	2	Color Coded	\N	\N	\N	\N
Integrate with Amex Gateway	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	#4286f4	\N	FALSE	5	6	XL	Discover	35	Color Coded	\N	\N	\N	\N
Allow user to vote on products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-05-30 10:59:00	2019-06-15 10:59:00	\N	#efab00	\N	FALSE	2	4	L	Discover	34	Standard	\N	\N	\N	\N
Duplcate order fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	#4286f4	\N	\N	\N	\N	L	Discover	38	Standard	\N	\N	\N	\N
Order purchase API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2019-05-24 09:48:00	2019-07-11 09:48:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	\N	8	L	Discover	\N	Summer	\N	\N	\N	\N
Purchase path	Cost Savings	Shopping Team	peter@acme.com	Re-build primary web app leverage API technology	R2	2019-07-16 00:00:00	2019-09-03 00:00:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#ee6c19	\N	FALSE	8	8	L	Discover	20	Extended	\N	\N	\N	70
Allow user accounts to sell products	None	Payment Team	patricia@acme.com	MV mobile online shopping site	\N	\N	\N	see business case attached	#21a2e0	\N	FALSE	5	6	\N	Propose	91	Extended	\N	\N	\N	\N
Integrate with Amex Gateway	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	#4286f4	\N	FALSE	5	6	XL	Discover	35	Standard	\N	\N	\N	\N
Shopping Cart	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-06-05 00:00:00	2019-06-30 00:00:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#105cab	\N	FALSE	3	8	M	Develop	1	Extended	\N	\N	\N	55
Support write API	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2019-05-27 09:48:00	2019-06-30 09:48:00	\N	\N	\N	FALSE	0	0	S	Develop	\N	Summer	3	8	1	\N
Shopping preferences	Strategic Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-05-25 10:59:00	2019-07-10 10:59:00	\N	#e7f298	\N	FALSE	5	0	L	Develop	27	Standard	\N	\N	\N	\N
Identify other items to purchase	Cost Savings	Shopping Team	peter@acme.com	MV mobile online shopping site	R4	2019-11-05 00:00:00	2019-12-24 00:00:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#21a2e0	\N	FALSE	8	8	L	Discover	73	Extended	\N	\N	\N	\N
Security layer for read-write API	None	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2019-08-15 00:00:00	2019-09-02 00:00:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#21a2e0	\N	FALSE	1	8	S	Discover	39	Extended	\N	\N	\N	\N
Purchase path	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2019-05-24 09:48:00	2019-07-12 09:48:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	\N	\N	FALSE	\N	8	L	Discover	\N	Summer	\N	\N	\N	\N
Integrate with Paypal	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-05-25 10:59:00	2019-06-25 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	M	Develop	18	Color Coded	\N	\N	\N	\N
Open integration platform	None	Payment Team	patricia@acme.com	MV mobile online shopping site	\N	\N	\N	see business case attached	#21a2e0	\N	FALSE	5	6	XL	Discover	90	Extended	\N	\N	\N	\N
Wish list	Short Term Growth	Shopping Team	peter@acme.com	MV mobile online shopping site	\N	2019-12-05 00:00:00	2019-12-30 00:00:00	\N	#21a2e0	\N	FALSE	7	10	M	Propose	97	Extended	\N	\N	\N	\N
Order Status 2.0	Strategic Growth	Payment Team	peter@acme.com	Modernize customer service portal	R1	2019-05-27 00:00:00	2019-06-30 00:00:00	\N	#4a1d7e	\N	FALSE	4	7	M	Develop	13	Extended	\N	\N	\N	\N
Provide public API to support 3rd party integrations	Strategic Growth	API Team	peter@acme.com	Integrate social into shopping experience	R2	2019-08-19 00:00:00	2019-09-09 00:00:00	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Allow 3rd party integrators to access our data.</span>	#848689	\N	FALSE	3	3	L	Discover	31	Extended	\N	\N	\N	\N
Credit card payments	Cost Savings	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-05-25 10:59:00	2019-07-01 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	L	Validate	9	Standard	\N	\N	\N	\N
Duplcate order fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	\N	\N	\N	\N	\N	L	Discover	\N	Summer	\N	\N	\N	\N
Integrate with Paypal	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-05-25 10:59:00	2019-06-25 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	M	Develop	18	Standard	\N	\N	\N	\N
Provide link to twitter so users can tweet about products they are researching.	Short Term Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-05-31 09:48:00	2019-06-23 09:48:00	\N	\N	\N	FALSE	\N	3	M	Discover	\N	Summer	\N	\N	\N	\N
User Profile	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2019-07-19 09:48:00	2019-08-13 09:48:00	\N	\N	\N	FALSE	0	7	M	Discover	\N	Summer	1	8	3	\N
User Profile	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R3	2019-09-10 00:00:00	2019-10-05 00:00:00	\N	#107c1e	\N	FALSE	2	7	M	Discover	42	Extended	\N	\N	\N	\N
Extended Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Minimal online shopping site	R1	2019-05-27 00:00:00	2019-07-03 00:00:00	\N	#105cab	\N	FALSE	12	4	M	Develop	3	Extended	\N	\N	\N	45
Email integration (case, online chat, customer service)	Cost Savings	API Team	aaron@acme.com	Innovate and develop purchasing system	R4	2019-11-05 00:00:00	2019-12-30 00:00:00	\N	#ee6c19	\N	FALSE	1	9	M	Develop	70	Extended	\N	\N	\N	\N
Online chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R1	2019-05-24 00:00:00	2019-07-03 00:00:00	\N	#4a1d7e	\N	FALSE	5	3	M	Develop	5	Extended	\N	\N	\N	45
Returned shipments	Strategic Growth	Fulfillment Team	pam@acme.com	Integrate in-store and online experience	R1	2019-05-27 00:00:00	2019-07-06 00:00:00	\N	#f9a814	\N	FALSE	5	5	S	Develop	10	Extended	\N	\N	\N	30
Online chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2019-05-19 10:59:00	2019-06-28 10:59:00	\N	#df1a7b	\N	FALSE	5	3	M	Develop	5	Standard	\N	\N	\N	\N
 ========^^^^ R3 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	Standard	\N	\N	\N	\N
Shopping Cart	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2019-05-31 10:59:00	2019-06-25 10:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#4286f4	\N	FALSE	3	8	M	Develop	1	Standard	\N	\N	\N	\N
<hr style="height:10px;border:none;color:#ff0000;background-color:#ff0000;" />	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	99	Extended	\N	\N	\N	\N
Suggest products purchased by friends	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-06-26 10:59:00	2019-07-10 10:59:00	\N	#efab00	\N	FALSE	1	5	XL	Discover	32	Standard	\N	\N	\N	\N
 ========^^^^ R3 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	62	Extended	\N	\N	\N	\N
Archive packing slips	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R1	2019-05-27 00:00:00	2019-07-06 00:00:00	\N	#107c1e	\N	FALSE	3	4	S	Done	12	Extended	\N	\N	\N	35
Priority shipping	Short Term Growth	Fulfillment Team	pam@acme.com	Integrate in-store and online experience	R2	2019-07-31 00:00:00	2019-08-28 00:00:00	\N	#f9a814	\N	FALSE	7	5	L	Develop	21	Extended	\N	\N	\N	85
Support case support with text verification	Cost Savings	API Team	aaron@acme.com	Innovate and develop purchasing system	R4	2019-11-14 00:00:00	2019-11-30 00:00:00	\N	#ee6c19	\N	FALSE	3	5	M	Develop	71	Extended	\N	\N	\N	\N
Implement Fraud Detection	Strategic Growth	Payment Team	patricia@acme.com	Re-build primary web app leverage API technology	R3	2019-09-22 00:00:00	2019-10-29 00:00:00	see business case attached	#ee6c19	\N	FALSE	5	6	S	Develop	46	Extended	\N	\N	\N	\N
Revamp homepage to be mobile ready	Cost Savings	Shopping Team	peter@acme.com	MV mobile online shopping site	R4	2019-12-05 00:00:00	2020-02-13 00:00:00	\N	#21a2e0	\N	FALSE	5	7	L	Internal Release	65	Extended	\N	\N	\N	\N
Shopping history	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R2	2019-05-24 09:48:00	2019-07-15 09:48:00	\N	\N	\N	FALSE	\N	0	L	Develop	\N	Summer	\N	\N	\N	\N
Product purchase confirmation	Strategic Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-04-04 09:48:00	2019-05-14 09:48:00	\N	\N	\N	FALSE	\N	3	XL	Done	\N	Summer	\N	\N	\N	\N
Creation of cart	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-07-31 00:00:00	2019-09-09 00:00:00	\N	#107c1e	\N	FALSE	1	0	M	Develop	23	Extended	\N	\N	\N	55
Pickup at local depot	Strategic Growth	Payment Team	patricia@acme.com	MV mobile online shopping site	R4	2019-11-17 00:00:00	2019-12-24 00:00:00	see business case attached	#21a2e0	\N	FALSE	5	6	XL	Develop	83	Extended	\N	\N	\N	\N
Knowledgebase	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2019-03-30 10:59:00	2019-04-27 10:59:00	\N	#4286f4	\N	FALSE	6	1	L	Done	45	Color Coded	\N	\N	\N	\N
 ========^^^^ R2 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21	Color Coded	\N	\N	\N	\N
Shopping Cart	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2019-06-08 09:48:00	2019-07-03 09:48:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	\N	\N	FALSE	5	8	M	Develop	\N	Summer	13	3	3	\N
Refund management	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2019-05-25 10:59:00	2019-06-25 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	M	Develop	20	Color Coded	\N	\N	\N	\N
Search for products	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-04-14 10:59:00	2019-04-27 10:59:00	\N	#4286f4	\N	FALSE	0	5	M	Open Beta	49	Color Coded	\N	\N	\N	\N
Online chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2019-05-19 10:59:00	2019-06-28 10:59:00	\N	#df1a7b	\N	FALSE	5	3	M	Develop	5	Color Coded	\N	\N	\N	\N
Purchase single product	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-03-21 10:59:00	2019-04-30 10:59:00	\N	#4286f4	\N	FALSE	13	10	M	Open Beta	44	Color Coded	\N	\N	\N	\N
Knowledgebase	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2019-03-30 10:59:00	2019-04-27 10:59:00	\N	#4286f4	\N	FALSE	6	1	L	Done	45	Standard	\N	\N	\N	\N
 ========^^^^ UNSCHED ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43	Standard	\N	\N	\N	\N
Allow voting up / down of product selections	Strategic Growth	Shopping Team	peter@acme.com	Innovate social selling, buying, rating systems	\N	2019-11-19 00:00:00	2020-01-29 00:00:00	\N	\N	\N	FALSE	2	4	L	Discover	89	Extended	\N	\N	\N	\N
Saving profile	Maintenance	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-05-30 09:48:00	2019-06-18 09:48:00	\N	\N	\N	FALSE	0	0	M	Develop	\N	Summer	1	3	1	\N
Refund management	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2019-06-02 09:48:00	2019-07-03 09:48:00	see business case attached	\N	\N	FALSE	\N	6	M	Develop	\N	Summer	\N	\N	\N	\N
Allow user to vote on products	Strategic Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2019-07-30 00:00:00	2019-08-15 00:00:00	\N	#105cab	\N	FALSE	2	4	L	Discover	49	Extended	\N	\N	\N	\N
Saving profile	Maintenance	Shopping Team	peter@acme.com	Personalized online shopping experience	R1	2019-05-27 00:00:00	2019-06-15 00:00:00	\N	#107c1e	\N	FALSE	2	0	M	Develop	4	Extended	\N	\N	\N	40
 ========^^^^ R4 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	86	Extended	\N	\N	\N	\N
 ========^^^^ UNSCHED ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Summer	\N	\N	\N	\N
Saving profile	Maintenance	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-05-22 10:59:00	2019-06-10 10:59:00	\N	#e7f298	\N	FALSE	2	0	M	Develop	4	Standard	\N	\N	\N	\N
Suggest products purchased by friends	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2019-07-04 09:48:00	2019-07-18 09:48:00	\N	\N	\N	FALSE	\N	5	XL	Discover	\N	Summer	\N	\N	\N	\N
Returned shipments	Strategic Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2019-03-27 10:59:00	2019-05-06 10:59:00	\N	#4286f4	\N	\N	\N	\N	\N	Develop	48	Standard	\N	\N	\N	\N
Purchase path	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2019-05-16 10:59:00	2019-07-04 10:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#4286f4	\N	FALSE	8	8	L	Discover	10	Color Coded	\N	\N	\N	\N
Shopping Cart	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2019-05-31 10:59:00	2019-06-25 10:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#4286f4	\N	FALSE	3	8	M	Develop	1	Color Coded	\N	\N	\N	\N
Users can add likes to products	Strategic Growth	Fulfillment Team	peter@acme.com	Innovate social selling, buying, rating systems	R3	2019-08-19 00:00:00	2019-12-23 00:00:00	\N	\N	\N	FALSE	6	3	XS	Propose	61	Extended	\N	\N	\N	\N
Integrate with Amex Gateway	None	Payment Team	patricia@acme.com	Minimal online shopping site	R2	\N	\N	see business case attached	#105cab	\N	FALSE	5	6	S	Discover	35	Extended	\N	\N	\N	\N
Order history API	Strategic Growth	API Team	aaron@acme.com	Minimal online shopping site	R3	2019-07-30 00:00:00	2019-08-26 00:00:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#105cab	\N	FALSE	1	8	M	Discover	52	Extended	\N	\N	\N	\N
Order history API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2019-06-07 09:48:00	2019-07-04 09:48:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	\N	8	M	Discover	\N	Summer	\N	\N	\N	\N
Archive packing slips	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R1	2019-03-27 10:59:00	2019-05-06 10:59:00	\N	#e7f298	\N	FALSE	3	4	M	Done	50	Standard	\N	\N	\N	\N
Special Offers	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-06-17 09:48:00	2019-07-15 09:48:00	\N	\N	\N	FALSE	\N	14	M	Develop	\N	Summer	\N	\N	\N	\N
Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2019-05-16 10:59:00	2019-07-10 10:59:00	\N	#105cab	\N	FALSE	1	9	M	Develop	7	Color Coded	\N	\N	\N	\N
 ========^^^^ UNSCHED ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43	Color Coded	\N	\N	\N	\N
Implement Fraud Detection	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R3	2019-07-31 09:48:00	2019-09-06 09:48:00	see business case attached	\N	\N	FALSE	\N	6	XL	Develop	\N	Summer	\N	\N	\N	\N
Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2019-05-16 10:59:00	2019-07-10 10:59:00	\N	#105cab	\N	FALSE	1	9	M	Develop	7	Standard	\N	\N	\N	\N
Share all customer reviews	Short Term Growth	Fulfillment Team	pam@acme.com	MV mobile online shopping site	R4	2019-11-14 00:00:00	2020-01-26 00:00:00	\N	#21a2e0	\N	FALSE	6	1	L	Done	64	Extended	\N	\N	\N	\N
Product purchase confirmation	Strategic Growth	Payment Team	peter@acme.com	Minimal online shopping site	R1	2019-05-27 00:00:00	2019-07-06 00:00:00	\N	#105cab	\N	FALSE	4	3	S	Done	9	Extended	\N	\N	\N	35
 ========^^^^ R1 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	Extended	\N	\N	\N	\N
Profile preferences	Strategic Growth	Shopping Team	peter@acme.com	Build location awareness for handling orders	\N	2019-11-14 00:00:00	2019-12-30 00:00:00	\N	#4a1d7e	\N	FALSE	5	0	L	Develop	98	Extended	\N	\N	\N	\N
Rearchitect User Management	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2019-06-03 10:59:00	2019-07-04 10:59:00	\N	#df1a7b	\N	FALSE	4	5	S	Discover	13	Color Coded	\N	\N	\N	\N
Priority shipping	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2019-05-31 10:59:00	2019-06-28 10:59:00	\N	#4286f4	\N	FALSE	7	5	L	Develop	11	Color Coded	\N	\N	\N	\N
Purchase path	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2019-05-16 10:59:00	2019-07-04 10:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#4286f4	\N	FALSE	8	8	L	Discover	10	Standard	\N	\N	\N	\N
Extended Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2019-05-22 10:59:00	2019-06-28 10:59:00	\N	#105cab	\N	FALSE	12	4	M	Develop	3	Color Coded	\N	\N	\N	\N
Mobile shopping Cart	Cost Savings	Shopping Team	peter@acme.com	MV mobile online shopping site	R3	2019-11-20 00:00:00	2019-12-15 00:00:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#21a2e0	\N	FALSE	3	8	M	Develop	47	Extended	\N	\N	\N	\N
Credit card payments	Cost Savings	Payment Team	patricia@acme.com	Integrate in-store and online experience	R2	2019-07-25 00:00:00	2019-08-31 00:00:00	see business case attached	#f9a814	\N	FALSE	3	6	L	Validate	19	Extended	\N	\N	\N	90
Provide cost options for shipping methods	Short Term Growth	Fulfillment Team	pam@acme.com	MV mobile online shopping site	R4	2019-11-20 00:00:00	2019-12-18 00:00:00	\N	#21a2e0	\N	FALSE	7	5	L	Develop	74	Extended	\N	\N	\N	\N
Cross sell related products	Strategic Growth	Shopping Team	peter@acme.com	Build read-write API for handling orders	R1	2019-08-19 00:00:00	2019-09-02 00:00:00	\N	#21a2e0	\N	FALSE	6	3	M	Propose	48	Extended	\N	\N	\N	50
Returned shipments	Strategic Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2019-04-04 09:48:00	2019-05-14 09:48:00	\N	\N	\N	\N	\N	\N	\N	Develop	\N	Summer	\N	\N	\N	\N
Integrate with Paypal	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2019-06-02 09:48:00	2019-07-03 09:48:00	see business case attached	\N	\N	FALSE	\N	6	M	Develop	\N	Summer	\N	\N	\N	\N
Creation of cart	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-06-08 09:48:00	2019-07-18 09:48:00	\N	\N	\N	FALSE	\N	0	M	Develop	\N	Summer	\N	\N	\N	\N
Credit card error messaging	None	Payment Team	patricia@acme.com	Minimal online shopping site	R3	\N	\N	\N	#4286f4	\N	FALSE	5	5	S	Propose	24	Standard	\N	\N	\N	\N
Homepage	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2019-04-20 10:59:00	2019-05-15 10:59:00	\N	#4286f4	\N	FALSE	5	7	L	Internal Release	46	Standard	\N	\N	\N	\N
Provide public API to support 3rd party integrations	Strategic Growth	API Team	peter@acme.com	Integrate social into shopping experience	R2	2019-06-19 10:59:00	2019-07-10 10:59:00	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Allow 3rd party integrators to access our data.</span>	#efab00	\N	FALSE	3	3	L	Discover	30	Standard	\N	\N	\N	\N
Saving profile	Maintenance	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-05-22 10:59:00	2019-06-10 10:59:00	\N	#e7f298	\N	FALSE	2	0	M	Develop	4	Color Coded	\N	\N	\N	\N
Provide public API to support 3rd party integrations	Strategic Growth	API Team	peter@acme.com	Integrate social into shopping experience	R2	2019-06-19 10:59:00	2019-07-10 10:59:00	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Allow 3rd party integrators to access our data.</span>	#efab00	\N	FALSE	3	3	L	Discover	30	Color Coded	\N	\N	\N	\N
Special Offers	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2019-06-09 10:59:00	2019-07-07 10:59:00	\N	#e7f298	\N	FALSE	3	14	M	Develop	15	Color Coded	\N	\N	\N	\N
Order Status 2.0	Strategic Growth	Shopping Team	peter@acme.com	Modernize customer service portal	R2	2019-05-30 09:48:00	2019-07-03 09:48:00	\N	\N	\N	FALSE	5	7	M	Develop	\N	Summer	18	5	3	\N
\.


--
-- Data for Name: fundingincrement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fundingincrement (name, amount, dataset, listing_order) FROM stdin;
\.


--
-- Data for Name: initiative; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY initiative (name, plannedstartdate, plannedenddate, parent, description, displaycolor, investmentcategory, notes, ready, riskscore, valuescore, project, state, owner, listing_order, dataset, rroevalue, jobsize, timecriticality) FROM stdin;
Integrate social into shopping experience	2019-05-06 10:59:00	2019-08-28 10:59:00	Revamp online presence	\N	#efab00	Strategic Growth	\N	FALSE	3	5	Consumer Site	Prioritize	rachel@acme.com	9	Standard	\N	\N	\N
Create a read-only API	2019-05-15 10:59:00	2019-07-29 10:59:00	Create best in class platform	Business Case <div><br /></div> <div><br /></div> <div>Read-only API enables integrations with Google....</div>	#c6b893	Short Term Growth	\N	FALSE	3	8	Platform	Business Case	aaron@acme.com	10	Standard	\N	\N	\N
Consolidate databases	2019-05-24 10:59:00	2019-09-27 10:59:00	Create best in class platform	\N	#3a2659	Strategic Growth	\N	FALSE	1	1	Platform	Prioritize	aaron@acme.com	11	Standard	\N	\N	\N
Minimal online shopping site	2019-04-20 10:59:00	2019-08-20 10:59:00	Revamp online presence	\N	#4286f4	Short Term Growth	\N	FALSE	3	8	Consumer Site	Build	rachel@acme.com	1	Color Coded	\N	\N	\N
Build read-write API for handling orders	2019-04-15 10:59:00	2019-06-29 10:59:00	Create best in class platform	\N	#ee6c19	Strategic Growth	\N	FALSE	8	8	Platform	Build	aaron@acme.com	2	Color Coded	\N	\N	\N
Personalized online shopping experience	2019-03-21 10:59:00	2019-09-04 10:59:00	Revamp online presence	\N	#e7f298	Short Term Growth	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	3	Color Coded	\N	\N	\N
Innovate and develop purchasing system	2019-07-20 00:00:00	2019-09-29 00:00:00	Expand mobile app capability	\N	#ee6c19	Cost Savings	\N	FALSE	8	1	Consumer Site	Build	rachel@acme.com	16	Extended	\N	\N	\N
Re-build primary web app to use API	2019-05-06 10:59:00	2019-07-29 10:59:00	Create best in class platform	\N	#107c1e	Cost Savings	\N	FALSE	13	3	Platform	Prioritize	aaron@acme.com	6	Color Coded	\N	\N	\N
Integrate in-store and online experience	2019-05-23 09:48:00	2019-10-12 09:48:00	Revamp online presence	\N	\N	Strategic Growth	\N	FALSE	3	13	Consumer Site	Prioritize	rachel@acme.com	\N	Summer	1	1	1
Automate to accelerate delivery	2019-05-29 00:00:00	2019-10-02 00:00:00	Create a Modern Software Factory	\N	#21a2e0	Strategic Growth	\N	FALSE	1	1	Platform	Prioritize	aaron@acme.com	22	Extended	\N	\N	\N
Personalized online shopping experience	2019-03-29 09:48:00	2019-09-12 09:48:00	Revamp online presence	\N	\N	Short Term Growth	\N	FALSE	0	3	Consumer Site	Build	rachel@acme.com	\N	Summer	13	2	13
Modernize customer service portal	2019-03-29 09:48:00	2019-08-13 09:48:00	Revamp online presence	\N	\N	Cost Savings	\N	FALSE	0	3	Consumer Site	Build	rachel@acme.com	\N	Summer	3	1	1
Minimal online shopping site	2019-06-20 00:00:00	2019-10-20 00:00:00	Revamp online presence	\N	#105cab	Short Term Growth	\N	FALSE	3	8	Consumer Site	Build	rachel@acme.com	1	Extended	\N	\N	\N
Embed Security designed from the outside it.	2019-04-20 00:00:00	2019-07-04 00:00:00	Create a Modern Software Factory	\N	#107c1e	Strategic Growth	\N	FALSE	8	8	Platform	Build	aaron@acme.com	13	Extended	\N	\N	\N
Integrate into Facebook	2019-05-08 09:48:00	2019-08-06 09:48:00	Revamp online presence	\N	\N	Strategic Growth	\N	FALSE	3	3	Consumer Site	Prioritize	rachel@acme.com	\N	Summer	5	3	5
Build location awareness for handling orders	2019-05-21 00:00:00	2019-11-04 00:00:00	Expand mobile app capability	\N	#4a1d7e	Short Term Growth	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	14	Extended	\N	\N	\N
Provide customer service portal for pickup	2019-05-21 00:00:00	2019-10-05 00:00:00	Expand mobile app capability	\N	#df1a7b	Cost Savings	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	15	Extended	\N	\N	\N
Integrate into Facebook as Knowledge base	2019-05-05 00:00:00	2019-08-03 00:00:00	Revamp online presence	\N	#fce205	Strategic Growth	\N	FALSE	2	3	Consumer Site	Prioritize	rachel@acme.com	8	Extended	\N	\N	\N
Maintain legacy purchasing system	2019-05-20 10:59:00	2019-07-30 10:59:00	Revamp online presence	\N	#105cab	Cost Savings	\N	FALSE	8	1	Consumer Site	Build	rachel@acme.com	5	Standard	\N	\N	\N
Maintain legacy purchasing system	2019-05-28 09:48:00	2019-08-07 09:48:00	Revamp online presence	\N	\N	Cost Savings	\N	FALSE	\N	1	Consumer Site	Build	rachel@acme.com	\N	Summer	\N	\N	\N
Consolidate databases	2019-05-29 00:00:00	2019-10-02 00:00:00	Create best in class platform	\N	#105cab	Strategic Growth	\N	FALSE	1	1	Platform	Prioritize	aaron@acme.com	11	Extended	\N	\N	\N
Modernize customer service portal	2019-03-21 10:59:00	2019-08-05 10:59:00	Revamp online presence	\N	#df1a7b	Cost Savings	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	4	Color Coded	\N	\N	\N
Integrate in-store and online experience	2019-05-15 10:59:00	2019-10-04 10:59:00	Revamp online presence	\N	#def2ee	Strategic Growth	\N	FALSE	8	13	Consumer Site	Prioritize	rachel@acme.com	7	Color Coded	\N	\N	\N
Consolidate databases	2019-05-24 10:59:00	2019-09-27 10:59:00	Create best in class platform	\N	#3a2659	Strategic Growth	\N	FALSE	1	1	Platform	Prioritize	aaron@acme.com	11	Color Coded	\N	\N	\N
Minimal online shopping site	2019-04-20 10:59:00	2019-08-20 10:59:00	Revamp online presence	\N	#4286f4	Short Term Growth	\N	FALSE	3	8	Consumer Site	Build	rachel@acme.com	1	Standard	\N	\N	\N
Integrate social into shopping experience	2019-05-14 09:48:00	2019-09-05 09:48:00	Revamp online presence	\N	\N	Strategic Growth	\N	FALSE	\N	5	Consumer Site	Prioritize	rachel@acme.com	\N	Summer	\N	\N	\N
Integrate social into shopping experience	2019-05-11 00:00:00	2019-09-02 00:00:00	Revamp online presence	\N	#848689	Strategic Growth	\N	FALSE	3	5	Consumer Site	Prioritize	rachel@acme.com	9	Extended	\N	\N	\N
Integrate social into shopping experience	2019-05-06 10:59:00	2019-08-28 10:59:00	Revamp online presence	\N	#efab00	Strategic Growth	\N	FALSE	3	5	Consumer Site	Prioritize	rachel@acme.com	9	Color Coded	\N	\N	\N
Create a read-only API	2019-05-15 10:59:00	2019-07-29 10:59:00	Create best in class platform	Business Case <div><br /></div> <div><br /></div> <div>Read-only API enables integrations with Google....</div>	#c6b893	Short Term Growth	\N	FALSE	3	8	Platform	Business Case	aaron@acme.com	10	Color Coded	\N	\N	\N
Build read-write API for handling orders	2019-04-23 09:48:00	2019-07-07 09:48:00	Create best in class platform	\N	\N	Strategic Growth	\N	FALSE	0	8	Platform	Build	aaron@acme.com	\N	Summer	8	1	3
Create a read-only API	2019-05-23 09:48:00	2019-08-06 09:48:00	Create best in class platform	Business Case <div><br /></div> <div><br /></div> <div>Read-only API enables integrations with Google....</div>	\N	Short Term Growth	\N	FALSE	5	8	Platform	Business Case	aaron@acme.com	\N	Summer	5	3	10
Maintain legacy purchasing system	2019-07-20 00:00:00	2019-09-29 00:00:00	Revamp online presence	\N	#df1a7b	Cost Savings	\N	FALSE	8	1	Consumer Site	Build	rachel@acme.com	5	Extended	\N	\N	\N
Re-build primary web app leverage API technology	2019-05-11 00:00:00	2019-08-03 00:00:00	Create best in class platform	\N	#ee6c19	Cost Savings	\N	FALSE	13	3	Platform	Prioritize	aaron@acme.com	6	Extended	\N	\N	\N
Accelerate DevOps, redefine SW delivery to innovate faster	2019-05-11 00:00:00	2019-08-03 00:00:00	Create a Modern Software Factory	\N	#f9a814	Cost Savings	\N	FALSE	13	3	Platform	Prioritize	aaron@acme.com	17	Extended	\N	\N	\N
Integrate in-store and online experience	2019-05-15 10:59:00	2019-10-04 10:59:00	Revamp online presence	\N	#def2ee	Strategic Growth	\N	FALSE	8	13	Consumer Site	Prioritize	rachel@acme.com	7	Standard	\N	\N	\N
Integrate into Facebook	2019-04-30 10:59:00	2019-07-29 10:59:00	Revamp online presence	\N	#a77fdb	Strategic Growth	\N	FALSE	2	3	Consumer Site	Prioritize	rachel@acme.com	8	Standard	\N	\N	\N
Maintain legacy purchasing system	2019-05-20 10:59:00	2019-07-30 10:59:00	Revamp online presence	\N	#105cab	Cost Savings	\N	FALSE	8	1	Consumer Site	Build	rachel@acme.com	5	Color Coded	\N	\N	\N
Personalized online shopping experience	2019-05-21 00:00:00	2019-11-04 00:00:00	Revamp online presence	\N	#107c1e	Short Term Growth	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	2	Extended	\N	\N	\N
Modernize customer service portal	2019-05-21 00:00:00	2019-10-05 00:00:00	Revamp online presence	\N	#4a1d7e	Cost Savings	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	3	Extended	\N	\N	\N
Build read-write API for handling orders	2019-04-20 00:00:00	2019-07-04 00:00:00	Create best in class platform	\N	#21a2e0	Strategic Growth	\N	FALSE	8	8	Platform	Build	aaron@acme.com	4	Extended	\N	\N	\N
Integrate mobile pickup with web purchasing experience	2019-05-20 00:00:00	2019-12-04 00:00:00	Expand mobile app capability	\N	#fce205	Strategic Growth	\N	FALSE	8	13	Consumer Site	Prioritize	rachel@acme.com	18	Extended	\N	\N	\N
Integrate into Pinterest one click ordering	2019-05-05 00:00:00	2019-08-03 00:00:00	Expand mobile app capability	\N	#848689	Strategic Growth	\N	FALSE	2	3	Consumer Site	Prioritize	rachel@acme.com	19	Extended	\N	\N	\N
Innovate social selling, buying, rating systems	2019-05-11 00:00:00	2019-09-02 00:00:00	Expand mobile app capability	\N	\N	Strategic Growth	\N	FALSE	3	5	Consumer Site	Prioritize	rachel@acme.com	20	Extended	\N	\N	\N
Build read-write API for handling orders	2019-04-15 10:59:00	2019-06-29 10:59:00	Create best in class platform	\N	#ee6c19	Strategic Growth	\N	FALSE	8	8	Platform	Build	aaron@acme.com	2	Standard	\N	\N	\N
Personalized online shopping experience	2019-03-21 10:59:00	2019-09-04 10:59:00	Revamp online presence	\N	#e7f298	Short Term Growth	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	3	Standard	\N	\N	\N
Modernize customer service portal	2019-03-21 10:59:00	2019-08-05 10:59:00	Revamp online presence	\N	#df1a7b	Cost Savings	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	4	Standard	\N	\N	\N
MV mobile online shopping site	2019-06-20 00:00:00	2019-10-20 00:00:00	Expand mobile app capability	\N	#21a2e0	Short Term Growth	\N	FALSE	3	8	Consumer Site	Build	rachel@acme.com	12	Extended	\N	\N	\N
Minimal online shopping site	2019-04-28 09:48:00	2019-08-28 09:48:00	Revamp online presence	\N	\N	Short Term Growth	\N	FALSE	5	8	Consumer Site	Build	rachel@acme.com	\N	Summer	3	3	13
Re-build primary web app to use API	2019-05-14 09:48:00	2019-08-06 09:48:00	Create best in class platform	\N	\N	Cost Savings	\N	FALSE	\N	3	Platform	Prioritize	aaron@acme.com	\N	Summer	\N	\N	\N
Ensure Agility Redefine how work is planned, achieve speed to value	2019-05-20 00:00:00	2019-08-03 00:00:00	Create a Modern Software Factory	Business Case <div><br /></div> <div><br /></div> <div>Read-only API enables integrations with Google....</div>	#105cab	Short Term Growth	\N	FALSE	3	8	Platform	Business Case	aaron@acme.com	21	Extended	\N	\N	\N
Integrate in-store and online experience	2019-05-20 00:00:00	2019-12-04 00:00:00	Revamp online presence	\N	#f9a814	Strategic Growth	\N	FALSE	8	13	Consumer Site	Prioritize	rachel@acme.com	7	Extended	\N	\N	\N
Re-build primary web app to use API	2019-05-06 10:59:00	2019-07-29 10:59:00	Create best in class platform	\N	#107c1e	Cost Savings	\N	FALSE	13	3	Platform	Prioritize	aaron@acme.com	6	Standard	\N	\N	\N
Consolidate databases	2019-06-01 09:48:00	2019-10-05 09:48:00	Create best in class platform	\N	\N	Strategic Growth	\N	FALSE	\N	1	Platform	Prioritize	aaron@acme.com	\N	Summer	\N	\N	\N
Integrate into Facebook	2019-04-30 10:59:00	2019-07-29 10:59:00	Revamp online presence	\N	#a77fdb	Strategic Growth	\N	FALSE	2	3	Consumer Site	Prioritize	rachel@acme.com	8	Color Coded	\N	\N	\N
Create a read-only API	2019-05-20 00:00:00	2019-08-03 00:00:00	Create best in class platform	Business Case <div><br /></div> <div><br /></div> <div>Read-only API enables integrations with Google....</div>	\N	Short Term Growth	\N	FALSE	3	8	Platform	Business Case	aaron@acme.com	10	Extended	\N	\N	\N
\.


--
-- Data for Name: investment; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

COPY investment (name, amount, startdate, enddate, listing_order, dataset) FROM stdin;
Minimal Site MVP	150000000	2018-11-21 00:00:00	2018-12-16 00:00:00	1	Standard
Minimal Site MVP	150000000	2018-11-21 00:00:00	2018-12-16 00:00:00	1	Enhanced
\.


--
-- Data for Name: iteration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY iteration (project, name, startdate, enddate, plannedvelocity, state, theme, notes, listing_order, dataset) FROM stdin;
Platform	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	92	Standard
Fulfillment Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	99	Standard
Platform	Iteration 8	2019-07-05 09:35:00	2019-07-18 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 1	2019-03-29 09:35:00	2019-04-11 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Consumer Site	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	12	Standard
Consumer Site	Iteration 1	2019-05-21 00:00:00	2019-06-03 00:00:00	\N	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	3	Extended
Fulfillment Team	Iteration 1	2019-05-21 00:00:00	2019-06-03 00:00:00	50	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	4	Extended
Online Store	Iteration 1	2019-05-21 00:00:00	2019-06-03 00:00:00	\N	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	5	Extended
Payment Team	Iteration 1	2019-05-21 00:00:00	2019-06-03 00:00:00	50	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	6	Extended
Shopping Team	Iteration 6	2019-07-30 00:00:00	2019-08-12 00:00:00	50	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	127	Extended
Analytics Team	Iteration 8	2019-08-27 00:00:00	2019-09-09 00:00:00	35	Planning	<ul><li>Similar Products</li></ul>	\N	138	Extended
API Team	Iteration 8	2019-08-27 00:00:00	2019-09-09 00:00:00	35	Planning	<ul><li>Similar Products</li></ul>	\N	139	Extended
Analytics Team	Iteration 16	2019-12-17 00:00:00	2019-12-30 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	70	Extended
Analytics Team	Iteration 15	2019-12-03 00:00:00	2019-12-16 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	60	Extended
Shopping Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	75	Color Coded
Payment Team	Iteration 8	2019-08-27 00:00:00	2019-09-09 00:00:00	50	Planning	<ul><li>Similar Products</li></ul>	\N	143	Extended
Shopping Team	Iteration 13	2019-11-05 00:00:00	2019-11-18 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	49	Extended
Platform	Iteration 14	2019-11-19 00:00:00	2019-12-02 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	56	Extended
API Team	Iteration 15	2019-12-03 00:00:00	2019-12-16 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	61	Extended
Reseller Site	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	114	Standard
API Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	20	Standard
Reseller Site	Iteration 8	2019-07-05 09:35:00	2019-07-18 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Analytics Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	66	Color Coded
Fulfillment Team	Iteration 1	2019-03-29 09:35:00	2019-04-11 09:35:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	109	Color Coded
Online Store	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	50	Standard
API Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	20	Color Coded
Reseller Portal Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	83	Color Coded
Platform	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	82	Color Coded
Reseller Site	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	94	Standard
Shopping Team	Iteration 7	2019-06-21 09:35:00	2019-07-04 09:35:00	40	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Analytics Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	19	Standard
API Team	Iteration 2	2019-04-12 09:35:00	2019-04-25 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	89	Standard
Payment Team	Iteration 16	2019-12-17 00:00:00	2019-12-30 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	75	Extended
Consumer Site	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	108	Standard
Fulfillment Team	Iteration 11	2019-10-08 00:00:00	2019-10-21 00:00:00	50	Planning	<ul><li>Enhanced notifications</li></ul>	\N	23	Extended
Reseller Portal Team	Iteration 1	2019-05-21 00:00:00	2019-06-03 00:00:00	35	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	7	Extended
Fulfillment Team	Iteration 8	2019-08-27 00:00:00	2019-09-09 00:00:00	50	Planning	<ul><li>Similar Products</li></ul>	\N	141	Extended
Fulfillment Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	4	Color Coded
Shopping Team	Iteration 8	2019-07-05 09:35:00	2019-07-18 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Consumer Site	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	3	Standard
Reseller Portal Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	73	Standard
Consumer Site	Iteration 6	2019-07-30 00:00:00	2019-08-12 00:00:00	\N	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	120	Extended
Reseller Site	Iteration 7	2019-08-13 00:00:00	2019-08-26 00:00:00	\N	Planning	<ul><li>Hardening for OM</li></ul>	\N	136	Extended
API Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	2	Standard
Medical Records App	Iteration 5 - User Administration	2019-06-13 11:23:00	2019-06-26 11:23:00	8	Planning	User administration	\N	117	Color Coded
Reseller Portal Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	16	Color Coded
Online Store	Iteration 3	2019-06-18 00:00:00	2019-07-01 00:00:00	\N	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	93	Extended
Payment Team	Iteration 6	2019-07-30 00:00:00	2019-08-12 00:00:00	50	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	123	Extended
Reseller Site	Iteration 15	2019-12-03 00:00:00	2019-12-16 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	68	Extended
Analytics Team	Iteration 4	2019-07-02 00:00:00	2019-07-15 00:00:00	35	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	98	Extended
API Team	Iteration 6	2019-06-07 09:35:00	2019-06-20 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Payment Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	71	Standard
Platform	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	112	Color Coded
Platform	Iteration 8	2019-08-27 00:00:00	2019-09-09 00:00:00	\N	Planning	<ul><li>Similar Products</li></ul>	\N	144	Extended
API Team	Iteration 16	2019-12-17 00:00:00	2019-12-30 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	71	Extended
Shopping Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	40	Planning	<ul><li>Hardening for OM</li></ul>	\N	65	Color Coded
Payment Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	15	Standard
Payment Team	Iteration 9	2019-09-10 00:00:00	2019-09-23 00:00:00	50	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	153	Extended
Reseller Site	Iteration 10	2019-09-24 00:00:00	2019-10-07 00:00:00	\N	Planning	<ul><li>Custom Ordering</li></ul>	\N	18	Extended
API Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	67	Standard
Online Store	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	90	Standard
Platform	Iteration 16	2019-12-17 00:00:00	2019-12-30 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	76	Extended
Consumer Site	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	58	Standard
Consumer Site	Iteration 16	2019-12-17 00:00:00	2019-12-30 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	72	Extended
Consumer Site	Iteration 12	2019-10-22 00:00:00	2019-11-04 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	32	Extended
Online Store	Iteration 15	2019-12-03 00:00:00	2019-12-16 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	64	Extended
Platform	Iteration 15	2019-12-03 00:00:00	2019-12-16 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	66	Extended
Online Store	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	32	Color Coded
Fulfillment Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	49	Standard
Platform	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	102	Standard
Reseller Portal Team	Iteration 3	2019-04-26 09:35:00	2019-05-09 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Analytics Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	46	Standard
Reseller Portal Team	Iteration 13	2019-11-05 00:00:00	2019-11-18 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	47	Extended
Analytics Team	Iteration 12	2019-10-22 00:00:00	2019-11-04 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	30	Extended
Reseller Portal Team	Iteration 12	2019-10-22 00:00:00	2019-11-04 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	37	Extended
Platform	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	102	Color Coded
Consumer Site	Iteration 7	2019-08-13 00:00:00	2019-08-26 00:00:00	\N	Planning	<ul><li>Hardening for OM</li></ul>	\N	130	Extended
Platform	Iteration 13	2019-11-05 00:00:00	2019-11-18 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	46	Extended
Fulfillment Team	Iteration 6	2019-07-30 00:00:00	2019-08-12 00:00:00	50	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	121	Extended
Fulfillment Team	Iteration 9	2019-07-19 09:35:00	2019-08-01 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
API Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	97	Color Coded
Fulfillment Team	Iteration 12	2019-10-22 00:00:00	2019-11-04 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	33	Extended
Shopping Team	Iteration 1	2019-05-21 00:00:00	2019-06-03 00:00:00	50	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	9	Extended
Online Store	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	23	Color Coded
Analytics Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	10	Standard
Reseller Site	Iteration 6	2019-07-30 00:00:00	2019-08-12 00:00:00	\N	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	126	Extended
Payment Team	Iteration 7	2019-08-13 00:00:00	2019-08-26 00:00:00	50	Planning	<ul><li>Hardening for OM</li></ul>	\N	133	Extended
Consumer Site	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	78	Standard
Reseller Site	Iteration 2	2019-04-12 09:35:00	2019-04-25 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
API Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	97	Standard
API Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	87	Standard
Analytics Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	106	Standard
Shopping Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	95	Standard
Reseller Site	Iteration 6	2019-06-07 09:35:00	2019-06-20 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 16	2019-12-17 00:00:00	2019-12-30 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	77	Extended
API Team	Iteration 2	2019-06-04 00:00:00	2019-06-17 00:00:00	35	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	81	Extended
Online Store	Iteration 6	2019-07-30 00:00:00	2019-08-12 00:00:00	\N	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	122	Extended
Payment Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	6	Standard
Shopping Team	Iteration 11	2019-10-08 00:00:00	2019-10-21 00:00:00	50	Planning	<ul><li>Enhanced notifications</li></ul>	\N	29	Extended
Fulfillment Team	Iteration 2	2019-06-04 00:00:00	2019-06-17 00:00:00	50	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	83	Extended
Reseller Site	Iteration 9	2019-09-10 00:00:00	2019-09-23 00:00:00	\N	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	156	Extended
Payment Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	6	Color Coded
Online Store	Iteration 3	2019-04-26 09:35:00	2019-05-09 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Consumer Site	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	21	Standard
Reseller Portal Team	Iteration 10	2019-09-24 00:00:00	2019-10-07 00:00:00	35	Planning	<ul><li>Custom Ordering</li></ul>	\N	17	Extended
Shopping Team	Iteration 6	2019-06-07 09:35:00	2019-06-20 09:35:00	40	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Analytics Team	Iteration 6	2019-07-30 00:00:00	2019-08-12 00:00:00	35	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	118	Extended
Payment Team	Iteration 9	2019-07-19 09:35:00	2019-08-01 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	69	Color Coded
Analytics Team	Iteration 6	2019-06-07 09:35:00	2019-06-20 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Payment Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	111	Standard
Payment Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b> <ul> <li>Paul appreciated John for helping with Ruby.</li> </ul> <b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i>  <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li> <li>Switch from cruise control to jenkins.</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i> <ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>Not enough professional development offered to team</li> <li>Weather in California is too nice to work indoors.</li> </ul>	42	Standard
Reseller Site	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	17	Standard
Consumer Site	Iteration 8	2019-07-05 09:35:00	2019-07-18 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Reseller Site	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	44	Standard
Consumer Site	Iteration 3	2019-06-18 00:00:00	2019-07-01 00:00:00	\N	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	91	Extended
API Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	38	Color Coded
API Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	67	Color Coded
Reseller Site	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	64	Color Coded
Reseller Portal Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	25	Standard
Analytics Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	96	Standard
Fulfillment Team	Iteration 10	2019-09-24 00:00:00	2019-10-07 00:00:00	50	Planning	<ul><li>Custom Ordering</li></ul>	\N	13	Extended
Reseller Site	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	104	Standard
Analytics Team	Iteration 1	2019-03-29 09:35:00	2019-04-11 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 8	2019-07-05 09:35:00	2019-07-18 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Payment Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	61	Standard
Online Store	Iteration 9	2019-09-10 00:00:00	2019-09-23 00:00:00	\N	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	152	Extended
Reseller Portal Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	83	Standard
Fulfillment Team	Iteration 16	2019-12-17 00:00:00	2019-12-30 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	73	Extended
Fulfillment Team	Iteration 14	2019-11-19 00:00:00	2019-12-02 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	53	Extended
API Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	11	Color Coded
Reseller Portal Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	53	Color Coded
Reseller Portal Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	113	Standard
Analytics Team	Iteration 13	2019-11-05 00:00:00	2019-11-18 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	40	Extended
Consumer Site	Iteration 2	2019-04-12 09:35:00	2019-04-25 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Payment Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	61	Color Coded
Shopping Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	85	Standard
Analytics Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	106	Color Coded
API Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	57	Color Coded
Online Store	Iteration 1	2019-03-29 09:35:00	2019-04-11 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 7	2019-08-13 00:00:00	2019-08-26 00:00:00	35	Planning	<ul><li>Hardening for OM</li></ul>	\N	135	Extended
API Team	Iteration 7	2019-06-21 09:35:00	2019-07-04 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 8	2019-08-27 00:00:00	2019-09-09 00:00:00	35	Planning	<ul><li>Similar Products</li></ul>	\N	145	Extended
Reseller Site	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	64	Standard
Consumer Site	Iteration 7	2019-06-21 09:35:00	2019-07-04 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Online Store	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	60	Standard
Platform	Iteration 7	2019-06-21 09:35:00	2019-07-04 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Online Store	Iteration 8	2019-07-05 09:35:00	2019-07-18 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Online Store	Iteration 2	2019-04-12 09:35:00	2019-04-25 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 2	2019-04-12 09:35:00	2019-04-25 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Analytics Team	Iteration 14	2019-11-19 00:00:00	2019-12-02 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	50	Extended
Medical Records App	Iteration 4 - New Patients	2019-05-30 11:23:00	2019-06-12 11:23:00	8	Committed	New patients	\N	116	Color Coded
Consumer Site	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	68	Standard
API Team	Iteration 3	2019-04-26 09:35:00	2019-05-09 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Consumer Site	Iteration 1	2019-03-29 09:35:00	2019-04-11 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Payment Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	24	Standard
Fulfillment Team	Iteration 5	2019-07-16 00:00:00	2019-07-29 00:00:00	50	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	111	Extended
Analytics Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	28	Standard
Payment Team	Iteration 15	2019-12-03 00:00:00	2019-12-16 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	65	Extended
Reseller Site	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	54	Color Coded
Analytics Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	1	Color Coded
Analytics Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	1	Standard
Fulfillment Team	Iteration 9	2019-09-10 00:00:00	2019-09-23 00:00:00	50	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	151	Extended
Analytics Team	Iteration 10	2019-09-24 00:00:00	2019-10-07 00:00:00	35	Planning	<ul><li>Custom Ordering</li></ul>	\N	10	Extended
API Team	Iteration 8	2019-07-05 09:35:00	2019-07-18 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Shopping Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	95	Color Coded
Platform	Iteration 11	2019-10-08 00:00:00	2019-10-21 00:00:00	\N	Planning	<ul><li>Enhanced notifications</li></ul>	\N	26	Extended
Consumer Site	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	21	Color Coded
Reseller Portal Team	Iteration 9	2019-09-10 00:00:00	2019-09-23 00:00:00	35	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	155	Extended
Shopping Team	Iteration 12	2019-10-22 00:00:00	2019-11-04 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	39	Extended
Online Store	Iteration 5	2019-07-16 00:00:00	2019-07-29 00:00:00	\N	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	112	Extended
Reseller Site	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	114	Color Coded
Platform	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	72	Color Coded
Online Store	Iteration 8	2019-08-27 00:00:00	2019-09-09 00:00:00	\N	Planning	<ul><li>Similar Products</li></ul>	\N	142	Extended
Analytics Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	19	Color Coded
Shopping Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	115	Standard
Fulfillment Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	79	Color Coded
Consumer Site	Iteration 14	2019-11-19 00:00:00	2019-12-02 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	52	Extended
Shopping Team	Iteration 4	2019-05-10 09:35:00	2019-05-23 09:35:00	25	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Reseller Site	Iteration 2	2019-06-04 00:00:00	2019-06-17 00:00:00	\N	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	87	Extended
Platform	Iteration 7	2019-08-13 00:00:00	2019-08-26 00:00:00	\N	Planning	<ul><li>Hardening for OM</li></ul>	\N	134	Extended
API Team	Iteration 1	2019-05-21 00:00:00	2019-06-03 00:00:00	35	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	2	Extended
Fulfillment Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	13	Color Coded
Shopping Team	Iteration 1	2019-03-29 09:35:00	2019-04-11 09:35:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Consumer Site	Iteration 11	2019-10-08 00:00:00	2019-10-21 00:00:00	\N	Planning	<ul><li>Enhanced notifications</li></ul>	\N	22	Extended
Reseller Portal Team	Iteration 9	2019-07-19 09:35:00	2019-08-01 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Online Store	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	60	Color Coded
API Team	Iteration 14	2019-11-19 00:00:00	2019-12-02 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	51	Extended
Consumer Site	Iteration 3	2019-04-26 09:35:00	2019-05-09 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Online Store	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	100	Color Coded
Online Store	Iteration 14	2019-11-19 00:00:00	2019-12-02 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	54	Extended
Shopping Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	9	Standard
Reseller Site	Iteration 9	2019-07-19 09:35:00	2019-08-01 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 7	2019-06-21 09:35:00	2019-07-04 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Consumer Site	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	68	Color Coded
Analytics Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	28	Color Coded
Online Store	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	14	Standard
Payment Team	Iteration 11	2019-10-08 00:00:00	2019-10-21 00:00:00	50	Planning	<ul><li>Enhanced notifications</li></ul>	\N	25	Extended
Online Store	Iteration 13	2019-11-05 00:00:00	2019-11-18 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	44	Extended
Reseller Site	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	17	Color Coded
Payment Team	Iteration 2	2019-04-12 09:35:00	2019-04-25 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Platform	Iteration 9	2019-09-10 00:00:00	2019-09-23 00:00:00	\N	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	154	Extended
Consumer Site	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	98	Color Coded
Fulfillment Team	Iteration 3	2019-04-26 09:35:00	2019-05-09 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Reseller Portal Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	7	Standard
Medical Records App	Iteration 4 - New Patients	2019-06-04 00:00:00	2019-06-17 00:00:00	8	Committed	New patients	\N	107	Extended
Payment Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	91	Standard
Payment Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	91	Color Coded
Medical Records App	Iteration 5 - User Administration	2019-06-18 00:00:00	2019-07-01 00:00:00	8	Planning	User administration	\N	117	Extended
Platform	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	82	Standard
API Team	Iteration 9	2019-07-19 09:35:00	2019-08-01 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Online Store	Iteration 12	2019-10-22 00:00:00	2019-11-04 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	34	Extended
Reseller Portal Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	113	Color Coded
Reseller Site	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	54	Standard
Consumer Site	Iteration 10	2019-09-24 00:00:00	2019-10-07 00:00:00	\N	Planning	<ul><li>Custom Ordering</li></ul>	\N	12	Extended
Payment Team	Iteration 14	2019-11-19 00:00:00	2019-12-02 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	55	Extended
Platform	Iteration 6	2019-07-30 00:00:00	2019-08-12 00:00:00	\N	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	124	Extended
Reseller Site	Iteration 8	2019-08-27 00:00:00	2019-09-09 00:00:00	\N	Planning	<ul><li>Similar Products</li></ul>	\N	146	Extended
Shopping Team	Iteration 8	2019-08-27 00:00:00	2019-09-09 00:00:00	50	Planning	<ul><li>Similar Products</li></ul>	\N	147	Extended
Online Store	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	110	Color Coded
Consumer Site	Iteration 15	2019-12-03 00:00:00	2019-12-16 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	62	Extended
Online Store	Iteration 2	2019-06-04 00:00:00	2019-06-17 00:00:00	\N	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	84	Extended
Fulfillment Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	22	Standard
Online Store	Iteration 6	2019-06-07 09:35:00	2019-06-20 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Reseller Site	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	8	Standard
API Team	Iteration 9	2019-09-10 00:00:00	2019-09-23 00:00:00	35	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	149	Extended
Online Store	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	50	Color Coded
Shopping Team	Iteration 7	2019-08-13 00:00:00	2019-08-26 00:00:00	50	Planning	<ul><li>Hardening for OM</li></ul>	\N	137	Extended
Platform	Iteration 12	2019-10-22 00:00:00	2019-11-04 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	36	Extended
Reseller Site	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	104	Color Coded
Shopping Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	115	Color Coded
Shopping Team	Iteration 9	2019-07-19 09:35:00	2019-08-01 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Online Store	Iteration 16	2019-12-17 00:00:00	2019-12-30 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	74	Extended
Payment Team	Iteration 10	2019-09-24 00:00:00	2019-10-07 00:00:00	50	Planning	<ul><li>Custom Ordering</li></ul>	\N	15	Extended
Medical Records App	Iteration 5 - User Administration	2019-06-13 11:23:00	2019-06-26 11:23:00	8	Planning	User administration	\N	117	Standard
API Team	Iteration 10	2019-09-24 00:00:00	2019-10-07 00:00:00	35	Planning	<ul><li>Custom Ordering</li></ul>	\N	11	Extended
Platform	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	92	Color Coded
Reseller Portal Team	Iteration 3	2019-06-18 00:00:00	2019-07-01 00:00:00	35	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	95	Extended
Reseller Site	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	74	Color Coded
Reseller Site	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	8	Color Coded
Fulfillment Team	Iteration 13	2019-11-05 00:00:00	2019-11-18 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	43	Extended
Payment Team	Iteration 1	2019-03-29 09:35:00	2019-04-11 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Payment Team	Iteration 8	2019-07-05 09:35:00	2019-07-18 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Consumer Site	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	98	Standard
Payment Team	Iteration 4	2019-05-10 09:35:00	2019-05-23 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Analytics Team	Iteration 9	2019-09-10 00:00:00	2019-09-23 00:00:00	35	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	148	Extended
Reseller Portal Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	25	Color Coded
Online Store	Iteration 4	2019-07-02 00:00:00	2019-07-15 00:00:00	\N	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	102	Extended
Shopping Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	40	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	55	Color Coded
Fulfillment Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	89	Color Coded
Payment Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	51	Standard
API Team	Iteration 3	2019-06-18 00:00:00	2019-07-01 00:00:00	35	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	90	Extended
API Team	Iteration 1	2019-03-29 09:35:00	2019-04-11 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Reseller Site	Iteration 7	2019-06-21 09:35:00	2019-07-04 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Shopping Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	75	Standard
Shopping Team	Iteration 14	2019-11-19 00:00:00	2019-12-02 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	59	Extended
Fulfillment Team	Iteration 3	2019-06-18 00:00:00	2019-07-01 00:00:00	50	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	92	Extended
Consumer Site	Iteration 9	2019-07-19 09:35:00	2019-08-01 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	99	Color Coded
Shopping Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	18	Standard
Consumer Site	Iteration 2	2019-06-04 00:00:00	2019-06-17 00:00:00	\N	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	82	Extended
Shopping Team	Iteration 3	2019-06-18 00:00:00	2019-07-01 00:00:00	50	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	97	Extended
Payment Team	Iteration 3	2019-04-26 09:35:00	2019-05-09 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Reseller Site	Iteration 14	2019-11-19 00:00:00	2019-12-02 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	58	Extended
API Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	11	Standard
API Team	Iteration 13	2019-11-05 00:00:00	2019-11-18 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	41	Extended
Platform	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	62	Color Coded
Analytics Team	Iteration 2	2019-04-12 09:35:00	2019-04-25 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Online Store	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	110	Standard
Online Store	Iteration 10	2019-09-24 00:00:00	2019-10-07 00:00:00	\N	Planning	<ul><li>Custom Ordering</li></ul>	\N	14	Extended
Fulfillment Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	31	Color Coded
Shopping Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	85	Color Coded
Reseller Portal Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	63	Color Coded
API Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	107	Standard
Analytics Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	86	Standard
API Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	77	Standard
Reseller Site	Iteration 12	2019-10-22 00:00:00	2019-11-04 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	38	Extended
Online Store	Iteration 11	2019-10-08 00:00:00	2019-10-21 00:00:00	\N	Planning	<ul><li>Enhanced notifications</li></ul>	\N	24	Extended
Reseller Site	Iteration 3	2019-06-18 00:00:00	2019-07-01 00:00:00	\N	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	96	Extended
Payment Team	Iteration 5	2019-07-16 00:00:00	2019-07-29 00:00:00	50	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b> <ul> <li>Paul appreciated John for helping with Ruby.</li> </ul> <b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i>  <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li> <li>Switch from cruise control to jenkins.</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i> <ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>Not enough professional development offered to team</li> <li>Weather in California is too nice to work indoors.</li> </ul>	113	Extended
Online Store	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	70	Standard
Analytics Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	76	Standard
Reseller Portal Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	53	Standard
Online Store	Iteration 9	2019-07-19 09:35:00	2019-08-01 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Online Store	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	23	Standard
Payment Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	81	Color Coded
Shopping Team	Iteration 15	2019-12-03 00:00:00	2019-12-16 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	69	Extended
API Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	77	Color Coded
Shopping Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	25	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	36	Color Coded
Shopping Team	Iteration 2	2019-06-04 00:00:00	2019-06-17 00:00:00	50	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	88	Extended
Reseller Site	Iteration 4	2019-07-02 00:00:00	2019-07-15 00:00:00	\N	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	105	Extended
Platform	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	62	Standard
Shopping Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	40	Planning	<ul><li>Hardening for OM</li></ul>	\N	65	Standard
Reseller Portal Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	34	Standard
Reseller Site	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	94	Color Coded
Consumer Site	Iteration 4	2019-07-02 00:00:00	2019-07-15 00:00:00	\N	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	100	Extended
Analytics Team	Iteration 8	2019-07-05 09:35:00	2019-07-18 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Payment Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	51	Color Coded
Online Store	Iteration 7	2019-08-13 00:00:00	2019-08-26 00:00:00	\N	Planning	<ul><li>Hardening for OM</li></ul>	\N	132	Extended
Reseller Site	Iteration 16	2019-12-17 00:00:00	2019-12-30 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	78	Extended
Reseller Portal Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	103	Standard
Online Store	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	80	Color Coded
Fulfillment Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	59	Standard
Reseller Portal Team	Iteration 14	2019-11-19 00:00:00	2019-12-02 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	57	Extended
Analytics Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	66	Standard
Platform	Iteration 10	2019-09-24 00:00:00	2019-10-07 00:00:00	\N	Planning	<ul><li>Custom Ordering</li></ul>	\N	16	Extended
Platform	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	52	Color Coded
API Team	Iteration 7	2019-08-13 00:00:00	2019-08-26 00:00:00	35	Planning	<ul><li>Hardening for OM</li></ul>	\N	129	Extended
Analytics Team	Iteration 4	2019-05-10 09:35:00	2019-05-23 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Payment Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	15	Color Coded
Shopping Team	Iteration 2	2019-04-12 09:35:00	2019-04-25 09:35:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Consumer Site	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	12	Color Coded
Online Store	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	70	Color Coded
Consumer Site	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	48	Color Coded
Reseller Site	Iteration 11	2019-10-08 00:00:00	2019-10-21 00:00:00	\N	Planning	<ul><li>Enhanced notifications</li></ul>	\N	28	Extended
Analytics Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	56	Color Coded
Reseller Site	Iteration 3	2019-04-26 09:35:00	2019-05-09 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Reseller Site	Iteration 13	2019-11-05 00:00:00	2019-11-18 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	48	Extended
Fulfillment Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	49	Color Coded
Online Store	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	90	Color Coded
Payment Team	Iteration 12	2019-10-22 00:00:00	2019-11-04 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	35	Extended
Reseller Site	Iteration 1	2019-05-21 00:00:00	2019-06-03 00:00:00	\N	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	8	Extended
Reseller Portal Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	7	Color Coded
Shopping Team	Iteration 10	2019-09-24 00:00:00	2019-10-07 00:00:00	50	Planning	<ul><li>Enhanced notifications</li></ul>	\N	19	Extended
Reseller Site	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	74	Standard
Fulfillment Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	20	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	40	Color Coded
Analytics Team	Iteration 9	2019-07-19 09:35:00	2019-08-01 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 7	2019-08-13 00:00:00	2019-08-26 00:00:00	50	Planning	<ul><li>Hardening for OM</li></ul>	\N	131	Extended
Payment Team	Iteration 3	2019-06-18 00:00:00	2019-07-01 00:00:00	50	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	94	Extended
Online Store	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	100	Standard
Fulfillment Team	Iteration 2	2019-04-12 09:35:00	2019-04-25 09:35:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Reseller Site	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	26	Standard
API Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	29	Color Coded
Reseller Site	Iteration 5	2019-07-16 00:00:00	2019-07-29 00:00:00	\N	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	115	Extended
Reseller Portal Team	Iteration 2	2019-06-04 00:00:00	2019-06-17 00:00:00	35	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	86	Extended
Fulfillment Team	Iteration 6	2019-06-07 09:35:00	2019-06-20 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Shopping Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	40	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	45	Color Coded
Consumer Site	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	88	Standard
Payment Team	Iteration 13	2019-11-05 00:00:00	2019-11-18 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	45	Extended
Fulfillment Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	109	Standard
Payment Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	71	Color Coded
Analytics Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	46	Color Coded
API Team	Iteration 5	2019-05-24 09:35:00	2019-06-06 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Reseller Site	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	35	Standard
Shopping Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	105	Color Coded
Medical Records App	Iteration 4 - New Patients	2019-05-30 11:23:00	2019-06-12 11:23:00	8	Committed	New patients	\N	116	Standard
Consumer Site	Iteration 5	2019-05-24 09:35:00	2019-06-06 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Shopping Team	Iteration 9	2019-09-10 00:00:00	2019-09-23 00:00:00	50	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	157	Extended
Reseller Portal Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	73	Color Coded
API Team	Iteration 11	2019-10-08 00:00:00	2019-10-21 00:00:00	35	Planning	<ul><li>Enhanced notifications</li></ul>	\N	21	Extended
Consumer Site	Iteration 8	2019-08-27 00:00:00	2019-09-09 00:00:00	\N	Planning	<ul><li>Similar Products</li></ul>	\N	140	Extended
Shopping Team	Iteration 16	2019-12-17 00:00:00	2019-12-30 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	79	Extended
Payment Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	101	Standard
Consumer Site	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	58	Color Coded
Reseller Portal Team	Iteration 4	2019-05-10 09:35:00	2019-05-23 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Reseller Portal Team	Iteration 5	2019-05-24 09:35:00	2019-06-06 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Analytics Team	Iteration 1	2019-05-21 00:00:00	2019-06-03 00:00:00	35	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	1	Extended
API Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	47	Standard
Shopping Team	Iteration 5	2019-07-16 00:00:00	2019-07-29 00:00:00	50	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	116	Extended
Fulfillment Team	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	69	Standard
Consumer Site	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	108	Color Coded
Reseller Portal Team	Iteration 4	2019-07-02 00:00:00	2019-07-15 00:00:00	35	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	104	Extended
Shopping Team	Iteration 5	2019-05-24 09:35:00	2019-06-06 09:35:00	40	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Reseller Portal Team	Iteration 11	2019-10-08 00:00:00	2019-10-21 00:00:00	35	Planning	<ul><li>Enhanced notifications</li></ul>	\N	27	Extended
Fulfillment Team	Iteration 7	2019-06-21 09:35:00	2019-07-04 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Payment Team	Iteration 2	2019-06-04 00:00:00	2019-06-17 00:00:00	50	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	85	Extended
Platform	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	52	Standard
Analytics Team	Iteration 7	2019-08-13 00:00:00	2019-08-26 00:00:00	35	Planning	<ul><li>Hardening for OM</li></ul>	\N	128	Extended
Consumer Site	Iteration 6	2019-06-07 09:35:00	2019-06-20 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	93	Standard
Shopping Team	Iteration 4	2019-07-02 00:00:00	2019-07-15 00:00:00	50	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	106	Extended
API Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	38	Standard
Reseller Portal Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	34	Color Coded
Consumer Site	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	88	Color Coded
Payment Team	Iteration 7	2019-06-21 09:35:00	2019-07-04 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 6	2019-07-30 00:00:00	2019-08-12 00:00:00	35	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	125	Extended
API Team	Iteration 4	2019-05-10 09:35:00	2019-05-23 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Analytics Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	37	Standard
Analytics Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	56	Standard
Reseller Portal Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	103	Color Coded
Fulfillment Team	Iteration 8	2019-07-05 09:35:00	2019-07-18 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 4	2019-05-10 09:35:00	2019-05-23 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Shopping Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	25	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	27	Color Coded
Reseller Portal Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	43	Color Coded
API Team	Iteration 5	2019-07-16 00:00:00	2019-07-29 00:00:00	35	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	109	Extended
Analytics Team	Iteration 3	2019-06-18 00:00:00	2019-07-01 00:00:00	35	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	89	Extended
Consumer Site	Iteration 13	2019-11-05 00:00:00	2019-11-18 00:00:00	\N	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	42	Extended
Consumer Site	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	39	Standard
Analytics Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	10	Color Coded
Analytics Team	Iteration 2	2019-06-04 00:00:00	2019-06-17 00:00:00	35	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	80	Extended
Reseller Site	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	84	Standard
Reseller Portal Team	Iteration 5	2019-07-16 00:00:00	2019-07-29 00:00:00	35	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	114	Extended
Payment Team	Iteration 4	2019-07-02 00:00:00	2019-07-15 00:00:00	50	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	103	Extended
Analytics Team	Iteration 3	2019-04-26 09:35:00	2019-05-09 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Consumer Site	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	39	Color Coded
Analytics Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	86	Color Coded
API Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	57	Standard
Consumer Site	Iteration 9	2019-09-10 00:00:00	2019-09-23 00:00:00	\N	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	150	Extended
Fulfillment Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	59	Color Coded
Shopping Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	25	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	36	Standard
Online Store	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	32	Standard
Reseller Portal Team	Iteration 7	2019-06-13 11:23:00	2019-06-26 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	63	Standard
Analytics Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	76	Color Coded
API Team	Iteration 12	2019-10-22 00:00:00	2019-11-04 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	31	Extended
Payment Team	Iteration 5	2019-05-24 09:35:00	2019-06-06 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b> <ul> <li>Paul appreciated John for helping with Ruby.</li> </ul> <b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i>  <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li> <li>Switch from cruise control to jenkins.</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i> <ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>Not enough professional development offered to team</li> <li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Analytics Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	96	Color Coded
Fulfillment Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	20	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	40	Standard
Online Store	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	41	Standard
Reseller Site	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	35	Color Coded
Payment Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	101	Color Coded
Payment Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	33	Color Coded
Fulfillment Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	31	Standard
Payment Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	33	Standard
Online Store	Iteration 5	2019-05-24 09:35:00	2019-06-06 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Analytics Team	Iteration 5	2019-07-16 00:00:00	2019-07-29 00:00:00	35	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	108	Extended
Consumer Site	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	30	Standard
API Team	Iteration 4	2019-07-02 00:00:00	2019-07-15 00:00:00	35	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	99	Extended
Consumer Site	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	48	Standard
Platform	Iteration 8	2019-06-27 11:23:00	2019-07-10 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	72	Standard
Fulfillment Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	4	Standard
Reseller Site	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	26	Color Coded
Payment Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b> <ul> <li>Paul appreciated John for helping with Ruby.</li> </ul> <b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i>  <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li> <li>Switch from cruise control to jenkins.</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i> <ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>Not enough professional development offered to team</li> <li>Weather in California is too nice to work indoors.</li> </ul>	42	Color Coded
Payment Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	24	Color Coded
Consumer Site	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	3	Color Coded
Payment Team	Iteration 6	2019-06-07 09:35:00	2019-06-20 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Reseller Site	Iteration 5	2019-05-24 09:35:00	2019-06-06 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
API Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	2	Color Coded
Platform	Iteration 9	2019-07-19 09:35:00	2019-08-01 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Online Store	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	80	Standard
Reseller Site	Iteration 1	2019-03-29 09:35:00	2019-04-11 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	93	Color Coded
Consumer Site	Iteration 5	2019-07-16 00:00:00	2019-07-29 00:00:00	\N	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	110	Extended
Shopping Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	40	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	45	Standard
Consumer Site	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	78	Color Coded
Fulfillment Team	Iteration 15	2019-12-03 00:00:00	2019-12-16 00:00:00	50	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	63	Extended
Online Store	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	14	Color Coded
Reseller Site	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	44	Color Coded
Shopping Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	40	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	55	Standard
Shopping Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	25	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	27	Standard
Fulfillment Team	Iteration 4	2019-07-02 00:00:00	2019-07-15 00:00:00	50	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	101	Extended
Fulfillment Team	Iteration 5	2019-05-24 09:35:00	2019-06-06 09:35:00	20	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
API Team	Iteration 6	2019-07-30 00:00:00	2019-08-12 00:00:00	35	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	119	Extended
Reseller Portal Team	Iteration 15	2019-12-03 00:00:00	2019-12-16 00:00:00	35	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	67	Extended
Analytics Team	Iteration 11	2019-10-08 00:00:00	2019-10-21 00:00:00	35	Planning	<ul><li>Enhanced notifications</li></ul>	\N	20	Extended
Reseller Site	Iteration 4	2019-05-10 09:35:00	2019-05-23 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
API Team	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	29	Standard
Consumer Site	Iteration 4	2019-05-02 11:23:00	2019-05-15 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	30	Color Coded
Online Store	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	41	Color Coded
Fulfillment Team	Iteration 3	2019-04-18 11:23:00	2019-05-01 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	22	Color Coded
Reseller Portal Team	Iteration 6	2019-06-07 09:35:00	2019-06-20 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	13	Standard
Platform	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	112	Standard
API Team	Iteration 6	2019-05-30 11:23:00	2019-06-12 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	47	Color Coded
Analytics Team	Iteration 5	2019-05-24 09:35:00	2019-06-06 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Payment Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	81	Standard
Reseller Portal Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	43	Standard
Online Store	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	5	Standard
Shopping Team	Iteration 3	2019-04-26 09:35:00	2019-05-09 09:35:00	25	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Platform	Iteration 6	2019-06-07 09:35:00	2019-06-20 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Analytics Team	Iteration 7	2019-06-21 09:35:00	2019-07-04 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Reseller Site	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	84	Color Coded
Online Store	Iteration 7	2019-06-21 09:35:00	2019-07-04 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
API Team	Iteration 10	2019-07-25 11:23:00	2019-08-07 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	87	Color Coded
Fulfillment Team	Iteration 9	2019-07-11 11:23:00	2019-07-24 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	79	Standard
Shopping Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	18	Color Coded
Reseller Portal Team	Iteration 2	2019-04-04 11:23:00	2019-04-17 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	16	Standard
Online Store	Iteration 4	2019-05-10 09:35:00	2019-05-23 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Shopping Team	Iteration 11	2019-08-08 11:23:00	2019-08-21 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	105	Standard
Analytics Team	Iteration 5	2019-05-16 11:23:00	2019-05-29 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	37	Color Coded
API Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	107	Color Coded
Consumer Site	Iteration 4	2019-05-10 09:35:00	2019-05-23 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Payment Team	Iteration 12	2019-08-22 11:23:00	2019-09-04 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	111	Color Coded
Online Store	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	5	Color Coded
Shopping Team	Iteration 1	2019-03-21 11:23:00	2019-04-03 11:23:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	9	Color Coded
\.


--
-- Data for Name: preliminaryestimate; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

COPY preliminaryestimate (name, value, dataset, listing_order) FROM stdin;
XS	10	Standard	1
S	30	Standard	2
M	50	Standard	3
L	80	Standard	4
XL	130	Standard	5
XS	10	Extended	1
S	30	Extended	2
M	50	Extended	3
L	80	Extended	4
XL	130	Extended	5
\.


--
-- Data for Name: release; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY release (project, name, plannedvelocity, releasedate, releasestartdate, state, theme, grossestimateconversionratio, listing_order, dataset) FROM stdin;
Platform	R4	\N	2019-12-30 00:00:00	2019-11-05 00:00:00	Planning	MVF 2.0 Launch	1	10	Extended
Online Store	R4	\N	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Medical Records App	2.3	10	2019-05-20 00:00:00	2019-03-26 00:00:00	Accepted	Client Profile Setup	1	44	Extended
Analytics Team	R4	140	2019-12-30 00:00:00	2019-11-05 00:00:00	Planning	MVF 2.0 Launch	1	4	Extended
Reseller Site	R4	\N	2019-12-30 00:00:00	2019-11-05 00:00:00	Planning	MVF 2.0 Launch	1	7	Extended
Reseller Site	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	27	Color Coded
Shopping Team	R1	40	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	2	Standard
Reseller Site	R2	\N	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Payment Team	R2	25	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Reseller Portal Team	R2	\N	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Platform	R2	\N	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Online Store	R3	\N	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Shopping Team	R3	36	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Consumer Site	R3	\N	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Analytics Team	R3	\N	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Fulfillment Team	R3	25	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Reseller Site	R3	\N	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Fulfillment Team	R2	25	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Payment Team	R3	20	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Reseller Portal Team	R3	\N	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Platform	R3	\N	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Consumer Site	R4	\N	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Analytics Team	R4	\N	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
API Team	R4	\N	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Platform	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	10	Color Coded
Fulfillment Team	R4	25	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	36	Color Coded
Analytics Team	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	34	Standard
Reseller Site	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	17	Color Coded
Analytics Team	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	34	Color Coded
Platform	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	20	Standard
Medical Records App	2.7	8	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Patient Notifications	1	43	Standard
Medical Records App	2.3	10	2019-05-15 10:59:00	2019-03-21 10:59:00	Accepted	Client Profile Setup	1	41	Color Coded
Consumer Site	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	23	Color Coded
API Team	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	35	Standard
Consumer Site	R2	\N	2019-09-09 00:00:00	2019-07-16 00:00:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	23	Extended
Reseller Portal Team	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	29	Color Coded
Online Store	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	31	Color Coded
Fulfillment Team	R4	25	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	36	Standard
Platform	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	30	Color Coded
Medical Records App	2.9	8	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	Mobile Access MVF 1.0	1	44	Standard
Fulfillment Team	R4	200	2019-12-30 00:00:00	2019-11-05 00:00:00	Planning	MVF 2.0 Launch	1	6	Extended
Reseller Portal Team	R3	140	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Personalization and Customization	1	19	Extended
Platform	R2	\N	2019-09-09 00:00:00	2019-07-16 00:00:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	30	Extended
Medical Records App	2.9	8	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Mobile Access MVF 1.0	1	41	Extended
Platform	R3	\N	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Personalization and Customization	1	20	Extended
Online Store	R2	\N	2019-09-09 00:00:00	2019-07-16 00:00:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	21	Extended
Reseller Portal Team	R4	140	2019-12-30 00:00:00	2019-11-05 00:00:00	Planning	MVF 2.0 Launch	1	9	Extended
API Team	R3	\N	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Analytics Team	R2	\N	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Reseller Site	R1	\N	2019-05-23 09:35:00	2019-03-29 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Payment Team	R1	\N	2019-05-23 09:35:00	2019-03-29 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
API Team	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	35	Color Coded
Reseller Site	R4	\N	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Payment Team	R4	20	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Reseller Portal Team	R4	\N	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Platform	R4	\N	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Medical Records App	2.3	10	2019-05-23 09:35:00	2019-03-29 09:35:00	Accepted	Client Profile Setup	1	\N	Summer
Medical Records App	2.5	8	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	New Patient Administration	1	\N	Summer
Medical Records App	2.7	8	2019-09-12 09:35:00	2019-07-19 09:35:00	Planning	Patient Notifications	1	\N	Summer
Medical Records App	2.9	8	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	Mobile Access MVF 1.0	1	\N	Summer
API Team	R2	35	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	15	Standard
Fulfillment Team	R3	25	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	26	Color Coded
API Team	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	5	Color Coded
Medical Records App	2.7	8	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Patient Notifications	1	43	Color Coded
Reseller Portal Team	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	19	Color Coded
Platform	R1	\N	2019-05-23 09:35:00	2019-03-29 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Consumer Site	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	3	Standard
Online Store	R2	\N	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Reseller Portal Team	R2	140	2019-09-09 00:00:00	2019-07-16 00:00:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	29	Extended
Payment Team	R4	200	2019-12-30 00:00:00	2019-11-05 00:00:00	Planning	MVF 2.0 Launch	1	8	Extended
Payment Team	R3	200	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Personalization and Customization	1	18	Extended
Payment Team	R2	25	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	18	Color Coded
Payment Team	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	8	Color Coded
Reseller Portal Team	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	9	Color Coded
Medical Records App	2.9	8	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	Mobile Access MVF 1.0	1	44	Color Coded
Reseller Portal Team	R1	\N	2019-05-23 09:35:00	2019-03-29 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Analytics Team	R1	\N	2019-05-23 09:35:00	2019-03-29 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Reseller Site	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	37	Color Coded
Payment Team	R4	20	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	38	Color Coded
Reseller Portal Team	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	39	Color Coded
Reseller Site	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	7	Standard
Online Store	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	1	Standard
Platform	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	20	Color Coded
Analytics Team	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	24	Color Coded
Analytics Team	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	4	Standard
Online Store	R3	\N	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Personalization and Customization	1	11	Extended
Reseller Site	R2	\N	2019-09-09 00:00:00	2019-07-16 00:00:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	27	Extended
Payment Team	R2	200	2019-09-09 00:00:00	2019-07-16 00:00:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	28	Extended
Shopping Team	R2	200	2019-09-09 00:00:00	2019-07-16 00:00:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	22	Extended
Shopping Team	R4	36	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Medical Records App	2.5	8	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	New Patient Administration	1	42	Color Coded
Analytics Team	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	4	Color Coded
Payment Team	R3	20	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	28	Color Coded
Platform	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	10	Standard
Online Store	R4	\N	2019-12-30 00:00:00	2019-11-05 00:00:00	Planning	MVF 2.0 Launch	1	1	Extended
Shopping Team	R4	200	2019-12-30 00:00:00	2019-11-05 00:00:00	Planning	MVF 2.0 Launch	1	2	Extended
Consumer Site	R4	\N	2019-12-30 00:00:00	2019-11-05 00:00:00	Planning	MVF 2.0 Launch	1	3	Extended
API Team	R4	140	2019-12-30 00:00:00	2019-11-05 00:00:00	Planning	MVF 2.0 Launch	1	5	Extended
Shopping Team	R3	200	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Personalization and Customization	1	12	Extended
Consumer Site	R3	\N	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Personalization and Customization	1	13	Extended
Analytics Team	R3	140	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Personalization and Customization	1	14	Extended
API Team	R3	140	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Personalization and Customization	1	15	Extended
Fulfillment Team	R3	200	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Personalization and Customization	1	16	Extended
Fulfillment Team	R2	25	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	16	Standard
Reseller Site	R3	\N	2019-11-04 00:00:00	2019-09-10 00:00:00	Planning	Personalization and Customization	1	17	Extended
API Team	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	25	Color Coded
Online Store	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	31	Standard
Fulfillment Team	R3	25	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	26	Standard
Reseller Site	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	27	Standard
Online Store	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	21	Color Coded
Reseller Site	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	7	Color Coded
Analytics Team	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	24	Standard
Consumer Site	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	13	Standard
Online Store	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	21	Standard
Online Store	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	11	Color Coded
Fulfillment Team	R1	10	2019-05-23 09:35:00	2019-03-29 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Analytics Team	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	14	Standard
Medical Records App	2.3	10	2019-05-15 10:59:00	2019-03-21 10:59:00	Accepted	Client Profile Setup	1	41	Standard
Online Store	R1	\N	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	31	Extended
Payment Team	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	8	Standard
Fulfillment Team	R2	25	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	16	Color Coded
Consumer Site	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	33	Color Coded
Platform	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	40	Color Coded
Shopping Team	R1	200	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	32	Extended
Consumer Site	R1	\N	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	33	Extended
Analytics Team	R1	140	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	34	Extended
API Team	R1	140	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	35	Extended
Fulfillment Team	R1	200	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	36	Extended
Reseller Site	R1	\N	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	37	Extended
Payment Team	R1	200	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	38	Extended
Reseller Portal Team	R1	140	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	39	Extended
Platform	R1	\N	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	40	Extended
Medical Records App	2.7	8	2019-09-09 00:00:00	2019-07-16 00:00:00	Planning	Patient Notifications	1	42	Extended
Medical Records App	2.5	8	2019-07-15 00:00:00	2019-05-21 00:00:00	Active	New Patient Administration	1	43	Extended
Reseller Portal Team	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	29	Standard
Medical Records App	2.5	8	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	New Patient Administration	1	42	Standard
Analytics Team	R2	140	2019-09-09 00:00:00	2019-07-16 00:00:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	24	Extended
API Team	R2	140	2019-09-09 00:00:00	2019-07-16 00:00:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	25	Extended
Fulfillment Team	R2	200	2019-09-09 00:00:00	2019-07-16 00:00:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	26	Extended
Shopping Team	R4	36	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	32	Color Coded
Online Store	R1	\N	2019-05-23 09:35:00	2019-03-29 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Shopping Team	R1	40	2019-05-23 09:35:00	2019-03-29 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Consumer Site	R1	\N	2019-05-23 09:35:00	2019-03-29 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
API Team	R1	\N	2019-05-23 09:35:00	2019-03-29 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Shopping Team	R2	32	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Consumer Site	R2	\N	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Fulfillment Team	R1	10	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	6	Color Coded
Shopping Team	R3	36	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	22	Standard
Platform	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	30	Standard
Shopping Team	R4	36	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	32	Standard
Consumer Site	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	33	Standard
Online Store	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	1	Color Coded
Fulfillment Team	R4	25	2019-11-07 09:35:00	2019-09-13 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Reseller Portal Team	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	9	Standard
Online Store	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	11	Standard
Shopping Team	R2	32	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	12	Standard
Reseller Site	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	37	Standard
Payment Team	R4	20	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	38	Standard
Reseller Portal Team	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	39	Standard
Platform	R4	\N	2019-10-30 10:59:00	2019-09-05 10:59:00	Planning	MVF 2.0 Launch	1	40	Standard
API Team	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	5	Standard
Fulfillment Team	R1	10	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	6	Standard
Reseller Site	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	17	Standard
Consumer Site	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	23	Standard
API Team	R2	35	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	15	Color Coded
Payment Team	R2	25	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	18	Standard
Reseller Portal Team	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	19	Standard
Shopping Team	R2	32	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	12	Color Coded
Consumer Site	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	13	Color Coded
Analytics Team	R2	\N	2019-07-10 10:59:00	2019-05-16 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	14	Color Coded
Shopping Team	R3	36	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	22	Color Coded
API Team	R2	35	2019-07-18 09:35:00	2019-05-24 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Shopping Team	R1	40	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	2	Color Coded
Consumer Site	R1	\N	2019-05-15 10:59:00	2019-03-21 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	3	Color Coded
API Team	R3	\N	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	25	Standard
Payment Team	R3	20	2019-09-04 10:59:00	2019-07-11 10:59:00	Planning	Personalization and Customization	1	28	Standard
\.


--
-- Data for Name: risk; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

COPY risk (name, release, iteration, schedulestate, project, owner, accepteddate, taskactualtotal, blocked, blockedreason, calculatedrisk, displaycolor, createdby, description, exposure, impact, milestones, notes, plannedestimate, probability, ready, resolution, response, sizeofloss, state, submittedby, listing_order, dataset) FROM stdin;
Lack of sales engagement	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	\N	\N	3 - Medium	\N	\N	\N	5 - High	FALSE	\N	Resolved	\N	\N	\N	6	Standard
Need to decide whether we get VPN access via Helpdesk or maintain our own servers.	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#848689	\N	\N	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Owned	\N	\N	\N	1	Extended
Tech Support readiness	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	Adequate support representation to handle issues/questions	\N	5 - High	\N	\N	\N	3 - Medium	FALSE	\N	Accepted	\N	Open	\N	2	Extended
Replicated integration surface area that can introduce scope growth	\N	\N	In-Progress	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	\N	\N	5 - High	\N	\N	\N	3 - Medium	FALSE	\N	Accepted	\N	Open	\N	3	Extended
Data movement: help wanted	\N	\N	Accepted	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	We need to figure out a path forward for data moves.	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Mitigated	\N	Open	\N	5	Extended
Lack of sales engagement	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	\N	\N	3 - Medium	\N	\N	\N	5 - High	FALSE	\N	Resolved	\N	\N	\N	6	Extended
Increased amount of production support	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	\N	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Accepted	\N	Open	\N	7	Extended
Dependency on another team to deliver on their functionality/Timeline discussion	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#848689	\N	\N	\N	5 - High	\N	\N	\N	1 - Low	FALSE	\N	Mitigated	\N	Open	\N	8	Extended
Help with Data Moves	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	Dev has the potential to be interrupted by unplanned support.	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Accepted	\N	\N	\N	9	Extended
Beta customers have not responded whether they would actively participate	\N	\N	Accepted	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	We do not know what issues can arise from customers actively testing and using the Beta and may need bandwidth after GA to do hot fixes	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Resolved	\N	Open	\N	4	Extended
Need to decide whether we get VPN access via Helpdesk or maintain our own servers.	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#848689	\N	\N	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Owned	\N	\N	\N	1	Standard
Tech Support readiness	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	Adequate support representation to handle issues/questions	\N	5 - High	\N	\N	\N	3 - Medium	FALSE	\N	Accepted	\N	Open	\N	2	Standard
Replicated integration surface area that can introduce scope growth	\N	\N	In-Progress	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	\N	\N	5 - High	\N	\N	\N	3 - Medium	FALSE	\N	Accepted	\N	Open	\N	3	Standard
Data movement: help wanted	\N	\N	Accepted	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	We need to figure out a path forward for data moves.	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Mitigated	\N	Open	\N	5	Standard
Increased amount of production support	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	\N	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Accepted	\N	Open	\N	7	Standard
Dependency on another team to deliver on their functionality/Timeline discussion	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#848689	\N	\N	\N	5 - High	\N	\N	\N	1 - Low	FALSE	\N	Mitigated	\N	Open	\N	8	Standard
Help with Data Moves	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	Dev has the potential to be interrupted by unplanned support.	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Accepted	\N	\N	\N	9	Standard
Data Deletion Requests delayed	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	Currently we are not planning any capacity to do any requested customer data changes.	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Accepted	\N	\N	\N	10	Standard
Beta customers have not responded whether they would actively participate	\N	\N	Accepted	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	We do not know what issues can arise from customers actively testing and using the Beta and may need bandwidth after GA to do hot fixes	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Resolved	\N	Open	\N	4	Standard
Data Deletion Requests delayed	\N	\N	Defined	Consumer Site	\N	\N	0	FALSE	\N	\N	#4a1d7e	\N	Currently we are not planning any capacity to do any requested customer data changes.	\N	1 - Low	\N	\N	\N	1 - Low	FALSE	\N	Accepted	\N	\N	\N	10	Extended
\.


--
-- Data for Name: story; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY story (name, schedulestate, kanbanstate, portfolioitem, project, iteration, owner, planestimate, release, description, ready, blocked, blockedreason, displaycolor, notes, listing_order, dataset) FROM stdin;
API for Basic Shipping	Defined	\N	API for Shipping	API Team	Iteration 8	\N	2	R3	For users who want to track a single package, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	1	Standard
API for Multi-Site Shipping	Defined	\N	API for Shipping	API Team	Iteration 8	\N	2	R3	For users who want to track multiple packages in a single order, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	2	Standard
Support USPS Shipping	Defined	\N	API for Shipping	API Team	\N	\N	\N	\N	\N	FALSE	FALSE	\N	\N	\N	3	Standard
Copy Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	4	Standard
Create Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	5	Standard
Delete Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	6	Standard
Save Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	7	Standard
Add error message if credit card number length is &lt; 16	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	tony@acme.com	1	R2	\N	FALSE	FALSE	\N	\N	\N	8	Standard
Purchase Multiple Items	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	9	Standard
Add order processing status on user profile page	Defined	\N	Credit card payments	Payment Team	\N	\N	13	\N	\N	FALSE	FALSE	\N	\N	\N	10	Standard
Add support for Discover card	Defined	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	11	Standard
Apple Pay	Accepted	Accepted	Credit card payments	Payment Team	Iteration 6	deb@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	12	Standard
Batch multiple payments for single transaction	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	\N	7	R2	\N	FALSE	FALSE	\N	\N	\N	13	Standard
Change Billing Address	Defined	\N	Credit card payments	Payment Team	\N	\N	\N	\N	As a returning customer, I want to be able to change my billing address.	FALSE	FALSE	\N	\N	\N	14	Standard
Change Method of Payment	Defined	\N	Credit card payments	Payment Team	\N	\N	3	\N	A customer should be able to change their method of payment for an order.	FALSE	FALSE	\N	\N	\N	15	Standard
Cross check purchases with fraud credit card list	Defined	\N	Credit card payments	Payment Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	16	Standard
Demo Support	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	\N	\N	R2	The demonstration instance of the application should be updated to reflect recent changes.	FALSE	FALSE	\N	\N	\N	17	Standard
Design spike	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	18	Standard
Generate audit report tempate for annual per-user purchase history.	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	19	Standard
Handle out of limit errors on credit card charges	Defined	\N	Credit card payments	Payment Team	Iteration 7	\N	13	R2	\N	FALSE	FALSE	\N	\N	\N	20	Standard
Install new 2048bit encryption key	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	dave@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	21	Standard
Log unsuccessful payment attempts	Defined	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	22	Standard
Pay with Points	Defined	\N	Credit card payments	Payment Team	Iteration 6	daphne@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	23	Standard
Payment - Supported Credit Cards	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	13	R2	Support a broad range of payment methods consistent with other e-commerce sites - including gift certificates	FALSE	FALSE	\N	\N	\N	24	Standard
align email 'importance field to case 'priority' field	Defined	\N	Email-to-case integration	API Team	Iteration 6	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	25	Standard
new case creation for case@domain.com	Defined	\N	Email-to-case integration	API Team	Iteration 8	peter@acme.com	5	R3	\N	FALSE	FALSE	\N	\N	\N	26	Standard
support case updates by matching subject line in reply emails	Defined	\N	Email-to-case integration	API Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	27	Standard
new case creation for case@domain.com	Accepted	Accepted	Extended Email-to-case integration	API Team	Iteration 6	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	28	Standard
support case updates by matching subject line in reply emails	Defined	Prioritized	Extended Email-to-case integration	API Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	29	Standard
Upgrade to React v0.4	Accepted	Accepted	Homepage	Shopping Team	Iteration 4	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	30	Standard
Resolve Performance Issues	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	31	Standard
Promotion codes	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	dudley@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	32	Standard
configure base drupal server	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	33	Standard
enable external api access	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	34	Standard
implement cms portal	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	35	Standard
Mauna Loa Hardening	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	36	Standard
Patch #1 - Mauna Loa	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	2	R1	\N	FALSE	FALSE	\N	\N	\N	37	Standard
plugins for external feed management	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	38	Standard
As a user I would like to create a chat	Accepted	Accepted	Online chat support	API Team	Iteration 4	dudley@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	39	Standard
As a user I would like to delete a chat	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	40	Standard
As a user I would like to search for chat history	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	41	Standard
Check the Status of Your Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	daniel@acme.com	5	R2	As a customer, I want the status of my order to be presented to me in the form of a simple report that is easily accessed on entrance to the shopping cart.  The report should include details regarding shipping information (tracking numbers and estimated arrival dates), the number of items I purchased (quantity and unit price), as well as the total amount spent.	FALSE	FALSE	\N	\N	\N	42	Standard
Combine Orders	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	For multiple orders with the same destination and expected ship dates within 24 hours of each other, the shipping department should combine the orders and ship them as one.	FALSE	FALSE	\N	\N	\N	43	Standard
Create Deployment Scripts	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 4	tara@acme.com	3	R1	Create Deployment scripts for the first release	FALSE	FALSE	\N	\N	\N	44	Standard
Customizing Product List	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	8	\N	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	45	Standard
Order Modification	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	Within 24 hours of the expected shipping date, a customer should be able to modify his/her order with no repercussions.	FALSE	FALSE	\N	\N	\N	46	Standard
Provide connection to CSPAN verification service.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	47	Standard
Provide failover connection to G5 verification service.	Defined	\N	Order Status 2.0	Shopping Team	Iteration 6	diane@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	48	Standard
Return Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	4	\N	A customer should be able to return unwanted or defective items.	FALSE	FALSE	\N	\N	\N	49	Standard
Search for Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	A user should able to search for items using a keyword.	FALSE	FALSE	\N	\N	\N	50	Standard
Send failure logs to CSPAN verification service nightly.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	51	Standard
Send success email notification after adding credit card to profile.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	52	Standard
Send user notification upon request for shipment.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	53	Standard
Music Streaming	Defined	\N	Order Status 2.0	Shopping Team	Iteration 8	dudley@acme.com	8	R2	<p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">User attempts to stream a song<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Add song to download list<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi Capable?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to Wifi?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi connection fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 4g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">4g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 3g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">3g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wait for buffer<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Stream successful<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Music plays<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Return to home screen<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'no connection fast enough available'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'stream interrupted'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Is the phone a Nokia?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Phone is destroyed<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wall is destroyed</span></p>	FALSE	FALSE	\N	\N	\N	54	Standard
Cancel the Order	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	2	R2	Investigate architecture approaches to order cancellation process.<br /><br /><u>Acceptance Criteria</u>:<ul><li>Order must not be shipped</li><li>credit card refunded</li><li>Fulfillment process reversed</li><li>restocking fee applied</li><li>undo 'cancel' functionality</li></ul><u>Definition of Done</u>:<ul><li>2 POC approaches</li><li>Timebox approach to 8 hours each spike</li><li>Estimate for each approach at task level</li><li>demo simple scenario</li></ul>	FALSE	FALSE	\N	\N	\N	55	Standard
Spike: Tax table/calculations	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	\N	\N	The development team should research possible implementations and problems arising from integrating tax calculations into the purchasing system.	FALSE	FALSE	\N	\N	\N	56	Standard
Support backorder email notification	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	57	Standard
Support out of stock email notification.	Defined	Ready for Dev	Order Status 2.0	Shopping Team	\N	\N	21	\N	\N	FALSE	FALSE	\N	\N	\N	58	Standard
Update user profile purchase history upon settlement.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	59	Standard
Add a single item to an Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	dudley@acme.com	2	R2	\N	FALSE	FALSE	\N	\N	\N	60	Standard
2-3 Day Shipping	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	3	R2	A user should be allowed to select 2-3 day shipping for their order.	FALSE	FALSE	\N	\N	\N	61	Standard
Calculate Split Shipping	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	5	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	FALSE	\N	\N	\N	62	Standard
Data fields for Shipping information	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	2	R2	The customer should enter basic shipping information	FALSE	FALSE	\N	\N	\N	63	Standard
Overnight Shipping	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 6	drew@acme.com	2	R2	A user should be allowed to select overnight shipping for their order.	FALSE	FALSE	\N	\N	\N	64	Standard
Ship Multi-Site Orders	In-Progress	In Dev	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	1	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	TRUE	\N	\N	\N	65	Standard
Ship Single-Site Order	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	5	R2	On completion of a transaction, the shipping department should ship the items to the appropriate destination	FALSE	FALSE	\N	\N	\N	66	Standard
Update Shipping System for Each Order	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	3	R2	In order to keep all of the shipping information consistent, implement link to our backend shipping system.	FALSE	FALSE	\N	\N	\N	67	Standard
Display confirmation code on checkout page	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	68	Standard
Send email receipt	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 3	daniel@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	69	Standard
Add CVVC to checkout path	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	dudley@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	70	Standard
Combine by amount	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	71	Standard
Combine by billing address	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	\N	R1	\N	FALSE	FALSE	\N	\N	\N	72	Standard
Payment - Promotional Codes	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	Once a user has entered a promotional code for an order, the discount should be reflected in the checkout total.	FALSE	FALSE	\N	\N	\N	73	Standard
Spike: Purchase Your Items	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	daniel@acme.com	3	R1	As a user I want to store things in my shopping cart and see them next time I am logged in, so I can save an order for payday.<br /><br />Once a user enters an item into their shopping cart, persist that information in their profile so that it is available next time they login.<br /><br /><u>Acceptance Criteria</u>: <ul> <li>User logged in adds to cart, these items stay associated with user until removed or purchased</li> <li>User logs in with items in shopping cart and items before login are added to 'stored' cart</li> <li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li> </ul> <u>Definition of Done</u>: <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	74	Standard
Support $50 certificates	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	75	Standard
Support increasing item count within cart	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 2	daniel@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	76	Standard
Move Server Room	In-Progress	In Dev	Rearchitect User Management	API Team	Iteration 5	\N	5	R2	In order to provide redundant power and network connections, move to an offsite hosting provider	FALSE	FALSE	\N	\N	\N	77	Standard
Move to Oracle	Accepted	Accepted	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	To produce a stable and performant experience for our customers, move to an integrated Oracle database	FALSE	FALSE	\N	\N	\N	78	Standard
System should support 10,000 concurrent users	Accepted	Accepted	Rearchitect User Management	API Team	\N	dora@acme.com	3	\N	In order to prepare for company growth, the system should perform appropriately for loads of up to 10,000 concurrent users.	FALSE	FALSE	\N	\N	\N	79	Standard
Website must be available 24x7	Completed	Ready for Acceptance	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	In order for customers to be able to order any time they want, the website should be available 24 hours a day, 7 days a week.	FALSE	FALSE	\N	\N	\N	80	Standard
As a user I would like to clone a profile	Defined	Ready for Dev	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	81	Standard
Create a Profile	Accepted	Accepted	Saving profile	Shopping Team	Iteration 5	dudley@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	82	Standard
As a user I would like to delete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	83	Standard
As a user I would like to save a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	84	Standard
As a user I would like to undelete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	85	Standard
Combine by date	Accepted	Accepted	Search for products	Shopping Team	Iteration 4	daniel@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	86	Standard
Combine by shipping address	Accepted	Accepted	Search for products	Shopping Team	Iteration 3	diane@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	87	Standard
Add Single Item	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	drew@acme.com	13	R2	\N	FALSE	FALSE	\N	\N	\N	88	Standard
Clone contents from previous cart	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	89	Standard
Combine Multiple Items	Defined	Prioritized	Shopping Cart	Shopping Team	Iteration 7	\N	1	R2	\N	FALSE	FALSE	\N	\N	\N	90	Standard
Customize product list	Defined	Prioritized	Shopping Cart	Fulfillment Team	Iteration 7	\N	\N	R2	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	91	Standard
Daily deals	Defined	\N	Shopping Cart	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	92	Standard
one-click checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	93	Standard
Payment - Gift Certificates	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	dawn@acme.com	4	R2	A customer should be able to pay for selected items using a gift certificate.	FALSE	FALSE	\N	\N	\N	94	Standard
Recent Purchases View	Defined	Ready for Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	\N	R2	As a user I should be allowed to select overnight shipping for their order so I can pay to get my stuff as fast as possible.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li>User is defaulted to standard First Class USPS shipping</li> <li>User can change shipping options to Overnight (FEDEX)</li> <li>User see's estimated arrival date of order when changing options</li> <li>User sees a the calculated cost of Overnighting before moving to the payment screens</li>   </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	95	Standard
Save cart for future checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	96	Standard
Shop for Items	Completed	Ready for Acceptance	Shopping Cart	Shopping Team	Iteration 6	dudley@acme.com	5	R2	A customer should be able to browse the list of all available products to find the items they wish to purchase. The system should provide suggestions to the customer based on previous purchases and items currently in his/her shopping cart.	TRUE	FALSE	\N	\N	\N	97	Standard
Purchase Your Items	In-Progress	In Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	7	R2	<p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0bb795425">As a customer, I want to be able to purchase items online and to be prompted to enter payment information as well as their preferred shipping method and destination, so that I can pay and have my stuff shipped to me.</span><span class="rally-rte-class-0b1c8cea2">&nbsp;&nbsp;</span></p><p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f"><img src="https://lh3.googleusercontent.com/yHah82A1dxoT2DitB296WnXCCcUJDzz0QCAVQqBnVSul0QQyXBUoLVJLHGmS8DAzbYO_V8PuQXKPq1qZOggvVFY2u2_WYnQrUi_8_fLdimiqse3_aESN4pOVJzeIa_clOo10QOY" width="243px;" height="44px;" class="CToWUd rally-rte-class-0e6d61dd9" /></span></p><div><b><span class="rally-rte-class-0bd330b21">Acceptance Criteria</span><span class="rally-rte-class-0b1c8cea2">:</span></b></div><ul><li>User logged in adds to cart, these items stay associated with user until removed or purchased</li><li>User logs in with items in shopping cart and items selected before login are added to 'stored' cart</li><li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li></ul><p class="rally-rte-class-03221dadb"><b><span class="rally-rte-class-0bd330b21">Definition of Done</span><span class="rally-rte-class-0b1c8cea2">:</span></b></p><ul><li>Code Checked In</li><li>Unit Tested</li><li>Accept Test Passed</li><li>No Defects</li><li>Accept Tests added to automated framework</li><li>Online help docs updated</li></ul><ul> </ul>	FALSE	TRUE	Test server is down.  IT said it will be back up @ 4pm ET.	\N	\N	98	Standard
As a user I would like to delete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	99	Standard
As a user I would like to save history	Accepted	Accepted	Shopping history	Shopping Team	Iteration 5	dudley@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	100	Standard
As a user I would like to search for history	Defined	\N	Shopping history	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	101	Standard
As a user I would like to send history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	102	Standard
As a user I would like to sort history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	103	Standard
As a user I would like to undelete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	104	Standard
As a user I would like to create preferences	Accepted	Accepted	Shopping preferences	Shopping Team	Iteration 5	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	105	Standard
As a user I would like to save prefereneces	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	106	Standard
As a user I would like to search for preferences	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	107	Standard
As a user I would like to reapply for offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 8	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	108	Standard
As a user I would like to receive offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	\N	R2	\N	FALSE	FALSE	\N	\N	\N	109	Standard
As a user I would like to remove offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	110	Standard
As a user I would like to subscribe to offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	111	Standard
As a user I would like to delete data	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	112	Standard
As a user I would like to post attributes	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	113	Standard
As a user I would like to post tickets	Defined	\N	Support write API	API Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	114	Standard
As a user I would like to update data	Defined	\N	Support write API	API Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	115	Standard
As a user I would like to update tickets	Defined	\N	Support write API	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	116	Standard
Spike: Basic profile form	Defined	\N	User Profile	Shopping Team	Iteration 8	\N	2	R3	\N	FALSE	FALSE	\N	\N	\N	117	Standard
Find My Orders	Defined	\N	User Profile	Shopping Team	Iteration 7	\N	3	R2	As a customer, I would like to be emailed with daily updates that contain package tracking information.	FALSE	FALSE	\N	\N	\N	118	Standard
Log-in to Secured Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	dudley@acme.com	5	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	119	Standard
Log-off Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	daniel@acme.com	4	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	120	Standard
Show history of account access.	Defined	\N	User Profile	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	121	Standard
Validate Customer Contact/Shipping info	Accepted	Accepted	User Profile	Shopping Team	Iteration 6	daniel@acme.com	5	R2	As a customer, I want my email and shipping addresses validated to make me known to the system, and to add another layer of protection against fraud.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li> Email address validated  <ul> <li>validate format</li> <li>email them a message then have them confirm by clicking a link</li> </ul> </li> <li> Check Shipping  <ul> <li>Address must exist validate against USPS DFS2 Validation DB</li> </ul> </li> <li>Perform Validation upon creation/change of info and each order placed</li> </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Oneline help docs updated</li> </ul>	FALSE	FALSE	\N	\N	\N	122	Standard
View By Order	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	\N	3	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	123	Standard
View or Change your One-Click settings	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	\N	\N	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	124	Standard
Search for packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	125	Standard
Auto delete packing slips after 6 months	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 2	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	126	Standard
Reactivate packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	127	Standard
Return labels printing first/last name in wrong order.	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	128	Standard
Implement barcode tracking for return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	129	Standard
Apply credits to account from valid return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	130	Standard
Update warehouse stock counts	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	131	Standard
Email notifications upon successful return processing	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	132	Standard
Implement self printed return receipts	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	5	R1	\N	FALSE	\N	\N	\N	\N	133	Standard
Show return status on order history page	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	3	R1	\N	FALSE	\N	\N	\N	\N	134	Standard
Mobile notification of return status	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	8	R1	\N	FALSE	\N	\N	\N	\N	135	Standard
Prescription Administration Updates	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a web site visitor, I want to browse through the inventory of available safaris so that I can pick one that fits my time, budget and interest.	\N	FALSE	\N	\N	\N	136	Standard
Physician Chat Environment	Completed	Ready for Acceptance	\N	Medical Records App	Iteration 4 - New Patients	\N	\N	2.5	As a web site visitor, I want to view upcoming safari availability so that I can choose an available date.	\N	FALSE	\N	\N	\N	137	Standard
Register for New Patient Service	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a safari-taker, I want to sign-up for a Frequent Adventurer Card so I can earn rewards.	\N	TRUE	Test Server Failure	\N	\N	138	Standard
Update Patient Records	Accepted	Accepted	\N	Medical Records App	Iteration 4 - New Patients	\N	8	2.5	As a safari-taker, I want to view any pictures taken and be able to order reprints so that I can remember my trip.	\N	FALSE	\N	\N	\N	139	Standard
Admin - Accept new patients	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	Admin - Accept new patients	\N	FALSE	\N	\N	\N	140	Standard
Validate Patient Data for EU Patients	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	3	2.5	\N	\N	\N	\N	\N	\N	141	Standard
Support for UK National Insurance Number Format	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	\N	2.5	\N	\N	\N	\N	\N	\N	142	Standard
Physician Application - confirm prescription data	Defined	Prioritized	\N	Medical Records App	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	143	Standard
As a user I would like to send history	Defined	\N	Shopping history	Fulfillment Team	Iteration 3	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	103	Extended
Apple Pay	Defined	Prioritized	Credit card payments	Payment Team	Iteration 5	deb@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	12	Extended
API for Basic Shipping	Defined	Prioritized	API for Shipping	API Team	Iteration 9	\N	2	R3	For users who want to track a single package, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	1	Extended
API for Multi-Site Shipping	Defined	Prioritized	API for Shipping	API Team	Iteration 9	\N	2	R3	For users who want to track multiple packages in a single order, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	2	Extended
Support USPS Shipping	Defined	\N	API for Shipping	API Team	\N	\N	\N	\N	\N	FALSE	FALSE	\N	\N	\N	3	Extended
Copy Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	4	Extended
Create Shopping Cart	Defined	Prioritized	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	5	Extended
Delete Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	6	Extended
Save Shopping Cart	Defined	Prioritized	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	7	Extended
Add error message if credit card number length is &lt; 16	Defined	Prioritized	Credit card payments	Payment Team	Iteration 5	tony@acme.com	1	R2	\N	FALSE	FALSE	\N	\N	\N	8	Extended
Purchase Multiple Items	Defined	\N	Credit card payments	Payment Team	\N	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	9	Extended
Add order processing status on user profile page	Defined	\N	Credit card payments	Payment Team	\N	\N	13	\N	\N	FALSE	FALSE	\N	\N	\N	10	Extended
Add support for Discover card	Defined	Prioritized	Credit card payments	Payment Team	Iteration 5	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	11	Extended
Batch multiple payments for single transaction	Defined	Prioritized	Credit card payments	Payment Team	Iteration 6	\N	7	R2	\N	FALSE	FALSE	\N	\N	\N	13	Extended
Change Billing Address	Defined	\N	Credit card payments	Payment Team	\N	\N	\N	\N	As a returning customer, I want to be able to change my billing address.	FALSE	FALSE	\N	\N	\N	14	Extended
Change Method of Payment	Defined	\N	Credit card payments	Payment Team	\N	\N	3	\N	A customer should be able to change their method of payment for an order.	FALSE	FALSE	\N	\N	\N	15	Extended
Cross check purchases with fraud credit card list	Defined	\N	Credit card payments	Payment Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	16	Extended
Demo Support	Defined	Prioritized	Credit card payments	Payment Team	Iteration 6	\N	\N	R2	The demonstration instance of the application should be updated to reflect recent changes.	FALSE	FALSE	\N	\N	\N	17	Extended
Design spike	Defined	Prioritized	Credit card payments	Payment Team	Iteration 6	deb@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	18	Extended
Generate audit report tempate for annual per-user purchase history.	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	19	Extended
Handle out of limit errors on credit card charges	Defined	Prioritized	Credit card payments	Payment Team	Iteration 6	\N	13	R2	\N	FALSE	FALSE	\N	\N	\N	20	Extended
Install new 2048bit encryption key	Defined	Prioritized	Credit card payments	Payment Team	Iteration 6	dave@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	21	Extended
Log unsuccessful payment attempts	Defined	Prioritized	Credit card payments	Payment Team	Iteration 6	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	22	Extended
Pay with Points	Defined	Prioritized	Credit card payments	Payment Team	Iteration 6	daphne@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	23	Extended
Payment - Supported Credit Cards	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	deb@acme.com	13	R2	Support a broad range of payment methods consistent with other e-commerce sites - including gift certificates	FALSE	FALSE	\N	\N	\N	24	Extended
align email 'importance field to case 'priority' field	Defined	Prioritized	Email-to-case integration	API Team	Iteration 7	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	25	Extended
new case creation for case@domain.com	Defined	Prioritized	Email-to-case integration	API Team	Iteration 7	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	26	Extended
support case updates by matching subject line in reply emails	Defined	\N	Email-to-case integration	API Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	27	Extended
New case creation for case@domain.com	Accepted	Accepted	Extended Email-to-case integration	API Team	Iteration 2	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	28	Extended
support case updates by matching subject line in reply emails	Defined	Prioritized	Extended Email-to-case integration	API Team	Iteration 3	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	29	Extended
Upgrade to React v0.4	Defined	Prioritized	Homepage	Payment Team	Iteration 4	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	30	Extended
Resolve Performance Issues	Defined	Prioritized	Homepage	Payment Team	Iteration 4	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	31	Extended
Promotion codes	Defined	Prioritized	Homepage	Payment Team	Iteration 4	dudley@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	32	Extended
Configure base drupal server	Defined	Prioritized	Knowledgebase	Fulfillment Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	33	Extended
Enable external api access	Defined	Prioritized	Knowledgebase	Fulfillment Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	34	Extended
Implement cms portal	Defined	Prioritized	Knowledgebase	Fulfillment Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	35	Extended
Mauna Loa Hardening	Defined	Prioritized	Knowledgebase	Fulfillment Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	36	Extended
Patch #1 - Mauna Loa	Defined	Prioritized	Knowledgebase	Fulfillment Team	Iteration 4	\N	2	R1	\N	FALSE	FALSE	\N	\N	\N	37	Extended
Plugins for external feed management	Defined	Prioritized	Knowledgebase	Fulfillment Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	38	Extended
As a user I would like to create a chat	Defined	Prioritized	Online chat support	API Team	Iteration 4	dudley@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	39	Extended
As a user I would like to delete a chat	Defined	\N	Online chat support	API Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	40	Extended
As a user I would like to search for chat history	Defined	\N	Online chat support	API Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	41	Extended
Check the Status of Your Order	Accepted	Accepted	Order Status 2.0	Payment Team	Iteration 1	daniel@acme.com	5	R1	As a customer, I want the status of my order to be presented to me in the form of a simple report that is easily accessed on entrance to the shopping cart.  The report should include details regarding shipping information (tracking numbers and estimated arrival dates), the number of items I purchased (quantity and unit price), as well as the total amount spent.	FALSE	FALSE	\N	\N	\N	42	Extended
Combine Orders	Defined	\N	Order Status 2.0	Payment Team	Iteration 4	\N	3	R1	For multiple orders with the same destination and expected ship dates within 24 hours of each other, the shipping department should combine the orders and ship them as one.	FALSE	FALSE	\N	\N	\N	43	Extended
As a user I would like to delete history	Defined	\N	Shopping history	Fulfillment Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	100	Extended
Historic orders view	Defined	Prioritized	Shopping Cart	Shopping Team	Iteration 4	daniel@acme.com	\N	R1	As a user I should be allowed to select overnight shipping for their order so I can pay to get my stuff as fast as possible.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li>User is defaulted to standard First Class USPS shipping</li> <li>User can change shipping options to Overnight (FEDEX)</li> <li>User see's estimated arrival date of order when changing options</li> <li>User sees a the calculated cost of Overnighting before moving to the payment screens</li>   </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	44	Extended
Create Deployment Scripts	Defined	Prioritized	Order Status 2.0	Payment Team	Iteration 4	tara@acme.com	3	R1	Create Deployment scripts for the first release	FALSE	FALSE	\N	\N	\N	45	Extended
Customizing Product List	Defined	\N	Order Status 2.0	Payment Team	Iteration 4	\N	8	R1	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	46	Extended
Order Modification	Defined	\N	Order Status 2.0	Payment Team	Iteration 4	\N	3	R1	Within 24 hours of the expected shipping date, a customer should be able to modify his/her order with no repercussions.	FALSE	FALSE	\N	\N	\N	47	Extended
Provide connection to CSPAN verification service.	Defined	Prioritized	Order Status 2.0	Payment Team	Iteration 3	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	48	Extended
Provide failover connection to G5 verification service.	Defined	Prioritized	Order Status 2.0	Payment Team	Iteration 2	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	49	Extended
Return Items	Defined	\N	Order Status 2.0	Payment Team	Iteration 3	\N	4	R1	A customer should be able to return unwanted or defective items.	FALSE	FALSE	\N	\N	\N	50	Extended
Search for Items	Defined	\N	Order Status 2.0	Payment Team	Iteration 3	\N	3	R1	A user should able to search for items using a keyword.	FALSE	FALSE	\N	\N	\N	51	Extended
Send failure logs to CSPAN verification service nightly.	Defined	Prioritized	Order Status 2.0	Payment Team	Iteration 3	\N	2	R1	\N	FALSE	FALSE	\N	\N	\N	52	Extended
Send success email notification after adding credit card to profile.	Defined	Prioritized	Order Status 2.0	Payment Team	Iteration 3	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	53	Extended
Send user notification upon request for shipment.	Defined	\N	Order Status 2.0	Payment Team	Iteration 3	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	54	Extended
Music Streaming	Defined	\N	Order Status 2.0	Payment Team	Iteration 3	dudley@acme.com	8	R1	<p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">User attempts to stream a song<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Add song to download list<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi Capable?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to Wifi?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi connection fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 4g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">4g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 3g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">3g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wait for buffer<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Stream successful<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Music plays<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Return to home screen<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'no connection fast enough available'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'stream interrupted'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Is the phone a Nokia?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Phone is destroyed<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wall is destroyed</span></p>	FALSE	FALSE	\N	\N	\N	55	Extended
Cancel the Order	Defined	Prioritized	Order Status 2.0	Payment Team	Iteration 2	\N	2	R1	Investigate architecture approaches to order cancellation process.<br /><br /><u>Acceptance Criteria</u>:<ul><li>Order must not be shipped</li><li>credit card refunded</li><li>Fulfillment process reversed</li><li>restocking fee applied</li><li>undo 'cancel' functionality</li></ul><u>Definition of Done</u>:<ul><li>2 POC approaches</li><li>Timebox approach to 8 hours each spike</li><li>Estimate for each approach at task level</li><li>demo simple scenario</li></ul>	FALSE	FALSE	\N	\N	\N	56	Extended
Spike: Tax table/calculations	Defined	\N	Order Status 2.0	Payment Team	Iteration 2	\N	\N	R1	The development team should research possible implementations and problems arising from integrating tax calculations into the purchasing system.	FALSE	FALSE	\N	\N	\N	57	Extended
Support backorder email notification	Defined	Prioritized	Order Status 2.0	Payment Team	Iteration 3	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	58	Extended
Support out of stock email notification.	Defined	Prioritized	Order Status 2.0	Payment Team	Iteration 2	\N	21	R1	\N	FALSE	FALSE	\N	\N	\N	59	Extended
Update user profile purchase history upon settlement.	Defined	\N	Order Status 2.0	Payment Team	Iteration 2	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	60	Extended
Add a single item to an Order	Accepted	Accepted	Order Status 2.0	Payment Team	Iteration 1	dudley@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	61	Extended
2-3 Day Shipping	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 7	tony@acme.com	3	R2	A user should be allowed to select 2-3 day shipping for their order.	FALSE	FALSE	\N	\N	\N	62	Extended
Calculate Split Shipping	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 7	tony@acme.com	5	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	FALSE	\N	\N	\N	63	Extended
Data fields for Shipping information	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 7	\N	2	\N	The customer should enter basic shipping information	FALSE	FALSE	\N	\N	\N	64	Extended
Overnight Shipping	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 7	drew@acme.com	2	R2	A user should be allowed to select overnight shipping for their order.	FALSE	FALSE	\N	\N	\N	65	Extended
Ship Multi-Site Orders	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 7	dawn@acme.com	1	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	TRUE	\N	\N	\N	66	Extended
Ship Single-Site Order	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 7	\N	5	\N	On completion of a transaction, the shipping department should ship the items to the appropriate destination	FALSE	FALSE	\N	\N	\N	67	Extended
Update Shipping System for Each Order	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 7	dawn@acme.com	3	R2	In order to keep all of the shipping information consistent, implement link to our backend shipping system.	FALSE	FALSE	\N	\N	\N	68	Extended
Display confirmation code on checkout page	Defined	Prioritized	Product purchase confirmation	Payment Team	Iteration 3	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	69	Extended
Send email receipt	Defined	Prioritized	Product purchase confirmation	Payment Team	Iteration 3	daniel@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	70	Extended
Add CVVC to checkout path	Defined	Prioritized	Purchase single product	Fulfillment Team	Iteration 2	dudley@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	71	Extended
Combine by amount	Defined	Prioritized	Purchase single product	Payment Team	Iteration 2	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	72	Extended
Combine by billing address	Defined	Prioritized	Purchase single product	Payment Team	Iteration 2	diane@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	73	Extended
Payment - Promotional Codes	Defined	Prioritized	Purchase single product	Fulfillment Team	Iteration 2	diane@acme.com	3	R1	Once a user has entered a promotional code for an order, the discount should be reflected in the checkout total.	FALSE	FALSE	\N	\N	\N	74	Extended
Spike: Purchase Your Items	Defined	Prioritized	Purchase single product	Shopping Team	Iteration 3	daniel@acme.com	3	R1	As a user I want to store things in my shopping cart and see them next time I am logged in, so I can save an order for payday.<br /><br />Once a user enters an item into their shopping cart, persist that information in their profile so that it is available next time they login.<br /><br /><u>Acceptance Criteria</u>: <ul> <li>User logged in adds to cart, these items stay associated with user until removed or purchased</li> <li>User logs in with items in shopping cart and items before login are added to 'stored' cart</li> <li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li> </ul> <u>Definition of Done</u>: <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	75	Extended
Support $50 certificates	Defined	Prioritized	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	76	Extended
Support increasing item count within cart	Defined	Prioritized	Purchase single product	Shopping Team	Iteration 3	daniel@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	77	Extended
Move Server Room	Defined	Prioritized	Rearchitect User Management	API Team	Iteration 7	\N	5	\N	In order to provide redundant power and network connections, move to an offsite hosting provider	FALSE	FALSE	\N	\N	\N	78	Extended
As a user I would like to subscribe to offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 8	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	112	Extended
Move to Oracle	Defined	Prioritized	Rearchitect User Management	API Team	Iteration 7	dora@acme.com	3	R2	To produce a stable and performant experience for our customers, move to an integrated Oracle database	FALSE	FALSE	\N	\N	\N	79	Extended
System should support 10,000 concurrent users	Defined	Prioritized	Rearchitect User Management	API Team	\N	dora@acme.com	3	R2	In order to prepare for company growth, the system should perform appropriately for loads of up to 10,000 concurrent users.	FALSE	FALSE	\N	\N	\N	80	Extended
Website must be available 24x7	Defined	Prioritized	Rearchitect User Management	API Team	Iteration 8	dora@acme.com	3	R2	In order for customers to be able to order any time they want, the website should be available 24 hours a day, 7 days a week.	FALSE	FALSE	\N	\N	\N	81	Extended
As a user I would like to clone a profile	Defined	Prioritized	Saving profile	Shopping Team	Iteration 4	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	82	Extended
Create a Profile	Accepted	Accepted	Saving profile	Shopping Team	Iteration 1	dudley@acme.com	7	R1	\N	FALSE	FALSE	\N	\N	\N	83	Extended
As a user I would like to delete a profile	Defined	\N	Saving profile	Shopping Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	84	Extended
As a user I would like to save a profile	Defined	\N	Saving profile	Shopping Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	85	Extended
As a user I would like to undelete a profile	Defined	\N	Saving profile	Shopping Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	86	Extended
Combine by date	Defined	Prioritized	Search for products	Payment Team	Iteration 4	daniel@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	87	Extended
Combine by shipping address	Defined	Prioritized	Search for products	Payment Team	Iteration 4	diane@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	88	Extended
Add Single Item	Completed	Accepted	Shopping Cart	Fulfillment Team	Iteration 1	drew@acme.com	13	R1	\N	FALSE	FALSE	\N	\N	\N	89	Extended
Clone contents from previous cart	Defined	\N	Shopping Cart	Shopping Team	Iteration 3	\N	2	R1	\N	FALSE	FALSE	\N	\N	\N	90	Extended
Combine Multiple Items	Defined	Prioritized	Shopping Cart	Shopping Team	Iteration 3	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	91	Extended
Customize product list	Defined	Prioritized	Shopping Cart	Fulfillment Team	Iteration 3	\N	3	R1	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	92	Extended
Daily deals	Defined	\N	Shopping Cart	Shopping Team	Iteration 3	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	93	Extended
one-click checkout	Defined	\N	Shopping Cart	Shopping Team	Iteration 3	\N	2	R1	\N	FALSE	FALSE	\N	\N	\N	94	Extended
Payment - Gift Certificates	Accepted	Accepted	Shopping Cart	Shopping Team	Iteration 1	dawn@acme.com	4	R1	A customer should be able to pay for selected items using a gift certificate.	FALSE	FALSE	\N	\N	\N	95	Extended
Recent Purchases View	Defined	Ready for Dev	Shopping Cart	Shopping Team	Iteration 2	daniel@acme.com	3	R1	As a user I should be allowed to select overnight shipping for their order so I can pay to get my stuff as fast as possible.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li>User is defaulted to standard First Class USPS shipping</li> <li>User can change shipping options to Overnight (FEDEX)</li> <li>User see's estimated arrival date of order when changing options</li> <li>User sees a the calculated cost of Overnighting before moving to the payment screens</li>   </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	96	Extended
Save cart for future checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	97	Extended
Shop for Items	Completed	Ready for Acceptance	Shopping Cart	Shopping Team	Iteration 2	dudley@acme.com	5	R1	A customer should be able to browse the list of all available products to find the items they wish to purchase. The system should provide suggestions to the customer based on previous purchases and items currently in his/her shopping cart.	TRUE	FALSE	\N	\N	\N	98	Extended
Purchase Your Items	In-Progress	In Dev	Shopping Cart	Shopping Team	Iteration 2	daniel@acme.com	7	R1	<p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0bb795425">As a customer, I want to be able to purchase items online and to be prompted to enter payment information as well as their preferred shipping method and destination, so that I can pay and have my stuff shipped to me.</span><span class="rally-rte-class-0b1c8cea2">&nbsp;&nbsp;</span></p><p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f"><img src="https://lh3.googleusercontent.com/yHah82A1dxoT2DitB296WnXCCcUJDzz0QCAVQqBnVSul0QQyXBUoLVJLHGmS8DAzbYO_V8PuQXKPq1qZOggvVFY2u2_WYnQrUi_8_fLdimiqse3_aESN4pOVJzeIa_clOo10QOY" width="243px;" height="44px;" class="CToWUd rally-rte-class-0e6d61dd9" /></span></p><div><b><span class="rally-rte-class-0bd330b21">Acceptance Criteria</span><span class="rally-rte-class-0b1c8cea2">:</span></b></div><ul><li>User logged in adds to cart, these items stay associated with user until removed or purchased</li><li>User logs in with items in shopping cart and items selected before login are added to 'stored' cart</li><li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li></ul><p class="rally-rte-class-03221dadb"><b><span class="rally-rte-class-0bd330b21">Definition of Done</span><span class="rally-rte-class-0b1c8cea2">:</span></b></p><ul><li>Code Checked In</li><li>Unit Tested</li><li>Accept Test Passed</li><li>No Defects</li><li>Accept Tests added to automated framework</li><li>Online help docs updated</li></ul><ul> </ul>	FALSE	TRUE	Test server is down.  IT said it will be back up @ 4pm ET.	\N	\N	99	Extended
As a user I would like to save history	Completed	Accepted	Shopping history	Fulfillment Team	Iteration 1	dudley@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	101	Extended
As a user I would like to search for history	Defined	\N	Shopping history	Fulfillment Team	Iteration 3	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	102	Extended
As a user I would like to sort history	Defined	\N	Shopping history	Fulfillment Team	Iteration 3	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	104	Extended
As a user I would like to undelete history	Defined	\N	Shopping history	Fulfillment Team	Iteration 3	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	105	Extended
As a user I would like to create preferences	Defined	Prioritized	Shopping preferences	Shopping Team	Iteration 8	diane@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	106	Extended
As a user I would like to save prefereneces	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	107	Extended
As a user I would like to search for preferences	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	108	Extended
As a user I would like to reapply for offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 8	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	109	Extended
As a user I would like to receive offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 8	\N	\N	R2	\N	FALSE	FALSE	\N	\N	\N	110	Extended
As a user I would like to remove offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 8	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	111	Extended
As a user I would like to delete data	Accepted	Accepted	Support write API	API Team	Iteration 1	peter@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	113	Extended
As a user I would like to post attributes	Accepted	Accepted	Support write API	API Team	Iteration 1	peter@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	114	Extended
As a user I would like to post tickets	Defined	\N	Support write API	API Team	\N	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	115	Extended
As a user I would like to update data	Defined	\N	Support write API	API Team	\N	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	116	Extended
As a user I would like to update tickets	Defined	\N	Support write API	API Team	\N	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	117	Extended
Spike: Basic profile form	Defined	Prioritized	User Profile	Shopping Team	Iteration 9	\N	2	R3	\N	FALSE	FALSE	\N	\N	\N	118	Extended
Find My Orders	Defined	Prioritized	User Profile	Shopping Team	Iteration 9	\N	3	R3	As a customer, I would like to be emailed with daily updates that contain package tracking information.	FALSE	FALSE	\N	\N	\N	119	Extended
Log-in to Secured Website	Defined	Prioritized	User Profile	Shopping Team	Iteration 9	dudley@acme.com	5	R3	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	120	Extended
Log-off Website	Defined	Prioritized	User Profile	Shopping Team	Iteration 10	daniel@acme.com	4	R3	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	121	Extended
Show history of account access.	Defined	\N	User Profile	Shopping Team	\N	\N	3	R3	\N	FALSE	FALSE	\N	\N	\N	122	Extended
Validate Customer Contact/Shipping info	Defined	Prioritized	User Profile	Shopping Team	Iteration 10	daniel@acme.com	5	R3	As a customer, I want my email and shipping addresses validated to make me known to the system, and to add another layer of protection against fraud.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li> Email address validated  <ul> <li>validate format</li> <li>email them a message then have them confirm by clicking a link</li> </ul> </li> <li> Check Shipping  <ul> <li>Address must exist validate against USPS DFS2 Validation DB</li> </ul> </li> <li>Perform Validation upon creation/change of info and each order placed</li> </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Oneline help docs updated</li> </ul>	FALSE	FALSE	\N	\N	\N	123	Extended
View By Order	Defined	Prioritized	User Profile	Shopping Team	Iteration 10	\N	3	R3	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	124	Extended
View or Change your One-Click settings	Defined	Prioritized	User Profile	Shopping Team	Iteration 10	\N	\N	R3	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	125	Extended
Search for packing slips	Defined	Prioritized	Archive packing slips	Fulfillment Team	Iteration 3	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	126	Extended
Auto delete packing slips after 6 months	Defined	Prioritized	Archive packing slips	Fulfillment Team	Iteration 3	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	127	Extended
Reactivate packing slips	Defined	Prioritized	Archive packing slips	Fulfillment Team	Iteration 3	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	128	Extended
Return labels printing first/last name in wrong order.	Defined	Prioritized	Returned shipments	Fulfillment Team	Iteration 4	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	129	Extended
Implement barcode tracking for return items	Defined	Prioritized	Returned shipments	Fulfillment Team	Iteration 2	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	130	Extended
Apply credits to account from valid return items	Defined	Prioritized	Returned shipments	Fulfillment Team	Iteration 2	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	131	Extended
Update warehouse stock counts	Defined	Prioritized	Returned shipments	Fulfillment Team	Iteration 2	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	132	Extended
Email notifications upon successful return processing	Defined	Prioritized	Returned shipments	Fulfillment Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	133	Extended
Implement self printed return receipts	Defined	\N	Returned shipments	Fulfillment Team	Iteration 3	\N	5	R1	\N	FALSE	\N	\N	\N	\N	134	Extended
Show return status on order history page	Defined	\N	Returned shipments	Fulfillment Team	Iteration 3	\N	3	R1	\N	FALSE	\N	\N	\N	\N	135	Extended
Mobile notification of return status	Defined	\N	Returned shipments	Fulfillment Team	Iteration 2	\N	8	R1	\N	FALSE	\N	\N	\N	\N	136	Extended
Prescription Administration Updates	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a web site visitor, I want to browse through the inventory of available safaris so that I can pick one that fits my time, budget and interest.	\N	FALSE	\N	\N	\N	137	Extended
Physician Chat Environment	Completed	Ready for Acceptance	\N	Medical Records App	Iteration 4 - New Patients	\N	\N	2.5	As a web site visitor, I want to view upcoming safari availability so that I can choose an available date.	\N	FALSE	\N	\N	\N	138	Extended
Register for New Patient Service	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a safari-taker, I want to sign-up for a Frequent Adventurer Card so I can earn rewards.	\N	TRUE	Test Server Failure	\N	\N	139	Extended
Update Patient Records	Accepted	Accepted	\N	Medical Records App	Iteration 4 - New Patients	\N	8	2.5	As a safari-taker, I want to view any pictures taken and be able to order reprints so that I can remember my trip.	\N	FALSE	\N	\N	\N	140	Extended
Admin - Accept new patients	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	Admin - Accept new patients	\N	FALSE	\N	\N	\N	141	Extended
Validate Patient Data for EU Patients	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	3	2.5	\N	\N	\N	\N	\N	\N	142	Extended
Support for UK National Insurance Number Format	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	\N	2.5	\N	\N	\N	\N	\N	\N	143	Extended
Physician Application - confirm prescription data	Defined	Prioritized	\N	Medical Records App	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	144	Extended
Shipping orders via API	Defined	Prioritized	Implement Open API	API Team	Iteration 14	\N	2	R4	For users who want to track a single package, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	145	Extended
Multi-Site Shipping via API	Defined	Prioritized	Implement Open API	API Team	Iteration 14	\N	2	R4	For users who want to track multiple packages in a single order, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	146	Extended
Support all shiping methods	Defined	\N	Implement Open API	API Team	\N	\N	\N	R4	\N	FALSE	FALSE	\N	\N	\N	147	Extended
EZ to add shopping card	Defined	\N	Build "As-U-Shop" cart	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	148	Extended
EZ to remove shopping cart	Defined	Prioritized	Build "As-U-Shop" cart	Shopping Team	Iteration 13	diane@acme.com	5	\N	\N	FALSE	FALSE	\N	\N	\N	149	Extended
EZ to move to wish list	Defined	\N	Build "As-U-Shop" cart	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	150	Extended
EZ to save for later shopping card	Defined	Prioritized	Build "As-U-Shop" cart	Shopping Team	Iteration 13	diane@acme.com	7	\N	\N	FALSE	FALSE	\N	\N	\N	151	Extended
CC validation	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 13	tony@acme.com	1	R4	\N	FALSE	FALSE	\N	\N	\N	152	Extended
Adding items to purchase list	Defined	\N	AnyMethod payments	Payment Team	\N	\N	5	R4	\N	FALSE	FALSE	\N	\N	\N	153	Extended
AnyMethod™ Add order processing status on user profile page	Defined	\N	AnyMethod payments	Payment Team	\N	\N	13	R4	\N	FALSE	FALSE	\N	\N	\N	154	Extended
Support only chip style CC	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 13	\N	3	R4	\N	FALSE	FALSE	\N	\N	\N	155	Extended
AnyMethod™ pay	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 13	deb@acme.com	3	R4	\N	FALSE	FALSE	\N	\N	\N	156	Extended
MV Mobile Batch multiple payments for single transaction	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 13	\N	7	R4	\N	FALSE	FALSE	\N	\N	\N	157	Extended
MV Mobile Change Billing Address	Defined	\N	AnyMethod payments	Payment Team	\N	\N	\N	\N	As a returning customer, I want to be able to change my billing address.	FALSE	FALSE	\N	\N	\N	158	Extended
MV Mobile Change Method of Payment	Defined	\N	AnyMethod payments	Payment Team	\N	\N	3	\N	A customer should be able to change their method of payment for an order.	FALSE	FALSE	\N	\N	\N	159	Extended
MV Mobile Cross check purchases with fraud credit card list	Defined	\N	AnyMethod payments	Payment Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	160	Extended
MV Mobile Demo Support	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 14	\N	\N	R4	The demonstration instance of the application should be updated to reflect recent changes.	FALSE	FALSE	\N	\N	\N	161	Extended
MV Mobile Design spike	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 14	deb@acme.com	\N	R4	\N	FALSE	FALSE	\N	\N	\N	162	Extended
MV Mobile Generate audit report tempate for annual per-user purchase history.	Defined	\N	AnyMethod payments	Payment Team	\N	\N	5	R4	\N	FALSE	FALSE	\N	\N	\N	163	Extended
MV Mobile Handle out of limit errors on credit card charges	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 14	\N	13	R4	\N	FALSE	FALSE	\N	\N	\N	164	Extended
MV Mobile Install new 2048bit encryption key	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 14	dave@acme.com	3	R4	\N	FALSE	FALSE	\N	\N	\N	165	Extended
MV Mobile Log unsuccessful payment attempts	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 13	\N	3	R4	\N	FALSE	FALSE	\N	\N	\N	166	Extended
MV Mobile Pay with Points	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 13	daphne@acme.com	3	R4	\N	FALSE	FALSE	\N	\N	\N	167	Extended
MV Mobile Payment - Supported Credit Cards	Defined	Prioritized	AnyMethod payments	Payment Team	Iteration 13	deb@acme.com	13	R4	Support a broad range of payment methods consistent with other e-commerce sites - including gift certificates	FALSE	FALSE	\N	\N	\N	168	Extended
"As-U-Shop" align email 'importance field to case 'priority' field	Defined	Prioritized	Email integration (case, online chat, customer service)	API Team	Iteration 13	peter@acme.com	5	R4	\N	FALSE	FALSE	\N	\N	\N	169	Extended
Add domain white lists	Defined	Prioritized	Email integration (case, online chat, customer service)	API Team	Iteration 13	peter@acme.com	5	R4	\N	FALSE	FALSE	\N	\N	\N	170	Extended
Add domain black lists	Defined	\N	Email integration (case, online chat, customer service)	API Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	171	Extended
Add domain allowance	Defined	Prioritized	Support ability to attach case and email notification	API Team	Iteration 10	\N	3	R3	\N	FALSE	FALSE	\N	\N	\N	172	Extended
Case / chat management upgrade	Defined	Prioritized	Support ability to attach case and email notification	API Team	Iteration 10	\N	3	R3	\N	FALSE	FALSE	\N	\N	\N	173	Extended
New technoloy incertion for homepage	Defined	Prioritized	Revamp homepage to be mobile ready	Shopping Team	Iteration 14	aaron@acme.com	5	R4	\N	FALSE	FALSE	\N	\N	\N	174	Extended
MV Mobile homepage loads	Defined	Prioritized	Revamp homepage to be mobile ready	Shopping Team	Iteration 13	aaron@acme.com	5	R4	\N	FALSE	FALSE	\N	\N	\N	175	Extended
MV Mobile Promotion codes	Defined	Prioritized	Revamp homepage to be mobile ready	Shopping Team	Iteration 13	dudley@acme.com	2	R4	\N	FALSE	FALSE	\N	\N	\N	176	Extended
Social configure base drupal server	Defined	Prioritized	Share all customer reviews	Fulfillment Team	Iteration 14	paul@acme.com	5	R4	\N	FALSE	FALSE	\N	\N	\N	177	Extended
Social enable external api access	Defined	Prioritized	Share all customer reviews	Fulfillment Team	Iteration 14	\N	5	R4	\N	FALSE	FALSE	\N	\N	\N	178	Extended
Social implement cms portal	Defined	Prioritized	Share all customer reviews	Fulfillment Team	Iteration 14	\N	4	R4	\N	FALSE	FALSE	\N	\N	\N	179	Extended
Social Mauna Loa Hardening	Defined	Prioritized	Share all customer reviews	Fulfillment Team	Iteration 14	\N	4	R4	\N	FALSE	FALSE	\N	\N	\N	180	Extended
Social Patch #1 - Mauna Loa	Defined	Prioritized	Share all customer reviews	Fulfillment Team	Iteration 14	\N	2	R4	\N	FALSE	FALSE	\N	\N	\N	181	Extended
Social plugins for external feed management	Defined	Prioritized	Share all customer reviews	Fulfillment Team	Iteration 14	\N	3	R4	\N	FALSE	FALSE	\N	\N	\N	182	Extended
Send receipt	Defined	Prioritized	Purchase confirmation settings in profile	Shopping Team	Iteration 4	daniel@acme.com	5	R4	\N	FALSE	FALSE	\N	\N	\N	213	Extended
Social As a user I would like to create a chat	Defined	Prioritized	Add additional chat platforms	Fulfillment Team	Iteration 11	dudley@acme.com	3	R3	\N	FALSE	FALSE	\N	\N	\N	183	Extended
Social As a user I would like to delete a chat	Defined	\N	Add additional chat platforms	Fulfillment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	184	Extended
Social As a user I would like to search for chat history	Defined	\N	Add additional chat platforms	Fulfillment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	185	Extended
"As-U-Shop" Check the Status of Your Order	Defined	Prioritized	Order Status 4.0	Shopping Team	Iteration 15	daniel@acme.com	5	R4	As a customer, I want the status of my order to be presented to me in the form of a simple report that is easily accessed on entrance to the shopping cart.  The report should include details regarding shipping information (tracking numbers and estimated arrival dates), the number of items I purchased (quantity and unit price), as well as the total amount spent.	FALSE	FALSE	\N	\N	\N	186	Extended
"As-U-Shop" Combine Orders	Defined	\N	Order Status 4.0	Shopping Team	\N	\N	3	\N	For multiple orders with the same destination and expected ship dates within 24 hours of each other, the shipping department should combine the orders and ship them as one.	FALSE	FALSE	\N	\N	\N	187	Extended
"As-U-Shop" Create Deployment Scripts	Defined	Prioritized	Order Status 4.0	Shopping Team	Iteration 14	tara@acme.com	3	R4	Create Deployment scripts for the first release	FALSE	FALSE	\N	\N	\N	188	Extended
"As-U-Shop" Customizing Product List	Defined	\N	Order Status 4.0	Shopping Team	\N	\N	8	\N	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	189	Extended
"As-U-Shop" Order Modification	Defined	\N	Order Status 4.0	Shopping Team	\N	\N	3	\N	Within 24 hours of the expected shipping date, a customer should be able to modify his/her order with no repercussions.	FALSE	FALSE	\N	\N	\N	190	Extended
"As-U-Shop" Provide connection to CSPAN verification service.	Defined	Prioritized	Order Status 4.0	Shopping Team	Iteration 15	\N	5	R4	\N	FALSE	FALSE	\N	\N	\N	191	Extended
"As-U-Shop" Provide failover connection to G5 verification service.	Defined	Prioritized	Order Status 4.0	Shopping Team	Iteration 15	diane@acme.com	\N	R4	\N	FALSE	FALSE	\N	\N	\N	192	Extended
"As-U-Shop" Return Items	Defined	\N	Order Status 4.0	Shopping Team	\N	\N	4	R4	A customer should be able to return unwanted or defective items.	FALSE	FALSE	\N	\N	\N	193	Extended
"As-U-Shop" Search for Items	Defined	\N	Order Status 4.0	Shopping Team	\N	\N	3	R4	A user should able to search for items using a keyword.	FALSE	FALSE	\N	\N	\N	194	Extended
"As-U-Shop" Send failure logs to CSPAN verification service nightly.	Defined	Prioritized	Order Status 4.0	Shopping Team	Iteration 15	\N	2	R4	\N	FALSE	FALSE	\N	\N	\N	195	Extended
"As-U-Shop" Send success email notification after adding credit card to profile.	Defined	Prioritized	Order Status 4.0	Shopping Team	Iteration 15	\N	3	R4	\N	FALSE	FALSE	\N	\N	\N	196	Extended
"As-U-Shop" Send user notification upon request for shipment.	Defined	\N	Order Status 4.0	Shopping Team	\N	\N	3	R4	\N	FALSE	FALSE	\N	\N	\N	197	Extended
"As-U-Shop" Music Streaming	Defined	Prioritized	Order Status 4.0	Shopping Team	Iteration 16	dudley@acme.com	8	R4	<p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">User attempts to stream a song<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Add song to download list<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi Capable?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to Wifi?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi connection fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 4g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">4g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 3g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">3g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wait for buffer<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Stream successful<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Music plays<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Return to home screen<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'no connection fast enough available'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'stream interrupted'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Is the phone a Nokia?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Phone is destroyed<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wall is destroyed</span></p>	FALSE	FALSE	\N	\N	\N	198	Extended
"As-U-Shop" Cancel the Order	Defined	Prioritized	Order Status 4.0	Shopping Team	Iteration 16	\N	2	R4	Investigate architecture approaches to order cancellation process.<br /><br /><u>Acceptance Criteria</u>:<ul><li>Order must not be shipped</li><li>credit card refunded</li><li>Fulfillment process reversed</li><li>restocking fee applied</li><li>undo 'cancel' functionality</li></ul><u>Definition of Done</u>:<ul><li>2 POC approaches</li><li>Timebox approach to 8 hours each spike</li><li>Estimate for each approach at task level</li><li>demo simple scenario</li></ul>	FALSE	FALSE	\N	\N	\N	199	Extended
"As-U-Shop" Spike: Tax table/calculations	Defined	\N	Order Status 4.0	Shopping Team	\N	\N	\N	R4	The development team should research possible implementations and problems arising from integrating tax calculations into the purchasing system.	FALSE	FALSE	\N	\N	\N	200	Extended
"As-U-Shop" Support backorder email notification	Defined	Prioritized	Order Status 4.0	Shopping Team	Iteration 16	\N	3	R4	\N	FALSE	FALSE	\N	\N	\N	201	Extended
"As-U-Shop" Support out of stock email notification.	Defined	Prioritized	Order Status 4.0	Shopping Team	\N	\N	21	R4	\N	FALSE	FALSE	\N	\N	\N	202	Extended
"As-U-Shop" Update user profile purchase history upon settlement.	Defined	\N	Order Status 4.0	Shopping Team	\N	\N	3	R4	\N	FALSE	FALSE	\N	\N	\N	203	Extended
"As-U-Shop" Add a single item to an Order	Defined	Prioritized	Order Status 4.0	Shopping Team	Iteration 13	dudley@acme.com	2	R4	\N	FALSE	FALSE	\N	\N	\N	204	Extended
<4 hours delivery	Defined	Prioritized	Provide cost options for shipping methods	Fulfillment Team	Iteration 13	tony@acme.com	3	R4	A user should be allowed to select 2-3 day shipping for their order.	FALSE	FALSE	\N	\N	\N	205	Extended
Pickup at location	Defined	Prioritized	Provide cost options for shipping methods	Fulfillment Team	Iteration 13	tony@acme.com	5	R4	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	FALSE	\N	\N	\N	206	Extended
Pickup or delivery location costs	Defined	Prioritized	Provide cost options for shipping methods	Fulfillment Team	Iteration 14	\N	2	R4	The customer should enter basic shipping information	FALSE	FALSE	\N	\N	\N	207	Extended
QUIKShip	Defined	Prioritized	Provide cost options for shipping methods	Fulfillment Team	Iteration 13	drew@acme.com	2	R4	A user should be allowed to select overnight shipping for their order.	FALSE	FALSE	\N	\N	\N	208	Extended
QUICKShip Multi-Site Orders	Defined	Prioritized	Provide cost options for shipping methods	Fulfillment Team	Iteration 13	dawn@acme.com	1	R4	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	TRUE	\N	\N	\N	209	Extended
QUICKShip Single-Site Order	Defined	Prioritized	Provide cost options for shipping methods	Fulfillment Team	Iteration 14	\N	5	R4	On completion of a transaction, the shipping department should ship the items to the appropriate destination	FALSE	FALSE	\N	\N	\N	210	Extended
QUICKShipUpdate Shipping System for Each Order	Defined	Prioritized	Provide cost options for shipping methods	Fulfillment Team	Iteration 15	dawn@acme.com	3	R4	In order to keep all of the shipping information consistent, implement link to our backend shipping system.	FALSE	FALSE	\N	\N	\N	211	Extended
QUICKShip Display confirmation code on checkout page	Defined	Prioritized	Purchase confirmation settings in profile	Shopping Team	Iteration 14	\N	5	R4	\N	FALSE	FALSE	\N	\N	\N	212	Extended
Validate CVVC to checkout path	Defined	Prioritized	Single product purchase click	Shopping Team	Iteration 2	dudley@acme.com	3	R4	\N	FALSE	FALSE	\N	\N	\N	214	Extended
Allow combinations	Defined	Prioritized	Single product purchase click	Shopping Team	Iteration 4	diane@acme.com	3	R4	\N	FALSE	FALSE	\N	\N	\N	215	Extended
Ship to address to arrive sooner	Defined	Prioritized	Single product purchase click	Shopping Team	Iteration 4	diane@acme.com	5	R4	\N	FALSE	FALSE	\N	\N	\N	216	Extended
QUICKClik Order	Defined	Prioritized	Single product purchase click	Shopping Team	Iteration 14	diane@acme.com	3	R4	Once a user has entered a promotional code for an order, the discount should be reflected in the checkout total.	FALSE	FALSE	\N	\N	\N	217	Extended
Identify error messages	Defined	Prioritized	Credit card error messaging	Payment Team	\N	daphne@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	254	Extended
Determine interface spec for error messages	Defined	Prioritized	Credit card error messaging	Payment Team	\N	deb@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	255	Extended
Revalidate product listings for website and mobile	Defined	Prioritized	Product Listings	Shopping Team	\N	peter@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	256	Extended
Product listing analysis for marketing	Defined	Prioritized	Product Listings	Shopping Team	\N	dudley@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	257	Extended
Spike: Purchase someone elses items Items	Defined	Prioritized	Single product purchase click	Shopping Team	Iteration 14	daniel@acme.com	3	R4	As a user I want to store things in my shopping cart and see them next time I am logged in, so I can save an order for payday.<br /><br />Once a user enters an item into their shopping cart, persist that information in their profile so that it is available next time they login.<br /><br /><u>Acceptance Criteria</u>: <ul> <li>User logged in adds to cart, these items stay associated with user until removed or purchased</li> <li>User logs in with items in shopping cart and items before login are added to 'stored' cart</li> <li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li> </ul> <u>Definition of Done</u>: <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	218	Extended
Support credit, promos, certificates	Defined	Prioritized	Single product purchase click	Shopping Team	Iteration 14	diane@acme.com	3	R4	\N	FALSE	FALSE	\N	\N	\N	219	Extended
Increment / decrement item quantities	Defined	Prioritized	Single product purchase click	Shopping Team	Iteration 13	daniel@acme.com	3	R4	\N	FALSE	FALSE	\N	\N	\N	220	Extended
Establish secure backup facility	Defined	Prioritized	Integrate User Management with Profile Management	API Team	Iteration 16	\N	5	R4	In order to provide redundant power and network connections, move to an offsite hosting provider	FALSE	FALSE	\N	\N	\N	221	Extended
Update to latest MongoDB	Defined	Prioritized	Integrate User Management with Profile Management	API Team	Iteration 16	dora@acme.com	3	R4	To produce a stable and performant experience for our customers, move to an integrated Oracle database	FALSE	FALSE	\N	\N	\N	222	Extended
Support for 10M premier members	Defined	Prioritized	Integrate User Management with Profile Management	API Team	\N	dora@acme.com	3	R4	In order to prepare for company growth, the system should perform appropriately for loads of up to 10,000 concurrent users.	FALSE	FALSE	\N	\N	\N	223	Extended
Uptime 0.9995 reliability	Defined	Prioritized	Integrate User Management with Profile Management	API Team	Iteration 16	dora@acme.com	3	R4	In order for customers to be able to order any time they want, the website should be available 24 hours a day, 7 days a week.	FALSE	FALSE	\N	\N	\N	224	Extended
Allow family profiles	Defined	Prioritized	Modify profile sharing with popular platforms	Shopping Team	\N	\N	3	R3	\N	FALSE	FALSE	\N	\N	\N	225	Extended
Share premier memberships	Defined	Prioritized	Modify profile sharing with popular platforms	Shopping Team	Iteration 11	dudley@acme.com	7	R3	\N	FALSE	FALSE	\N	\N	\N	226	Extended
As a user I would like to delete a profile on mobile	Defined	\N	Modify profile sharing with popular platforms	Shopping Team	\N	\N	3	R3	\N	FALSE	FALSE	\N	\N	\N	227	Extended
As a user I would like to save a profile on mobile	Defined	\N	Modify profile sharing with popular platforms	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	228	Extended
As a user I would like to undelete a profile on mobile	Defined	\N	Modify profile sharing with popular platforms	Shopping Team	\N	\N	3	R3	\N	FALSE	FALSE	\N	\N	\N	229	Extended
Combine by business shipping address	Defined	Prioritized	Search based on profile attributes	Shopping Team	Iteration 14	daniel@acme.com	2	R4	\N	FALSE	FALSE	\N	\N	\N	230	Extended
Combine by pickup location	Defined	Prioritized	Search based on profile attributes	Shopping Team	Iteration 13	diane@acme.com	2	R4	\N	FALSE	FALSE	\N	\N	\N	231	Extended
Any size cart should be allowed	Defined	Prioritized	Mobile shopping Cart	Shopping Team	Iteration 10	drew@acme.com	13	R3	\N	FALSE	FALSE	\N	\N	\N	232	Extended
EZ cart implementation for mobile	Defined	\N	Mobile shopping Cart	Shopping Team	\N	\N	2	R3	\N	FALSE	FALSE	\N	\N	\N	233	Extended
EZ cart for combining orders	Defined	Prioritized	Mobile shopping Cart	Shopping Team	Iteration 12	\N	1	R3	\N	FALSE	FALSE	\N	\N	\N	234	Extended
EZ card to add product types	Defined	Prioritized	Mobile shopping Cart	Shopping Team	Iteration 12	\N	\N	R3	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	235	Extended
Premeir member deals	Defined	\N	Mobile shopping Cart	Shopping Team	\N	\N	3	R3	\N	FALSE	FALSE	\N	\N	\N	236	Extended
EZ cart to One-Click purchase	Defined	\N	Mobile shopping Cart	Shopping Team	\N	\N	2	R3	\N	FALSE	FALSE	\N	\N	\N	237	Extended
Accepts any form of payments	Defined	Prioritized	Mobile shopping Cart	Shopping Team	Iteration 12	dawn@acme.com	4	R3	A customer should be able to pay for selected items using a gift certificate.	FALSE	FALSE	\N	\N	\N	238	Extended
Determine path with mobile	Defined	Prioritized	Purchase path	Payment Team	\N	tony@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	239	Extended
Identify CC to be accepted	Defined	Prioritized	Credit card payments	Payment Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	240	Extended
Verify CC security code interface	Defined	Prioritized	Credit card payments	Payment Team	\N	drew@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	241	Extended
Determine security for online refunds	Defined	Prioritized	Online refunds	Fulfillment Team	\N	dawn@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	242	Extended
Wireframe design for online refunds	Defined	Prioritized	Online refunds	Fulfillment Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	243	Extended
Create Paypal security model	Defined	Prioritized	Integrate with Paypal	Payment Team	Iteration 8	dave@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	244	Extended
Create ACK messaging interface to Paypal	Defined	Prioritized	Integrate with Paypal	Payment Team	Iteration 8	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	245	Extended
Create WePay security model	Defined	Prioritized	Integrate with WePay	Payment Team	\N	daphne@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	246	Extended
Create ACK messaging interface to WePay	Defined	Prioritized	Integrate with WePay	Payment Team	\N	deb@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	247	Extended
Create flow thru payment system for refunds	Defined	Prioritized	Refund management	Fulfillment Team	\N	peter@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	248	Extended
Design wireframes for refund management	Defined	Prioritized	Refund management	Fulfillment Team	\N	tony@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	249	Extended
Develop security for API	Defined	Prioritized	Provide public API to support 3rd party integrations	API Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	250	Extended
Identify web doc and pdf  doc changes to support public API	Defined	Prioritized	Provide public API to support 3rd party integrations	API Team	\N	drew@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	251	Extended
Develop coupon.com integration strategy	Defined	Prioritized	Integrate with coupon.com site to match *popular* items in shopping cart	Payment Team	\N	dave@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	252	Extended
Establish interface spec with coupon.com	Defined	Prioritized	Integrate with coupon.com site to match *popular* items in shopping cart	Payment Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	253	Extended
Identify realtime chat options	Defined	Prioritized	Realtime chat support	API Team	\N	diane@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	258	Extended
Fraud Detection features design and interface	Defined	Prioritized	Implement Fraud Detection	Payment Team	\N	tony@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	259	Extended
Determine parameters for write and delete in API	Defined	Prioritized	Add web services for API write and delete	API Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	260	Extended
Design mods to sys admin screen	Defined	Prioritized	Eliminate batch process to notification	API Team	\N	drew@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	261	Extended
Create design mods to personal profiles to allow history reset	Defined	Prioritized	Allow users to reset purchase history	Fulfillment Team	\N	dawn@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	262	Extended
Re-design suggestion and personal history interface	Defined	Prioritized	Allow users to dissassociate suggestions	Payment Team	\N	dave@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	263	Extended
History setting redesign	Defined	Prioritized	Product suggestion settings	Fulfillment Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	264	Extended
"Like" interface to leverage integration to orders	Defined	Prioritized	Users can add likes to products	Fulfillment Team	\N	daphne@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	265	Extended
Verify that order tracking will work with returns w/o redesign	Defined	Prioritized	Track orders returned for credit	Fulfillment Team	\N	deb@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	266	Extended
Order system design to allow history	Defined	Prioritized	Order history available	Fulfillment Team	\N	peter@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	267	Extended
SMS interface modernization	Defined	Prioritized	Support case support with text verification	API Team	\N	diane@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	268	Extended
Wireframe other recommended options	Defined	Prioritized	Identify other items to purchase	Shopping Team	\N	tony@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	269	Extended
Create lo res interface for mobile	Defined	Prioritized	Render product images on mobile platforms	Payment Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	270	Extended
cart interface modification, save in profile, recall	Defined	Prioritized	Allow users to save carts	Payment Team	\N	drew@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	271	Extended
Design refund system to allow the return of new purchase	Defined	Prioritized	Credit refunds to new purchases	Fulfillment Team	\N	dave@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	272	Extended
User needs realtime feedback on purchase`	Defined	Prioritized	Credit card processing with realtime feedback	Payment Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	273	Extended
Design user and SE interface for portal	Defined	Prioritized	Support portal on web	API Team	\N	daphne@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	274	Extended
Add location specific purchase attrs	Defined	Prioritized	Pickup at local depot	Payment Team	\N	deb@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	275	Extended
Implement personal profile security policy	Defined	Prioritized	re-establish logins every 60 days	API Team	\N	peter@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	276	Extended
Modify auth codes for API attributed to users	Defined	Prioritized	Users get authentication codes for API	API Team	\N	dudley@acme.com	3	\N	\N	FALSE	FALSE	\N	\N	\N	277	Extended
Determine cross-sell algorythm capability	Accepted	Accepted	Cross sell related products	API Team	Iteration 1	peter@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	278	Extended
Warn user on duplicate orders and suggest to verify	Accepted	Accepted	Duplcate order fulfillment	Shopping Team	Iteration 1	dudley@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	279	Extended
Implement personal profile for QuickBuy policy	Accepted	Accepted	Purchase single product	API Team	Iteration 1	peter@acme.com	8	R1	\N	FALSE	FALSE	\N	\N	\N	280	Extended
Modify auth codes and profile setting for QuickBuy	Accepted	Accepted	Purchase single product	API Team	Iteration 1	dudley@acme.com	8	R1	\N	FALSE	FALSE	\N	\N	\N	281	Extended
Determine CC authority for QuickBuy	Accepted	Accepted	Purchase single product	API Team	Iteration 1	peter@acme.com	8	R1	\N	FALSE	FALSE	\N	\N	\N	282	Extended
Warn user on QuickBuy profile settings	Accepted	Accepted	Purchase single product	API Team	Iteration 1	dudley@acme.com	8	R1	\N	FALSE	FALSE	\N	\N	\N	283	Extended
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY task (name, workproduct, state, owner, estimate, todo, actuals, blocked, blockedreason, description, displaycolor, ready, taskindex, project, listing_order, dataset, notes) FROM stdin;
Link to shipping backend	2-3 Day Shipping	Defined	dudley@acme.com	6	6	\N	FALSE	\N	\N	\N	FALSE	0	\N	1	Standard	\N
GUI for shipping options	2-3 Day Shipping	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	2	Standard	\N
Run Functional Tests	2-3 Day Shipping	Defined	daniel@acme.com	15	15	\N	FALSE	\N	\N	\N	FALSE	2	\N	3	Standard	\N
Write Code	API for Basic Shipping	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	4	Standard	\N
API Test Harnesses	API for Basic Shipping	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	5	Standard	\N
Automated Tests	API for Basic Shipping	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	6	Standard	\N
Run Functional Tests	API for Basic Shipping	Defined	dudley@acme.com	0	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	7	Standard	\N
Write Code	API for Multi-Site Shipping	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	8	Standard	\N
API Test Harnesses	API for Multi-Site Shipping	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	1	\N	9	Standard	\N
Run Functional Tests	API for Multi-Site Shipping	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	10	Standard	\N
Create automated Tests	API for Multi-Site Shipping	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	3	\N	11	Standard	\N
Use Shipping Web Service for Calculation	Calculate Split Shipping	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	0	\N	12	Standard	\N
Filter only company supported shipping options	Calculate Split Shipping	Defined	daniel@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	13	Standard	\N
Automated Tests for Web Services API	Calculate Split Shipping	Defined	diane@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	2	\N	14	Standard	\N
Code	Find My Orders	Defined	diane@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	15	Standard	\N
Create Automated Tests	Find My Orders	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	1	\N	16	Standard	\N
Code	Data fields for Shipping information	Defined	dudley@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	17	Standard	\N
Create Automated Tests	Data fields for Shipping information	Defined	dudley@acme.com	11	11	\N	FALSE	\N	\N	\N	FALSE	1	\N	18	Standard	\N
Doc	Data fields for Shipping information	Defined	diane@acme.com	6	6	\N	FALSE	\N	\N	\N	FALSE	2	\N	19	Standard	\N
adjust stylesheet properties	latest Promo Code is invalid.	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	20	Standard	\N
fix screenshots in online help	latest Promo Code is invalid.	Defined	diane@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	21	Standard	\N
Code	Provide failover connection to G5 verification service.	Defined	diane@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	22	Standard	\N
Regression Testing	Provide failover connection to G5 verification service.	Defined	diane@acme.com	15	15	\N	FALSE	\N	\N	\N	FALSE	1	\N	23	Standard	\N
Setup new Servers	Move Server Room	Defined	\N	14	14	\N	FALSE	\N	\N	\N	FALSE	0	\N	24	Standard	\N
Move Code to new Servers	Move Server Room	Defined	dudley@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	25	Standard	\N
Update SQL	Move to Oracle	Defined	tara@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	0	\N	26	Standard	\N
Setup Oracle	Move to Oracle	Defined	daniel@acme.com	1	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	27	Standard	\N
Link to shipping backend	Overnight Shipping	Defined	diane@acme.com	7	7	\N	FALSE	\N	\N	\N	FALSE	0	\N	28	Standard	\N
GUI for shipping options	Overnight Shipping	Defined	diane@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	29	Standard	\N
Run Functional Tests	Overnight Shipping	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	2	\N	30	Standard	\N
Database tables for order codes	View By Order	Defined	dudley@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	31	Standard	\N
GUI for order pages	View By Order	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	32	Standard	\N
Run Functional Tests	View By Order	Defined	diane@acme.com	11	11	\N	FALSE	\N	\N	\N	FALSE	2	\N	33	Standard	\N
Create automated Tests	View By Order	Defined	tara@acme.com	2	2	\N	TRUE	Need UI changes	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	3	\N	34	Standard	\N
GUI for Purchase Your Items	Purchase Your Items	Defined	dudley@acme.com	11	11	\N	FALSE	\N	\N	\N	FALSE	1	\N	35	Standard	\N
Create Automated Tests	Purchase Your Items	Defined	tara@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	2	\N	36	Standard	\N
Implement Service Layer	Purchase Your Items	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	37	Standard	\N
Implement Credit Card Payment Service	Purchase Your Items	Defined	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	4	\N	38	Standard	\N
Validate GUI design	Purchase Your Items	Defined	diane@acme.com	9	9	\N	FALSE	\N	\N	\N	FALSE	5	\N	39	Standard	\N
Run Manual Tests	Purchase Your Items	Defined	tara@acme.com	3	3	\N	TRUE	Test environment down.  IT says it'll be back up by 4pm ET.	<strong>Blocked:</strong> Test environment is down.	\N	FALSE	0	\N	40	Standard	\N
Store Data for Recent Purchases	Recent Purchases View	Defined	dudley@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	41	Standard	\N
Validate GUI styles	Recent Purchases View	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	1	\N	42	Standard	\N
GUI for recent items list	Recent Purchases View	Defined	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	2	\N	43	Standard	\N
Run Functional Tests	Recent Purchases View	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	3	\N	44	Standard	\N
UI for splitting order	Ship Multi-Site Orders	Defined	\N	9	9	\N	FALSE	\N	\N	\N	FALSE	0	\N	45	Standard	\N
Create automated Tests	Ship Multi-Site Orders	Defined	\N	6	6	\N	TRUE	Waiting for UI changes	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	1	\N	46	Standard	\N
Document Functionality	Ship Multi-Site Orders	Defined	\N	2	2	\N	FALSE	\N	\N	\N	FALSE	2	\N	47	Standard	\N
Code	Ship Single-Site Order	Defined	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	0	\N	48	Standard	\N
Create Automated Tests	Ship Single-Site Order	Defined	\N	0	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	49	Standard	\N
Doc	Ship Single-Site Order	Defined	\N	7	7	\N	FALSE	\N	\N	\N	FALSE	2	\N	50	Standard	\N
Identify impact on removing order from server cache	Cancel the Order	Defined	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	51	Standard	\N
Review error conditions from payment gateway	Cancel the Order	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	52	Standard	\N
use new api version call	State drop down doesn't contain any items	Defined	dudley@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	53	Standard	\N
replace renderer to show display value instead of internal value	State drop down doesn't contain any items	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	1	\N	54	Standard	\N
Backend Link to Shipping System	Update Shipping System for Each Order	Defined	\N	9	9	\N	FALSE	\N	\N	\N	FALSE	0	\N	55	Standard	\N
Update Logic	Update Shipping System for Each Order	Defined	\N	14	14	\N	FALSE	\N	\N	\N	FALSE	1	\N	56	Standard	\N
Automated Tests	Update Shipping System for Each Order	Defined	\N	4	4	\N	FALSE	\N	\N	\N	FALSE	2	\N	57	Standard	\N
Write front-end validation code	Validate Customer Contact/Shipping info	Defined	daniel@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	58	Standard	\N
Call Web Service for Address Verification	Validate Customer Contact/Shipping info	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	59	Standard	\N
Document Validation Functionality	Validate Customer Contact/Shipping info	Defined	daniel@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	2	\N	60	Standard	\N
Code	Website must be available 24x7	Defined	\N	11	11	\N	FALSE	\N	\N	\N	FALSE	0	\N	61	Standard	\N
Create Automated Tests	Website must be available 24x7	Defined	\N	6	6	\N	FALSE	\N	\N	\N	FALSE	1	\N	62	Standard	\N
Create Automated Tests	Unable to login after entering invalid password	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	1	\N	63	Standard	\N
Fix exception handling routing after failed login	Unable to login after entering invalid password	Defined	dudley@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	1	\N	64	Standard	\N
Run manual FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	65	Standard	\N
Run automated FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	66	Standard	\N
Run manual Chrome  browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	0	\N	67	Standard	\N
Run automated Chrome browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	68	Standard	\N
Setup new Servers	Move Server Room	Defined	\N	14	14	\N	FALSE	\N	\N	\N	FALSE	0	\N	53	Extended	\N
Code	Identify error messages	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	160	Extended	\N
Write front-end validation code	"As-U-Shop" align email 'importance field to case 'priority' field	Defined	daniel@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	1	Extended	\N
Call Web Service for Address Verification	"As-U-Shop" align email 'importance field to case 'priority' field	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	2	Extended	\N
Document Validation Functionality	"As-U-Shop" align email 'importance field to case 'priority' field	Defined	daniel@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	2	\N	3	Extended	\N
Identify impact on removing order from server cache	"As-U-Shop" Cancel the Order	Defined	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	4	Extended	\N
Review error conditions from payment gateway	"As-U-Shop" Cancel the Order	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	5	Extended	\N
Code	"As-U-Shop" Provide failover connection to G5 verification service.	Defined	diane@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	6	Extended	\N
Regression Testing	"As-U-Shop" Provide failover connection to G5 verification service.	Defined	diane@acme.com	15	15	\N	FALSE	\N	\N	\N	FALSE	1	\N	7	Extended	\N
Link to shipping backend	<4 hours delivery	Defined	dudley@acme.com	6	6	\N	FALSE	\N	\N	\N	FALSE	0	\N	8	Extended	\N
GUI for shipping options	<4 hours delivery	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	9	Extended	\N
Run Functional Tests	<4 hours delivery	Defined	daniel@acme.com	15	15	\N	FALSE	\N	\N	\N	FALSE	2	\N	10	Extended	\N
Link to shipping backend	2-3 Day Shipping	Defined	dudley@acme.com	6	6	\N	FALSE	\N	\N	\N	FALSE	0	\N	11	Extended	\N
GUI for shipping options	2-3 Day Shipping	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	12	Extended	\N
Run Functional Tests	2-3 Day Shipping	Defined	daniel@acme.com	15	15	\N	FALSE	\N	\N	\N	FALSE	2	\N	13	Extended	\N
Write Code	API for Basic Shipping	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	14	Extended	\N
API Test Harnesses	API for Basic Shipping	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	15	Extended	\N
Automated Tests	API for Basic Shipping	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	16	Extended	\N
Run Functional Tests	API for Basic Shipping	Defined	dudley@acme.com	0	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	17	Extended	\N
Write Code	API for Multi-Site Shipping	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	18	Extended	\N
API Test Harnesses	API for Multi-Site Shipping	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	1	\N	19	Extended	\N
Run Functional Tests	API for Multi-Site Shipping	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	20	Extended	\N
Create automated Tests	API for Multi-Site Shipping	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	3	\N	21	Extended	\N
Use Shipping Web Service for Calculation	Calculate Split Shipping	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	0	\N	22	Extended	\N
Filter only company supported shipping options	Calculate Split Shipping	Defined	daniel@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	23	Extended	\N
Automated Tests for Web Services API	Calculate Split Shipping	Defined	diane@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	2	\N	24	Extended	\N
Identify impact on removing order from server cache	Cancel the Order	Defined	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	25	Extended	\N
Review error conditions from payment gateway	Cancel the Order	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	26	Extended	\N
Run manual Chrome  browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	27	Extended	\N
Run automated Chrome browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	28	Extended	\N
Code	Data fields for Shipping information	Defined	dudley@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	29	Extended	\N
Create Automated Tests	Data fields for Shipping information	Defined	dudley@acme.com	11	11	\N	FALSE	\N	\N	\N	FALSE	1	\N	30	Extended	\N
Doc	Data fields for Shipping information	Defined	diane@acme.com	6	6	\N	FALSE	\N	\N	\N	FALSE	2	\N	31	Extended	\N
Code	Establish secure backup facility	Defined	diane@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	32	Extended	\N
Create Automated Tests	Establish secure backup facility	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	1	\N	33	Extended	\N
Setup new Servers	Establish secure backup facility	Defined	\N	14	14	\N	FALSE	\N	\N	\N	FALSE	0	\N	34	Extended	\N
Move Code to new Servers	Establish secure backup facility	Defined	dudley@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	35	Extended	\N
Implement Credit Card Payment Service	EZ cart for combining orders	Defined	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	4	\N	36	Extended	\N
Validate GUI design	EZ cart for combining orders	Defined	diane@acme.com	9	9	\N	FALSE	\N	\N	\N	FALSE	5	\N	37	Extended	\N
Run Manual Tests	EZ cart for combining orders	Defined	tara@acme.com	3	3	\N	TRUE	Test environment down.  IT says it'll be back up by 4pm ET.	<strong>Blocked:</strong> Test environment is down.	\N	FALSE	0	\N	38	Extended	\N
Code	Find My Orders	Defined	diane@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	39	Extended	\N
Create Automated Tests	Find My Orders	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	1	\N	40	Extended	\N
Run manual FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	41	Extended	\N
Run automated FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	42	Extended	\N
Run manual Chrome browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	43	Extended	\N
Write Code	Update warehouse stock counts	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	345	Extended	\N
Run automated Chrome browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	44	Extended	\N
Run manual Firefox  browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	45	Extended	\N
Run automated Firefox browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	46	Extended	\N
GUI for Purchase Your Items	Historic orders view	Defined	dudley@acme.com	11	11	\N	FALSE	\N	\N	\N	FALSE	1	\N	47	Extended	\N
Create Automated Tests	Historic orders view	Defined	tara@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	2	\N	48	Extended	\N
Implement Service Layer	Historic orders view	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	49	Extended	\N
Store Data for Recent Purchases	Historic orders view	Defined	dudley@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	50	Extended	\N
adjust stylesheet properties	latest Promo Code is invalid.	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	51	Extended	\N
fix screenshots in online help	latest Promo Code is invalid.	Defined	diane@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	52	Extended	\N
Move Code to new Servers	Move Server Room	Defined	dudley@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	54	Extended	\N
Update SQL	Move to Oracle	Defined	tara@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	0	\N	55	Extended	\N
Setup Oracle	Move to Oracle	Defined	daniel@acme.com	1	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	56	Extended	\N
Write Code	Multi-Site Shipping via API	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	57	Extended	\N
API Test Harnesses	Multi-Site Shipping via API	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	1	\N	58	Extended	\N
Run Functional Tests	Multi-Site Shipping via API	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	59	Extended	\N
Create automated Tests	Multi-Site Shipping via API	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	3	\N	60	Extended	\N
Link to shipping backend	Overnight Shipping	Defined	diane@acme.com	7	7	\N	FALSE	\N	\N	\N	FALSE	0	\N	61	Extended	\N
GUI for shipping options	Overnight Shipping	Defined	diane@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	62	Extended	\N
Run Functional Tests	Overnight Shipping	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	2	\N	63	Extended	\N
Validate GUI styles	Pay with Points	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	1	\N	64	Extended	\N
GUI for recent items list	Pay with Points	Defined	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	2	\N	65	Extended	\N
Run Functional Tests	Pay with Points	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	3	\N	66	Extended	\N
Use Shipping Web Service for Calculation	Pickup at location	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	0	\N	67	Extended	\N
Filter only company supported shipping options	Pickup at location	Defined	daniel@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	68	Extended	\N
Automated Tests for Web Services API	Pickup at location	Defined	diane@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	2	\N	69	Extended	\N
Code	Pickup or delivery location costs	Defined	dudley@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	70	Extended	\N
Create Automated Tests	Pickup or delivery location costs	Defined	dudley@acme.com	11	11	\N	FALSE	\N	\N	\N	FALSE	1	\N	71	Extended	\N
Doc	Pickup or delivery location costs	Defined	diane@acme.com	6	6	\N	FALSE	\N	\N	\N	FALSE	2	\N	72	Extended	\N
Code	Provide failover connection to G5 verification service.	Defined	diane@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	73	Extended	\N
Regression Testing	Provide failover connection to G5 verification service.	Defined	diane@acme.com	15	15	\N	FALSE	\N	\N	\N	FALSE	1	\N	74	Extended	\N
Database tables for order codes	Provide failover connection to G5 verification service.	Defined	dudley@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	75	Extended	\N
GUI for order pages	Provide failover connection to G5 verification service.	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	76	Extended	\N
Run Functional Tests	Provide failover connection to G5 verification service.	Defined	diane@acme.com	11	11	\N	FALSE	\N	\N	\N	FALSE	2	\N	77	Extended	\N
Create automated Tests	Provide failover connection to G5 verification service.	Defined	tara@acme.com	2	2	\N	TRUE	Need UI changes	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	3	\N	78	Extended	\N
GUI for Purchase Your Items	Purchase Your Items	Defined	dudley@acme.com	11	11	\N	FALSE	\N	\N	\N	FALSE	1	\N	79	Extended	\N
Create Automated Tests	Purchase Your Items	Defined	tara@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	2	\N	80	Extended	\N
Implement Service Layer	Purchase Your Items	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	81	Extended	\N
Implement Credit Card Payment Service	Purchase Your Items	Defined	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	4	\N	82	Extended	\N
Validate GUI design	Purchase Your Items	Defined	diane@acme.com	9	9	\N	FALSE	\N	\N	\N	FALSE	5	\N	83	Extended	\N
Run Manual Tests	Purchase Your Items	Defined	tara@acme.com	3	3	\N	TRUE	Test environment down.  IT says it'll be back up by 4pm ET.	<strong>Blocked:</strong> Test environment is down.	\N	FALSE	0	\N	84	Extended	\N
Create automated tests	QUICKShip Multi-Site Orders	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	85	Extended	\N
Doc	QUICKShip Multi-Site Orders	Defined	\N	7	7	\N	FALSE	\N	\N	\N	FALSE	2	\N	86	Extended	\N
UI for splitting order	QUICKShip Multi-Site Orders	Defined	\N	9	9	\N	FALSE	\N	\N	\N	FALSE	0	\N	87	Extended	\N
Create automated Tests	QUICKShip Single-Site Order	Defined	\N	6	6	\N	TRUE	Waiting for UI changes	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	1	\N	88	Extended	\N
Document Functionality	QUICKShip Single-Site Order	Defined	\N	2	2	\N	FALSE	\N	\N	\N	FALSE	2	\N	89	Extended	\N
Code	QUICKShip Single-Site Order	Defined	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	0	\N	90	Extended	\N
Create Automated Tests	QUICKShip Single-Site Order	Defined	\N	0	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	91	Extended	\N
Doc	QUICKShip Single-Site Order	Defined	\N	7	7	\N	FALSE	\N	\N	\N	FALSE	2	\N	92	Extended	\N
Backend Link to Shipping System	QUICKShipUpdate Shipping System for Each Order	Defined	\N	9	9	\N	FALSE	\N	\N	\N	FALSE	0	\N	93	Extended	\N
Update Logic	QUICKShipUpdate Shipping System for Each Order	Defined	\N	14	14	\N	FALSE	\N	\N	\N	FALSE	1	\N	94	Extended	\N
Automated Tests	QUICKShipUpdate Shipping System for Each Order	Defined	\N	4	4	\N	FALSE	\N	\N	\N	FALSE	2	\N	95	Extended	\N
Link to shipping backend	QUIKShip	Defined	diane@acme.com	7	7	\N	FALSE	\N	\N	\N	FALSE	0	\N	96	Extended	\N
GUI for shipping options	QUIKShip	Defined	diane@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	97	Extended	\N
Run Functional Tests	QUIKShip	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	2	\N	98	Extended	\N
adjust stylesheet properties	Re-order invalidated promo code	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	99	Extended	\N
fix screenshots in online help	Re-order invalidated promo code	Defined	diane@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	100	Extended	\N
Store Data for Recent Purchases	Recent Purchases View	Defined	dudley@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	101	Extended	\N
Validate GUI styles	Recent Purchases View	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	1	\N	102	Extended	\N
GUI for recent items list	Recent Purchases View	Defined	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	2	\N	103	Extended	\N
Run Functional Tests	Recent Purchases View	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	3	\N	104	Extended	\N
UI for splitting order	Ship Multi-Site Orders	Defined	\N	9	9	\N	FALSE	\N	\N	\N	FALSE	0	\N	105	Extended	\N
Create automated tests	Ship Multi-Site Orders	Defined	\N	6	6	\N	TRUE	Waiting for UI changes	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	1	\N	106	Extended	\N
Document Functionality	Ship Multi-Site Orders	Defined	\N	4	4	\N	FALSE	\N	\N	\N	FALSE	2	\N	107	Extended	\N
Code	Ship Multi-Site Orders	Defined	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	0	\N	108	Extended	\N
Write Code	Shipping orders via API	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	109	Extended	\N
API Test Harnesses	Shipping orders via API	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	110	Extended	\N
Automated Tests	Shipping orders via API	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	111	Extended	\N
Run Functional Tests	Shipping orders via API	Defined	dudley@acme.com	0	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	112	Extended	\N
use new api version call	State drop down doesn't contain any items	Defined	dudley@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	113	Extended	\N
replace renderer to show display value instead of internal value	State drop down doesn't contain any items	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	1	\N	114	Extended	\N
use new api version call	State drop down is missing all two word states.	Defined	dudley@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	115	Extended	\N
replace renderer to show display value instead of internal value	State drop down is missing all two word states.	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	1	\N	116	Extended	\N
Create Automated Tests	Unable to login after entering 3 security questions correctly	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	117	Extended	\N
Fix exception handling routing after failed login	Unable to login after entering 3 security questions correctly	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	118	Extended	\N
Create Automated Tests	Unable to login after entering invalid password	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	119	Extended	\N
Fix exception handling routing after failed login	Unable to login after entering invalid password	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	120	Extended	\N
Backend Link to Shipping System	Update Shipping System for Each Order	Defined	\N	9	9	\N	FALSE	\N	\N	\N	FALSE	0	\N	121	Extended	\N
Update Logic	Update Shipping System for Each Order	Defined	\N	14	14	\N	FALSE	\N	\N	\N	FALSE	1	\N	122	Extended	\N
Automated Tests	Update Shipping System for Each Order	Defined	\N	4	4	\N	FALSE	\N	\N	\N	FALSE	2	\N	123	Extended	\N
Update SQL	Update to latest MongoDB	Defined	tara@acme.com	3	3	\N	FALSE	\N	\N	\N	FALSE	0	\N	124	Extended	\N
Setup Oracle	Update to latest MongoDB	Defined	daniel@acme.com	1	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	125	Extended	\N
Code	Uptime 0.9995 reliability	Defined	\N	11	11	\N	FALSE	\N	\N	\N	FALSE	0	\N	126	Extended	\N
Create Automated Tests	Uptime 0.9995 reliability	Defined	\N	6	6	\N	FALSE	\N	\N	\N	FALSE	1	\N	127	Extended	\N
Write front-end validation code	Validate Customer Contact/Shipping info	Defined	daniel@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	128	Extended	\N
Call Web Service for Address Verification	Validate Customer Contact/Shipping info	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	129	Extended	\N
Document Validation Functionality	Validate Customer Contact/Shipping info	Defined	daniel@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	2	\N	130	Extended	\N
Database tables for order codes	View By Order	Defined	dudley@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	131	Extended	\N
GUI for order pages	View By Order	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	132	Extended	\N
Run Functional Tests	View By Order	Defined	diane@acme.com	11	11	\N	FALSE	\N	\N	\N	FALSE	2	\N	133	Extended	\N
Create automated Tests	View By Order	Defined	tara@acme.com	2	2	\N	TRUE	Need UI changes	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	3	\N	134	Extended	\N
Code	Website must be available 24x7	Defined	\N	11	11	\N	FALSE	\N	\N	\N	FALSE	0	\N	135	Extended	\N
Create Automated Tests	Website must be available 24x7	Defined	\N	6	6	\N	FALSE	\N	\N	\N	FALSE	1	\N	136	Extended	\N
Run manual Safari  browser test	Safari Browser Tests: Checkout Path	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	137	Extended	\N
Run automated Safari browser test	Safari Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	138	Extended	\N
Run manual Opera  browser test	Opera Browser Tests: Checkout Path	Defined	tara@acme.com	8	8	\N	TRUE	Not installed in our test enviro	\N	\N	FALSE	0	\N	139	Extended	\N
Run automated Opera browser test	Opera Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	TRUE	Not installed in our test enviro	\N	\N	FALSE	1	\N	140	Extended	\N
UI for splitting order	QUICKShip Single-Site Order	Defined	\N	9	9	\N	FALSE	\N	\N	\N	FALSE	0	\N	141	Extended	\N
GUI for Purchase Your Items	Save cart for future checkout	Defined	dudley@acme.com	11	11	\N	FALSE	\N	\N	\N	FALSE	1	\N	142	Extended	\N
Create Automated Tests	Save cart for future checkout	Defined	tara@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	2	\N	143	Extended	\N
Implement Service Layer	Save cart for future checkout	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	144	Extended	\N
Implement Credit Card Payment Service	Save cart for future checkout	Defined	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	4	\N	145	Extended	\N
Validate GUI design	Save cart for future checkout	Defined	diane@acme.com	9	9	\N	FALSE	\N	\N	\N	FALSE	5	\N	146	Extended	\N
Run Manual Tests	Save cart for future checkout	Defined	tara@acme.com	3	3	\N	TRUE	Test environment down.  IT says it'll be back up by 4pm ET.	<strong>Blocked:</strong> Test environment is down.	\N	FALSE	0	\N	147	Extended	\N
Code	Determine security for online refunds	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	148	Extended	\N
Code	Wireframe design for online refunds	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	149	Extended	\N
Code	Create Paypal security model	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	150	Extended	\N
Code	Create ACK messaging interface to Paypal	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	151	Extended	\N
Code	Create WePay security model	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	152	Extended	\N
Code	Create ACK messaging interface to WePay	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	153	Extended	\N
Code	Create flow thru payment system for refunds	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	154	Extended	\N
Code	Design wireframes for refund management	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	155	Extended	\N
Code	Develop security for API	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	156	Extended	\N
Code	Identify web doc and pdf  doc changes to support public API	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	157	Extended	\N
Code	Develop coupon.com integration strategy	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	158	Extended	\N
Code	Establish interface spec with coupon.com	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	159	Extended	\N
Code	Determine interface spec for error messages	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	161	Extended	\N
Code	Revalidate product listings for website and mobile	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	162	Extended	\N
Code	Product listing analysis for marketing	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	163	Extended	\N
Code	Identify realtime chat options	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	164	Extended	\N
Code	Fraud Detection features design and interface	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	165	Extended	\N
Code	Determine parameters for write and delete in API	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	166	Extended	\N
Code	Design mods to sys admin screen	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	167	Extended	\N
Code	Create design mods to personal profiles to allow history reset	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	168	Extended	\N
Code	Re-design suggestion and personal history interface	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	169	Extended	\N
Code	History setting redesign	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	170	Extended	\N
Code	"Like" interface to leverage integration to orders	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	171	Extended	\N
Code	Verify that order tracking will work with returns w/o redesign	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	172	Extended	\N
Code	Order system design to allow history	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	173	Extended	\N
Code	SMS interface modernization	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	174	Extended	\N
Code	Wireframe other recommended options	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	175	Extended	\N
Code	Create lo res interface for mobile	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	176	Extended	\N
Code	cart interface modification, save in profile, recall	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	177	Extended	\N
Code	Design refund system to allow the return of new purchase	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	178	Extended	\N
Code	User needs realtime feedback on purchase`	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	179	Extended	\N
Code	Design user and SE interface for portal	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	180	Extended	\N
Code	Add location specific purchase attrs	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	181	Extended	\N
Code	Implement personal profile security policy	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	182	Extended	\N
Code	Modify auth codes for API attributed to users	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	183	Extended	\N
Code	Determine path with mobile	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	184	Extended	\N
Code	Identify CC to be accepted	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	185	Extended	\N
Code	Verify CC security code interface	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	186	Extended	\N
Docs	Determine security for online refunds	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	187	Extended	\N
Docs	Wireframe design for online refunds	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	188	Extended	\N
Docs	Create Paypal security model	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	189	Extended	\N
Docs	Create ACK messaging interface to Paypal	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	190	Extended	\N
Docs	Create WePay security model	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	191	Extended	\N
Docs	Create ACK messaging interface to WePay	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	192	Extended	\N
Docs	Create flow thru payment system for refunds	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	193	Extended	\N
Docs	Design wireframes for refund management	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	194	Extended	\N
Docs	Develop security for API	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	195	Extended	\N
Docs	Identify web doc and pdf  doc changes to support public API	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	196	Extended	\N
Docs	Develop coupon.com integration strategy	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	197	Extended	\N
Docs	Establish interface spec with coupon.com	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	198	Extended	\N
Docs	Identify error messages	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	199	Extended	\N
Docs	Determine interface spec for error messages	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	200	Extended	\N
Docs	Revalidate product listings for website and mobile	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	201	Extended	\N
Docs	Product listing analysis for marketing	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	202	Extended	\N
Docs	Identify realtime chat options	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	203	Extended	\N
Docs	Fraud Detection features design and interface	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	204	Extended	\N
Docs	Determine parameters for write and delete in API	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	205	Extended	\N
Docs	Design mods to sys admin screen	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	206	Extended	\N
Docs	Create design mods to personal profiles to allow history reset	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	207	Extended	\N
Docs	Re-design suggestion and personal history interface	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	208	Extended	\N
Docs	History setting redesign	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	209	Extended	\N
Docs	"Like" interface to leverage integration to orders	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	210	Extended	\N
Docs	Verify that order tracking will work with returns w/o redesign	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	211	Extended	\N
Docs	Order system design to allow history	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	212	Extended	\N
Docs	SMS interface modernization	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	213	Extended	\N
Docs	Wireframe other recommended options	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	214	Extended	\N
Docs	Create lo res interface for mobile	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	215	Extended	\N
Docs	cart interface modification, save in profile, recall	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	216	Extended	\N
Docs	Design refund system to allow the return of new purchase	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	217	Extended	\N
Docs	User needs realtime feedback on purchase`	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	218	Extended	\N
Docs	Design user and SE interface for portal	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	219	Extended	\N
Docs	Add location specific purchase attrs	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	220	Extended	\N
Docs	Implement personal profile security policy	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	221	Extended	\N
Docs	Modify auth codes for API attributed to users	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	222	Extended	\N
Docs	Determine path with mobile	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	223	Extended	\N
Docs	Identify CC to be accepted	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	224	Extended	\N
Docs	Verify CC security code interface	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	225	Extended	\N
Test	Determine security for online refunds	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	226	Extended	\N
Test	Wireframe design for online refunds	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	227	Extended	\N
Test	Create Paypal security model	Defined	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	228	Extended	\N
Test	Create ACK messaging interface to Paypal	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	229	Extended	\N
Test	Create WePay security model	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	230	Extended	\N
Test	Create ACK messaging interface to WePay	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	231	Extended	\N
Test	Create flow thru payment system for refunds	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	232	Extended	\N
Test	Design wireframes for refund management	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	233	Extended	\N
Test	Develop security for API	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	234	Extended	\N
Test	Identify web doc and pdf  doc changes to support public API	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	235	Extended	\N
Test	Develop coupon.com integration strategy	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	236	Extended	\N
Test	Establish interface spec with coupon.com	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	237	Extended	\N
Test	Identify error messages	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	238	Extended	\N
Test	Determine interface spec for error messages	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	239	Extended	\N
Test	Revalidate product listings for website and mobile	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	240	Extended	\N
Test	Product listing analysis for marketing	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	241	Extended	\N
Test	Identify realtime chat options	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	242	Extended	\N
Test	Fraud Detection features design and interface	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	243	Extended	\N
Test	Determine parameters for write and delete in API	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	244	Extended	\N
Test	Design mods to sys admin screen	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	245	Extended	\N
Test	Create design mods to personal profiles to allow history reset	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	246	Extended	\N
Test	Re-design suggestion and personal history interface	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	247	Extended	\N
Test	History setting redesign	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	248	Extended	\N
Test	"Like" interface to leverage integration to orders	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	249	Extended	\N
Test	Verify that order tracking will work with returns w/o redesign	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	250	Extended	\N
Test	Order system design to allow history	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	251	Extended	\N
Test	SMS interface modernization	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	252	Extended	\N
Test	Wireframe other recommended options	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	253	Extended	\N
Test	Create lo res interface for mobile	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	254	Extended	\N
Test	cart interface modification, save in profile, recall	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	255	Extended	\N
Test	Design refund system to allow the return of new purchase	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	256	Extended	\N
Test	User needs realtime feedback on purchase`	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	257	Extended	\N
Test	Design user and SE interface for portal	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	258	Extended	\N
Test	Add location specific purchase attrs	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	259	Extended	\N
Test	Implement personal profile security policy	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	260	Extended	\N
Test	Modify auth codes for API attributed to users	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	261	Extended	\N
Test	Determine path with mobile	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	262	Extended	\N
Test	Identify CC to be accepted	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	263	Extended	\N
Test	Verify CC security code interface	Defined	tara@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	2	\N	264	Extended	\N
Write Code	Combine by date	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	265	Extended	\N
API Test Harnesses	Combine by date	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	266	Extended	\N
Write Docs	Combine by date	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	267	Extended	\N
Run Functional Tests	Combine by date	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	268	Extended	\N
Write Code	Combine by shipping address	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	269	Extended	\N
API Test Harnesses	Combine by shipping address	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	270	Extended	\N
Write Docs	Combine by shipping address	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	271	Extended	\N
Run Functional Tests	Combine by shipping address	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	272	Extended	\N
Write Code	Add Single Item	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	273	Extended	\N
API Test Harnesses	Add Single Item	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	274	Extended	\N
Write Docs	Add Single Item	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	275	Extended	\N
Run Functional Tests	Add Single Item	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	276	Extended	\N
Write Code	Clone contents from previous cart	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	277	Extended	\N
API Test Harnesses	Clone contents from previous cart	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	278	Extended	\N
Write Docs	Clone contents from previous cart	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	279	Extended	\N
Run Functional Tests	Clone contents from previous cart	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	280	Extended	\N
Write Code	Combine Multiple Items	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	281	Extended	\N
API Test Harnesses	Combine Multiple Items	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	282	Extended	\N
Write Docs	Combine Multiple Items	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	283	Extended	\N
Run Functional Tests	Combine Multiple Items	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	284	Extended	\N
Write Code	Customize product list	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	285	Extended	\N
API Test Harnesses	Customize product list	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	286	Extended	\N
Write Docs	Customize product list	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	287	Extended	\N
Run Functional Tests	Customize product list	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	288	Extended	\N
Write Code	Daily deals	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	289	Extended	\N
API Test Harnesses	Daily deals	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	290	Extended	\N
Write Docs	Daily deals	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	291	Extended	\N
Run Functional Tests	Daily deals	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	292	Extended	\N
Write Code	one-click checkout	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	293	Extended	\N
API Test Harnesses	one-click checkout	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	294	Extended	\N
Write Docs	one-click checkout	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	295	Extended	\N
Run Functional Tests	one-click checkout	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	296	Extended	\N
Write Code	Payment - Gift Certificates	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	297	Extended	\N
API Test Harnesses	Payment - Gift Certificates	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	298	Extended	\N
Write Docs	Payment - Gift Certificates	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	299	Extended	\N
Run Functional Tests	Payment - Gift Certificates	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	300	Extended	\N
Write Code	As a user I would like to save history	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	301	Extended	\N
API Test Harnesses	As a user I would like to save history	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	302	Extended	\N
Write Docs	As a user I would like to save history	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	303	Extended	\N
Run Functional Tests	As a user I would like to save history	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	304	Extended	\N
Write Code	As a user I would like to search for history	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	305	Extended	\N
API Test Harnesses	As a user I would like to search for history	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	306	Extended	\N
Write Docs	As a user I would like to search for history	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	307	Extended	\N
Run Functional Tests	As a user I would like to search for history	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	308	Extended	\N
Write Code	As a user I would like to send history	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	309	Extended	\N
API Test Harnesses	As a user I would like to send history	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	310	Extended	\N
Write Docs	As a user I would like to send history	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	311	Extended	\N
Run Functional Tests	As a user I would like to send history	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	312	Extended	\N
Write Code	As a user I would like to sort history	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	313	Extended	\N
API Test Harnesses	As a user I would like to sort history	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	314	Extended	\N
Write Docs	As a user I would like to sort history	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	315	Extended	\N
Run Functional Tests	As a user I would like to sort history	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	316	Extended	\N
Write Code	As a user I would like to undelete history	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	317	Extended	\N
API Test Harnesses	As a user I would like to undelete history	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	318	Extended	\N
Write Docs	As a user I would like to undelete history	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	319	Extended	\N
Run Functional Tests	As a user I would like to undelete history	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	320	Extended	\N
Write Code	Search for packing slips	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	321	Extended	\N
API Test Harnesses	Search for packing slips	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	322	Extended	\N
Write Docs	Search for packing slips	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	323	Extended	\N
Run Functional Tests	Search for packing slips	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	324	Extended	\N
Write Code	Auto delete packing slips after 6 months	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	325	Extended	\N
API Test Harnesses	Auto delete packing slips after 6 months	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	326	Extended	\N
Write Docs	Auto delete packing slips after 6 months	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	327	Extended	\N
Run Functional Tests	Auto delete packing slips after 6 months	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	328	Extended	\N
Write Code	Reactivate packing slips	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	329	Extended	\N
API Test Harnesses	Reactivate packing slips	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	330	Extended	\N
Write Docs	Reactivate packing slips	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	331	Extended	\N
Run Functional Tests	Reactivate packing slips	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	332	Extended	\N
Write Code	Return labels printing first/last name in wrong order.	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	333	Extended	\N
API Test Harnesses	Return labels printing first/last name in wrong order.	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	334	Extended	\N
Write Docs	Return labels printing first/last name in wrong order.	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	335	Extended	\N
Run Functional Tests	Return labels printing first/last name in wrong order.	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	336	Extended	\N
Write Code	Implement barcode tracking for return items	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	337	Extended	\N
API Test Harnesses	Implement barcode tracking for return items	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	338	Extended	\N
Write Docs	Implement barcode tracking for return items	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	339	Extended	\N
Run Functional Tests	Implement barcode tracking for return items	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	340	Extended	\N
Write Code	Apply credits to account from valid return items	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	341	Extended	\N
API Test Harnesses	Apply credits to account from valid return items	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	342	Extended	\N
Write Docs	Apply credits to account from valid return items	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	343	Extended	\N
Run Functional Tests	Apply credits to account from valid return items	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	344	Extended	\N
API Test Harnesses	Update warehouse stock counts	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	346	Extended	\N
Write Docs	Update warehouse stock counts	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	347	Extended	\N
Run Functional Tests	Update warehouse stock counts	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	348	Extended	\N
Write Code	Email notifications upon successful return processing	Defined	diane@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	349	Extended	\N
API Test Harnesses	Email notifications upon successful return processing	Defined	diane@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	350	Extended	\N
Write Docs	Email notifications upon successful return processing	Defined	tara@acme.com	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	351	Extended	\N
Run Functional Tests	Email notifications upon successful return processing	Defined	dudley@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	352	Extended	\N
\.


--
-- Data for Name: testcase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testcase (name, owner, project, testfolder, workproduct, method, description, objective, postconditions, preconditions, priority, ready, risk, type, validationexpectedresult, validationinput, listing_order, dataset) FROM stdin;
Calculate shipping costs for multiple destinations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	1	Color Coded
Check Invoice Creation	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	2	Color Coded
Check the Status of Your Orders	tara@acme.com	Shopping Team	Order Status	Check the Status of Your Order	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	3	Color Coded
Validate data fields for Shipping information	tara@acme.com	Shopping Team	\N	Data fields for Shipping information	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	4	Color Coded
Default Shipping - Ground	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	5	Color Coded
GUI - Checkout Button	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Critical	FALSE	Low	Acceptance	\N	\N	6	Color Coded
Invalid Promo Code	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	9	Color Coded
GUI - Checkout Button for Empty Cart	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Useful	FALSE	Low	Acceptance	\N	\N	7	Color Coded
GUI - Multi-Site Shipping Options	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	8	Color Coded
Log-in to Secured Website	tara@acme.com	Shopping Team	Login/Authentication	Log-in to Secured Website	Manual	Verify that entering a correct username/password combo on the login screen grants a user access to the application.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	10	Color Coded
Log-off Website	tara@acme.com	Shopping Team	Login/Authentication	Log-off Website	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	11	Color Coded
Max Number of Shipping Destinations	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	12	Color Coded
No Address Entered	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	13	Color Coded
One Promo Code per order	tina@acme.com	Payment Team	\N	Payment - Promotional Codes	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	14	Color Coded
Order Verification	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	15	Color Coded
Order Verification - Backordered Item Handling	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	16	Color Coded
Priority Shipping chosen on a per-package basis	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	17	Color Coded
Priority Shipping GUI	tara@acme.com	Shopping Team	Fulfillment	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	18	Color Coded
Priority Shipping Options for each Destination	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	19	Color Coded
Promo Code GUI	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	20	Color Coded
Purchase MAX Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	21	Color Coded
Search for Items	tara@acme.com	Shopping Team	Shopping	Search for Items	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	24	Color Coded
Shipping Address and Billing Address must match	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	26	Color Coded
Shipping Calculations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	27	Color Coded
Purchase Multiple Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	22	Color Coded
Tracking Information	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	29	Color Coded
Purchase One Item	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test the functionality of the purchase options in the shopping site.	Logoff and clear the browser cache so that no lingering test data gets saved. &nbsp;Reset the account history details in the shopping application.	A browser connection to the shopping site is required. &nbsp;Please ensure that your browser is updated to the latest version for your platform. &nbsp;A registered User ID is also required.	Important	FALSE	Low	Acceptance	An email should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The purchase complete window should list your order details that were purchased.	23	Color Coded
Search for Items	tara@acme.com	Shopping Team	Shopping	Search for Items	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	24	Standard
Shipping Address and Billing Address must match	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	26	Standard
Order Verification - Backordered Item Handling	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Select MAX+1 Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	25	Color Coded
System should support 10,000 concurrent users	tara@acme.com	Shopping Team	\N	System should support 10,000 concurrent users	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	28	Color Coded
Update Total Shipping Cost	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	30	Color Coded
Updated Totals	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	31	Color Coded
Validate Email Address - Email Authentication	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	32	Color Coded
Validate Email Address - Invalid Address Handling	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	33	Color Coded
Validate Email Address - Permissions	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	34	Color Coded
Validate website must be available 24x7	tara@acme.com	Shopping Team	\N	Website must be available 24x7	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	35	Color Coded
Failed Test Case for Demonstration	\N	Medical Records App	\N	Prescription Administration Updates	Automated	\N	\N	\N	\N	\N	FALSE	\N	Functional	\N	\N	36	Color Coded
CheckNewPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	37	Color Coded
CheckExistingPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	38	Color Coded
Calculate shipping costs for multiple destinations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	1	Standard
Check Invoice Creation	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	2	Standard
Check the Status of Your Orders	tara@acme.com	Shopping Team	Order Status	Check the Status of Your Order	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	3	Standard
Validate data fields for Shipping information	tara@acme.com	Shopping Team	\N	Data fields for Shipping information	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	4	Standard
Default Shipping - Ground	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	5	Standard
GUI - Checkout Button	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Critical	FALSE	Low	Acceptance	\N	\N	6	Standard
Invalid Promo Code	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	9	Standard
GUI - Checkout Button for Empty Cart	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Useful	FALSE	Low	Acceptance	\N	\N	7	Standard
GUI - Multi-Site Shipping Options	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	8	Standard
Log-in to Secured Website	tara@acme.com	Shopping Team	Login/Authentication	Log-in to Secured Website	Manual	Verify that entering a correct username/password combo on the login screen grants a user access to the application.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	10	Standard
Log-off Website	tara@acme.com	Shopping Team	Login/Authentication	Log-off Website	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	11	Standard
Max Number of Shipping Destinations	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	12	Standard
No Address Entered	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	13	Standard
One Promo Code per order	tina@acme.com	Payment Team	\N	Payment - Promotional Codes	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	14	Standard
Order Verification	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	15	Standard
Order Verification - Backordered Item Handling	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	16	Standard
Priority Shipping chosen on a per-package basis	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	17	Standard
Priority Shipping GUI	tara@acme.com	Shopping Team	Fulfillment	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	18	Standard
Priority Shipping Options for each Destination	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	19	Standard
Promo Code GUI	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	20	Standard
Purchase MAX Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	21	Standard
Shipping Calculations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	27	Standard
Purchase Multiple Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	22	Standard
Tracking Information	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	29	Standard
Purchase One Item	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test the functionality of the purchase options in the shopping site.	Logoff and clear the browser cache so that no lingering test data gets saved. &nbsp;Reset the account history details in the shopping application.	A browser connection to the shopping site is required. &nbsp;Please ensure that your browser is updated to the latest version for your platform. &nbsp;A registered User ID is also required.	Important	FALSE	Low	Acceptance	An email should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The purchase complete window should list your order details that were purchased.	23	Standard
Select MAX+1 Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	25	Standard
System should support 10,000 concurrent users	tara@acme.com	Shopping Team	\N	System should support 10,000 concurrent users	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	28	Standard
Update Total Shipping Cost	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	30	Standard
Updated Totals	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	31	Standard
Validate Email Address - Email Authentication	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	32	Standard
Validate Email Address - Invalid Address Handling	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	33	Standard
Validate Email Address - Permissions	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	34	Standard
Validate website must be available 24x7	tara@acme.com	Shopping Team	\N	Website must be available 24x7	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	35	Standard
Failed Test Case for Demonstration	\N	Medical Records App	\N	Prescription Administration Updates	Automated	\N	\N	\N	\N	\N	FALSE	\N	Functional	\N	\N	36	Standard
CheckNewPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	37	Standard
CheckExistingPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	38	Standard
Calculate shipping costs for multiple destinations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Check Invoice Creation	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Check the Status of Your Orders	tara@acme.com	Shopping Team	Order Status	Check the Status of Your Order	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
Validate data fields for Shipping information	tara@acme.com	Shopping Team	\N	Data fields for Shipping information	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Default Shipping - Ground	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
GUI - Checkout Button	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
GUI - Checkout Button for Empty Cart	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
GUI - Multi-Site Shipping Options	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Invalid Promo Code	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
Log-in to Secured Website	tara@acme.com	Shopping Team	Login/Authentication	Log-in to Secured Website	Manual	Verify that entering a correct username/password combo on the login screen grants a user access to the application.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Log-off Website	tara@acme.com	Shopping Team	Login/Authentication	Log-off Website	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Max Number of Shipping Destinations	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
No Address Entered	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
One Promo Code per order	tina@acme.com	Payment Team	\N	Payment - Promotional Codes	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Order Verification	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Priority Shipping chosen on a per-package basis	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Priority Shipping GUI	tara@acme.com	Shopping Team	Fulfillment	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Priority Shipping Options for each Destination	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Promo Code GUI	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Purchase MAX Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	\N	Summer
Purchase Multiple Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	\N	Summer
Purchase One Item	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test the functionality of the purchase options in the shopping site.	Logoff and clear the browser cache so that no lingering test data gets saved. &nbsp;Reset the account history details in the shopping application.	A browser connection to the shopping site is required. &nbsp;Please ensure that your browser is updated to the latest version for your platform. &nbsp;A registered User ID is also required.	Important	FALSE	Low	Acceptance	An email should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The purchase complete window should list your order details that were purchased.	\N	Summer
Search for Items	tara@acme.com	Shopping Team	Shopping	Search for Items	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Select MAX+1 Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	\N	Summer
Shipping Address and Billing Address must match	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Shipping Calculations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
System should support 10,000 concurrent users	tara@acme.com	Shopping Team	\N	System should support 10,000 concurrent users	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Tracking Information	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Update Total Shipping Cost	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Updated Totals	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
Validate Email Address - Email Authentication	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Validate Email Address - Invalid Address Handling	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
Validate Email Address - Permissions	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Validate website must be available 24x7	tara@acme.com	Shopping Team	\N	Website must be available 24x7	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Failed Test Case for Demonstration	\N	Medical Records App	\N	Prescription Administration Updates	Automated	\N	\N	\N	\N	\N	FALSE	\N	Functional	\N	\N	\N	Summer
CheckNewPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	\N	Summer
CheckExistingPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	\N	Summer
Calculate shipping costs for multiple destinations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	1	Extended
Check Invoice Creation	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	2	Extended
Check the Status of Your Orders	tara@acme.com	Shopping Team	Order Status	Check the Status of Your Order	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	3	Extended
Validate data fields for Shipping information	tara@acme.com	Shopping Team	\N	Data fields for Shipping information	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	4	Extended
Default Shipping - Ground	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	5	Extended
GUI - Checkout Button	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Critical	FALSE	Low	Acceptance	\N	\N	6	Extended
GUI - Checkout Button for Empty Cart	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Useful	FALSE	Low	Acceptance	\N	\N	7	Extended
GUI - Multi-Site Shipping Options	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	8	Extended
Invalid Promo Code	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	9	Extended
Log-in to Secured Website	tara@acme.com	Shopping Team	Login/Authentication	Log-in to Secured Website	Manual	Verify that entering a correct username/password combo on the login screen grants a user access to the application.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	10	Extended
Log-off Website	tara@acme.com	Shopping Team	Login/Authentication	Log-off Website	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	11	Extended
Max Number of Shipping Destinations	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	12	Extended
No Address Entered	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	13	Extended
One Promo Code per order	tina@acme.com	Payment Team	\N	Payment - Promotional Codes	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	14	Extended
Order Verification	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	15	Extended
Order Verification - Backordered Item Handling	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	16	Extended
Priority Shipping chosen on a per-package basis	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	17	Extended
Priority Shipping GUI	tara@acme.com	Shopping Team	Fulfillment	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	18	Extended
Priority Shipping Options for each Destination	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	19	Extended
Promo Code GUI	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	20	Extended
Purchase MAX Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	21	Extended
Purchase Multiple Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	22	Extended
Update Total Shipping Cost	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	30	Extended
Updated Totals	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	31	Extended
Validate Email Address - Email Authentication	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	32	Extended
Purchase One Item	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test the functionality of the purchase options in the shopping site.	Logoff and clear the browser cache so that no lingering test data gets saved. &nbsp;Reset the account history details in the shopping application.	A browser connection to the shopping site is required. &nbsp;Please ensure that your browser is updated to the latest version for your platform. &nbsp;A registered User ID is also required.	Important	FALSE	Low	Acceptance	An email should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The purchase complete window should list your order details that were purchased.	23	Extended
Search for Items	tara@acme.com	Shopping Team	Shopping	Search for Items	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	24	Extended
Select MAX+1 Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	25	Extended
Shipping Address and Billing Address must match	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	26	Extended
Shipping Calculations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	27	Extended
System should support 10,000 concurrent users	tara@acme.com	Shopping Team	\N	System should support 10,000 concurrent users	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	28	Extended
Tracking Information	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	29	Extended
Validate Email Address - Invalid Address Handling	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	33	Extended
Validate Email Address - Permissions	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	34	Extended
Validate website must be available 24x7	tara@acme.com	Shopping Team	\N	Website must be available 24x7	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	35	Extended
Failed Test Case for Demonstration	\N	Medical Records App	\N	Prescription Administration Updates	Automated	\N	\N	\N	\N	\N	FALSE	\N	Functional	\N	\N	36	Extended
CheckNewPatient-QA	tony@acme.com	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	37	Extended
CheckExistingPatient-QA	tara@acme.com	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	38	Extended
\.


--
-- Data for Name: testcaseresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testcaseresult (build, date, duration, notes, verdict, testcase, testset, tester, listing_order, dataset) FROM stdin;
113	2019-06-07 09:35:00	0	\N	Pass	Promo Code GUI	\N	\N	\N	Summer
114	2019-05-30 10:59:00	0	\N	Fail	Tracking Information	\N	\N	67	Standard
114	2017-08-16 20:40:09	0	\N	Pass	Validate Email Address - Permissions	\N	\N	\N	Summer
114	2019-05-30 10:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	60	Color Coded
113	2019-06-07 09:35:00	4	!! FAILURE NOTE: Error accessing purchase engine.	Fail	Purchase Multiple Items	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	21	Color Coded
114	2017-11-18 20:40:15	0	\N	Pass	Promo Code GUI	\N	\N	47	Standard
113	2019-06-07 09:35:00	0	\N	Pass	Priority Shipping GUI	\N	\N	\N	Summer
113	2019-06-07 09:35:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	\N	Summer
114	2017-08-16 20:40:16	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	\N	Summer
114	2019-05-30 10:59:00	0	\N	Pass	No Address Entered	\N	\N	30	Standard
114	2017-08-16 20:40:15	0	\N	Pass	Promo Code GUI	\N	\N	\N	Summer
119	2017-08-16 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	\N	Summer
114	2017-08-16 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	\N	Summer
112	2019-05-30 10:59:00	0	\N	Fail	Log-in to Secured Website	\N	\N	20	Color Coded
112	2019-06-07 09:35:00	0	\N	Fail	Log-off Website	\N	\N	\N	Summer
114	2017-11-18 20:40:09	0	\N	Pass	Search for Items	\N	\N	56	Standard
1.2.24	2019-06-07 09:35:00	1	\N	Pass	Log-off Website	\N	\N	\N	Summer
1.2.24	2019-06-07 09:35:00	1	\N	Pass	Tracking Information	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Pass	Invalid Promo Code	\N	\N	16	Standard
113	2019-05-30 10:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	39	Color Coded
114	2019-05-30 10:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	22	Standard
1.2.24	2019-05-24 00:00:00	2	\N	Pass	Log-in to Secured Website	\N	\N	19	Extended
115	2017-11-19 20:40:04	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	64	Color Coded
114	2019-06-07 09:35:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	13	Color Coded
115	2017-11-19 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	43	Standard
113	2019-06-07 09:35:00	0	\N	Pass	Log-in to Secured Website	\N	\N	\N	Summer
114	2019-05-24 00:00:00	0	\N	Pass	Log-in to Secured Website	\N	\N	22	Extended
113	2019-05-30 10:59:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	10	Standard
114	2017-08-16 20:40:15	0	\N	Pass	Invalid Promo Code	\N	\N	\N	Summer
118	2017-08-17 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	\N	Summer
115	2017-08-17 20:40:15	0	\N	Fail	Invalid Promo Code	\N	\N	\N	Summer
1.2.24	2019-05-30 10:59:00	1	Only showing 1 order, not 2.	Fail	Check the Status of Your Orders	\N	\N	3	Standard
113	2019-05-24 00:00:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	59	Extended
115	2019-05-24 00:00:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	61	Extended
114	2019-05-24 00:00:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	63	Extended
113	2019-05-30 10:59:00	0	\N	Pass	Order Verification	\N	\N	35	Standard
1.2.24	2019-05-30 10:59:00	1	\N	Pass	Log-off Website	\N	\N	23	Standard
115	2017-08-17 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	\N	Summer
112	2019-05-30 10:59:00	0	\N	Fail	Log-off Website	\N	\N	24	Color Coded
113	2019-05-30 10:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	37	Standard
115	2017-08-17 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	\N	Summer
115	2017-11-19 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	12	Color Coded
114	2019-05-30 10:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	38	Color Coded
114	2017-11-18 20:40:10	1.5	!! FAILURE NOTE: Entered one item and the cart showed duplicate entries.	Fail	Purchase One Item	\N	\N	54	Standard
114	2019-05-30 10:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	75	Color Coded
115	2017-11-19 20:40:04	0	\N	Fail	Validate website must be available 24x7	\N	\N	76	Standard
118	2017-11-19 04:14:51	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	45	Color Coded
117	2017-08-16 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	\N	Summer
113	2019-06-07 09:35:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	\N	Summer
119	2017-11-18 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	9	Color Coded
113	2019-05-30 10:59:00	0	\N	Fail	Search for Items	\N	\N	55	Color Coded
113	2019-05-30 10:59:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	26	Standard
113	2019-05-30 10:59:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	10	Color Coded
113	2019-06-07 09:35:00	0	\N	Fail	Validate Email Address - Email Authentication	\N	\N	\N	Summer
117	2017-11-18 20:40:11	2	!! FAILURE NOTE: Unable to purchase exactly MAX items. Error message indicates count exceeded.  Is this a < vs. <= condition?	Fail	Purchase MAX Items	\N	\N	49	Color Coded
114	2019-05-24 00:00:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	40	Extended
1.2.24	2019-05-30 10:59:00	2	\N	Pass	Log-in to Secured Website	\N	\N	19	Color Coded
117	2017-11-18 20:40:11	2	!! FAILURE NOTE: Unable to purchase exactly MAX items. Error message indicates count exceeded.  Is this a < vs. <= condition?	Fail	Purchase MAX Items	\N	\N	49	Standard
113	2019-05-30 10:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	59	Color Coded
113	2019-05-30 10:59:00	0	\N	Pass	One Promo Code per order	\N	\N	32	Standard
114	2019-05-24 00:00:00	0	\N	Pass	Invalid Promo Code	\N	\N	17	Extended
115	2019-05-24 00:00:00	0	\N	Fail	Invalid Promo Code	\N	\N	18	Extended
1.2.24	2019-05-30 10:59:00	1	Only showing 1 order, not 2.	Fail	Check the Status of Your Orders	\N	\N	3	Color Coded
113	2019-05-30 10:59:00	0.5	!! FAILURE NOTE: Entered one item but the cart was still empty.	Fail	Purchase One Item	\N	\N	53	Color Coded
113	2019-05-30 10:59:00	0	\N	Pass	Promo Code GUI	\N	\N	46	Standard
112	2019-05-24 00:00:00	0	\N	Fail	Log-off Website	\N	\N	24	Extended
113	2019-05-24 00:00:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	26	Extended
113	2019-05-30 10:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	59	Standard
115	2017-11-19 20:40:16	0	\N	Fail	One Promo Code per order	\N	\N	34	Standard
1.2.24	2019-05-24 00:00:00	1	\N	Pass	Tracking Information	\N	\N	65	Extended
113	2019-05-30 10:59:00	0	\N	Pass	Priority Shipping GUI	\N	\N	41	Color Coded
1.2.24	2019-05-30 10:59:00	1	\N	Pass	Tracking Information	\N	\N	65	Standard
114	2017-11-18 20:40:16	0	\N	Pass	One Promo Code per order	\N	\N	33	Standard
113	2019-05-30 10:59:00	0	\N	Fail	Search for Items	\N	\N	55	Standard
114	2017-11-18 20:40:15	0	\N	Pass	Invalid Promo Code	\N	\N	17	Color Coded
114	2019-06-07 09:35:00	0	\N	Pass	Check Invoice Creation	\N	\N	\N	Summer
1.2.24	2019-05-30 10:59:00	1	\N	Pass	Log-off Website	\N	\N	23	Color Coded
115	2017-08-17 20:40:17	0	\N	Fail	GUI - Multi-Site Shipping Options	\N	\N	\N	Summer
201	2019-05-24 00:00:00	1	\N	Pass	CheckNewPatient-QA	\N	\N	78	Extended
115	2019-05-24 00:00:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	64	Extended
118	2017-11-19 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	7	Color Coded
119	2017-11-18 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	9	Standard
117	2017-11-19 20:40:16	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	44	Color Coded
113	2019-05-24 00:00:00	0	\N	Pass	Invalid Promo Code	\N	\N	16	Extended
113	2019-05-30 10:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	62	Color Coded
115	2017-11-19 20:40:07	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	61	Standard
1.2.24	2019-05-30 10:59:00	1	\N	Pass	Tracking Information	\N	\N	65	Color Coded
114	2019-05-30 10:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	40	Standard
118	2017-08-15 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	\N	Summer
113	2019-06-07 09:35:00	0	\N	Fail	Validate Email Address - Permissions	\N	\N	\N	Summer
117	2017-11-19 20:40:16	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	44	Standard
114	2019-05-24 00:00:00	0	\N	Fail	Tracking Information	\N	\N	67	Extended
115	2019-05-24 00:00:00	0	\N	Fail	GUI - Multi-Site Shipping Options	\N	\N	15	Extended
118	2019-05-24 00:00:00	0	\N	Fail	Default Shipping - Ground	\N	\N	7	Extended
117	2019-05-24 00:00:00	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	44	Extended
115	2017-08-17 20:40:07	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	\N	Summer
117	2017-08-16 20:40:11	2	!! FAILURE NOTE: Unable to purchase exactly MAX items. Error message indicates count exceeded.  Is this a < vs. <= condition?	Fail	Purchase MAX Items	\N	\N	\N	Summer
115	2019-05-24 00:00:00	0	\N	Fail	One Promo Code per order	\N	\N	34	Extended
113	2019-05-24 00:00:00	0	\N	Pass	Priority Shipping GUI	\N	\N	41	Extended
114	2019-05-24 00:00:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	27	Extended
115	2019-05-24 00:00:00	0	\N	Pass	Log-off Website	\N	\N	25	Extended
113	2019-06-07 09:35:00	0	\N	Pass	Invalid Promo Code	\N	\N	\N	Summer
113	2019-05-24 00:00:00	0	\N	Pass	Log-in to Secured Website	\N	\N	21	Extended
114	2017-11-18 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	42	Color Coded
112	2019-05-30 10:59:00	0	\N	Fail	Log-in to Secured Website	\N	\N	20	Standard
114	2017-08-16 20:40:11	4.5	!! FAILURE NOTE: All items are showing duplicates.	Fail	Purchase Multiple Items	\N	\N	\N	Summer
118	2017-11-19 20:40:12	1.5	!! FAILURE NOTE: Set # of products to MAX but response email shows MAX minus 1.	Fail	Purchase MAX Items	\N	\N	50	Color Coded
115	2017-11-19 20:40:07	0	\N	Pass	No Address Entered	\N	\N	31	Standard
202	2019-05-30 10:59:00	1	\N	Pass	CheckExistingPatient-QA	\N	\N	79	Standard
1.2.24	2019-05-24 00:00:00	1	\N	Pass	Log-off Website	\N	\N	23	Extended
113	2019-06-07 09:35:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	\N	Summer
114	2017-11-19 20:40:08	0	\N	Pass	Validate Email Address - Invalid Address Handling	\N	\N	71	Standard
118	2017-11-17 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	8	Color Coded
114	2019-05-30 10:59:00	0	\N	Fail	Tracking Information	\N	\N	67	Color Coded
114	2017-11-18 20:40:16	0	\N	Pass	One Promo Code per order	\N	\N	33	Color Coded
113	2019-06-07 09:35:00	0	\N	Pass	Check Invoice Creation	\N	\N	\N	Summer
113	2019-06-07 09:35:00	0	\N	Pass	One Promo Code per order	\N	\N	\N	Summer
114	2019-05-30 10:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	2	Color Coded
115	2017-11-19 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	12	Standard
115	2017-08-17 20:40:16	0	\N	Fail	One Promo Code per order	\N	\N	\N	Summer
115	2017-11-19 20:40:02	0	\N	Pass	Log-off Website	\N	\N	25	Standard
114	2017-11-18 20:40:10	1.5	!! FAILURE NOTE: Entered one item and the cart showed duplicate entries.	Fail	Purchase One Item	\N	\N	54	Color Coded
113	2019-05-30 10:59:00	0	\N	Pass	No Address Entered	\N	\N	29	Color Coded
113	2019-05-24 00:00:00	0	\N	Pass	Tracking Information	\N	\N	66	Extended
115	2017-11-19 20:40:04	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	64	Standard
113	2019-06-07 09:35:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	\N	Summer
117	2017-11-18 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	6	Color Coded
114	2019-05-30 10:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	40	Color Coded
117	2019-05-24 00:00:00	2	!! FAILURE NOTE: Unable to purchase exactly MAX items. Error message indicates count exceeded.  Is this a < vs. <= condition?	Fail	Purchase MAX Items	\N	\N	49	Extended
113	2019-05-24 00:00:00	0	\N	Fail	Validate Email Address - Permissions	\N	\N	72	Extended
115	2017-11-19 20:40:16	0	\N	Fail	Max Number of Shipping Destinations	\N	\N	28	Standard
114	2019-05-24 00:00:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	11	Extended
115	2019-05-24 00:00:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	12	Extended
114	2017-08-17 04:14:51	0	\N	Pass	Validate Email Address - Email Authentication	\N	\N	\N	Summer
113	2019-06-07 09:35:00	0	\N	Fail	Validate Email Address - Invalid Address Handling	\N	\N	\N	Summer
114	2019-05-30 10:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	60	Standard
113	2019-06-07 09:35:00	0	\N	Pass	No Address Entered	\N	\N	\N	Summer
114	2019-05-30 10:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	2	Standard
113	2019-06-07 09:35:00	0	\N	Pass	Tracking Information	\N	\N	\N	Summer
118	2017-11-19 20:40:12	1.5	!! FAILURE NOTE: Set # of products to MAX but response email shows MAX minus 1.	Fail	Purchase MAX Items	\N	\N	50	Standard
114	2017-11-18 20:40:16	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	14	Standard
114	2017-08-16 20:40:09	0	\N	Pass	Search for Items	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Pass	Invalid Promo Code	\N	\N	16	Color Coded
114	2019-06-07 09:35:00	0	\N	Pass	Log-in to Secured Website	\N	\N	\N	Summer
113	2019-05-24 00:00:00	0	\N	Pass	No Address Entered	\N	\N	29	Extended
113	2019-05-24 00:00:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	37	Extended
115	2017-08-17 20:40:03	0	\N	Pass	Check the Status of Your Orders	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	74	Standard
114	2019-05-30 10:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	75	Standard
113	2019-05-30 10:59:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	26	Color Coded
114	2019-05-24 00:00:00	0	\N	Pass	Order Verification	\N	\N	36	Extended
117	2017-11-18 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	57	Color Coded
118	2017-11-19 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	58	Standard
114	2017-11-18 20:40:15	0	\N	Pass	Promo Code GUI	\N	\N	47	Color Coded
114	2017-11-18 20:40:16	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	27	Color Coded
114	2019-06-07 09:35:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	\N	Summer
112	2019-05-24 00:00:00	0	\N	Fail	Log-in to Secured Website	\N	\N	20	Extended
115	2017-11-19 20:40:07	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	61	Color Coded
118	2017-08-17 04:14:51	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	\N	Summer
118	2017-11-19 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	58	Color Coded
115	2017-11-19 20:40:17	0	\N	Fail	GUI - Multi-Site Shipping Options	\N	\N	15	Color Coded
113	2019-05-30 10:59:00	0	\N	Pass	Order Verification	\N	\N	35	Color Coded
114	2019-05-30 10:59:00	0	\N	Pass	Order Verification	\N	\N	36	Color Coded
115	2017-11-19 20:40:03	0	\N	Pass	Check the Status of Your Orders	\N	\N	5	Color Coded
115	2017-11-19 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	43	Color Coded
118	2019-05-24 00:00:00	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	45	Extended
114	2019-05-24 00:00:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	38	Extended
113	2019-05-24 00:00:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	39	Extended
114	2019-05-24 00:00:00	0	\N	Pass	One Promo Code per order	\N	\N	33	Extended
114	2019-05-24 00:00:00	0	\N	Pass	Promo Code GUI	\N	\N	47	Extended
114	2017-08-16 20:40:16	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	\N	Summer
114	2017-11-18 20:40:16	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	27	Standard
115	2017-11-19 20:40:16	0	\N	Fail	Max Number of Shipping Destinations	\N	\N	28	Color Coded
112	2019-05-30 10:59:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	4	Standard
113	2019-05-30 10:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	1	Standard
114	2017-08-16 20:40:10	1.5	!! FAILURE NOTE: Entered one item and the cart showed duplicate entries.	Fail	Purchase One Item	\N	\N	\N	Summer
114	2019-05-24 00:00:00	0	\N	Pass	No Address Entered	\N	\N	30	Extended
114	2017-11-18 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	42	Standard
202	2019-05-30 10:59:00	1	\N	Pass	CheckExistingPatient-QA	\N	\N	79	Color Coded
113	2019-06-07 09:35:00	0.5	!! FAILURE NOTE: Entered one item but the cart was still empty.	Fail	Purchase One Item	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Pass	Promo Code GUI	\N	\N	46	Color Coded
114	2017-11-18 20:40:11	4.5	!! FAILURE NOTE: All items are showing duplicates.	Fail	Purchase Multiple Items	\N	\N	52	Color Coded
114	2019-06-07 09:35:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	\N	Summer
114	2017-11-19 04:14:51	0	\N	Pass	Validate Email Address - Email Authentication	\N	\N	69	Standard
114	2019-05-30 10:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	38	Standard
118	2019-05-24 00:00:00	1.5	!! FAILURE NOTE: Set # of products to MAX but response email shows MAX minus 1.	Fail	Purchase MAX Items	\N	\N	50	Extended
114	2019-05-24 00:00:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	60	Extended
113	2019-06-07 09:35:00	0	\N	Fail	Search for Items	\N	\N	\N	Summer
114	2017-11-18 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	11	Color Coded
117	2017-11-18 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	6	Standard
114	2017-11-18 20:40:09	0	\N	Pass	Validate Email Address - Permissions	\N	\N	73	Standard
113	2019-05-30 10:59:00	0	\N	Pass	No Address Entered	\N	\N	29	Standard
114	2017-08-17 20:40:08	0	\N	Pass	Validate Email Address - Invalid Address Handling	\N	\N	\N	Summer
115	2017-08-17 20:40:04	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	\N	Summer
114	2017-08-16 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	\N	Summer
200	2019-05-30 10:59:00	1	\N	Fail	Failed Test Case for Demonstration	\N	\N	77	Standard
118	2017-11-19 04:14:51	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	45	Standard
113	2019-05-24 00:00:00	0	\N	Fail	Validate Email Address - Email Authentication	\N	\N	68	Extended
114	2019-05-24 00:00:00	0	\N	Pass	Validate Email Address - Email Authentication	\N	\N	69	Extended
113	2019-05-24 00:00:00	0	\N	Fail	Search for Items	\N	\N	55	Extended
114	2019-05-24 00:00:00	0	\N	Pass	Search for Items	\N	\N	56	Extended
113	2019-05-24 00:00:00	0.5	!! FAILURE NOTE: Entered one item but the cart was still empty.	Fail	Purchase One Item	\N	\N	53	Extended
112	2019-05-24 00:00:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	4	Extended
118	2019-05-24 00:00:00	0	\N	Pass	GUI - Checkout Button	\N	\N	8	Extended
119	2019-05-24 00:00:00	0	\N	Pass	GUI - Checkout Button	\N	\N	9	Extended
113	2019-05-24 00:00:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	10	Extended
115	2019-05-24 00:00:00	0	\N	Fail	Promo Code GUI	\N	\N	48	Extended
114	2019-05-24 00:00:00	0	\N	Pass	Priority Shipping GUI	\N	\N	42	Extended
115	2019-05-24 00:00:00	0	\N	Pass	No Address Entered	\N	\N	31	Extended
113	2019-05-24 00:00:00	0	\N	Pass	One Promo Code per order	\N	\N	32	Extended
113	2019-05-24 00:00:00	0	\N	Pass	Order Verification	\N	\N	35	Extended
115	2019-05-24 00:00:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	5	Extended
115	2019-05-24 00:00:00	0	\N	Fail	Max Number of Shipping Destinations	\N	\N	28	Extended
200	2019-05-24 00:00:00	1	\N	Fail	Failed Test Case for Demonstration	\N	\N	77	Extended
202	2019-05-24 00:00:00	1	\N	Pass	CheckExistingPatient-QA	\N	\N	79	Extended
115	2019-05-24 00:00:00	0	\N	Pass	Priority Shipping GUI	\N	\N	43	Extended
113	2019-05-24 00:00:00	4	!! FAILURE NOTE: Error accessing purchase engine.	Fail	Purchase Multiple Items	\N	\N	51	Extended
114	2019-05-24 00:00:00	4.5	!! FAILURE NOTE: All items are showing duplicates.	Fail	Purchase Multiple Items	\N	\N	52	Extended
113	2019-05-30 10:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	39	Standard
113	2019-05-30 10:59:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	13	Standard
113	2019-05-30 10:59:00	0	\N	Fail	Validate Email Address - Permissions	\N	\N	72	Standard
113	2019-05-30 10:59:00	0	\N	Pass	Tracking Information	\N	\N	66	Standard
118	2017-11-17 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	8	Standard
117	2019-05-24 00:00:00	0	\N	Fail	Default Shipping - Ground	\N	\N	6	Extended
113	2019-05-24 00:00:00	0	\N	Pass	Promo Code GUI	\N	\N	46	Extended
113	2019-05-24 00:00:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	13	Extended
114	2019-05-24 00:00:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	14	Extended
114	2019-05-24 00:00:00	1.5	!! FAILURE NOTE: Entered one item and the cart showed duplicate entries.	Fail	Purchase One Item	\N	\N	54	Extended
117	2019-05-24 00:00:00	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	57	Extended
118	2019-05-24 00:00:00	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	58	Extended
1.2.24	2019-05-24 00:00:00	1	Only showing 1 order, not 2.	Fail	Check the Status of Your Orders	\N	\N	3	Extended
113	2019-05-24 00:00:00	0	\N	Fail	Validate Email Address - Invalid Address Handling	\N	\N	70	Extended
114	2019-05-24 00:00:00	0	\N	Pass	Validate Email Address - Invalid Address Handling	\N	\N	71	Extended
114	2019-05-24 00:00:00	0	\N	Pass	Validate Email Address - Permissions	\N	\N	73	Extended
113	2019-05-24 00:00:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	74	Extended
114	2019-05-24 00:00:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	75	Extended
115	2019-05-24 00:00:00	0	\N	Fail	Validate website must be available 24x7	\N	\N	76	Extended
113	2019-05-24 00:00:00	0	\N	Pass	Check Invoice Creation	\N	\N	1	Extended
114	2019-05-24 00:00:00	0	\N	Pass	Check Invoice Creation	\N	\N	2	Extended
114	2019-05-30 10:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	22	Color Coded
115	2017-08-17 20:40:02	0	\N	Pass	Log-off Website	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	1	Color Coded
114	2019-05-30 10:59:00	0	\N	Pass	Order Verification	\N	\N	36	Standard
113	2019-06-07 09:35:00	0	\N	Pass	Order Verification	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0.5	!! FAILURE NOTE: Entered one item but the cart was still empty.	Fail	Purchase One Item	\N	\N	53	Standard
200	2019-05-30 10:59:00	1	\N	Fail	Failed Test Case for Demonstration	\N	\N	77	Color Coded
114	2019-06-07 09:35:00	0	\N	Fail	Tracking Information	\N	\N	\N	Summer
113	2019-06-07 09:35:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	\N	Summer
115	2017-11-19 20:40:16	0	\N	Fail	One Promo Code per order	\N	\N	34	Color Coded
113	2019-05-30 10:59:00	0	\N	Pass	Tracking Information	\N	\N	66	Color Coded
113	2019-05-30 10:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	37	Color Coded
113	2019-05-24 00:00:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	62	Extended
113	2019-05-30 10:59:00	4	!! FAILURE NOTE: Error accessing purchase engine.	Fail	Purchase Multiple Items	\N	\N	51	Standard
114	2017-11-18 20:40:11	4.5	!! FAILURE NOTE: All items are showing duplicates.	Fail	Purchase Multiple Items	\N	\N	52	Standard
201	2019-05-30 10:59:00	1	\N	Pass	CheckNewPatient-QA	\N	\N	78	Standard
113	2019-05-30 10:59:00	0	\N	Pass	Priority Shipping GUI	\N	\N	41	Standard
114	2019-05-30 10:59:00	0	\N	Pass	No Address Entered	\N	\N	30	Color Coded
201	2019-05-30 10:59:00	1	\N	Pass	CheckNewPatient-QA	\N	\N	78	Color Coded
115	2017-11-19 20:40:04	0	\N	Fail	Validate website must be available 24x7	\N	\N	76	Color Coded
114	2017-11-18 20:40:16	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	14	Color Coded
115	2017-11-19 20:40:02	0	\N	Pass	Log-off Website	\N	\N	25	Color Coded
114	2019-06-07 09:35:00	0	\N	Pass	Order Verification	\N	\N	\N	Summer
113	2019-05-30 10:59:00	4	!! FAILURE NOTE: Error accessing purchase engine.	Fail	Purchase Multiple Items	\N	\N	51	Color Coded
118	2017-08-17 20:40:12	1.5	!! FAILURE NOTE: Set # of products to MAX but response email shows MAX minus 1.	Fail	Purchase MAX Items	\N	\N	\N	Summer
117	2017-11-18 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	57	Standard
118	2017-11-19 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	7	Standard
115	2017-11-19 20:40:03	0	\N	Pass	Check the Status of Your Orders	\N	\N	5	Standard
115	2017-11-19 20:40:15	0	\N	Fail	Invalid Promo Code	\N	\N	18	Color Coded
114	2019-06-07 09:35:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	\N	Summer
115	2017-08-17 20:40:07	0	\N	Pass	No Address Entered	\N	\N	\N	Summer
115	2017-11-19 20:40:15	0	\N	Fail	Promo Code GUI	\N	\N	48	Standard
114	2017-11-19 04:14:51	0	\N	Pass	Validate Email Address - Email Authentication	\N	\N	69	Color Coded
114	2017-11-18 20:40:09	0	\N	Pass	Search for Items	\N	\N	56	Color Coded
112	2019-05-30 10:59:00	0	\N	Fail	Log-off Website	\N	\N	24	Standard
117	2017-08-17 20:40:16	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	\N	Summer
115	2017-11-19 20:40:07	0	\N	Pass	No Address Entered	\N	\N	31	Color Coded
115	2017-11-19 20:40:15	0	\N	Fail	Promo Code GUI	\N	\N	48	Color Coded
115	2017-11-19 20:40:17	0	\N	Fail	GUI - Multi-Site Shipping Options	\N	\N	15	Standard
114	2017-11-18 20:40:15	0	\N	Pass	Invalid Promo Code	\N	\N	17	Standard
115	2017-11-19 20:40:15	0	\N	Fail	Invalid Promo Code	\N	\N	18	Standard
114	2019-06-07 09:35:00	0	\N	Pass	No Address Entered	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	21	Standard
112	2019-05-30 10:59:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	4	Color Coded
113	2019-06-07 09:35:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Fail	Validate Email Address - Email Authentication	\N	\N	68	Color Coded
115	2017-08-17 20:40:15	0	\N	Fail	Promo Code GUI	\N	\N	\N	Summer
113	2019-06-07 09:35:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	\N	Summer
113	2019-06-07 09:35:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	\N	Summer
114	2019-06-07 09:35:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	\N	Summer
115	2017-08-17 20:40:04	0	\N	Fail	Validate website must be available 24x7	\N	\N	\N	Summer
200	2019-06-07 09:35:00	1	\N	Fail	Failed Test Case for Demonstration	\N	\N	\N	Summer
201	2019-06-07 09:35:00	1	\N	Pass	CheckNewPatient-QA	\N	\N	\N	Summer
202	2019-06-07 09:35:00	1	\N	Pass	CheckExistingPatient-QA	\N	\N	\N	Summer
117	2017-08-16 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	\N	Summer
118	2017-08-17 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	\N	Summer
1.2.24	2019-06-07 09:35:00	2	\N	Pass	Log-in to Secured Website	\N	\N	\N	Summer
112	2019-06-07 09:35:00	0	\N	Fail	Log-in to Secured Website	\N	\N	\N	Summer
1.2.24	2019-05-30 10:59:00	2	\N	Pass	Log-in to Secured Website	\N	\N	19	Standard
114	2019-05-30 10:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	63	Color Coded
113	2019-05-30 10:59:00	0	\N	Fail	Validate Email Address - Email Authentication	\N	\N	68	Standard
114	2017-08-16 20:40:16	0	\N	Pass	One Promo Code per order	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Pass	One Promo Code per order	\N	\N	32	Color Coded
113	2019-05-30 10:59:00	0	\N	Fail	Validate Email Address - Invalid Address Handling	\N	\N	70	Standard
114	2017-11-18 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	11	Standard
1.2.24	2019-06-07 09:35:00	1	Only showing 1 order, not 2.	Fail	Check the Status of Your Orders	\N	\N	\N	Summer
112	2019-06-07 09:35:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Fail	Validate Email Address - Invalid Address Handling	\N	\N	70	Color Coded
114	2017-11-19 20:40:08	0	\N	Pass	Validate Email Address - Invalid Address Handling	\N	\N	71	Color Coded
113	2019-05-30 10:59:00	0	\N	Fail	Validate Email Address - Permissions	\N	\N	72	Color Coded
114	2017-11-18 20:40:09	0	\N	Pass	Validate Email Address - Permissions	\N	\N	73	Color Coded
113	2019-05-30 10:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	74	Color Coded
114	2019-05-30 10:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	63	Standard
115	2017-08-17 20:40:16	0	\N	Fail	Max Number of Shipping Destinations	\N	\N	\N	Summer
113	2019-05-30 10:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	62	Standard
\.


--
-- Data for Name: testcasestep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testcasestep (expectedresult, input, stepindex, testcase, listing_order, dataset) FROM stdin;
My account home page	Login to Shopping Site	0	Purchase One Item	1	Standard
Displayed Search results	Search for items	1	Purchase One Item	2	Standard
Checked Item	Select one item for purchase	2	Purchase One Item	3	Standard
Populated Cart with one item	Choose to add one item to Cart	3	Purchase One Item	4	Standard
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase One Item	5	Standard
My Home Page	Login to Shopping Site	0	Purchase Multiple Items	6	Standard
Displayed Search results	Search for items	1	Purchase Multiple Items	7	Standard
Checked Items	Select multiple items for purchase (more than 1)	2	Purchase Multiple Items	8	Standard
Populated Cart with multiple items	Choose to add multiple items to the Cart (more than 1)	3	Purchase Multiple Items	9	Standard
Completed Purchase of multiple items	Purchase Items in Cart	4	Purchase Multiple Items	10	Standard
My Home Page	Login to Shopping Site	0	Purchase MAX Items	11	Standard
Displayed Search results	Search for items	1	Purchase MAX Items	12	Standard
Checked Item	Select 100 items for purchase (max)	2	Purchase MAX Items	13	Standard
Populated Cart with max items	Choose to add 100 items to Cart (max)	3	Purchase MAX Items	14	Standard
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase MAX Items	15	Standard
My Home Page	Login to Shopping Site	0	Select MAX+1 Items	16	Standard
Displayed Search results	Search for items	1	Select MAX+1 Items	17	Standard
Checked Items	Select 101 items for purchase (max +1)	2	Select MAX+1 Items	18	Standard
Error message that max +1 reached.	Choose to add 101 items to Cart	3	Select MAX+1 Items	19	Standard
Error message purchasing over max not permitted.	Purchase Items in Cart	4	Select MAX+1 Items	20	Standard
My Home Page	Login to Shopping Site	0	GUI - Checkout Button	21	Standard
Displayed Search results	Search for items	1	GUI - Checkout Button	22	Standard
Checked Item	Select one item for purchase	2	GUI - Checkout Button	23	Standard
Show Cart	Click GUI Checkout Button	3	GUI - Checkout Button	24	Standard
My Home Page	Login to Shopping Site	0	GUI - Checkout Button for Empty Cart	25	Standard
Show Empty Cart	Click GUI Checkout Button	1	GUI - Checkout Button for Empty Cart	26	Standard
My account home page	Login to Shopping Site	0	Purchase One Item	1	Color Coded
Displayed Search results	Search for items	1	Purchase One Item	2	Color Coded
Checked Item	Select one item for purchase	2	Purchase One Item	3	Color Coded
Populated Cart with one item	Choose to add one item to Cart	3	Purchase One Item	4	Color Coded
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase One Item	5	Color Coded
My Home Page	Login to Shopping Site	0	Purchase Multiple Items	6	Color Coded
Displayed Search results	Search for items	1	Purchase Multiple Items	7	Color Coded
Checked Items	Select multiple items for purchase (more than 1)	2	Purchase Multiple Items	8	Color Coded
Populated Cart with multiple items	Choose to add multiple items to the Cart (more than 1)	3	Purchase Multiple Items	9	Color Coded
Completed Purchase of multiple items	Purchase Items in Cart	4	Purchase Multiple Items	10	Color Coded
My Home Page	Login to Shopping Site	0	Purchase MAX Items	11	Color Coded
Displayed Search results	Search for items	1	Purchase MAX Items	12	Color Coded
Checked Item	Select 100 items for purchase (max)	2	Purchase MAX Items	13	Color Coded
Populated Cart with max items	Choose to add 100 items to Cart (max)	3	Purchase MAX Items	14	Color Coded
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase MAX Items	15	Color Coded
My Home Page	Login to Shopping Site	0	Select MAX+1 Items	16	Color Coded
Displayed Search results	Search for items	1	Select MAX+1 Items	17	Color Coded
Checked Items	Select 101 items for purchase (max +1)	2	Select MAX+1 Items	18	Color Coded
Error message that max +1 reached.	Choose to add 101 items to Cart	3	Select MAX+1 Items	19	Color Coded
Error message purchasing over max not permitted.	Purchase Items in Cart	4	Select MAX+1 Items	20	Color Coded
My Home Page	Login to Shopping Site	0	GUI - Checkout Button	21	Color Coded
Displayed Search results	Search for items	1	GUI - Checkout Button	22	Color Coded
Checked Item	Select one item for purchase	2	GUI - Checkout Button	23	Color Coded
Show Cart	Click GUI Checkout Button	3	GUI - Checkout Button	24	Color Coded
My Home Page	Login to Shopping Site	0	GUI - Checkout Button for Empty Cart	25	Color Coded
Show Empty Cart	Click GUI Checkout Button	1	GUI - Checkout Button for Empty Cart	26	Color Coded
My account home page	Login to Shopping Site	0	Purchase One Item	\N	Summer
Displayed Search results	Search for items	1	Purchase One Item	\N	Summer
Checked Item	Select one item for purchase	2	Purchase One Item	\N	Summer
Populated Cart with one item	Choose to add one item to Cart	3	Purchase One Item	\N	Summer
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase One Item	\N	Summer
My Home Page	Login to Shopping Site	0	Purchase Multiple Items	\N	Summer
Displayed Search results	Search for items	1	Purchase Multiple Items	\N	Summer
Checked Items	Select multiple items for purchase (more than 1)	2	Purchase Multiple Items	\N	Summer
Populated Cart with multiple items	Choose to add multiple items to the Cart (more than 1)	3	Purchase Multiple Items	\N	Summer
Completed Purchase of multiple items	Purchase Items in Cart	4	Purchase Multiple Items	\N	Summer
My Home Page	Login to Shopping Site	0	Purchase MAX Items	\N	Summer
Displayed Search results	Search for items	1	Purchase MAX Items	\N	Summer
Checked Item	Select 100 items for purchase (max)	2	Purchase MAX Items	\N	Summer
Populated Cart with max items	Choose to add 100 items to Cart (max)	3	Purchase MAX Items	\N	Summer
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase MAX Items	\N	Summer
My Home Page	Login to Shopping Site	0	Select MAX+1 Items	\N	Summer
Displayed Search results	Search for items	1	Select MAX+1 Items	\N	Summer
Checked Items	Select 101 items for purchase (max +1)	2	Select MAX+1 Items	\N	Summer
Error message that max +1 reached.	Choose to add 101 items to Cart	3	Select MAX+1 Items	\N	Summer
Error message purchasing over max not permitted.	Purchase Items in Cart	4	Select MAX+1 Items	\N	Summer
My Home Page	Login to Shopping Site	0	GUI - Checkout Button	\N	Summer
Displayed Search results	Search for items	1	GUI - Checkout Button	\N	Summer
Checked Item	Select one item for purchase	2	GUI - Checkout Button	\N	Summer
Show Cart	Click GUI Checkout Button	3	GUI - Checkout Button	\N	Summer
My Home Page	Login to Shopping Site	0	GUI - Checkout Button for Empty Cart	\N	Summer
Show Empty Cart	Click GUI Checkout Button	1	GUI - Checkout Button for Empty Cart	\N	Summer
My account home page	Login to Shopping Site	0	Purchase One Item	1	Extended
Displayed Search results	Search for items	1	Purchase One Item	2	Extended
Checked Item	Select one item for purchase	2	Purchase One Item	3	Extended
Populated Cart with one item	Choose to add one item to Cart	3	Purchase One Item	4	Extended
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase One Item	5	Extended
My Home Page	Login to Shopping Site	0	Purchase Multiple Items	6	Extended
Displayed Search results	Search for items	1	Purchase Multiple Items	7	Extended
Checked Items	Select multiple items for purchase (more than 1)	2	Purchase Multiple Items	8	Extended
Populated Cart with multiple items	Choose to add multiple items to the Cart (more than 1)	3	Purchase Multiple Items	9	Extended
Completed Purchase of multiple items	Purchase Items in Cart	4	Purchase Multiple Items	10	Extended
My Home Page	Login to Shopping Site	0	Purchase MAX Items	11	Extended
Displayed Search results	Search for items	1	Purchase MAX Items	12	Extended
Checked Item	Select 100 items for purchase (max)	2	Purchase MAX Items	13	Extended
Populated Cart with max items	Choose to add 100 items to Cart (max)	3	Purchase MAX Items	14	Extended
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase MAX Items	15	Extended
My Home Page	Login to Shopping Site	0	Select MAX+1 Items	16	Extended
Displayed Search results	Search for items	1	Select MAX+1 Items	17	Extended
Checked Items	Select 101 items for purchase (max +1)	2	Select MAX+1 Items	18	Extended
Error message that max +1 reached.	Choose to add 101 items to Cart	3	Select MAX+1 Items	19	Extended
Error message purchasing over max not permitted.	Purchase Items in Cart	4	Select MAX+1 Items	20	Extended
My Home Page	Login to Shopping Site	0	GUI - Checkout Button	21	Extended
Displayed Search results	Search for items	1	GUI - Checkout Button	22	Extended
Checked Item	Select one item for purchase	2	GUI - Checkout Button	23	Extended
Show Cart	Click GUI Checkout Button	3	GUI - Checkout Button	24	Extended
My Home Page	Login to Shopping Site	0	GUI - Checkout Button for Empty Cart	25	Extended
Show Empty Cart	Click GUI Checkout Button	1	GUI - Checkout Button for Empty Cart	26	Extended
\.


--
-- Data for Name: testfolder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testfolder (name, project, listing_order, dataset) FROM stdin;
Checkout	Shopping Team	1	Standard
Fulfillment	Shopping Team	2	Standard
Login/Authentication	Shopping Team	3	Standard
Order Status	Shopping Team	4	Standard
Shopping	Shopping Team	5	Standard
Checkout	Shopping Team	1	Color Coded
Fulfillment	Shopping Team	2	Color Coded
Login/Authentication	Shopping Team	3	Color Coded
Order Status	Shopping Team	4	Color Coded
Shopping	Shopping Team	5	Color Coded
Checkout	Shopping Team	\N	Summer
Fulfillment	Shopping Team	\N	Summer
Login/Authentication	Shopping Team	\N	Summer
Order Status	Shopping Team	\N	Summer
Shopping	Shopping Team	\N	Summer
Checkout	Shopping Team	1	Extended
Fulfillment	Shopping Team	2	Extended
Login/Authentication	Shopping Team	3	Extended
Order Status	Shopping Team	4	Extended
Shopping	Shopping Team	5	Extended
\.


--
-- Data for Name: testset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testset (description, name, planestimate, ready, schedulestate, project, iteration, release, owner, listing_order, dataset) FROM stdin;
Test routine for checkout path using Chrome browser	Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	1	Standard
Test routine for checkout path using Firefox browser	Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	2	Standard
Test routine for checkout path using Chrome browser	Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	1	Color Coded
Test routine for checkout path using Firefox browser	Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	2	Color Coded
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Test routine for checkout path using Chrome browser	Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 2	R1	tara@acme.com	1	Extended
Test routine for checkout path using Firefox browser	Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 2	R1	tara@acme.com	2	Extended
Test routine for checkout path using Safari browser	Safari Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 3	R1	tara@acme.com	3	Extended
Test routine for checkout path using Opera browser	Opera Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 3	R1	tara@acme.com	4	Extended
\.


--
-- Data for Name: theme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theme (name, owner, plannedstartdate, plannedenddate, description, displaycolor, investmentcategory, ready, riskscore, valuescore, project, preliminaryestimate, state, listing_order, dataset) FROM stdin;
Revamp online presence	paul@acme.com	2019-04-20 10:59:00	2019-10-19 10:59:00	\N	\N	Strategic Growth	FALSE	3	6	Online Store	L	Developing	1	Color Coded
Create best in class platform	aaron@acme.com	2019-03-30 10:59:00	2019-12-03 10:59:00	\N	\N	Strategic Growth	FALSE	5	8	Platform	XL	Discovering	2	Color Coded
Revamp online presence	paul@acme.com	2019-04-20 10:59:00	2019-10-19 10:59:00	\N	\N	Strategic Growth	FALSE	3	6	Online Store	L	Developing	1	Standard
Create best in class platform	aaron@acme.com	2019-03-30 10:59:00	2019-12-03 10:59:00	\N	\N	Strategic Growth	FALSE	5	8	Platform	XL	Discovering	2	Standard
Revamp online presence	paul@acme.com	2019-04-28 09:35:00	2019-10-27 09:35:00	\N	\N	Strategic Growth	FALSE	3	6	Online Store	L	Developing	\N	Summer
Revamp online presence	paul@acme.com	2019-06-20 00:00:00	2019-12-19 00:00:00	\N	\N	Strategic Growth	FALSE	3	6	Online Store	L	Developing	1	Extended
Expand mobile app capability	paul@acme.com	2019-06-20 00:00:00	2019-12-19 00:00:00	\N	\N	Strategic Growth	FALSE	3	6	Online Store	XL	Developing	2	Extended
Create best in class platform	aaron@acme.com	2019-05-30 00:00:00	2020-02-02 00:00:00	\N	\N	Strategic Growth	FALSE	5	8	Platform	XL	Discovering	3	Extended
Create a Modern Software Factory	aaron@acme.com	2019-05-30 00:00:00	2020-02-02 00:00:00	\N	\N	Cost Savings	FALSE	5	8	Online Store	L	Discovering	4	Extended
Create best in class platform	aaron@acme.com	2019-04-07 09:35:00	2019-12-11 09:35:00	\N	\N	Strategic Growth	FALSE	5	8	Platform	XL	Discovering	\N	Summer
\.


--
-- Data for Name: updates; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

COPY updates (day, formattedid, newvalue, field, itemtype, parent, parent_type, work_type, project, dataset) FROM stdin;
1	TA64	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
1	DE39	Accepted	ScheduleState	Defect	\N	\N	modify	Shopping Team	Standard
1	US21	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
1	TA43	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
1	TA41	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
1	US1	In-Progress	ScheduleState	HierarchicalRequirement	\N	\N	modify	Payment Team	Standard
1	TA30	5	ToDo	Task	\N	\N	modify	Fulfillment Team	Standard
1	TA29	Completed	State	Task	\N	\N	modify	Fulfillment Team	Standard
2	DE43	Accepted	ScheduleState	Defect	\N	\N	modify	Shopping Team	Standard
2	TA63	5	ToDo	Task	\N	\N	modify	Shopping Team	Standard
2	TA64	3	ToDo	Task	\N	\N	modify	Shopping Team	Standard
2	US100	In-Progress	ScheduleState	HierarchicalRequirement	\N	\N	modify	Payment Team	Standard
2	TA2	2	ToDo	Task	\N	\N	modify	Fulfillment Team	Standard
2	TA28	Completed	State	Task	\N	\N	modify	Fulfillment Team	Standard
3	DE46	Accepted	ScheduleState	Defect	\N	\N	modify	Shopping Team	Standard
3	TA42	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
3	TA43	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
3	TA44	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
3	US140	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
3	DE2	Accepted	ScheduleState	Defect	\N	\N	modify	Shopping Team	Standard
3	US1	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Payment Team	Standard
3	TA3	Completed	State	Task	\N	\N	modify	Fulfillment Team	Standard
3	TA2	Completed	State	Task	\N	\N	modify	Fulfillment Team	Standard
3	TA1	Completed	State	Task	\N	\N	modify	Fulfillment Team	Standard
3	US34	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Fulfillment Team	Standard
4	TA63	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
4	TA64	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
4	DE8	Accepted	ScheduleState	Defect	\N	\N	modify	Shopping Team	Standard
4	DE4	Accepted	ScheduleState	Defect	\N	\N	modify	Shopping Team	Standard
4	TA37	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
4	TA38	5	ToDo	Task	\N	\N	modify	Shopping Team	Standard
4	US100	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Payment Team	Standard
4	TA30	Completed	State	Task	\N	\N	modify	Fulfillment Team	Standard
4	US108	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Fulfillment Team	Standard
5	TA65	10	ToDo	Task	\N	\N	modify	Shopping Team	Standard
5	DE14	In-Progress	ScheduleState	Defect	\N	\N	modify	Payment Team	Standard
5	US41	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Fulfillment Team	Standard
5	TA47	Completed	State	Task	\N	\N	modify	Fulfillment Team	Standard
6	US66	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
6	DE14	Accepted	ScheduleState	Defect	\N	\N	modify	Payment Team	Standard
6	TA45	Completed	State	Task	\N	\N	modify	Fulfillment Team	Standard
7	DE45	Accepted	ScheduleState	Defect	\N	\N	modify	Shopping Team	Standard
7	TA38	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
7	TA40	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
7	TA40	FALSE	Blocked	Task	\N	\N	modify	Shopping Team	Standard
7	US141	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
8	TA68	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
8	TA67	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
8	DE15	Completed	ScheduleState	Defect	\N	\N	modify	Payment Team	Standard
8	TA46	FALSE	Blocked	Task	\N	\N	modify	Shopping Team	Standard
8	TA46	Completed	State	Task	\N	\N	modify	Fulfillment Team	Standard
8	US39	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Fulfillment Team	Standard
8	TA65	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
8	TA66	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
8	TA67	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
8	TA68	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
9	TA39	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
9	TA39	10	ToDo	Task	\N	\N	modify	Shopping Team	Standard
9	DE45	Accepted	ScheduleState	Defect	\N	\N	modify	Shopping Team	Standard
9	US140	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
8	TA65	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
8	TA66	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
8	TA67	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
8	TA68	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
10	TS1	Accepted	State	TestSet	\N	\N	modify	Shopping Team	Standard
10	TS2	Accepted	State	TestSet	\N	\N	modify	Shopping Team	Standard
10	DE15	Accepted	ScheduleState	Defect	\N	\N	modify	Payment Team	Standard
10	US36	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Fulfillment Team	Standard
10	TA39	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
11	US62	In-Progress	ScheduleState	HierarchicalRequirement	\N	\N	modify	Fulfillment Team	Standard
11	US97	In-Progress	ScheduleState	HierarchicalRequirement	\N	\N	modify	Payment Team	Standard
11	TA31	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
11	TA32	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
11	TA31	7	ToDo	Task	\N	\N	modify	Shopping Team	Standard
11	TA32	2	ToDo	Task	\N	\N	modify	Shopping Team	Standard
12	TA33	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
12	TA34	In-Progress	State	Task	\N	\N	modify	Shopping Team	Standard
12	TA33	4	ToDo	Task	\N	\N	modify	Shopping Team	Standard
12	TA34	1	ToDo	Task	\N	\N	modify	Shopping Team	Standard
12	US94	Completed	ScheduleState	HierarchicalRequirement	\N	\N	modify	Payment Team	Standard
13	TA31	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
13	TA32	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
13	TA15	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
13	US61	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
14	TA33	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
14	TA34	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
14	US110	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
14	TA16	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
15	US62	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Payment Team	Standard
15	US90	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Payment Team	Standard
15	US24	Completed	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
16	US28	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
16	US97	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Payment Team	Standard
16	US25	Completed	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
16	TA51	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
17	US24	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
17	TA52	Completed	State	Task	\N	\N	modify	Shopping Team	Standard
17	US30	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
18	US25	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
19	US77	Completed	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
19	US78	Completed	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
20	US78	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
20	US77	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
20	US20	Accepted	ScheduleState	HierarchicalRequirement	\N	\N	modify	Shopping Team	Standard
\.


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

