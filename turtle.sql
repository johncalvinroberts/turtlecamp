--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "user";

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE attachments (
    id integer NOT NULL,
    format character varying,
    task_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE attachments OWNER TO "user";

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attachments_id_seq OWNER TO "user";

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- Name: college_apps; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE college_apps (
    id integer NOT NULL,
    deadline timestamp without time zone,
    category character varying,
    status boolean,
    user_id integer,
    college_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE college_apps OWNER TO "user";

--
-- Name: college_apps_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE college_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE college_apps_id_seq OWNER TO "user";

--
-- Name: college_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE college_apps_id_seq OWNED BY college_apps.id;


--
-- Name: colleges; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE colleges (
    id integer NOT NULL,
    name character varying,
    address character varying,
    website character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE colleges OWNER TO "user";

--
-- Name: colleges_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE colleges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE colleges_id_seq OWNER TO "user";

--
-- Name: colleges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE colleges_id_seq OWNED BY colleges.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE notifications (
    id integer NOT NULL,
    content character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE notifications OWNER TO "user";

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notifications_id_seq OWNER TO "user";

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "user";

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE tasks (
    id integer NOT NULL,
    name character varying,
    due_date timestamp without time zone NOT NULL,
    status character varying DEFAULT 'not done'::character varying,
    college_app_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    document character varying
);


ALTER TABLE tasks OWNER TO "user";

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_id_seq OWNER TO "user";

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying NOT NULL,
    current_school character varying,
    satm integer,
    satv integer,
    satwr integer,
    act integer,
    toeflr integer,
    toeflwr integer,
    toefls integer,
    toefll integer,
    is_counselor boolean DEFAULT true NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    counselor_ref integer
);


ALTER TABLE users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- Name: college_apps id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY college_apps ALTER COLUMN id SET DEFAULT nextval('college_apps_id_seq'::regclass);


--
-- Name: colleges id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY colleges ALTER COLUMN id SET DEFAULT nextval('colleges_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: user
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-03-30 11:30:28.76085	2017-03-30 11:30:28.76085
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: user
--

COPY attachments (id, format, task_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('attachments_id_seq', 1, false);


--
-- Data for Name: college_apps; Type: TABLE DATA; Schema: public; Owner: user
--

COPY college_apps (id, deadline, category, status, user_id, college_id, created_at, updated_at) FROM stdin;
13	\N	REACH	\N	2	1	2017-03-31 04:05:22.99858	2017-03-31 04:05:22.99858
16	2017-01-01 00:00:00	REACH	\N	2	3	2017-03-31 04:22:19.70042	2017-03-31 04:22:19.70042
17	\N	REACH	\N	3	4	2017-03-31 05:21:57.214807	2017-03-31 05:21:57.214807
18	2017-01-01 00:00:00	REACH	\N	3	2	2017-03-31 05:22:09.254827	2017-03-31 05:22:09.254827
19	2017-01-01 00:00:00	REACH	\N	4	2	2017-03-31 05:31:24.720453	2017-03-31 05:31:24.720453
20	\N	TARGET	\N	4	3	2017-03-31 06:20:56.091386	2017-03-31 07:00:35.261037
22	2017-01-10 00:00:00	TARGET	\N	4	1	2017-03-31 06:27:09.289307	2017-03-31 07:00:51.986324
25	2017-01-01 00:00:00	TARGET	\N	5	1	2017-03-31 07:06:52.183302	2017-03-31 07:07:39.930101
27	\N	REACH	\N	7	1	2017-03-31 07:29:42.823198	2017-03-31 07:29:42.823198
28	2017-02-02 00:00:00	REACH	\N	8	2	2017-03-31 09:13:04.021352	2017-03-31 09:13:04.021352
29	2017-01-01 00:00:00	REACH	\N	8	1	2017-03-31 09:20:36.792887	2017-03-31 09:20:36.792887
31	2017-01-01 00:00:00	REACH	\N	2	2	2017-04-01 04:08:28.435873	2017-04-01 04:08:28.435873
32	2017-01-01 00:00:00	REACH	\N	2	4	2017-04-01 04:52:16.081664	2017-04-01 04:52:16.081664
33	2017-01-01 00:00:00	REACH	\N	9	1	2017-04-01 17:26:53.787593	2017-04-01 17:26:53.787593
\.


--
-- Name: college_apps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('college_apps_id_seq', 33, true);


--
-- Data for Name: colleges; Type: TABLE DATA; Schema: public; Owner: user
--

COPY colleges (id, name, address, website, created_at, updated_at) FROM stdin;
1	Harvard	Cambridge, MA	\N	2017-03-30 11:30:28.920381	2017-03-30 11:30:28.920381
2	Yale	New Haven, CT	\N	2017-03-30 11:30:28.930851	2017-03-30 11:30:28.930851
3	Whitman	345 Boyer Ave, Walla Walla, WA	\N	2017-03-30 11:30:28.933571	2017-03-30 11:30:28.933571
4	Middlebury	14 Old Chapel Rd, Middlebury, VT	\N	2017-03-30 11:30:28.935449	2017-03-30 11:30:28.935449
\.


--
-- Name: colleges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('colleges_id_seq', 4, true);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: user
--

COPY notifications (id, content, created_at, updated_at) FROM stdin;
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('notifications_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY schema_migrations (version) FROM stdin;
20170330100501
20170328044204
20170328081450
20170329063031
20170329063503
20170329064016
20170329064819
20170329064941
20170329172316
20170330150219
20170401100953
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: user
--

COPY tasks (id, name, due_date, status, college_app_id, created_at, updated_at, document) FROM stdin;
9	gogogo	2017-01-01 00:00:00	not done	20	2017-03-31 06:33:27.700263	2017-03-31 06:33:27.700263	\N
10	get super hig	2017-01-01 00:00:00	not done	22	2017-03-31 06:36:23.235125	2017-03-31 06:36:23.235125	\N
11	uglyface	2018-01-01 00:00:00	not done	20	2017-03-31 06:37:29.845885	2017-03-31 06:37:29.845885	\N
12	get super hig	2017-01-01 00:00:00	not done	22	2017-03-31 06:37:39.497568	2017-03-31 06:37:39.497568	pp05t5skxtcah5zxfnjz.png
13	blash	2018-02-02 00:00:00	not done	22	2017-03-31 06:52:25.20584	2017-03-31 06:52:25.20584	\N
14	gofasfas	2017-01-01 00:00:00	not done	25	2017-03-31 07:07:01.474306	2017-03-31 07:07:01.474306	\N
6	Write an amazing life story (essay)	2017-04-08 14:46:37.980279	not done	19	2017-03-31 05:32:01.925254	2017-04-01 19:17:48.504091	\N
7	fill out bio (form)	2017-01-01 00:00:00	not done	19	2017-03-31 05:32:12.6488	2017-03-31 05:32:12.6488	\N
8	adopt a dog (reference)	2017-01-01 00:00:00	not done	19	2017-03-31 05:33:36.795652	2017-03-31 05:33:36.795652	mvtg5kac1sanptofdlp7.docx
16	go fishing n stuff	2017-02-01 00:00:00	not done	19	2017-03-31 08:18:44.048957	2017-03-31 08:18:44.048957	\N
17	marathon (character)	2017-01-01 00:00:00	not done	19	2017-03-31 09:13:13.115266	2017-03-31 09:13:13.115266	\N
18	get recommendation forms (recommendation)	2017-12-01 00:00:00	not done	19	2017-03-31 09:20:58.168676	2017-03-31 09:20:58.168676	\N
20	review common words (SAT)	2017-01-01 00:00:00	not done	19	2017-04-01 04:08:43.476594	2017-04-01 04:08:43.476594	\N
21	go fishing n stuff (character)	2018-01-01 00:00:00	not done	19	2017-04-01 04:52:26.359505	2017-04-01 04:52:26.359505	\N
22	be free and fuck shit up (character)	2017-01-01 00:00:00	not done	19	2017-04-01 04:52:36.522432	2017-04-01 04:52:36.522432	\N
23	transcripts (forms)	2017-01-01 00:00:00	not done	19	2017-04-01 05:18:23.167534	2017-04-01 05:18:23.167534	\N
24	Passport photo (visa)	2017-01-02 00:00:00	not done	19	2017-04-01 05:30:45.293929	2017-04-01 05:30:45.293929	\N
25	 Why some people hate life (essay)	2017-01-01 00:00:00	approved	19	2017-04-01 05:43:17.307751	2017-04-01 17:56:38.41153	\N
19	talk to a rabi (reference)	2017-01-01 00:00:00	approved	19	2017-03-31 09:24:32.573891	2017-03-31 09:24:32.573891	aiorzalvapizstxuvbvp.png
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('tasks_id_seq', 25, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, current_school, satm, satv, satwr, act, toeflr, toeflwr, toefls, toefll, is_counselor, admin, counselor_ref) FROM stdin;
2	ask@ask.com	$2a$11$AfASSCkBk1mHmZ1OZoiB1.m4yK.t82YotnsytOBqfomLQloyoaEYG	\N	\N	\N	2	2017-03-31 04:22:11.219567	2017-03-31 04:04:54.409205	127.0.0.1	127.0.0.1	2017-03-30 11:32:42.513808	2017-03-31 04:22:11.22047	Usagi Tsukino	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	1
3	m@m.com	$2a$11$Lsm.yWxgQrDt9IeaGmGG/u4LyadXXyeffjlHDJpkmxDwNgkk2KQUi	\N	\N	\N	7	2017-03-31 05:25:26.083666	2017-03-31 04:21:42.457906	127.0.0.1	127.0.0.1	2017-03-30 14:20:12.433194	2017-03-31 05:25:26.084757	Mamoru Chiba	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	1
4	ryuichi@ryuichi.com	$2a$11$PDxAoOuE.Y0P.ntaO40eAejFSQd1vlnLm7uycgFdSEwYpnSzwP9qq	\N	\N	\N	1	2017-03-31 06:34:52.404111	2017-03-31 06:34:52.404111	127.0.0.1	127.0.0.1	2017-03-31 05:31:17.45707	2017-03-31 06:34:52.405198	Ryuichi Sakomoto	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	1
5	k@k.com	$2a$11$fZosClWxaF9fU1iv39YOLu9JvU0bB7mjDh40oTY0dtB62I5OcOECe	\N	\N	\N	1	2017-03-31 07:06:31.281798	2017-03-31 07:06:31.281798	127.0.0.1	127.0.0.1	2017-03-31 07:05:49.128017	2017-03-31 07:06:31.282632	Kyari pamyu	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	1
6	fuck@fuck.com	$2a$11$RMuT9nURhovsfrf.Kx4LB.U2tSIfH13M5NaRlQhzXpE1ac8ghpB3O	\N	\N	\N	1	2017-03-31 07:29:11.533205	2017-03-31 07:29:11.533205	127.0.0.1	127.0.0.1	2017-03-31 07:29:11.529438	2017-03-31 07:29:11.534089	fuck	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	f	\N
7	yosuke@yosuke.com	$2a$11$XGzOGtW8uMFRYNiQFoSYjOB7veH5LUAwZs3z8orwZiaeWXx4rzmJS	\N	\N	\N	1	2017-03-31 07:32:13.922671	2017-03-31 07:32:13.922671	127.0.0.1	127.0.0.1	2017-03-31 07:29:38.570748	2017-03-31 07:32:13.923436	yosuke	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	6
8	go@go.com	$2a$11$gSkFF466Hi0NFIycQCwvlODahM02RzXKMo86dIPffVyUaJzyEDBzi	\N	\N	\N	0	\N	\N	\N	\N	2017-03-31 09:12:56.00201	2017-03-31 09:12:56.00201	gogog	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	1
1	john@john.com	$2a$11$EYo7DgGEMF8k0d8byRaq/uCU3NrVu2lmJ6XJuy9lcHD1I/Z/Vu/Gy	\N	\N	\N	15	2017-04-01 14:49:58.752275	2017-04-01 04:51:50.798294	::1	127.0.0.1	2017-03-30 11:31:15.23544	2017-04-01 14:49:58.756583	john	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	f	\N
9	jason@jason.com	$2a$11$wVvAwsNFH.2DY2pNcLdA3ONGWkdPbweco07OLiQz2a4pNs4SSKqOS	\N	\N	\N	0	\N	\N	\N	\N	2017-04-01 17:26:45.438175	2017-04-01 17:26:45.438175	jason	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('users_id_seq', 9, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: college_apps college_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY college_apps
    ADD CONSTRAINT college_apps_pkey PRIMARY KEY (id);


--
-- Name: colleges colleges_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY colleges
    ADD CONSTRAINT colleges_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_attachments_on_task_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_attachments_on_task_id ON attachments USING btree (task_id);


--
-- Name: index_college_apps_on_college_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_college_apps_on_college_id ON college_apps USING btree (college_id);


--
-- Name: index_college_apps_on_user_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_college_apps_on_user_id ON college_apps USING btree (user_id);


--
-- Name: index_tasks_on_college_app_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_tasks_on_college_app_id ON tasks USING btree (college_app_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: tasks fk_rails_1885d3d6a9; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT fk_rails_1885d3d6a9 FOREIGN KEY (college_app_id) REFERENCES college_apps(id);


--
-- Name: college_apps fk_rails_82eb192bf0; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY college_apps
    ADD CONSTRAINT fk_rails_82eb192bf0 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: attachments fk_rails_98bb5e58c9; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT fk_rails_98bb5e58c9 FOREIGN KEY (task_id) REFERENCES tasks(id);


--
-- Name: college_apps fk_rails_b80e6614c1; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY college_apps
    ADD CONSTRAINT fk_rails_b80e6614c1 FOREIGN KEY (college_id) REFERENCES colleges(id);


--
-- PostgreSQL database dump complete
--

