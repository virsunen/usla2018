--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

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
-- Name: app_boardpositions; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_boardpositions (
    title character varying(100) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE app_boardpositions OWNER TO virsunen;

--
-- Name: app_committeechairpositions; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_committeechairpositions (
    title character varying(100) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE app_committeechairpositions OWNER TO virsunen;

--
-- Name: app_event; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_event (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    location character varying(2) NOT NULL,
    unique_location character varying(100) NOT NULL,
    cost integer NOT NULL,
    cost_has_hst boolean NOT NULL,
    is_annual_event boolean NOT NULL,
    image character varying(100) NOT NULL,
    pdf_file character varying(100) NOT NULL,
    description text NOT NULL,
    contact_email character varying(254) NOT NULL,
    author_id integer
);


ALTER TABLE app_event OWNER TO virsunen;

--
-- Name: app_event_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_event_id_seq OWNER TO virsunen;

--
-- Name: app_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_event_id_seq OWNED BY app_event.id;


--
-- Name: app_eventgallery; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_eventgallery (
    description character varying(140) NOT NULL,
    slug character varying(50) NOT NULL,
    type_id integer NOT NULL,
    author_id integer
);


ALTER TABLE app_eventgallery OWNER TO virsunen;

--
-- Name: app_eventgalleryimages; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_eventgalleryimages (
    id integer NOT NULL,
    description character varying(140) NOT NULL,
    date date,
    image character varying(100) NOT NULL,
    image_thumb character varying(100) NOT NULL,
    author_id integer,
    gallery_id integer NOT NULL
);


ALTER TABLE app_eventgalleryimages OWNER TO virsunen;

--
-- Name: app_eventgalleryimages_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_eventgalleryimages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_eventgalleryimages_id_seq OWNER TO virsunen;

--
-- Name: app_eventgalleryimages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_eventgalleryimages_id_seq OWNED BY app_eventgalleryimages.id;


--
-- Name: app_frontpagelinks; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_frontpagelinks (
    url character varying(200) NOT NULL,
    link_text character varying(60) NOT NULL
);


ALTER TABLE app_frontpagelinks OWNER TO virsunen;

--
-- Name: app_newsitem; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_newsitem (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    description text NOT NULL,
    publish_date date NOT NULL,
    pdf_file character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    author_id integer
);


ALTER TABLE app_newsitem OWNER TO virsunen;

--
-- Name: app_newsitem_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_newsitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_newsitem_id_seq OWNER TO virsunen;

--
-- Name: app_newsitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_newsitem_id_seq OWNED BY app_newsitem.id;


--
-- Name: app_page; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_page (
    title_text character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    fa_icon character varying(30) NOT NULL,
    sub_description character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    page_order integer NOT NULL
);


ALTER TABLE app_page OWNER TO virsunen;

--
-- Name: app_program; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_program (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    image character varying(100) NOT NULL,
    pdf_file character varying(100) NOT NULL,
    fa_icon character varying(30) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    sub_description text NOT NULL,
    contact_name character varying(100) NOT NULL,
    contact_email character varying(254) NOT NULL,
    contact_tel character varying(16) NOT NULL,
    author_id integer
);


ALTER TABLE app_program OWNER TO virsunen;

--
-- Name: app_program_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_program_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_program_id_seq OWNER TO virsunen;

--
-- Name: app_program_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_program_id_seq OWNED BY app_program.id;


--
-- Name: app_programevent; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_programevent (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    location character varying(2) NOT NULL,
    unique_location character varying(100) NOT NULL,
    cost integer NOT NULL,
    cost_has_hst boolean NOT NULL,
    is_annual_event boolean NOT NULL,
    image character varying(100) NOT NULL,
    pdf_file character varying(100) NOT NULL,
    description text NOT NULL,
    contact_email character varying(254) NOT NULL,
    author_id integer,
    program_id character varying(50) NOT NULL
);


ALTER TABLE app_programevent OWNER TO virsunen;

--
-- Name: app_programevent_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_programevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_programevent_id_seq OWNER TO virsunen;

--
-- Name: app_programevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_programevent_id_seq OWNED BY app_programevent.id;


--
-- Name: app_programgallery; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_programgallery (
    id integer NOT NULL,
    description character varying(140) NOT NULL,
    slug character varying(50) NOT NULL,
    author_id integer,
    type_id integer NOT NULL
);


ALTER TABLE app_programgallery OWNER TO virsunen;

--
-- Name: app_programgallery_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_programgallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_programgallery_id_seq OWNER TO virsunen;

--
-- Name: app_programgallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_programgallery_id_seq OWNED BY app_programgallery.id;


--
-- Name: app_programgalleryimages; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_programgalleryimages (
    id integer NOT NULL,
    description character varying(140) NOT NULL,
    date date,
    image character varying(100) NOT NULL,
    image_thumb character varying(100) NOT NULL,
    author_id integer,
    gallery_id integer NOT NULL
);


ALTER TABLE app_programgalleryimages OWNER TO virsunen;

--
-- Name: app_programgalleryimages_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_programgalleryimages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_programgalleryimages_id_seq OWNER TO virsunen;

--
-- Name: app_programgalleryimages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_programgalleryimages_id_seq OWNED BY app_programgalleryimages.id;


--
-- Name: app_programschedule; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_programschedule (
    total_available_spaces integer NOT NULL,
    total_reserved_spaces integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    monday boolean NOT NULL,
    tuesday boolean NOT NULL,
    wednesday boolean NOT NULL,
    thursday boolean NOT NULL,
    friday boolean NOT NULL,
    saturday boolean NOT NULL,
    sunday boolean NOT NULL,
    name character varying(60) NOT NULL,
    location character varying(2) NOT NULL,
    note character varying(200) NOT NULL,
    author_id integer,
    program_id integer NOT NULL,
    CONSTRAINT app_programschedule_total_available_spaces_check CHECK ((total_available_spaces >= 0)),
    CONSTRAINT app_programschedule_total_reserved_spaces_check CHECK ((total_reserved_spaces >= 0))
);


ALTER TABLE app_programschedule OWNER TO virsunen;

--
-- Name: app_sitememberprofile; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_sitememberprofile (
    id integer NOT NULL,
    board_member_id character varying(100),
    committee_member_id character varying(100),
    user_id integer NOT NULL,
    cel_num character varying(16) NOT NULL,
    email_forward character varying(254) NOT NULL,
    image character varying(100) NOT NULL,
    tel_num character varying(16) NOT NULL
);


ALTER TABLE app_sitememberprofile OWNER TO virsunen;

--
-- Name: app_sitememberprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_sitememberprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_sitememberprofile_id_seq OWNER TO virsunen;

--
-- Name: app_sitememberprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_sitememberprofile_id_seq OWNED BY app_sitememberprofile.id;


--
-- Name: app_sitesettings; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_sitesettings (
    id integer NOT NULL,
    site_name character varying(40) NOT NULL,
    site_desc character varying(80) NOT NULL,
    site_history text NOT NULL,
    site_history_lbl character varying(80) NOT NULL,
    contact character varying(254) NOT NULL,
    facebook_link character varying(200) NOT NULL,
    logo_header_image character varying(100) NOT NULL,
    logo_btm_image character varying(100) NOT NULL
);


ALTER TABLE app_sitesettings OWNER TO virsunen;

--
-- Name: app_sitesettings_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_sitesettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_sitesettings_id_seq OWNER TO virsunen;

--
-- Name: app_sitesettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_sitesettings_id_seq OWNED BY app_sitesettings.id;


--
-- Name: app_uslagallery; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_uslagallery (
    id integer NOT NULL,
    description character varying(140) NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(140) NOT NULL,
    author_id integer
);


ALTER TABLE app_uslagallery OWNER TO virsunen;

--
-- Name: app_uslagallery_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_uslagallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_uslagallery_id_seq OWNER TO virsunen;

--
-- Name: app_uslagallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_uslagallery_id_seq OWNED BY app_uslagallery.id;


--
-- Name: app_uslagalleryimages; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_uslagalleryimages (
    id integer NOT NULL,
    description character varying(140) NOT NULL,
    date date,
    image character varying(100) NOT NULL,
    image_thumb character varying(100) NOT NULL,
    author_id integer,
    gallery_id integer NOT NULL
);


ALTER TABLE app_uslagalleryimages OWNER TO virsunen;

--
-- Name: app_uslagalleryimages_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_uslagalleryimages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_uslagalleryimages_id_seq OWNER TO virsunen;

--
-- Name: app_uslagalleryimages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_uslagalleryimages_id_seq OWNED BY app_uslagalleryimages.id;


--
-- Name: app_uslalocations; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_uslalocations (
    name character varying(50) NOT NULL,
    short_name character varying(2) NOT NULL
);


ALTER TABLE app_uslalocations OWNER TO virsunen;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO virsunen;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO virsunen;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO virsunen;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO virsunen;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO virsunen;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO virsunen;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO virsunen;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO virsunen;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO virsunen;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO virsunen;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO virsunen;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO virsunen;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO virsunen;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO virsunen;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO virsunen;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO virsunen;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO virsunen;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO virsunen;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO virsunen;

--
-- Name: app_event id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_event ALTER COLUMN id SET DEFAULT nextval('app_event_id_seq'::regclass);


--
-- Name: app_eventgalleryimages id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_eventgalleryimages ALTER COLUMN id SET DEFAULT nextval('app_eventgalleryimages_id_seq'::regclass);


--
-- Name: app_newsitem id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_newsitem ALTER COLUMN id SET DEFAULT nextval('app_newsitem_id_seq'::regclass);


--
-- Name: app_program id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_program ALTER COLUMN id SET DEFAULT nextval('app_program_id_seq'::regclass);


--
-- Name: app_programevent id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programevent ALTER COLUMN id SET DEFAULT nextval('app_programevent_id_seq'::regclass);


--
-- Name: app_programgallery id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programgallery ALTER COLUMN id SET DEFAULT nextval('app_programgallery_id_seq'::regclass);


--
-- Name: app_programgalleryimages id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programgalleryimages ALTER COLUMN id SET DEFAULT nextval('app_programgalleryimages_id_seq'::regclass);


--
-- Name: app_sitememberprofile id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_sitememberprofile ALTER COLUMN id SET DEFAULT nextval('app_sitememberprofile_id_seq'::regclass);


--
-- Name: app_sitesettings id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_sitesettings ALTER COLUMN id SET DEFAULT nextval('app_sitesettings_id_seq'::regclass);


--
-- Name: app_uslagallery id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_uslagallery ALTER COLUMN id SET DEFAULT nextval('app_uslagallery_id_seq'::regclass);


--
-- Name: app_uslagalleryimages id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_uslagalleryimages ALTER COLUMN id SET DEFAULT nextval('app_uslagalleryimages_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: app_boardpositions; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_boardpositions (title, "order") FROM stdin;
Director - Environment	8
Director - Fundraising	6
Director - Membership	3
Director - Pavilion	7
Director - Regatta	5
Director - Swim / Youth	4
President	0
Proposed Director	9
Secretary - Treasurer	2
Treasurer	1
\.


--
-- Data for Name: app_committeechairpositions; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_committeechairpositions (title, "order") FROM stdin;
Craft Sale	0
Rocks / Shoals	1
Summer Programs	3
Yacht Club	4
\.


--
-- Data for Name: app_event; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_event (id, name, start_date, end_date, start_time, end_time, location, unique_location, cost, cost_has_hst, is_annual_event, image, pdf_file, description, contact_email, author_id) FROM stdin;
1	CPR & Defibrillator Training	2017-07-08	2017-07-08	10:00:00	12:00:00	LA		40	t	f			Space is Limited!  A minimum class size of 10 is required for each course;  Prepayment required, non-refundable.\r\n\r\nRegister @ the USLA AGM or via Cathy @ 647-808-6062	jenchrreb@yahoo.com	\N
5	30th Annual Craft Sale	2017-07-02	2017-07-02	10:00:00	16:00:00	LA	Crowes Landing	0	t	f			This is the Kawartha's largest Art and Craft Show. This year over 80 vendors will present to you everything imaginable in either Fine Art, or Unique Craft Works. We will have live Jazz musicians to entertain you, Coffee and Sweets available from Kyoto Coffee, Hamburgers, Hot Dogs on the grill to purchase along with soft drinks. Parking is FREE, Entrance is FREE, and the Fun is also FREE.\r\nCome out and join us, support the local community.		\N
6	111th Regatta	2017-08-05	2017-08-05	09:30:00	16:30:00	LC		5	f	f			Registration for the Regatta is on site, starting at 9am\r\n\r\n$5.00 for Junior, 14 and under, and $10.00 for Adults.		\N
7	Family Dance	2017-08-05	2017-08-05	19:00:00	20:00:00			0	t	f					\N
8	26th Annual Paddle	2017-07-16	2017-07-16	09:00:00	10:00:00	LC		0	t	f					\N
9	AGM	2017-07-01	2017-07-01	09:30:00	11:00:00	LA		0	t	f					\N
10	Canada Day BBQ	2017-07-01	2017-07-01	12:00:00	15:00:00			0	t	f					\N
11	Canada Day Family Dance	2017-07-01	2017-07-01	20:00:00	22:00:00			0	t	f					\N
12	USLA Fireworks	2017-07-02	2017-07-02	21:30:00	22:00:00		Upper Stoney Lake	0	t	f			Join us for a very Special Night on the water, our 150th Canadian Anniversary, with a spectacular and imaginative display of Fireworks, put on by your neighbors, and funded by donations from families, and  sponsors. This year the show will be larger and unbelievable, starting at Dusk, with members, family and friends, and boaters from all parts of our Lake joining the hundred's of boats to watch.		\N
13	2017 Comedy Night	2017-07-15	2017-07-16	20:00:00	01:00:00	LA		0	t	f			Eddie will provide more details		\N
14	23rd Annual Kids Fishing Derby	2017-07-09	2017-07-09	08:00:00	11:00:00		Upper Stoney Lake	0	t	f	images/events/fishing_derby.jpg		To coincide with Family Fishing Week, "Kids" bring your catch to Crowe's Landing for the weigh-in at 11am. There will be lots of prizes for many different categories		\N
15	Swing Dance	2017-08-12	2017-08-12	20:00:00	23:00:00	LA		10	f	f	images/events/Swing_Jazz_Musicians.jpg		Join us for a great Evening of Swing Jazz, and Dancing		\N
16	Movie Night Premier Screening	2017-07-22	2017-07-22	19:30:00	22:00:00	LA		15	f	f			USLA presents the STONEY LAKE premiere of ARCTIC SECRETES Yukon Wild at the Pavilion. Screening followed with a Q&A with producer and Stoney Lake cottager Peter Raymont. \r\nCash Bar\r\nTickets available at Stoney Lake Market, Woodview General Store, or at the door		\N
\.


--
-- Name: app_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_event_id_seq', 16, true);


--
-- Data for Name: app_eventgallery; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_eventgallery (description, slug, type_id, author_id) FROM stdin;
	30th-annual-craft-sale	5	\N
\.


--
-- Data for Name: app_eventgalleryimages; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_eventgalleryimages (id, description, date, image, image_thumb, author_id, gallery_id) FROM stdin;
1		\N	images/gallery/30th-annual-craft-sale/1/IMG_1964.jpg	images/gallery/30th-annual-craft-sale/1/thumb_IMG_1964.jpg	\N	5
2		\N	images/gallery/30th-annual-craft-sale/2/IMG_1965.jpg	images/gallery/30th-annual-craft-sale/2/thumb_IMG_1965.jpg	\N	5
3		\N	images/gallery/30th-annual-craft-sale/3/IMG_1966.jpg	images/gallery/30th-annual-craft-sale/3/thumb_IMG_1966.jpg	\N	5
4		\N	images/gallery/30th-annual-craft-sale/4/IMG_3825.JPG	images/gallery/30th-annual-craft-sale/4/thumb_IMG_3825.JPG	\N	5
5		\N	images/gallery/30th-annual-craft-sale/5/IMG_3828.JPG	images/gallery/30th-annual-craft-sale/5/thumb_IMG_3828.JPG	\N	5
6		\N	images/gallery/30th-annual-craft-sale/6/IMG_3840.JPG	images/gallery/30th-annual-craft-sale/6/thumb_IMG_3840.JPG	\N	5
7		\N	images/gallery/30th-annual-craft-sale/7/IMG_3847.JPG	images/gallery/30th-annual-craft-sale/7/thumb_IMG_3847.JPG	\N	5
8		\N	images/gallery/30th-annual-craft-sale/8/IMG_3845.JPG	images/gallery/30th-annual-craft-sale/8/thumb_IMG_3845.JPG	\N	5
\.


--
-- Name: app_eventgalleryimages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_eventgalleryimages_id_seq', 8, true);


--
-- Data for Name: app_frontpagelinks; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_frontpagelinks (url, link_text) FROM stdin;
https://foca.on.ca/	foca.on.ca
http://www.prhc.on.ca/	www.prhc.on.ca
http://www.dourodummer.on.ca/	www.dourodummer.on.ca
http://www.aslcmembers.ca/Default.asp?id=home&l=1	www.aslcmembers.ca
\.


--
-- Data for Name: app_newsitem; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_newsitem (id, title, description, publish_date, pdf_file, image, author_id) FROM stdin;
1	Dock Found!	Check out the picture attached to see if this dock belongs to you.	2017-06-22		images/newsitems/dock_found_-_rick_barnard_1.jpg	\N
2	New Stoney Lakers		2017-06-20	files/newsitems/page9-births.pdf		\N
3	new dates	contact me	2017-06-22			7
\.


--
-- Name: app_newsitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_newsitem_id_seq', 3, true);


--
-- Data for Name: app_page; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_page (title_text, slug, fa_icon, sub_description, image, description, page_order) FROM stdin;
Events	events	fa-calendar	USLA Upcoming Events	images/pages/events/usla_events_sml.png	Remember Blah Blah	1
Membership	membership	fa-group	The Title Description	images/pages/membership/usla_membership_sml.png	<p>Membership Page</p>	3
Programs	programs	fa-pencil-square	2017 -  USLA Programs	images/pages/programs/usla_programs.png	We have lots of exciting....	2
News	news	fa-newspaper-o	News & Announcements from the USLA Community	images/pages/news/usla_contact.png	News & Announcements from the USLA Community	4
Contact	contact	fa-envelope	Contact description	images/pages/contact/usla_contact_sml.png	Page Description	5
Home	home	fa-home	Home Page	images/pages/home/Cover_picture.jpg	<h2>Presidents Message</h2>\r\n<p>As we await another summer on the lake, the board has been working over the winter to not only update our mandate but to invigorate many of the programs on the lake. The feedback from the membership on our expanded mandate was positive, and we will be moving forward this spring with establishing a committee of those who volunteered to ensure that we are more involved in monitoring and participating in projects/policies that will affect the lake.</p>\r\n<p>This year in addition to our regular children and youth activities (swimming, regatta, dances, land sports and movie nights), Camp Kawartha will be running a free two-day camp on August 21, and 22 for 5 to 12-year old’s with activities focused on environmental education in action. Their hope is to provide a week-long camp in 2018 similar to the camp currently running at Juniper. Information about registration is contained in this Bulletin. </p>\r\n\r\n<p>Peter Raymont has once again donated his film, “Yukon Wild” to be previewed at the Pavilion. We would like to thank Peter for his time and generosity every year. Check this year’s summer schedule for other social and information events at the Pavilion. \r\nWe are working to have a new website up and running for the summer in the hope that we can move away from paper communication in the near future. </p>\r\n<p>This year is Canada’s 150th birthday, and we will be celebrating on the July 1st weekend with a family dance on July 1 and fireworks on Sunday, July 2nd. Our AGM will be in the 1st with the Craft Sale following on the 2nd. </p>\r\n<p>Finally, as this is my last President’s message, I am more keenly aware of our responsibility as a board to involve the next generation of cottagers to ensure the USLA continues to be an engaging and energetic organization. We will be reaching out to all around the lake who are current, past or future members highlighting the benefits of membership and the importance of the continued involvement of a variety of ages and interests in the running of the association. We welcome any and all assistance and/or ideas about how we can continue to maintain the association as an important part of the Stoney Lake experience.</p>\r\n<p>Have a safe and happy summer on the lake.</p>\r\n<h5><i>Elizabeth Hyde</i></h5>	0
\.


--
-- Data for Name: app_program; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_program (id, name, description, image, pdf_file, fa_icon, start_date, end_date, sub_description, contact_name, contact_email, contact_tel, author_id) FROM stdin;
0	Golf				fa-flag	2017-07-03	2017-08-28					\N
1	Swimming	We are excited that some of our Instructors and many of our volunteers are returning this summer!  Our programming will be much the same as last year but without Olympics Day. The Irwin family have graciously allowed us to continue the Beach swim component on their property. Finally we have a fantastic FREE program hosted by Camp Kawartha in August (see ad Page ?? for details) and hope you will pre-register your kids/grandkids to be sure they get a spot!		files/programs/pdf/swim_registration_form_2QFwGMF.pdf	fa-tint	2017-07-03	2017-08-11	* Crafts and games - $10 per class or $20 for the week (3 classes).  Discounted if you prepay for 2 weeks of crafts to $35.	Cathy Miller			\N
2	Sailing				fa-life-saver	2017-06-04	2017-06-04					\N
3	Yoga				fa-child	2017-07-04	2017-08-31					\N
4	Aerobics				fa-heart	2017-07-03	2017-09-06					\N
5	Landsports				fa-bicycle	2017-07-06	2017-08-10					\N
6	Crafts				fa-cut	2017-07-03	2017-08-11					\N
\.


--
-- Name: app_program_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_program_id_seq', 6, true);


--
-- Data for Name: app_programevent; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_programevent (id, name, start_date, end_date, start_time, end_time, location, unique_location, cost, cost_has_hst, is_annual_event, image, pdf_file, description, contact_email, author_id, program_id) FROM stdin;
\.


--
-- Name: app_programevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_programevent_id_seq', 1, false);


--
-- Data for Name: app_programgallery; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_programgallery (id, description, slug, author_id, type_id) FROM stdin;
\.


--
-- Name: app_programgallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_programgallery_id_seq', 1, false);


--
-- Data for Name: app_programgalleryimages; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_programgalleryimages (id, description, date, image, image_thumb, author_id, gallery_id) FROM stdin;
\.


--
-- Name: app_programgalleryimages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_programgalleryimages_id_seq', 1, false);


--
-- Data for Name: app_programschedule; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_programschedule (total_available_spaces, total_reserved_spaces, start_time, end_time, monday, tuesday, wednesday, thursday, friday, saturday, sunday, name, location, note, author_id, program_id) FROM stdin;
0	0	10:00:00	11:00:00	t	f	t	f	t	f	f	Aerobics	LA		\N	4
0	0	09:00:00	10:00:00	t	f	t	f	t	f	f	Arts & Crafts	LA		\N	6
0	0	10:15:00	10:45:00	t	t	t	t	t	f	f	Beach Swim	LB		\N	1
0	0	09:00:00	10:00:00	t	f	t	f	t	f	f	Crafts / Games	LA	Crafts and games - $10 per class or $20 for the week (3 classes).  Discounted if you prepay for 2 weeks of crafts to $35.	\N	1
0	0	16:30:00	18:00:00	f	f	f	t	f	f	f	Landsports	LA		\N	5
0	0	11:00:00	11:45:00	t	t	t	t	t	f	f	Levels 4-7	LC		\N	1
0	0	12:00:00	13:00:00	t	t	t	t	t	f	f	Levels 8 & Up	LC		\N	1
0	0	12:00:00	16:00:00	t	f	f	f	f	f	f	Monday Golf	LD		\N	0
0	0	14:00:00	16:00:00	f	f	f	f	f	t	f	Sailing Races	LC		\N	2
0	0	09:00:00	10:00:00	f	t	f	t	f	f	f	Yoga	LA		\N	3
\.


--
-- Data for Name: app_sitememberprofile; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_sitememberprofile (id, board_member_id, committee_member_id, user_id, cel_num, email_forward, image, tel_num) FROM stdin;
1	President	\N	6	647-965-9032	president@usla.ca	images/members/president.png	705-877-9293
3	Secretary - Treasurer	\N	8	647-537-1819	owensbrittany@hotmail.com	images/members/secretary.png	
4	Director - Membership	\N	9	705-741-6800	membership@usla.ca	images/members/director_membership.png	705-877-2884
5	Director - Swim / Youth	\N	10		swim@usla.ca	images/members/director_swim_youth.png	647-808-6062
6	Director - Regatta	\N	11	416-410-8716	regatta@usla.ca	images/members/director_regatta.png	
7	Director - Fundraising	\N	12	416-705-8086	fundraising@usla.ca	images/members/director_fundraising.png	705-877-2950
8	Director - Pavilion	\N	13		pavilion@usla.ca	images/members/director_pavilion.png	705-877-8878
9	Director - Environment	\N	14	705-875-1844	environment@usla.ca	images/members/director_environment.png	705-877-8201
10	Proposed Director	Craft Sale	15	705-772-8136		images/members/proposed_director.png	416-605-0246
11	Proposed Director	\N	16			images/members/proposed_director2.png	416-886-6475
12	\N	Rocks / Shoals	17		rockshoals@usla.ca	images/members/cc_rocks_shoals.png	705-877-3657
13	\N	Rocks / Shoals	18	647-453-7538	rockshoals@usla.ca	images/members/cc_rocks_shoals2.png	416-482-3211
14	\N	Summer Programs	19		summerprograms@usla.ca	images/members/cc_summer_programs.png	705-877-2872
15	\N	Yacht Club	20		yachtclub@usla.ca	images/members/cc_yacht_club.png	705-877-1314
16	\N	Yacht Club	21	905-439-8775	yachtclub@usla.ca	images/members/cc_yacht_club2.png	705-877-1314
\.


--
-- Name: app_sitememberprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_sitememberprofile_id_seq', 16, true);


--
-- Data for Name: app_sitesettings; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_sitesettings (id, site_name, site_desc, site_history, site_history_lbl, contact, facebook_link, logo_header_image, logo_btm_image) FROM stdin;
1	usla.ca	Upper Stoney Lake Association	<p>It was many years ago when the Upper Stony (yes, Stony) Lake Association started. Always called the bulletin, their first newsletter was Volume 1, 1955 and “published once in a while in the interests of Cottagers and Lodge Owners on Upper Stony Lake.” The first newsletter was three pages.</p>\r\n\r\n<p>With four officers and five directors, it was noted that “It comprises: The Landing, The North Shore, Northey’s Bay, The Islands, Mouth of the Cree, South Bay, Burnham Lodge, Irwin Inn, Birchmuir Lodge, Whetung’s Pavilion, Knox’s, Boschink Narrows, The Duck Pond and Jack’s Creek.”</p>\r\n\r\n<p>Their bulletin was considered a new venture by the Association to keep members posted on things of interest about the lake. Although printed 62 years ago, the issues they considered serious then included “algae in the water”, “ fire protection”, “burglary”, and “road maintenance”. Many of those same issues remain strong in the minds of members today.</p>\r\n\r\n<p>Membership to the association, at that time $1 for each family member over 18 years, was earmarked to be spent on the Regatta and upkeep of the pavilion and the maintenance of the Landing.\r\nOver the years the association has flourished and grown – grown not only in membership and issues, but also grown in the name, with an “e” being added to Stony. The first sign of the “e” was in the Regatta Notice of 1960. It appeared once again in 1965, but it was in 1972 that it became a constant.</p>\r\n\r\n<p>Throughout the years there have been changes in the association, ranging from activities put on, to different events in the Regatta – there are no longer boat races with a maximum 6HP motor powering your boat!</p>\r\n\r\n<p>In the early 1900s a trip to the cottage from as close as 14 miles away was a day-long event. Today even flying from Europe, you will get to the cottage just as quickly. Membership invoices are now emailed and payments sent by Internet transfers. Websites and Facebook bring news to people within mere minutes. There have been many bulletins produced over the years, although now on a somewhat more consistent basis. The membership has fluctuated and prices have increased. People now live at their “cottages” 12 months of the year; some even fly in for the weekend.</p>\r\n\r\n<p>There is, however, one constant that has been evident throughout these many years. That is the dedication of members and volunteers to the lake. The environment has always been a concern, as has the water quality. Today’s cottagers, residents, members and volunteers are dedicated to helping preserve forever what brought people to our lake in the first place. The beautiful views; the comradery of friends and neighbours; the life-long bonds created; the sight of rolling waves and the sounds of nature are just part of what makes Stoney Lake so special.</p>\r\n\r\n<h5><i>Shelagh Landsmann / June 2017</i></h5>	History of USLA	info@usla.ca	https://www.facebook.com/UpperStoneyLakeAssociation	images/site/usla_regata_logo-header.png	images/site/usla_logo_red_yellow_212_105_kkSlC8R.png
\.


--
-- Name: app_sitesettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_sitesettings_id_seq', 1, true);


--
-- Data for Name: app_uslagallery; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_uslagallery (id, description, slug, name, author_id) FROM stdin;
\.


--
-- Name: app_uslagallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_uslagallery_id_seq', 1, false);


--
-- Data for Name: app_uslagalleryimages; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_uslagalleryimages (id, description, date, image, image_thumb, author_id, gallery_id) FROM stdin;
\.


--
-- Name: app_uslagalleryimages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_uslagalleryimages_id_seq', 1, false);


--
-- Data for Name: app_uslalocations; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_uslalocations (name, short_name) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY auth_group (id, name) FROM stdin;
2	SiteMembers
1	SiteAdministrators
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	7
2	1	10
3	1	11
4	1	12
5	1	19
6	1	20
7	1	21
8	1	22
9	1	23
10	1	24
11	1	26
12	1	28
13	1	29
14	1	30
15	1	31
16	1	32
17	1	33
18	1	34
19	1	35
20	1	36
21	1	37
22	1	38
23	1	39
24	1	40
25	1	41
26	1	42
27	1	43
28	1	44
29	1	45
30	1	46
31	1	47
32	1	48
33	1	49
34	1	50
35	1	51
36	1	52
37	1	53
38	1	54
39	1	56
40	1	58
41	1	59
42	1	60
43	1	61
44	1	62
45	1	63
46	1	64
47	1	65
48	1	66
49	1	67
50	1	68
51	1	69
52	1	73
53	1	74
54	1	75
55	1	76
56	1	77
57	1	78
58	2	32
59	2	33
60	2	76
61	2	77
62	2	78
63	2	31
64	1	4
65	1	5
66	1	70
67	1	71
68	1	72
69	1	9
70	1	8
71	1	25
72	1	6
73	1	27
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 73, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add board positions	7	add_boardpositions
20	Can change board positions	7	change_boardpositions
21	Can delete board positions	7	delete_boardpositions
22	Can add program	8	add_program
23	Can change program	8	change_program
24	Can delete program	8	delete_program
25	Can add site settings	9	add_sitesettings
26	Can change site settings	9	change_sitesettings
27	Can delete site settings	9	delete_sitesettings
28	Can add usla locations	10	add_uslalocations
29	Can change usla locations	10	change_uslalocations
30	Can delete usla locations	10	delete_uslalocations
31	Can add news item	11	add_newsitem
32	Can change news item	11	change_newsitem
33	Can delete news item	11	delete_newsitem
34	Can add event gallery images	12	add_eventgalleryimages
35	Can change event gallery images	12	change_eventgalleryimages
36	Can delete event gallery images	12	delete_eventgalleryimages
37	Can add usla gallery images	13	add_uslagalleryimages
38	Can change usla gallery images	13	change_uslagalleryimages
39	Can delete usla gallery images	13	delete_uslagalleryimages
40	Can add committee member	14	add_committeemember
41	Can change committee member	14	change_committeemember
42	Can delete committee member	14	delete_committeemember
43	Can add committee chair positions	15	add_committeechairpositions
44	Can change committee chair positions	15	change_committeechairpositions
45	Can delete committee chair positions	15	delete_committeechairpositions
46	Can add program schedule	16	add_programschedule
47	Can change program schedule	16	change_programschedule
48	Can delete program schedule	16	delete_programschedule
49	Can add front page links	17	add_frontpagelinks
50	Can change front page links	17	change_frontpagelinks
51	Can delete front page links	17	delete_frontpagelinks
52	Can add board member	18	add_boardmember
53	Can change board member	18	change_boardmember
54	Can delete board member	18	delete_boardmember
55	Can add page	19	add_page
56	Can change page	19	change_page
57	Can delete page	19	delete_page
58	Can add usla gallery	20	add_uslagallery
59	Can change usla gallery	20	change_uslagallery
60	Can delete usla gallery	20	delete_uslagallery
61	Can add program gallery	21	add_programgallery
62	Can change program gallery	21	change_programgallery
63	Can delete program gallery	21	delete_programgallery
64	Can add event gallery	22	add_eventgallery
65	Can change event gallery	22	change_eventgallery
66	Can delete event gallery	22	delete_eventgallery
67	Can add program event	23	add_programevent
68	Can change program event	23	change_programevent
69	Can delete program event	23	delete_programevent
70	Can add site member profile	24	add_sitememberprofile
71	Can change site member profile	24	change_sitememberprofile
72	Can delete site member profile	24	delete_sitememberprofile
73	Can add program gallery images	25	add_programgalleryimages
74	Can change program gallery images	25	change_programgalleryimages
75	Can delete program gallery images	25	delete_programgalleryimages
76	Can add event	26	add_event
77	Can change event	26	change_event
78	Can delete event	26	delete_event
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_permission_id_seq', 78, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
16	pbkdf2_sha256$36000$sfwcdKu570a0$nYiLqIaqnwLgMRmNItg6T8JMDqsPomexZF+DYN/ixxk=	\N	f	bigjuli@rogers.com	Julian	Pope	bigjuli@rogers.com	t	t	2017-06-24 14:55:00+00
8	pbkdf2_sha256$36000$ysMMc0gE02YQ$Tzvs7ZhEQGNE3ZeAoFUwLmoTLF8mfCtFaXDCOWTQFAE=	\N	f	owensbrittany@hotmail.com	Brittany	Owens	owensbrittany@hotmail.com	t	t	2017-06-24 14:44:00+00
10	pbkdf2_sha256$36000$q4455TtvJwQe$QACQoEzKDccU5aEqQaG9SVl6yZyLISeZMfv6J0NSpWU=	\N	f	jenchrreb@yahoo.com	Cathy	Miller	jenchrreb@yahoo.com	t	t	2017-06-24 14:46:00+00
1	pbkdf2_sha256$36000$NMzAJafmA9Wq$dSW4VtrQG5vki6ZvdWGCYUOdtlRs0zGfSKnnJgxmHlw=	2017-06-25 22:58:47.828172+00	t	virsunen			virsunen@gmail.com	t	t	2017-06-07 21:10:41.191+00
3	pbkdf2_sha256$36000$hzLsWn5g2Xph$MZ/oK3w98OQUyPvHOZQ4Wm5FMJbp4FBA6yN3p9UJPy0=	2017-06-22 16:42:04.702572+00	f	glenn_admin	Glenn	Hunter		t	t	2017-06-22 15:20:00+00
6	pbkdf2_sha256$36000$j29uxx68439c$W+nJeB4aMNXH5aBvMptFe9lkqKAwIcVSSF2TCDGkZ/Y=	\N	f	elizabethhyde@gmail.com	Elizabeth	Hyde	elizabethhyde@gmail.com	t	t	2017-06-24 14:40:00+00
7	pbkdf2_sha256$36000$HWtouUgPSReC$BistUv3bdtJ4gsNj3R5ls8U4G9dlWAXQvBypiS9hP/E=	\N	f	mastewart@icloud.com	Mike	Stewart	mastewart@icloud.com	t	t	2017-06-24 14:42:00+00
9	pbkdf2_sha256$36000$rCnZ95exgsa3$UvXnCOZLlLCju0WqZm8dcmSM3IqUJSoWqENvgdOL5xk=	\N	f	shelagh@bell.net	Shelagh	Landsmann	shelagh@bell.net	t	t	2017-06-24 14:45:00+00
11	pbkdf2_sha256$36000$n8VuypMwGShg$maEOM+QHS8OmyHD7nS2DuwxU34oT47oJRYZfwfLv7OM=	\N	f	johnpitblado@yahoo.ca	John	Pitblado	johnpitblado@yahoo.ca	t	t	2017-06-24 14:47:00+00
12	pbkdf2_sha256$36000$eBOG2Je7tMSm$a6sqXbsZOGOt62JlqVF7QzF8FkiR+MkvYiJbpU6q0FY=	\N	f	edwardbeqaj@gmail.com	Eddie	Beqaj	edwardbeqaj@gmail.com	t	t	2017-06-24 14:48:00+00
13	pbkdf2_sha256$36000$lw36ueOtLbz1$GgveGI4z87jXRRQ99Jvd4IlnCrh/+RB1FzXTahXOrC8=	\N	f	rickardjg@hotmail.com	Jim	Rickard	rickardjg@hotmail.com	t	t	2017-06-24 14:50:00+00
14	pbkdf2_sha256$36000$sZNtuiLcJXnV$LMG6tyEC9hDNKF4Zf0pBaneipqrhyl7qLolDKYQk//8=	\N	f	mediaguy@theduckpond.tv	Jim	Patterson		t	t	2017-06-24 14:52:00+00
15	pbkdf2_sha256$36000$dNhkESbTLZzl$2IVv3q2Gcz5nOFtSfKhfLlWaD6u3yzU41Lmgw9DBQ74=	\N	f	gshunter@sympatico.ca	Glenn	Hunter	gshunter@sympatico.ca	t	t	2017-06-24 14:54:00+00
17	pbkdf2_sha256$36000$Xyan6J1Oy1La$SMW+xUS7bL6kCRc1sTBo3tCXQT9pTXeaUVWeVRyvmns=	\N	f	Michael-Nolan	Michael	Nolan		t	t	2017-06-24 15:01:00+00
18	pbkdf2_sha256$36000$zeggDZOG1nRn$JWu0QfpOrT4gU84enD7eCDIaDOAEb9lRvevqpxuLMoU=	\N	f	michaelboughner@rogers.com	Michael	Boughner	michaelboughner@rogers.com	t	t	2017-06-24 15:03:00+00
19	pbkdf2_sha256$36000$C9QQbgxtXs8C$ArAdvupJza2X7i2iGcm9E21mxCzsi0+Ex8D1dqY28TY=	\N	f	lgminty@gmail.com	Len	Minty	lgminty@gmail.com	t	t	2017-06-24 15:04:00+00
20	pbkdf2_sha256$36000$IBP6OzCx2QwA$JWY01FODNCy9dMVYpZ+CCPQUYu228Hj5JdndaLe7vDw=	\N	f	g.j.greenwood@xplornet.ca	Jane	Greenwood	g.j.greenwood@xplornet.ca	t	t	2017-06-24 15:06:00+00
21	pbkdf2_sha256$36000$v0hHOsOhSF5k$8O1rpgF54xPhaSmgXB2L1hVbJWdlOpsT8qwbZtA5n7E=	\N	f	thecraigfamily@sympatico.ca	Tania	Craig	thecraigfamily@sympatico.ca	t	t	2017-06-24 15:07:00+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	3	1
3	6	2
4	7	2
6	8	2
7	9	2
8	10	2
9	11	2
10	12	2
11	13	2
12	14	2
13	15	2
14	16	2
15	17	2
16	18	2
17	19	2
18	20	2
19	21	2
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 19, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_user_id_seq', 21, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-06-22 15:12:11.929427+00	1	usla.ca Settings	2	[{"changed": {"fields": ["site_history", "site_history_lbl", "logo_header_image", "logo_btm_image"]}}]	9	1
2	2017-06-22 15:12:38.253336+00	1	usla.ca Settings	2	[]	9	1
11	2017-06-22 15:22:47.077712+00	5	testUser	1	[{"added": {}}]	4	3
23	2017-06-22 16:08:34.810646+00	6	testuser	1	[{"added": {}}]	4	3
24	2017-06-22 16:09:20.534598+00	7	cathymiller	1	[{"added": {}}]	4	3
25	2017-06-22 16:12:04.233512+00	6	testuser	2	[]	4	3
26	2017-06-22 16:12:06.412051+00	7	cathymiller	2	[{"changed": {"fields": ["is_staff"]}}]	4	3
28	2017-06-22 16:15:36.278964+00	7	cathymiller	2	[{"added": {"object": "cathymiller", "name": "site member profile"}}]	4	3
29	2017-06-22 16:19:45.328254+00	3	new dates	1	[{"added": {}}]	11	7
32	2017-06-24 15:21:04.99271+00	2	glenn	3		4	1
33	2017-06-24 15:21:04.998974+00	4	glenn_user	3		4	1
34	2017-06-24 15:21:21.273745+00	5	testUser	3		4	1
35	2017-06-24 15:24:17.542561+00	16	bigjuli@rogers.com	2	[{"added": {"object": "bigjuli@rogers.com", "name": "site member profile"}}]	4	1
36	2017-06-24 16:35:49.84673+00	16	bigjuli@rogers.com	2	[]	4	1
37	2017-06-24 16:36:58.278692+00	8	owensbrittany@hotmail.com	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	4	1
38	2017-06-24 16:37:49.595905+00	10	jenchrreb@yahoo.com	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	4	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 38, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	app	boardpositions
8	app	program
9	app	sitesettings
10	app	uslalocations
11	app	newsitem
12	app	eventgalleryimages
13	app	uslagalleryimages
14	app	committeemember
15	app	committeechairpositions
16	app	programschedule
17	app	frontpagelinks
18	app	boardmember
19	app	page
20	app	uslagallery
21	app	programgallery
22	app	eventgallery
23	app	programevent
24	app	sitememberprofile
25	app	programgalleryimages
26	app	event
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('django_content_type_id_seq', 26, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-06-22 14:44:54.09187+00
2	auth	0001_initial	2017-06-22 14:44:54.313972+00
3	admin	0001_initial	2017-06-22 14:44:54.370739+00
4	admin	0002_logentry_remove_auto_add	2017-06-22 14:44:54.390882+00
5	app	0001_initial	2017-06-22 14:44:55.365624+00
6	contenttypes	0002_remove_content_type_name	2017-06-22 14:44:55.429202+00
7	auth	0002_alter_permission_name_max_length	2017-06-22 14:44:55.442084+00
8	auth	0003_alter_user_email_max_length	2017-06-22 14:44:55.480503+00
9	auth	0004_alter_user_username_opts	2017-06-22 14:44:55.516776+00
10	auth	0005_alter_user_last_login_null	2017-06-22 14:44:55.559313+00
11	auth	0006_require_contenttypes_0002	2017-06-22 14:44:55.565063+00
12	auth	0007_alter_validators_add_error_messages	2017-06-22 14:44:55.596692+00
13	auth	0008_alter_user_username_max_length	2017-06-22 14:44:55.639522+00
14	sessions	0001_initial	2017-06-22 14:44:55.666572+00
15	app	0002_auto_20170624_1116	2017-06-24 15:16:31.666076+00
16	app	0003_auto_20170624_1202	2017-06-24 16:03:04.445537+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('django_migrations_id_seq', 16, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
w0gnc0yuvu8uxvoufs21hd9gi1rz051g	YmU3OGM2MjNmMGZjMWRlOTRjOTc4NmIxMzU4ZmFjZGM1OThlMDZhODp7Il9hdXRoX3VzZXJfaGFzaCI6ImE1NTY1NzlmYjhkOTZkMTAxZDk3YmQ5N2NmNzc3YmRjNTMxN2Y0ODgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-09 22:58:47.831153+00
\.


--
-- Name: app_boardpositions app_boardpositions_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_boardpositions
    ADD CONSTRAINT app_boardpositions_pkey PRIMARY KEY (title);


--
-- Name: app_committeechairpositions app_committeechairpositions_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_committeechairpositions
    ADD CONSTRAINT app_committeechairpositions_pkey PRIMARY KEY (title);


--
-- Name: app_event app_event_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_event
    ADD CONSTRAINT app_event_pkey PRIMARY KEY (id);


--
-- Name: app_eventgallery app_eventgallery_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_eventgallery
    ADD CONSTRAINT app_eventgallery_pkey PRIMARY KEY (type_id);


--
-- Name: app_eventgalleryimages app_eventgalleryimages_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_eventgalleryimages
    ADD CONSTRAINT app_eventgalleryimages_pkey PRIMARY KEY (id);


--
-- Name: app_frontpagelinks app_frontpagelinks_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_frontpagelinks
    ADD CONSTRAINT app_frontpagelinks_pkey PRIMARY KEY (url);


--
-- Name: app_newsitem app_newsitem_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_newsitem
    ADD CONSTRAINT app_newsitem_pkey PRIMARY KEY (id);


--
-- Name: app_page app_page_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_page
    ADD CONSTRAINT app_page_pkey PRIMARY KEY (title_text);


--
-- Name: app_program app_program_name_key; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_program
    ADD CONSTRAINT app_program_name_key UNIQUE (name);


--
-- Name: app_program app_program_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_program
    ADD CONSTRAINT app_program_pkey PRIMARY KEY (id);


--
-- Name: app_programevent app_programevent_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programevent
    ADD CONSTRAINT app_programevent_pkey PRIMARY KEY (id);


--
-- Name: app_programgallery app_programgallery_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programgallery
    ADD CONSTRAINT app_programgallery_pkey PRIMARY KEY (id);


--
-- Name: app_programgalleryimages app_programgalleryimages_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programgalleryimages
    ADD CONSTRAINT app_programgalleryimages_pkey PRIMARY KEY (id);


--
-- Name: app_programschedule app_programschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programschedule
    ADD CONSTRAINT app_programschedule_pkey PRIMARY KEY (name);


--
-- Name: app_sitememberprofile app_sitememberprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_sitememberprofile
    ADD CONSTRAINT app_sitememberprofile_pkey PRIMARY KEY (id);


--
-- Name: app_sitememberprofile app_sitememberprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_sitememberprofile
    ADD CONSTRAINT app_sitememberprofile_user_id_key UNIQUE (user_id);


--
-- Name: app_sitesettings app_sitesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_sitesettings
    ADD CONSTRAINT app_sitesettings_pkey PRIMARY KEY (id);


--
-- Name: app_uslagallery app_uslagallery_name_key; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_uslagallery
    ADD CONSTRAINT app_uslagallery_name_key UNIQUE (name);


--
-- Name: app_uslagallery app_uslagallery_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_uslagallery
    ADD CONSTRAINT app_uslagallery_pkey PRIMARY KEY (id);


--
-- Name: app_uslagalleryimages app_uslagalleryimages_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_uslagalleryimages
    ADD CONSTRAINT app_uslagalleryimages_pkey PRIMARY KEY (id);


--
-- Name: app_uslalocations app_uslalocations_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_uslalocations
    ADD CONSTRAINT app_uslalocations_pkey PRIMARY KEY (name);


--
-- Name: app_uslalocations app_uslalocations_short_name_key; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_uslalocations
    ADD CONSTRAINT app_uslalocations_short_name_key UNIQUE (short_name);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: app_boardpositions_title_ebcfb1d4_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_boardpositions_title_ebcfb1d4_like ON app_boardpositions USING btree (title varchar_pattern_ops);


--
-- Name: app_committeechairpositions_title_19f89db2_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_committeechairpositions_title_19f89db2_like ON app_committeechairpositions USING btree (title varchar_pattern_ops);


--
-- Name: app_event_author_id_cfeb3b0c; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_event_author_id_cfeb3b0c ON app_event USING btree (author_id);


--
-- Name: app_eventgallery_author_id_e86d8f8a; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_eventgallery_author_id_e86d8f8a ON app_eventgallery USING btree (author_id);


--
-- Name: app_eventgalleryimages_author_id_2e093969; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_eventgalleryimages_author_id_2e093969 ON app_eventgalleryimages USING btree (author_id);


--
-- Name: app_eventgalleryimages_gallery_id_032c5cdb; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_eventgalleryimages_gallery_id_032c5cdb ON app_eventgalleryimages USING btree (gallery_id);


--
-- Name: app_frontpagelinks_url_3f52434a_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_frontpagelinks_url_3f52434a_like ON app_frontpagelinks USING btree (url varchar_pattern_ops);


--
-- Name: app_newsitem_author_id_22adb0b7; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_newsitem_author_id_22adb0b7 ON app_newsitem USING btree (author_id);


--
-- Name: app_page_title_text_9741db09_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_page_title_text_9741db09_like ON app_page USING btree (title_text varchar_pattern_ops);


--
-- Name: app_program_author_id_78d951b4; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_program_author_id_78d951b4 ON app_program USING btree (author_id);


--
-- Name: app_program_name_89dcfe7b_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_program_name_89dcfe7b_like ON app_program USING btree (name varchar_pattern_ops);


--
-- Name: app_programevent_author_id_f03c804b; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_programevent_author_id_f03c804b ON app_programevent USING btree (author_id);


--
-- Name: app_programevent_program_id_bd0da2ec; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_programevent_program_id_bd0da2ec ON app_programevent USING btree (program_id);


--
-- Name: app_programevent_program_id_bd0da2ec_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_programevent_program_id_bd0da2ec_like ON app_programevent USING btree (program_id varchar_pattern_ops);


--
-- Name: app_programgallery_author_id_c10d7f26; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_programgallery_author_id_c10d7f26 ON app_programgallery USING btree (author_id);


--
-- Name: app_programgallery_type_id_2734446e; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_programgallery_type_id_2734446e ON app_programgallery USING btree (type_id);


--
-- Name: app_programgalleryimages_author_id_bc61e2fb; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_programgalleryimages_author_id_bc61e2fb ON app_programgalleryimages USING btree (author_id);


--
-- Name: app_programgalleryimages_gallery_id_e53a5ce8; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_programgalleryimages_gallery_id_e53a5ce8 ON app_programgalleryimages USING btree (gallery_id);


--
-- Name: app_programschedule_author_id_ce3f269c; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_programschedule_author_id_ce3f269c ON app_programschedule USING btree (author_id);


--
-- Name: app_programschedule_name_6514d4e0_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_programschedule_name_6514d4e0_like ON app_programschedule USING btree (name varchar_pattern_ops);


--
-- Name: app_programschedule_program_id_051b5d40; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_programschedule_program_id_051b5d40 ON app_programschedule USING btree (program_id);


--
-- Name: app_sitememberprofile_board_member_id_bbbb1c80; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_sitememberprofile_board_member_id_bbbb1c80 ON app_sitememberprofile USING btree (board_member_id);


--
-- Name: app_sitememberprofile_board_member_id_bbbb1c80_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_sitememberprofile_board_member_id_bbbb1c80_like ON app_sitememberprofile USING btree (board_member_id varchar_pattern_ops);


--
-- Name: app_sitememberprofile_committee_member_id_64a4ec55; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_sitememberprofile_committee_member_id_64a4ec55 ON app_sitememberprofile USING btree (committee_member_id);


--
-- Name: app_sitememberprofile_committee_member_id_64a4ec55_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_sitememberprofile_committee_member_id_64a4ec55_like ON app_sitememberprofile USING btree (committee_member_id varchar_pattern_ops);


--
-- Name: app_uslagallery_author_id_bbed1fe1; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_uslagallery_author_id_bbed1fe1 ON app_uslagallery USING btree (author_id);


--
-- Name: app_uslagallery_name_f41b9c3c_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_uslagallery_name_f41b9c3c_like ON app_uslagallery USING btree (name varchar_pattern_ops);


--
-- Name: app_uslagalleryimages_author_id_3001b4ff; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_uslagalleryimages_author_id_3001b4ff ON app_uslagalleryimages USING btree (author_id);


--
-- Name: app_uslagalleryimages_gallery_id_1a467b1f; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_uslagalleryimages_gallery_id_1a467b1f ON app_uslagalleryimages USING btree (gallery_id);


--
-- Name: app_uslalocations_name_35de3c1c_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_uslalocations_name_35de3c1c_like ON app_uslalocations USING btree (name varchar_pattern_ops);


--
-- Name: app_uslalocations_short_name_98b2323c_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_uslalocations_short_name_98b2323c_like ON app_uslalocations USING btree (short_name varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: app_event app_event_author_id_cfeb3b0c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_event
    ADD CONSTRAINT app_event_author_id_cfeb3b0c_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_eventgallery app_eventgallery_author_id_e86d8f8a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_eventgallery
    ADD CONSTRAINT app_eventgallery_author_id_e86d8f8a_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_eventgallery app_eventgallery_type_id_da940bd7_fk_app_event_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_eventgallery
    ADD CONSTRAINT app_eventgallery_type_id_da940bd7_fk_app_event_id FOREIGN KEY (type_id) REFERENCES app_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_eventgalleryimages app_eventgalleryimag_gallery_id_032c5cdb_fk_app_event; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_eventgalleryimages
    ADD CONSTRAINT app_eventgalleryimag_gallery_id_032c5cdb_fk_app_event FOREIGN KEY (gallery_id) REFERENCES app_eventgallery(type_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_eventgalleryimages app_eventgalleryimages_author_id_2e093969_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_eventgalleryimages
    ADD CONSTRAINT app_eventgalleryimages_author_id_2e093969_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_newsitem app_newsitem_author_id_22adb0b7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_newsitem
    ADD CONSTRAINT app_newsitem_author_id_22adb0b7_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_program app_program_author_id_78d951b4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_program
    ADD CONSTRAINT app_program_author_id_78d951b4_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_programevent app_programevent_author_id_f03c804b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programevent
    ADD CONSTRAINT app_programevent_author_id_f03c804b_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_programevent app_programevent_program_id_bd0da2ec_fk_app_program_name; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programevent
    ADD CONSTRAINT app_programevent_program_id_bd0da2ec_fk_app_program_name FOREIGN KEY (program_id) REFERENCES app_program(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_programgallery app_programgallery_author_id_c10d7f26_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programgallery
    ADD CONSTRAINT app_programgallery_author_id_c10d7f26_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_programgallery app_programgallery_type_id_2734446e_fk_app_program_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programgallery
    ADD CONSTRAINT app_programgallery_type_id_2734446e_fk_app_program_id FOREIGN KEY (type_id) REFERENCES app_program(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_programgalleryimages app_programgalleryim_gallery_id_e53a5ce8_fk_app_progr; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programgalleryimages
    ADD CONSTRAINT app_programgalleryim_gallery_id_e53a5ce8_fk_app_progr FOREIGN KEY (gallery_id) REFERENCES app_programgallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_programgalleryimages app_programgalleryimages_author_id_bc61e2fb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programgalleryimages
    ADD CONSTRAINT app_programgalleryimages_author_id_bc61e2fb_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_programschedule app_programschedule_author_id_ce3f269c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programschedule
    ADD CONSTRAINT app_programschedule_author_id_ce3f269c_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_programschedule app_programschedule_program_id_051b5d40_fk_app_program_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_programschedule
    ADD CONSTRAINT app_programschedule_program_id_051b5d40_fk_app_program_id FOREIGN KEY (program_id) REFERENCES app_program(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_sitememberprofile app_sitememberprofil_board_member_id_bbbb1c80_fk_app_board; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_sitememberprofile
    ADD CONSTRAINT app_sitememberprofil_board_member_id_bbbb1c80_fk_app_board FOREIGN KEY (board_member_id) REFERENCES app_boardpositions(title) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_sitememberprofile app_sitememberprofil_committee_member_id_64a4ec55_fk_app_commi; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_sitememberprofile
    ADD CONSTRAINT app_sitememberprofil_committee_member_id_64a4ec55_fk_app_commi FOREIGN KEY (committee_member_id) REFERENCES app_committeechairpositions(title) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_sitememberprofile app_sitememberprofile_user_id_fffa5da8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_sitememberprofile
    ADD CONSTRAINT app_sitememberprofile_user_id_fffa5da8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_uslagallery app_uslagallery_author_id_bbed1fe1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_uslagallery
    ADD CONSTRAINT app_uslagallery_author_id_bbed1fe1_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_uslagalleryimages app_uslagalleryimages_author_id_3001b4ff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_uslagalleryimages
    ADD CONSTRAINT app_uslagalleryimages_author_id_3001b4ff_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_uslagalleryimages app_uslagalleryimages_gallery_id_1a467b1f_fk_app_uslagallery_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_uslagalleryimages
    ADD CONSTRAINT app_uslagalleryimages_gallery_id_1a467b1f_fk_app_uslagallery_id FOREIGN KEY (gallery_id) REFERENCES app_uslagallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

