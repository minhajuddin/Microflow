--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: homes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE homes (
    id integer NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.homes OWNER TO postgres;

--
-- Name: homes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE homes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homes_id_seq OWNER TO postgres;

--
-- Name: homes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE homes_id_seq OWNED BY homes.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying(255),
    description text,
    picture character varying(255),
    video_url character varying(255),
    raise_amount numeric,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp without time zone
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    username character varying(255) NOT NULL,
    password_hash character varying(255),
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY homes ALTER COLUMN id SET DEFAULT nextval('homes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: homes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY homes (id, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: homes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('homes_id_seq', 1, false);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projects (id, name, description, picture, video_url, raise_amount, inserted_at, updated_at) FROM stdin;
38	Lifesaver Bottle	<p>LIFESAVER&reg;&nbsp;products are microbiological water filters which use ultra filtration technology to filter out viruses, bacteria, cysts and parasites from contaminated water sources. LIFESAVER&reg;&nbsp;bottles meet an adaption of NSF Protocol 231 based on recommendations of the U.S. Environmental Protection Agency (EPA). LIFESAVER&reg;&nbsp;bottles filter bacteria to a minimum of Log 6 (99.9999%), Viruses to a minimum of Log 4 (99.99%) and Cysts to a minimum of Log 3 (99.9%).</p>\r\n\r\n<p>&nbsp;</p>\r\n	original-lifesaver.jpg.jpg?63627947299	https://www.youtube.com/watch?v=wDJhtAFZPpM	100	2016-04-15 13:48:19	2016-04-15 13:48:19
39	Solar lantern lights up rural India's dark nights	<p>For more than 100 Indian villages cut off from grid electricity, life no longer comes to an end after dark thanks to an innovative solar-powered lantern that offers hope to the nation&#39;s rural poor.</p>\r\n\r\n<p>While cooking, farming and studying after sunset were once a struggle using inefficient kerosene or paraffin lamps, the solar lantern now provides a cheap and practical source of light.</p>\r\n\r\n<p>The simple device, which is charged during the day from a communal rooftop solar panel, uses between five and seven watts of power and has a battery that lasts up to eight hours.</p>\r\n\r\n<p><br />\r\n<br />\r\n&nbsp;</p>\r\n	anindianvill.jpg?63627948098	https://www.youtube.com/watch?v=Ft99NJK-YSQ	100	2016-04-15 14:01:38	2016-04-15 14:01:38
40	Hydroponics can grow up to 1,200 lettuce heads per week on campus	<p>New York&rsquo;s&nbsp;<a href="http://www.stonybrook.edu/" target="_blank">Stony Brook University</a>&nbsp;has become the nation&rsquo;s first college to install a&nbsp;<a href="http://freightfarms.com/" target="_blank">Freight Farm</a>right on campus. The fully-operational hydroponic micro-farm, known as the &ldquo;Leafy Green Machine&rdquo;, will be managed by university students who will use a toolbox of technologies such as cloud-synced growth data, live camera feeds and a smartphone app in order to&nbsp;<a href="http://inhabitat.com/nyc/index.php?s=hydroponic" target="_blank">hydroponically grow</a>&nbsp;fresh greens all year-round.</p>\r\n\r\n<p>&nbsp;</p>\r\n	Stoney-Brook-University-and-Freight-Farms-537x350.jpg?63627948451	https://www.youtube.com/watch?v=Kh-ONb13gqk	100	2016-04-15 14:07:31	2016-04-15 14:07:31
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('projects_id_seq', 42, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version, inserted_at) FROM stdin;
20160212161617	2016-03-07 15:22:51
20160216142946	2016-03-07 15:22:51
20160322165511	2016-03-22 16:59:12
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, username, password_hash, inserted_at, updated_at) FROM stdin;
1	José	josevalim	wowamazing	2016-03-22 17:04:40	2016-03-22 17:04:40
2	admin	admin	wowamazing	2016-03-22 17:05:31	2016-03-22 17:05:31
3	indra	indra	\N	2016-03-23 12:50:20	2016-03-23 12:50:20
4	Jake	JakeUser	\N	2016-03-23 13:02:14	2016-03-23 13:02:14
5	s	x	\N	2016-03-23 13:47:14	2016-03-23 13:47:14
10	Jake3	Jake3 Username	\N	2016-03-23 16:41:56	2016-03-23 16:41:56
11	d	dd	\N	2016-03-23 16:51:56	2016-03-23 16:51:56
13	asddas	ddad	\N	2016-03-23 18:12:28	2016-03-23 18:12:28
14	eee	eee	\N	2016-03-23 18:14:07	2016-03-23 18:14:07
15	df	fdf	\N	2016-03-23 18:16:31	2016-03-23 18:16:31
16	vvccxv	vxcvcxv	\N	2016-03-23 18:20:05	2016-03-23 18:20:05
18	Jake	Joke	$2b$12$DeXO29cnOvE/YCKaYAJWmuXaiZ6RXNXjiFkyyWLOgfQVVgjjg8zuW	2016-03-24 05:52:18	2016-03-24 05:52:18
19	Yadda	Yidda	$2b$12$vXHcKbJ7ZufIdYDgehobpeomWeuTJ9JQ5QVF0/..5fMKTYRrzq742	2016-03-24 06:34:27	2016-03-24 06:34:27
20	Jake	Jake	$2b$12$Za/12I0hf8Gwh8.9cPlnbOEE/qlcQkPYGBPViEWVUClZreAIOuEBC	2016-03-24 13:49:24	2016-03-24 13:49:24
21	test 	test	$2b$12$xi3ZDcnP3.xYjpt3afnna.qZsFPPk9G1XafctuprqQvDXQHiqub.6	2016-03-24 13:56:13	2016-03-24 13:56:13
22	Jake3	Jake3	$2b$12$PvzJzfALbLtp7FVl5qOqH.YveSRmLMC0AXnP2vLRex3tMcleNZMA6	2016-03-24 14:54:01	2016-03-24 14:54:01
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 22, true);


--
-- Name: homes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY homes
    ADD CONSTRAINT homes_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_username_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX users_username_index ON users USING btree (username);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

