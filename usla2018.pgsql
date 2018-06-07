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
-- Name: app_calendarholidays; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_calendarholidays (
    name character varying(120) NOT NULL,
    date date NOT NULL
);


ALTER TABLE app_calendarholidays OWNER TO virsunen;

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
-- Name: app_membershipsettings; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_membershipsettings (
    id integer NOT NULL,
    pdf_file character varying(100) NOT NULL
);


ALTER TABLE app_membershipsettings OWNER TO virsunen;

--
-- Name: app_membershipsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: virsunen
--

CREATE SEQUENCE app_membershipsettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_membershipsettings_id_seq OWNER TO virsunen;

--
-- Name: app_membershipsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: virsunen
--

ALTER SEQUENCE app_membershipsettings_id_seq OWNED BY app_membershipsettings.id;


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
    author_id integer,
    board_news_id character varying(100),
    committee_news_id character varying(100),
    contact_email character varying(254),
    contact_name character varying(80),
    contact_tel character varying(16),
    general_news_id character varying(40)
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
-- Name: app_newstopics; Type: TABLE; Schema: public; Owner: virsunen
--

CREATE TABLE app_newstopics (
    name character varying(40) NOT NULL
);


ALTER TABLE app_newstopics OWNER TO virsunen;

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
    author_id integer,
    pdf_link_name character varying(40)
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
-- Name: app_membershipsettings id; Type: DEFAULT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_membershipsettings ALTER COLUMN id SET DEFAULT nextval('app_membershipsettings_id_seq'::regclass);


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
Director - Pavilion	7
Director - Regatta	5
Director - Swim / Youth	4
President	0
Proposed Director	9
Secretary - Treasurer	2
Treasurer	1
Director - Membership	3
Director	9
\.


--
-- Data for Name: app_calendarholidays; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_calendarholidays (name, date) FROM stdin;
CIVIC HOLIDAY	2017-08-07
LABOUR DAY	2017-09-04
\.


--
-- Data for Name: app_committeechairpositions; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_committeechairpositions (title, "order") FROM stdin;
Craft Sale	0
Summer Programs	3
Yacht Club	4
Rocks / Shoals	2
Art and Craft Show	1
\.


--
-- Data for Name: app_event; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_event (id, name, start_date, end_date, start_time, end_time, location, unique_location, cost, cost_has_hst, is_annual_event, image, pdf_file, description, contact_email, author_id) FROM stdin;
5	30th Annual Craft Sale	2017-07-02	2017-07-02	10:00:00	16:00:00	LA	Crowes Landing	0	t	f			This is the Kawartha's largest Art and Craft Show. This year over 80 vendors will present to you everything imaginable in either Fine Art, or Unique Craft Works. We will have live Jazz musicians to entertain you, Coffee and Sweets available from Kyoto Coffee, Hamburgers, Hot Dogs on the grill to purchase along with soft drinks. Parking is FREE, Entrance is FREE, and the Fun is also FREE.\r\nCome out and join us, support the local community.		\N
12	USLA Fireworks	2017-07-02	2017-07-02	21:30:00	22:00:00		Upper Stoney Lake	0	t	f			Join us for a very Special Night on the water, our 150th Canadian Anniversary, with a spectacular and imaginative display of Fireworks, put on by your neighbors, and funded by donations from families, and  sponsors. This year the show will be larger and unbelievable, starting at Dusk, with members, family and friends, and boaters from all parts of our Lake joining the hundred's of boats to watch.		\N
14	23rd Annual Kids Fishing Derby	2017-07-09	2017-07-09	08:00:00	11:00:00		Upper Stoney Lake	0	t	f	images/events/fishing_derby.jpg		To coincide with Family Fishing Week, "Kids" bring your catch to Crowe's Landing for the weigh-in at 11am. There will be lots of prizes for many different categories		\N
16	Movie Night Premier Screening	2017-07-22	2017-07-22	19:30:00	22:00:00	LA		15	f	f			USLA presents the STONEY LAKE premiere of ARCTIC SECRETES Yukon Wild at the Pavilion. Screening followed with a Q&A with producer and Stoney Lake cottager Peter Raymont. \r\nCash Bar\r\nTickets available at Stoney Lake Market, Woodview General Store, or at the door		\N
9	AGM	2017-07-01	2017-07-01	09:30:00	11:00:00	LA		0	t	f			This year we will be celebrating Canada's 150 birthday with a weekend packed full of activities. The AGM will be held on Saturday with coffee starting at 9:30 and the meeting starting at 10 a.m. There will be burgers, dogs and cake following the AGM. We will be previewing our new website at the AGM which we hope will mean less emails going forward as all of our info and events will be easily accessible through the website.		3
17	9th Annual Stony Lake Sprint	2017-07-15	2017-07-15	09:00:00	12:00:00		Viamede Resort	0	t	f			The 9th Annual Stony Lake Sprint is coming up very quickly!  It is scheduled for Saturday, July 15th at 9 a.m. at Viamede Resort, not the second weekend in August, as it has been in the past.  Once Summer starts, you will only have 2 weeks to register, so please do so soon at www.stoneylakesprint.ca .  \r\n\r\nWe are also looking for volunteers for the event.\r\n \r\nFor volunteers, we are looking for people on the morning of the 15th to help park boats, park cars, give out water, give out registration kits, organize kids events, etc.  All volunteers get a great, dry-fit shirt!  Please e-mail Jenny Chambers at jenniferpeterborough@gmail.com if you are interested.		3
8	26th Annual Paddle	2017-07-16	2017-07-16	09:00:00	10:00:00	LC		5	f	f					3
18	Camp Kawartha Environment Showcase	2017-08-21	2017-08-22	10:00:00	16:00:00	LA		0	f	f	images/events/Camp_Kawartha_pic_Mon_Aug_21.jpg		<p> FREE KIDS CAMP TODAY and TUESDAY</p>\r\n<p>Camp Kawartha Environment Camp Showcase: Camp Kawartha is thrilled to showcase nature and environment based programming at Crowe’s landing on August 21 and August 22nd, 2017 from 10 a.m. to 4 p.m. each day.  Join puppeteer and musician Glen Caradus and Executive Director Jacob Rodenburg as they provide inspiring examples of environmental education in action.</p>  \r\n \r\n<p>Dance like bees, find salamanders, experience a micro-hike, follow scent trails, stalk like a fox and discover the wriggling and very small under logs and in pond water.  Follow the adventures of “Outdoor Ed” as Edward discovers the magic of his own “neighbourwood” during our interactive puppet show.  Enjoy a taste of the forest as you sip pine tea.</p>\r\n \r\n<p>Jacob and Glen will feature activities found in Jacob’s new award winning book called the Big Book of Nature Activities.  Best suited for children between the ages of 5 and 12.  Bring a lunch and snacks.  Cost is free.  Parents and grandparents are welcome as well.  Camp Kawartha hopes to offer a one week Environment Camp during the summer of 2018 at Crowe’s landing.</p>\r\n \r\n<p>Camp Kawartha is an award winning not-for-profit charity whose mission is to foster positive stewardship in children and youth of all ages.  FOR MORE INFORMATION VISIT www.campkawartha.ca</p>\r\n<p> -\tDiscover our inspiring nature… it is always close at hand.</p>		3
6	111th Regatta	2017-08-05	2017-08-05	09:30:00	16:30:00	LC		10	f	f			WAKEY WAKEY STONEY LAKEY\r\n\r\n<p>We have heard that call for the past few decades and once again we will be calling all Regatta participants tomorrow morning for a 9:30 start. The morning will be the juniors followed immediately by the seniors. NO LUNCH BREAK. This leaves more time for everyone to get home and ready themselves for the Regatta Dance which starts at 8 pm for families with younger kids and continues on until midnight for the rest of us! HAMBURGERS AND HOT DOGS WILL BE ON SALE AT THE LANDING FROM 11:30 UNTIL 2.</p>\r\n\r\nWe are looking forward to a rain free day and hope to see all of you out to participate or cheer on the participants.		3
10	Canada Day BBQ	2017-07-01	2017-07-01	12:00:00	15:00:00			0	t	f			Join the fun, there will be burgers, dogs and cake following the AGM.		3
11	Canada Day Family Dance	2017-07-01	2017-07-01	20:00:00	23:59:00	LA		0	t	f			This years opening dance on Saturday night will be FREE to 2017 members and guests. We have nibbles and are spending Friday decorating the pavilion to befit the celebration. The dance starts at 8 for the younger (or older) crowd..		3
15	Swing Dance	2017-08-12	2017-08-12	20:00:00	23:00:00	LA		20	f	f	images/events/Swing_Jazz_Musicians.jpg		Join us for a great Evening of Swing Jazz, and Dancing.		3
7	Family Dance	2017-08-05	2017-08-06	20:00:00	00:00:00			5	f	f			Join us for the Regatta Family Dance, starting at 8PM. Everyone is welcome, entrance is $5.00\r\nA DJ will provide great music to enjoy, and for the Adults a cash Bar is available.\r\nSoft drinks are also available.		3
\.


--
-- Name: app_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_event_id_seq', 20, true);


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
http://www.northkawartha.on.ca	North Kawartha Ontario
https://friendsoffraserwetlands.com/	Friends of Fraser Wetlands
https://foca.on.ca/	FOCA
http://www.aslcmembers.ca/Default.asp?id=home&l=1	Lower Stony Lake Association
http://www.prhc.on.ca/	Peterborough Regional Health Center
http://www.dourodummer.on.ca/	Township of Douro-Dummer
https://www.opp.ca/index.php?id=115&entryid=56f048738f94ac0f337b23c6	OPP Marine Safety
http://www.stonylake.on.ca	The Ston(e)y Lake Community Web Site
http://www.kawarthalandtrust.org	Kawartha Land Trust
http://www.dourodummer.on.ca/services-departments/roads-public-works-waste-management/curbside-pick-up/	Douro-Dummer Township Council
\.


--
-- Data for Name: app_membershipsettings; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_membershipsettings (id, pdf_file) FROM stdin;
1	files/2017_membership_invoice.pdf
\.


--
-- Name: app_membershipsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_membershipsettings_id_seq', 1, false);


--
-- Data for Name: app_newsitem; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_newsitem (id, title, description, publish_date, pdf_file, image, author_id, board_news_id, committee_news_id, contact_email, contact_name, contact_tel, general_news_id) FROM stdin;
27	Pavilion Manager Wanted	<h3>Looking for Summer Employment?</h3>\r\n\r\n<p>The Upper Stoney Lake Association requires an\r\nindependent contractor to manage the USLA Sunset\r\nPavilion located at 2378 Crowe’s Landing Road,\r\nStoney Lake, for the 2018 season for the period May 1\r\n(flexible) to September 9th (pavilion closes down after\r\nLabour Day).</p>\r\n<p>Spring duties: spring clean-up, arranging for: water\r\nto be hooked up, water sampling, fire extinguisher\r\nchecking/re-certification; lawn care, garbage pickup,\r\npurchase of supplies (including food) for events.\r\nThere is also contact with renters to schedule events,\r\ncollection of rental payments. For events serving\r\nliquor permits need to be applied for, liquor purchased\r\n(and stored securely prior to and after an event) and\r\ncleaning of premises after any functions.</p>\r\n<p>Manager to receive a cash float, which must be\r\nmaintained with accurate records and continual cash\r\nbalance reconciliation.</p>\r\n<p>Fall duties: cleaning and arranging for cancellation of\r\nseasonal services.</p>\r\n<h2><i>Must be of legal age to purchase alcohol. Vehicle\r\nrequired.<h2></i>\r\n<p>Interested parties to email resume to uslastoneylake@\r\ngmail.com by March 31, 2018. Detailed list of duties\r\ncan be emailed.</p>	2018-02-19	files/newsitems/2018-02-18-pavilion_manager_required.pdf		3	\N	\N	uslastoneylake@gmail.com	\N	\N	Pavilion Manager Wanted
\.


--
-- Name: app_newsitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_newsitem_id_seq', 27, true);


--
-- Data for Name: app_newstopics; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_newstopics (name) FROM stdin;
Lost & Found
Births & Deaths
For Sale
Community News
Pavilion Manager Wanted
\.


--
-- Data for Name: app_page; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_page (title_text, slug, fa_icon, sub_description, image, description, page_order) FROM stdin;
Home	home	fa-home	Home Page	images/pages/home/Cover_picture.jpg	<h2>Presidents Message</h2>\r\n<p>As we await another summer on the lake, the board has been working over the winter to not only update our mandate but to invigorate many of the programs on the lake. The feedback from the membership on our expanded mandate was positive, and we will be moving forward this spring with establishing a committee of those who volunteered to ensure that we are more involved in monitoring and participating in projects/policies that will affect the lake.</p>\r\n<p>This year in addition to our regular children and youth activities (swimming, regatta, dances, land sports and movie nights), Camp Kawartha will be running a free two-day camp on August 21, and 22 for 5 to 12-year old’s with activities focused on environmental education in action. Their hope is to provide a week-long camp in 2018 similar to the camp currently running at Juniper. Information about registration is contained in this Bulletin. </p>\r\n\r\n<p>Peter Raymont has once again donated his film, “Yukon Wild” to be previewed at the Pavilion. We would like to thank Peter for his time and generosity every year. Check this year’s summer schedule for other social and information events at the Pavilion. \r\nWe are working to have a new website up and running for the summer in the hope that we can move away from paper communication in the near future. </p>\r\n<p>This year is Canada’s 150th birthday, and we will be celebrating on the July 1st weekend with a family dance on July 1 and fireworks on Sunday, July 2nd. Our AGM will be in the 1st with the Craft Sale following on the 2nd. </p>\r\n<p>Finally, as this is my last President’s message, I am more keenly aware of our responsibility as a board to involve the next generation of cottagers to ensure the USLA continues to be an engaging and energetic organization. We will be reaching out to all around the lake who are current, past or future members highlighting the benefits of membership and the importance of the continued involvement of a variety of ages and interests in the running of the association. We welcome any and all assistance and/or ideas about how we can continue to maintain the association as an important part of the Stoney Lake experience.</p>\r\n<p>Have a safe and happy summer on the lake.</p>\r\n<h5><i>Elizabeth Hyde</i></h5>	0
Programs	programs	fa-pencil-square	2017 -  USLA Programs	images/pages/programs/pic_of_crowes_landing_1.jpg	We have lots of exciting....	2
Membership	membership	fa-group	The Title Description	images/pages/membership/usla_membership_sml.png	<h1>USLA Membership</h1>\r\n\r\n<p>To all our members, seasonal cottagers, or year-round residents\r\n\r\nbelonging to our association has benefits to take advantage of;</p>\r\n\r\n<h2><i>CONNECTION</i> with other members</h2>\r\n\r\n<ul>\r\n<li>Listing in the annual USLA Bulletin Membership Directory. This is of special importance in Fire Fighting and Rescue operations</li>\r\n</ul>\r\n\r\n<h2><i>ACTIVITIES</i> for you and the family</h2>\r\n\r\n<ul>\r\n<li>Access to a full range of Red Cross and Life Saving Society swim lessons at our Crowes Landing swim docks, for everyone of all ages. REDUCED Fees for members.</li>\r\n\r\n<li>Access to the popular Camp Kawartha, the brilliantly successful Environment Camp for children to learn and play</li>\r\n\r\n<li>A wide range of family activities and events, some with REDUCED costs including: Movie nights; Yoga, Aerobics; Swing Dancing; Reading Club; Family Paddle Day, Kids Fishing Derby, and the Yacht Club</li>\r\n\r\n<li>Popular annual events, including: AGM and Members&#39; BBQ; The Stoney Lake Arts and Craft Show; The Kawartha’s best Fireworks show; The USLA Regatta</li>\r\n\r\n<li>Access to CPR and Defibrillator training, with REDUCED costs</li>\r\n</ul>\r\n<h2><i>OUR FACILITIES</i> to use</h2>\r\n<ul>\r\n<li>The Crowe's Landing “Pavilion” is available for dedicated events, weddings, or other occasions.</li>\r\n</ul>\r\n\r\n<h2><i>ADVOCACY AND STEWARDSHIP</i></h2>\r\n<ul>\r\n<li>The USLA, together with other organizations, works to protect the lake and surrounding environment through active participation on various local committees.</li>\r\n<li>Active involvement in the local Lakes Alliance Group</li>\r\n</ul>\r\n\r\n<h2><i>FEDERATION OF ONTARIO COTTAGERS&#39; ASSOCIATIONS (FOCA)</i></h2>\r\n<ul><li>Benefits of the USLA&#39;s membership in the Federation of Ontario Cottagers&#39; Associations (FOCA), are available to all paid USLA members. These include discounts on cottage and boat insurance, CAA memberships and Cottage Life magazine subscriptions, as well as a free Canoe Museum membership.  </li>\r\n</ul>\r\n<p>Visit <a href="http://www.foca.on.ca">www.foca.on.ca</a> for more information on these and other benefits.</p>\r\n<h2><i>COMING SOON</i>Membership Renewal, Signup, and Payment options ONLINE</h2>\r\n<p>Sign up for programs or special events quickly and securely and make sure your family is registered for your favorite program.</p>	3
Contact	contact	fa-envelope	Contact description	images/pages/contact/Boats_at_Crowes.jpg	Page Description	5
News	news	fa-newspaper-o	News & Announcements from the USLA Community	images/pages/news/Lake_bright_background.jpg	News & Announcements from the USLA Community	4
Events	events	fa-calendar	USLA Upcoming Events	images/pages/events/Loons_bright.JPG	Remember Blah Blah	1
\.


--
-- Data for Name: app_program; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_program (id, name, description, image, pdf_file, fa_icon, start_date, end_date, sub_description, contact_name, contact_email, contact_tel, author_id, pdf_link_name) FROM stdin;
1	Swimming	We are excited that some of our Instructors and many of our volunteers are returning this summer!  Our programming will be much the same as last year but without Olympics Day. The Irwin family have graciously allowed us to continue the Beach swim component on their property. Finally we have a fantastic FREE program hosted by Camp Kawartha in August (see ad Page ?? for details) and hope you will pre-register your kids/grandkids to be sure they get a spot!		files/programs/pdf/swim_registration_form_2QFwGMF.pdf	fa-tint	2017-07-03	2017-08-11	* Crafts and games - $10 per class or $20 for the week (3 classes).  Discounted if you prepay for 2 weeks of crafts to $35.	Cathy Miller			\N	\N
5	Landsports				fa-bicycle	2017-07-06	2017-08-10					\N	\N
6	Crafts				fa-cut	2017-07-03	2017-08-11					\N	\N
0	Golf	Join the Monday morning golf enthusiasts, Ladies and Men. Meet at 8:15 AM at Oakland Greens, 1993 Asphodel 7th Line, Norwood. 8:30 AM Start.\r\nThis is PURE FUN, not a competition, and many of the players meet after to have lunch at the Clubhouse.\r\nPlease note, for Holiday Monday's the group play on the following Tuesday morning.			fa-flag	2017-07-03	2017-08-28		David Baird		705-877-2372	3	\N
3	Yoga	Toni Graham, certified Yoga Practitioner will guide you through a 75 minute class that will move your body, release your stress and invigorate your breath. Classes start at 9 AM,  ALL Levels are welcome. \r\nSome basic yoga experience would be helpful. Bring your own mat and thick towel.\r\nUSLA members $15.00,  non-members $20.00			fa-child	2017-07-04	2017-08-31		Toni Graham			3	\N
4	Aerobics				fa-heart	2017-07-03	2017-09-01					3	\N
2	USLA Yacht Club	This is an invitation to anyone with a sailboat to join in the fun. Saturdays at 2:00 PM. If it is a holiday long weekend, then the fun is Sunday afternoon. Lindsay Nie, starter, will have laid out the course in the middle of the lake, north of Salmon Island. And, you don't have to sail to enjoy the social benefits, meet new friends, socials "hosted" by the sailors, and families. Contact Tania Craig as below, or Jane Greenwood, g.j.greenwood@xplornet.ca for more information. see you on the water...\r\n\r\nPlease download the event program named registration form		files/programs/usla-yacht-club/Sailing_Program.pdf	fa-life-saver	2017-06-04	2017-06-04		Tania Craig	thecraigfamily@sympatico.ca	705-877-1314	3	\N
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

SELECT pg_catalog.setval('app_programevent_id_seq', 1, true);


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
0	0	14:00:00	16:00:00	f	f	f	f	f	t	f	Sailing Races	LC		\N	2
0	0	09:00:00	10:00:00	f	t	f	t	f	f	f	Yoga	LA		\N	3
0	0	08:15:00	12:00:00	t	f	f	f	f	f	f	Monday Golf	LD		3	0
\.


--
-- Data for Name: app_sitememberprofile; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY app_sitememberprofile (id, board_member_id, committee_member_id, user_id, cel_num, email_forward, image, tel_num) FROM stdin;
7	Director - Fundraising	\N	12	416-705-8086	fundraising@usla.ca	images/members/director_fundraising.png	705-877-2950
1	President	\N	6	647-965-9032	president@usla.ca	images/members/president.png	705-877-9293
5	Director - Swim / Youth	\N	10		swim@usla.ca	images/members/director_swim_youth.png	647-808-6062
6	Director - Regatta	\N	11	416-410-8716	regatta@usla.ca	images/members/director_regatta.png	
14	\N	Summer Programs	19		summerprograms@usla.ca	images/members/cc_summer_programs.png	705-877-2872
9	Director - Environment	\N	14	705-875-1844	environment@usla.ca	images/members/director_environment.png	705-877-8201
13	\N	Rocks / Shoals	18	647-453-7538	rockshoals@usla.ca	images/members/cc_rocks_shoals2.png	416-482-3211
3	Secretary - Treasurer	\N	8	647-537-1819	owensbrittany@hotmail.com	images/members/secretary.png	
8	Director - Pavilion	\N	13		pavilion@usla.ca	images/members/director_pavilion.png	705-877-8878
16	\N	Yacht Club	21	905-439-8775	yachtclub@usla.ca	images/members/cc_yacht_club2.png	705-877-1314
18	Director - Membership	\N	9	705-741-6800		images/members/director_membership.png	705-877-2884
19	\N	\N	22		virsunen@gmail.com		
11	Treasurer	\N	16			images/members/proposed_director2.png	416-886-6475
20	\N	Art and Craft Show	23	647-668-6291	allymolnar@hotmail.com	images/members/Ally_Molnar__002.JPG	
21	\N	Craft Sale	24			images/members/pic_of_Glenn.jpg	416-605-0246
10	Director	\N	15			images/members/proposed_director.png	416-605-0246
12	\N	\N	17		rockshoals@usla.ca	images/members/cc_rocks_shoals.png	705-877-3657
15	\N	Yacht Club	20		yachtclub@usla.ca	images/members/cc_yacht_club.png	705-877-1314
\.


--
-- Name: app_sitememberprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('app_sitememberprofile_id_seq', 21, true);


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
74	1	80
75	1	81
76	1	79
77	2	11
78	2	71
79	2	64
80	2	65
81	2	66
82	1	82
83	1	83
84	1	84
85	1	13
86	1	14
87	1	15
88	1	16
89	1	17
90	1	18
91	1	85
92	1	86
93	1	87
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 93, true);


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
79	Can add membership settings	27	add_membershipsettings
80	Can change membership settings	27	change_membershipsettings
81	Can delete membership settings	27	delete_membershipsettings
82	Can add calendar holidays	28	add_calendarholidays
83	Can change calendar holidays	28	change_calendarholidays
84	Can delete calendar holidays	28	delete_calendarholidays
85	Can add news topics	29	add_newstopics
86	Can change news topics	29	change_newstopics
87	Can delete news topics	29	delete_newstopics
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_permission_id_seq', 87, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
9	pbkdf2_sha256$36000$rCnZ95exgsa3$UvXnCOZLlLCju0WqZm8dcmSM3IqUJSoWqENvgdOL5xk=	\N	f	shelagh@bell.net	Shelagh	Landsmann	shelagh@bell.net	t	t	2017-06-24 14:45:00+00
12	pbkdf2_sha256$36000$eBOG2Je7tMSm$a6sqXbsZOGOt62JlqVF7QzF8FkiR+MkvYiJbpU6q0FY=	\N	f	edwardbeqaj@gmail.com	Eddie	Beqaj	edwardbeqaj@gmail.com	t	t	2017-06-24 14:48:00+00
6	pbkdf2_sha256$36000$j29uxx68439c$W+nJeB4aMNXH5aBvMptFe9lkqKAwIcVSSF2TCDGkZ/Y=	2017-06-29 23:39:45.47318+00	f	elizabethhyde@gmail.com	Elizabeth	Hyde	elizabethhyde@gmail.com	t	t	2017-06-24 14:40:00+00
15	pbkdf2_sha256$36000$dNhkESbTLZzl$2IVv3q2Gcz5nOFtSfKhfLlWaD6u3yzU41Lmgw9DBQ74=	\N	f	gshunter@sympatico.ca	Glenn	Hunter	gshunter@sympatico.ca	t	t	2017-06-24 14:54:00+00
10	pbkdf2_sha256$36000$q4455TtvJwQe$QACQoEzKDccU5aEqQaG9SVl6yZyLISeZMfv6J0NSpWU=	\N	f	jenchrreb@yahoo.com	Cathy	Miller	jenchrreb@yahoo.com	t	t	2017-06-24 14:46:00+00
17	pbkdf2_sha256$36000$Xyan6J1Oy1La$SMW+xUS7bL6kCRc1sTBo3tCXQT9pTXeaUVWeVRyvmns=	\N	f	Michael-Nolan	Michael	Nolan		f	f	2017-06-24 15:01:00+00
19	pbkdf2_sha256$36000$C9QQbgxtXs8C$ArAdvupJza2X7i2iGcm9E21mxCzsi0+Ex8D1dqY28TY=	\N	f	lgminty@gmail.com	Len	Minty	lgminty@gmail.com	t	t	2017-06-24 15:04:00+00
20	pbkdf2_sha256$36000$IBP6OzCx2QwA$JWY01FODNCy9dMVYpZ+CCPQUYu228Hj5JdndaLe7vDw=	\N	f	g.j.greenwood@xplornet.ca	Jane	Greenwood	g.j.greenwood@xplornet.ca	t	t	2017-06-24 15:06:00+00
18	pbkdf2_sha256$36000$zeggDZOG1nRn$JWu0QfpOrT4gU84enD7eCDIaDOAEb9lRvevqpxuLMoU=	\N	f	michaelboughner@rogers.com	Michael	Boughner	michaelboughner@rogers.com	t	t	2017-06-24 15:03:00+00
8	pbkdf2_sha256$36000$ysMMc0gE02YQ$Tzvs7ZhEQGNE3ZeAoFUwLmoTLF8mfCtFaXDCOWTQFAE=	\N	f	owensbrittany@hotmail.com	Brittany	Owens	owensbrittany@hotmail.com	t	t	2017-06-24 14:44:00+00
13	pbkdf2_sha256$36000$lw36ueOtLbz1$GgveGI4z87jXRRQ99Jvd4IlnCrh/+RB1FzXTahXOrC8=	\N	f	rickardjg@hotmail.com	Jim	Rickard	rickardjg@hotmail.com	t	t	2017-06-24 14:50:00+00
23	pbkdf2_sha256$36000$CzG7lmFZju69$tI5AO2jAw0F7z4bh8p3MoUAGgEC9TAK5VP2qAjNkpEE=	\N	f	Ally	Ally	Molnar	allymolnar@hotmail.com	f	t	2017-08-10 20:28:00+00
21	pbkdf2_sha256$36000$v0hHOsOhSF5k$8O1rpgF54xPhaSmgXB2L1hVbJWdlOpsT8qwbZtA5n7E=	\N	f	thecraigfamily@sympatico.ca	Tania	Craig	thecraigfamily@sympatico.ca	t	t	2017-06-24 15:07:00+00
1	pbkdf2_sha256$36000$rBD3jROOTHFa$lfUCV24NO2X0OR0bA5lgpHYCJVtlrCJ2/EeJiox5qMw=	2017-10-19 16:23:11.877227+00	t	virsunen			virsunen@gmail.com	t	t	2017-06-07 21:10:00+00
24	pbkdf2_sha256$36000$VFQmqLuDADxn$xEvL4K1sHVLckn0VizZhXJxrZqWVoD5jnuwyhF5wDtQ=	2018-01-14 23:56:24.177347+00	t	stoneylakeartcraftshow@bell.net	Glenn	Hunter	stoneylakeartcraftshow@bell.net	t	t	2017-10-16 15:31:00+00
22	pbkdf2_sha256$36000$AlobcNP5PX1i$MzYty46SRaknK1AgS0tZz+x3Ye/r1Scc3IuHOBvryps=	2017-08-14 17:20:55.866589+00	f	vadmin	Matthew	Virsunen	virsunen@hotmail.com	t	t	2017-07-07 15:51:00+00
3	pbkdf2_sha256$36000$Pe4r0EqCgeQp$xB4EJIHgamyC7/S7cMrzBWzMj+KTQeAXe9BwxC9OV+I=	2018-02-19 19:41:35.900579+00	f	glenn_admin	Glenn	Hunter	glenn@thomescanada.com	t	t	2017-06-22 15:20:00+00
16	pbkdf2_sha256$36000$sfwcdKu570a0$nYiLqIaqnwLgMRmNItg6T8JMDqsPomexZF+DYN/ixxk=	\N	f	bigjuli@rogers.com	Julian	Pope	bigjuli@rogers.com	t	t	2017-06-24 14:55:00+00
11	pbkdf2_sha256$36000$n8VuypMwGShg$maEOM+QHS8OmyHD7nS2DuwxU34oT47oJRYZfwfLv7OM=	2017-06-29 23:27:56.960864+00	f	johnpitblado@yahoo.ca	John	Pitblado	johnpitblado@yahoo.ca	t	t	2017-06-24 14:47:00+00
14	pbkdf2_sha256$36000$sZNtuiLcJXnV$LMG6tyEC9hDNKF4Zf0pBaneipqrhyl7qLolDKYQk//8=	2017-06-29 23:32:47.428675+00	f	mediaguy@theduckpond.tv	Jim	Patterson	mediaguy@theduckpond.tv	t	t	2017-06-24 14:52:00+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	3	1
3	6	2
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
20	22	1
21	1	1
22	24	2
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 22, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_user_id_seq', 24, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	24	1
2	24	2
3	24	3
4	24	4
5	24	5
6	24	6
7	24	7
8	24	8
9	24	9
10	24	10
11	24	11
12	24	12
13	24	13
14	24	14
15	24	15
16	24	16
17	24	17
18	24	18
19	24	19
20	24	20
21	24	21
22	24	22
23	24	23
24	24	24
25	24	25
26	24	26
27	24	27
28	24	28
29	24	29
30	24	30
31	24	31
32	24	32
33	24	33
34	24	34
35	24	35
36	24	36
37	24	37
38	24	38
39	24	39
40	24	40
41	24	41
42	24	42
43	24	43
44	24	44
45	24	45
46	24	46
47	24	47
48	24	48
49	24	49
50	24	50
51	24	51
52	24	52
53	24	53
54	24	54
55	24	55
56	24	56
57	24	57
58	24	58
59	24	59
60	24	60
61	24	61
62	24	62
63	24	63
64	24	64
65	24	65
66	24	66
67	24	67
68	24	68
69	24	69
70	24	70
71	24	71
72	24	72
73	24	73
74	24	74
75	24	75
76	24	76
77	24	77
78	24	78
79	24	79
80	24	80
81	24	81
82	24	82
83	24	83
84	24	84
85	24	85
86	24	86
87	24	87
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 87, true);


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
32	2017-06-24 15:21:04.99271+00	2	glenn	3		4	1
33	2017-06-24 15:21:04.998974+00	4	glenn_user	3		4	1
34	2017-06-24 15:21:21.273745+00	5	testUser	3		4	1
35	2017-06-24 15:24:17.542561+00	16	bigjuli@rogers.com	2	[{"added": {"object": "bigjuli@rogers.com", "name": "site member profile"}}]	4	1
36	2017-06-24 16:35:49.84673+00	16	bigjuli@rogers.com	2	[]	4	1
37	2017-06-24 16:36:58.278692+00	8	owensbrittany@hotmail.com	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	4	1
38	2017-06-24 16:37:49.595905+00	10	jenchrreb@yahoo.com	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	4	1
39	2017-06-26 14:30:02.376208+00	16	bigjuli@rogers.com	2	[{"changed": {"fields": ["image"], "object": "bigjuli@rogers.com", "name": "site member profile"}}]	4	1
40	2017-06-26 14:30:18.901348+00	12	edwardbeqaj@gmail.com	2	[{"changed": {"fields": ["image"], "object": "edwardbeqaj@gmail.com", "name": "site member profile"}}]	4	1
41	2017-06-26 14:30:19.63584+00	12	edwardbeqaj@gmail.com	2	[{"changed": {"fields": ["image"], "object": "edwardbeqaj@gmail.com", "name": "site member profile"}}]	4	1
42	2017-06-26 14:30:29.564926+00	6	elizabethhyde@gmail.com	2	[{"changed": {"fields": ["image"], "object": "elizabethhyde@gmail.com", "name": "site member profile"}}]	4	1
43	2017-06-26 14:31:02.130684+00	20	g.j.greenwood@xplornet.ca	2	[{"changed": {"fields": ["image"], "object": "g.j.greenwood@xplornet.ca", "name": "site member profile"}}]	4	1
44	2017-06-26 14:31:09.395011+00	3	glenn_admin	2	[{"changed": {"fields": ["last_login"]}}]	4	1
45	2017-06-26 14:31:20.087908+00	15	gshunter@sympatico.ca	2	[{"changed": {"fields": ["image"], "object": "gshunter@sympatico.ca", "name": "site member profile"}}]	4	1
46	2017-06-26 14:31:42.730023+00	10	jenchrreb@yahoo.com	2	[{"changed": {"fields": ["image"], "object": "jenchrreb@yahoo.com", "name": "site member profile"}}]	4	1
47	2017-06-26 14:31:53.684145+00	11	johnpitblado@yahoo.ca	2	[{"changed": {"fields": ["image"], "object": "johnpitblado@yahoo.ca", "name": "site member profile"}}]	4	1
48	2017-06-26 14:32:03.874603+00	19	lgminty@gmail.com	2	[{"changed": {"fields": ["image"], "object": "lgminty@gmail.com", "name": "site member profile"}}]	4	1
49	2017-06-26 14:32:22.407779+00	7	mastewart@icloud.com	2	[{"added": {"object": "mastewart@icloud.com", "name": "site member profile"}}]	4	1
50	2017-06-26 14:32:38.083742+00	7	mastewart@icloud.com	2	[{"changed": {"fields": ["board_member"], "object": "mastewart@icloud.com", "name": "site member profile"}}]	4	1
51	2017-06-26 14:32:50.727377+00	14	mediaguy@theduckpond.tv	2	[{"changed": {"fields": ["image"], "object": "mediaguy@theduckpond.tv", "name": "site member profile"}}]	4	1
52	2017-06-26 14:33:02.723563+00	18	michaelboughner@rogers.com	2	[{"changed": {"fields": ["image"], "object": "michaelboughner@rogers.com", "name": "site member profile"}}]	4	1
53	2017-06-26 14:33:12.788867+00	17	Michael-Nolan	2	[{"changed": {"fields": ["image"], "object": "Michael-Nolan", "name": "site member profile"}}]	4	1
54	2017-06-26 14:33:24.785896+00	8	owensbrittany@hotmail.com	2	[{"changed": {"fields": ["image"], "object": "owensbrittany@hotmail.com", "name": "site member profile"}}]	4	1
55	2017-06-26 14:33:42.701064+00	13	rickardjg@hotmail.com	2	[{"changed": {"fields": ["image"], "object": "rickardjg@hotmail.com", "name": "site member profile"}}]	4	1
56	2017-06-26 14:33:52.354763+00	9	shelagh@bell.net	2	[{"changed": {"fields": ["image"], "object": "shelagh@bell.net", "name": "site member profile"}}]	4	1
57	2017-06-26 14:34:02.000019+00	21	thecraigfamily@sympatico.ca	2	[{"changed": {"fields": ["image"], "object": "thecraigfamily@sympatico.ca", "name": "site member profile"}}]	4	1
59	2017-06-26 15:21:39.227647+00	Membership	Membership	2	[{"changed": {"fields": ["image"]}}]	19	1
60	2017-06-26 15:22:03.80591+00	Membership	Membership	2	[{"changed": {"fields": ["image"]}}]	19	1
61	2017-06-26 15:22:28.760776+00	News	News	2	[{"changed": {"fields": ["image"]}}]	19	1
62	2017-06-26 15:22:55.500834+00	Programs	Programs	2	[{"changed": {"fields": ["image"]}}]	19	1
63	2017-06-26 15:23:08.142391+00	News	News	2	[]	19	1
64	2017-06-26 15:23:24.608796+00	Events	Events	2	[{"changed": {"fields": ["image"]}}]	19	1
65	2017-06-26 15:24:36.655596+00	Contact	Contact	2	[{"changed": {"fields": ["image"]}}]	19	1
66	2017-06-26 17:29:34.709071+00	1	MembershipSettings object	1	[{"added": {}}]	27	1
67	2017-06-26 17:29:55.216108+00	Membership	Membership	2	[{"changed": {"fields": ["description"]}}]	19	1
68	2017-06-26 17:32:09.908485+00	Membership	Membership	2	[{"changed": {"fields": ["description"]}}]	19	1
69	2017-06-27 14:30:23.330104+00	3	glenn_admin	2	[{"changed": {"fields": ["email"]}}]	4	1
70	2017-06-27 17:31:52.90751+00	1	Yoga	1	[{"added": {}}]	23	3
71	2017-06-27 17:39:14.420081+00	11	Canada Day Family Dance	2	[{"changed": {"fields": ["description", "end_time", "location"]}}]	26	3
72	2017-06-27 17:40:30.82049+00	9	AGM	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
73	2017-06-27 17:41:39.410637+00	10	Canada Day BBQ	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
74	2017-06-27 17:47:48.417593+00	17	9th Annual Stony Lake Sprint	1	[{"added": {}}]	26	3
75	2017-06-27 17:48:27.288912+00	17	9th Annual Stony Lake Sprint	2	[{"changed": {"fields": ["start_date", "end_date", "start_time", "end_time"]}}]	26	3
76	2017-06-27 17:56:56.801692+00	0	Golf	2	[{"changed": {"fields": ["description", "contact_name", "contact_tel"]}}]	8	3
77	2017-06-27 19:23:35.399859+00	1	SiteAdministrators	2	[]	2	1
78	2017-06-27 20:39:01.964308+00	13	2017 Comedy Night	3		26	3
79	2017-06-27 20:41:45.478966+00	3	Yoga	2	[{"changed": {"fields": ["description", "contact_name"]}}]	8	3
80	2017-06-27 20:42:52.960168+00	1	Yoga	3		23	3
81	2017-06-27 23:03:59.33193+00	7	Family Dance	2	[{"changed": {"fields": ["end_date", "start_time", "end_time"]}}]	26	3
82	2017-06-27 23:04:50.188637+00	8	26th Annual Paddle	2	[{"changed": {"fields": ["start_time", "end_time", "cost", "cost_has_hst"]}}]	26	3
83	2017-06-27 23:06:57.047064+00	8	26th Annual Paddle	2	[{"changed": {"fields": ["start_time", "end_time"]}}]	26	3
84	2017-06-27 23:08:14.376303+00	4	Aerobics	2	[{"changed": {"fields": ["end_date"]}}]	8	3
85	2017-06-27 23:15:35.355233+00	18	Camp Kawartha Environment Showcase	1	[{"added": {}}]	26	3
86	2017-06-27 23:16:57.396176+00	18	Camp Kawartha Environment Showcase	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
87	2017-06-27 23:34:02.719539+00	http://www.northkawartha.on.ca	http://www.northkawartha.on.ca	1	[{"added": {}}]	17	3
88	2017-06-27 23:39:17.872163+00	https://friendsoffraserwetlands.com/	https://friendsoffraserwetlands.com/	1	[{"added": {}}]	17	3
89	2017-06-27 23:40:06.847556+00	https://foca.on.ca/	https://foca.on.ca/	2	[{"changed": {"fields": ["link_text"]}}]	17	3
90	2017-06-27 23:40:59.746777+00	http://www.aslcmembers.ca/Default.asp?id=home&l=1	http://www.aslcmembers.ca/Default.asp?id=home&l=1	2	[{"changed": {"fields": ["link_text"]}}]	17	3
91	2017-06-27 23:42:12.042442+00	http://www.prhc.on.ca/	http://www.prhc.on.ca/	2	[{"changed": {"fields": ["link_text"]}}]	17	3
92	2017-06-27 23:42:56.766878+00	http://www.dourodummer.on.ca/	http://www.dourodummer.on.ca/	2	[{"changed": {"fields": ["link_text"]}}]	17	3
93	2017-06-27 23:54:15.591906+00	2	USLA Yaught Club	2	[{"changed": {"fields": ["name", "description", "contact_name", "contact_tel", "contact_email"]}}]	8	3
94	2017-06-27 23:56:25.086717+00	2	USLA Yacht Club	2	[{"changed": {"fields": ["name"]}}]	8	3
95	2017-06-28 00:01:18.59816+00	19	Juniper Island Art Festival	1	[{"added": {}}]	26	3
96	2017-06-28 00:10:09.49411+00	News	News	2	[{"changed": {"fields": ["image"]}}]	19	3
97	2017-06-28 00:12:23.456743+00	Programs	Programs	2	[{"changed": {"fields": ["image"]}}]	19	3
98	2017-06-28 18:10:13.967719+00	19	Juniper Island Art Festival	3		26	3
99	2017-06-29 23:26:27.706138+00	2	SiteMembers	2	[]	2	1
100	2017-06-29 23:31:17.659074+00	14	mediaguy@theduckpond.tv	2	[{"changed": {"fields": ["email"]}}]	4	11
101	2017-06-29 23:34:00.43093+00	Membership	Membership	2	[{"changed": {"fields": ["title"]}}]	7	1
102	2017-06-29 23:34:09.317513+00	Membership	Membership	2	[{"changed": {"fields": ["title"]}}]	7	1
103	2017-06-29 23:34:24.959204+00	Director - Membership	Director - Membership	2	[]	7	1
104	2017-06-29 23:34:29.399693+00	Membership	Membership	2	[]	7	1
105	2017-06-29 23:35:25.716417+00	9	shelagh@bell.net	2	[{"changed": {"fields": ["board_member"], "object": "shelagh@bell.net", "name": "site member profile"}}]	4	1
106	2017-06-29 23:36:01.136356+00	Membership	Membership	3		7	1
107	2017-06-29 23:36:54.618702+00	9	shelagh@bell.net	2	[{"added": {"object": "shelagh@bell.net", "name": "site member profile"}}]	4	1
108	2017-06-29 23:38:29.010551+00	9	shelagh@bell.net	2	[{"changed": {"fields": ["tel_num", "cel_num", "image"], "object": "shelagh@bell.net", "name": "site member profile"}}]	4	1
109	2017-06-29 23:38:39.62226+00	9	shelagh@bell.net	2	[]	4	1
110	2017-06-29 23:39:13.605867+00	2	SiteMembers	2	[]	2	1
111	2017-06-29 23:41:31.054931+00	11	fsdf	3		11	1
112	2017-06-29 23:41:31.063682+00	8	New NEws Dates	3		11	1
113	2017-06-29 23:41:31.07157+00	7	New news 2kj1lkj	3		11	1
114	2017-06-29 23:41:31.07853+00	6	News Item!	3		11	1
115	2017-06-29 23:41:31.08677+00	5	News Item 3	3		11	1
116	2017-06-29 23:41:31.092706+00	4	News Item 2	3		11	1
117	2017-06-29 23:41:31.098108+00	3	Testing news item	3		11	1
118	2017-06-30 00:09:31.495752+00	9	Membership News	3		11	1
119	2017-06-30 14:53:50.7367+00	1	SiteAdministrators	2	[]	2	1
120	2017-06-30 15:05:38.893733+00	2	SiteMembers	2	[]	2	1
121	2017-07-05 20:37:55.492252+00	Director	Director	2	[{"changed": {"fields": ["title"]}}]	7	3
122	2017-07-05 20:56:20.11548+00	2	USLA Yacht Club	2	[{"changed": {"fields": ["pdf_file"]}}]	8	3
123	2017-07-05 20:58:37.04461+00	2	USLA Yacht Club	2	[{"changed": {"fields": ["description"]}}]	8	3
124	2017-07-05 21:03:55.098669+00	Monday Golf	Monday Golf	2	[{"changed": {"fields": ["start_time", "end_time"]}}]	16	3
125	2017-07-05 21:10:46.822699+00	1	SiteAdministrators	2	[]	2	3
126	2017-07-06 11:28:56.075329+00	1	CPR & Defibrillator Training	3		26	3
127	2017-07-06 11:39:36.466528+00	Membership	Membership	2	[{"changed": {"fields": ["description"]}}]	19	3
128	2017-07-06 12:04:28.809793+00	https://www.opp.ca/index.php?id=115&entryid=56f048738f94ac0f337b23c6	https://www.opp.ca/index.php?id=115&entryid=56f048738f94ac0f337b23c6	1	[{"added": {}}]	17	3
129	2017-07-07 14:57:03.808852+00	1	Environment Council applauds progress on septics	2	[{"changed": {"fields": ["board_news", "pdf_file"]}}]	11	1
130	2017-07-07 15:51:44.28453+00	22	vadmin	1	[{"added": {}}, {"added": {"object": "vadmin", "name": "site member profile"}}]	4	1
131	2017-07-07 15:52:29.657458+00	22	vadmin	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff"]}}]	4	1
132	2017-07-07 15:52:53.91493+00	1	virsunen	2	[{"changed": {"fields": ["email", "last_login"]}}]	4	1
133	2017-07-07 15:55:33.402514+00	1	virsunen	2	[{"changed": {"fields": ["email"]}}]	4	1
134	2017-07-07 16:16:26.786967+00	7	mastewart@icloud.com	3		4	3
135	2017-07-07 16:17:18.567029+00	16	bigjuli@rogers.com	2	[{"changed": {"fields": ["board_member"], "object": "bigjuli@rogers.com", "name": "site member profile"}}]	4	3
136	2017-07-10 14:15:10.970221+00	1	SiteAdministrators	2	[]	2	1
137	2017-07-10 14:16:53.72542+00	Lost & Found	Lost & Found	1	[{"added": {}}]	29	1
138	2017-07-10 14:17:05.906443+00	Births & Deaths	Births & Deaths	1	[{"added": {}}]	29	1
139	2017-07-10 14:17:14.618192+00	For Sale	For Sale	1	[{"added": {}}]	29	1
140	2017-07-10 14:17:26.367663+00	Community News	Community News	1	[{"added": {}}]	29	1
141	2017-07-10 14:19:05.348436+00	12	New Stoney Lakers	1	[{"added": {}}]	11	1
142	2017-07-10 20:19:35.165515+00	15	gshunter@sympatico.ca	2	[{"changed": {"fields": ["board_member", "cel_num"], "object": "gshunter@sympatico.ca", "name": "site member profile"}}]	4	3
143	2017-07-10 20:23:49.961809+00	13	Lost Dock	1	[{"added": {}}]	11	3
144	2017-07-10 20:29:29.732662+00	13	Lost Dock	2	[{"changed": {"fields": ["pdf_file"]}}]	11	3
145	2017-07-11 19:11:15.966874+00	13	Lost Dock	3		11	3
146	2017-07-14 21:30:15.779572+00	14	Benefit Cruise Night in Warsaw	1	[{"added": {}}]	11	3
147	2017-07-17 15:47:46.695428+00	15	Dock Found	1	[{"added": {}}]	11	3
148	2017-07-17 17:59:28.52836+00	http://www.stonylake.on.ca	http://www.stonylake.on.ca	1	[{"added": {}}]	17	3
149	2017-07-18 11:12:42.190326+00	Contact	Contact	2	[{"changed": {"fields": ["image"]}}]	19	3
150	2017-07-27 16:29:57.800332+00	http://www.kawarthalandtrust.org	http://www.kawarthalandtrust.org	1	[{"added": {}}]	17	3
151	2017-07-31 13:55:28.574763+00	7	Family Dance	2	[{"changed": {"fields": ["start_time", "end_time", "cost"]}}]	26	3
152	2017-07-31 13:55:53.242635+00	7	Family Dance	2	[{"changed": {"fields": ["cost"]}}]	26	3
153	2017-07-31 15:54:55.035609+00	20	Event Name	1	[{"added": {}}]	26	1
154	2017-07-31 15:55:06.034033+00	20	Event Name	3		26	1
155	2017-07-31 15:56:01.775289+00	15	Dock Found	2	[]	11	1
156	2017-07-31 15:56:57.547786+00	10	Canada Day BBQ	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	1
157	2017-07-31 16:00:35.918336+00	11	Canada Day Family Dance	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	1
158	2017-07-31 16:02:46.394188+00	15	Swing Dance	2	[{"changed": {"fields": ["description", "start_time", "end_time", "image"]}}]	26	1
159	2017-07-31 16:04:03.629177+00	15	Swing Dance	2	[{"changed": {"fields": ["start_time", "end_time"]}}]	26	1
160	2017-07-31 16:38:49.707593+00	15	Swing Dance	2	[{"changed": {"fields": ["start_time", "end_time", "image"]}}]	26	1
161	2017-07-31 16:38:56.707722+00	15	Swing Dance	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	1
162	2017-07-31 16:39:14.635567+00	15	Swing Dance	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	1
163	2017-07-31 16:40:41.175242+00	15	Swing Dance	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	1
164	2017-07-31 16:40:53.290873+00	15	Swing Dance	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	1
165	2017-07-31 18:13:41.605267+00	15	Swing Dance	2	[{"changed": {"fields": ["start_time", "end_time", "cost"]}}]	26	3
166	2017-07-31 18:14:06.607157+00	7	Family Dance	2	[{"changed": {"fields": ["start_time", "end_time", "cost", "cost_has_hst"]}}]	26	3
167	2017-07-31 18:15:07.164912+00	6	111th Regatta	2	[{"changed": {"fields": ["start_time", "end_time", "cost"]}}]	26	3
168	2017-07-31 18:16:51.782159+00	6	111th Regatta	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
169	2017-07-31 18:25:34.410954+00	15	Dock Found	2	[{"changed": {"fields": ["description"]}}]	11	1
170	2017-07-31 18:26:12.987387+00	15	Dock Found	2	[{"changed": {"fields": ["description"]}}]	11	1
171	2017-07-31 19:05:02.549165+00	6	111th Regatta	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
172	2017-07-31 19:05:50.833054+00	6	111th Regatta	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
173	2017-07-31 19:07:05.167189+00	14	Benefit Cruise Night in Warsaw	3		11	3
174	2017-07-31 19:09:57.05786+00	6	111th Regatta	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
175	2017-07-31 19:10:47.497964+00	6	111th Regatta	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
176	2017-07-31 19:11:53.003681+00	6	111th Regatta	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
177	2017-07-31 20:19:47.166224+00	15	Swing Dance	2	[{"changed": {"fields": ["start_time", "end_time", "image"]}}]	26	1
178	2017-08-01 00:54:50.002925+00	7	Family Dance	2	[{"changed": {"fields": ["start_time", "end_time", "cost"]}}]	26	3
179	2017-08-02 13:47:18.110741+00	7	Family Dance	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
180	2017-08-04 15:03:04.536558+00	6	111th Regatta	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
181	2017-08-04 15:03:44.91537+00	6	111th Regatta	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
182	2017-08-04 15:05:54.012692+00	6	111th Regatta	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
183	2017-08-07 21:39:46.841009+00	18	Camp Kawartha Environment Showcase	2	[{"changed": {"fields": ["description", "start_time", "end_time"]}}]	26	3
184	2017-08-08 13:54:40.059333+00	16	Warsaw Benefit Cruise Night Cheque Presentation	1	[{"added": {}}]	11	3
185	2017-08-08 13:55:38.459883+00	15	Dock Found	3		11	3
186	2017-08-08 13:55:44.804912+00	12	New Stoney Lakers	3		11	3
187	2017-08-10 20:19:56.694111+00	Art and Craft Show	Art and Craft Show	1	[{"added": {}}]	15	3
188	2017-08-10 20:28:31.262914+00	23	Ally	1	[{"added": {}}, {"added": {"object": "Ally", "name": "site member profile"}}]	4	3
189	2017-08-10 20:30:20.647207+00	23	Ally	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	4	3
190	2017-08-14 17:16:32.593575+00	20	Test Item	1	[{"added": {}}]	11	1
191	2017-08-14 17:17:14.686019+00	20	Test Item	3		11	1
192	2017-08-14 17:21:21.607792+00	21	Testing Item	1	[{"added": {}}]	11	22
193	2017-08-14 17:21:27.689497+00	21	Testing Item	3		11	22
194	2017-08-14 17:36:22.357024+00	23	Township Council Town Hall Meeting	1	[{"added": {}}]	11	3
195	2017-08-14 17:39:38.91644+00	16	Warsaw Benefit Cruise Night Cheque Presentation	3		11	3
196	2017-08-14 17:40:17.586696+00	23	Township Council Town Hall Meeting	2	[{"changed": {"fields": ["description"]}}]	11	3
197	2017-08-14 17:42:39.693699+00	23	Township Council Town Hall Meeting	2	[{"changed": {"fields": ["description"]}}]	11	3
198	2017-08-14 17:44:36.594654+00	23	Township Council Town Hall Meeting	2	[{"changed": {"fields": ["description"]}}]	11	22
199	2017-08-14 17:45:27.152248+00	23	Township Council Town Hall Meeting	2	[{"changed": {"fields": ["description"]}}]	11	22
200	2017-08-14 18:45:43.74258+00	23	Township Council Town Hall Meeting	2	[{"changed": {"fields": ["description"]}}]	11	3
201	2017-08-14 18:58:10.914588+00	News	News	2	[{"changed": {"fields": ["image"]}}]	19	3
202	2017-08-14 19:16:53.640404+00	Events	Events	2	[{"changed": {"fields": ["image"]}}]	19	3
203	2017-08-16 12:49:25.271413+00	23	Ally	2	[{"changed": {"fields": ["email"]}}, {"changed": {"fields": ["email_forward", "cel_num"], "object": "Ally", "name": "site member profile"}}]	4	3
204	2017-08-21 15:47:27.692039+00	18	Camp Kawartha Environment Showcase	2	[{"changed": {"fields": ["description", "start_time", "end_time", "image"]}}]	26	3
205	2017-09-27 17:19:29.265451+00	24	Regulate off-road Vehicles	1	[{"added": {}}]	11	3
206	2017-09-27 17:22:09.839329+00	23	Township Council Town Hall Meeting	3		11	3
207	2017-09-27 17:23:03.506354+00	24	Regulate off-road Vehicles	2	[{"changed": {"fields": ["description"]}}]	11	3
208	2017-09-27 17:24:49.832024+00	25	October 4 Meeting Septic Re-Inspection	1	[{"added": {}}]	11	3
209	2017-09-27 19:29:41.184168+00	26	Nov 16 meeting new by-law clear Garbage Bag program	1	[{"added": {}}]	11	3
210	2017-09-27 19:29:55.348928+00	1	Environment Council applauds progress on septics	3		11	3
211	2017-09-27 19:30:23.196247+00	24	Sept 27 Meeting Regulate off-road Vehicles	2	[{"changed": {"fields": ["title"]}}]	11	3
212	2017-10-13 11:02:59.719381+00	25	October 4 Meeting Septic Re-Inspection	3		11	3
213	2017-10-13 11:03:18.578335+00	24	Sept 27 Meeting Regulate off-road Vehicles	3		11	3
214	2017-10-16 15:31:16.970522+00	24	stoneylakeartcraftshow@bell.net	1	[{"added": {}}, {"added": {"object": "stoneylakeartcraftshow@bell.net", "name": "site member profile"}}]	4	3
215	2017-10-16 15:32:44.018724+00	24	stoneylakeartcraftshow@bell.net	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	3
216	2017-10-16 15:40:32.46346+00	24	stoneylakeartcraftshow@bell.net	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}, {"changed": {"fields": ["image"], "object": "stoneylakeartcraftshow@bell.net", "name": "site member profile"}}]	4	3
217	2017-10-16 15:42:10.68662+00	15	gshunter@sympatico.ca	2	[{"changed": {"fields": ["committee_member"], "object": "gshunter@sympatico.ca", "name": "site member profile"}}]	4	3
218	2017-10-16 15:44:27.604002+00	17	Michael-Nolan	2	[{"changed": {"fields": ["is_active", "is_staff"]}}, {"changed": {"fields": ["committee_member"], "object": "Michael-Nolan", "name": "site member profile"}}]	4	3
219	2017-10-16 15:45:32.000924+00	20	g.j.greenwood@xplornet.ca	2	[{"changed": {"fields": ["committee_member"], "object": "g.j.greenwood@xplornet.ca", "name": "site member profile"}}]	4	3
220	2017-10-16 15:47:34.215537+00	20	g.j.greenwood@xplornet.ca	2	[{"changed": {"fields": ["committee_member"], "object": "g.j.greenwood@xplornet.ca", "name": "site member profile"}}]	4	3
221	2017-10-16 15:48:28.361765+00	Rocks / Shoals	Rocks / Shoals	2	[{"changed": {"fields": ["order"]}}]	15	3
222	2017-10-16 15:48:33.357165+00	18	michaelboughner@rogers.com	2	[]	4	3
223	2017-10-16 15:48:54.656025+00	Art and Craft Show	Art and Craft Show	2	[{"changed": {"fields": ["order"]}}]	15	3
224	2017-10-16 15:48:59.449042+00	23	Ally	2	[]	4	3
225	2017-10-16 15:52:08.049315+00	http://www.dourodummer.on.ca/services-departments/roads-public-works-waste-management/curbside-pick-up/	http://www.dourodummer.on.ca/services-departments/roads-public-works-waste-management/curbside-pick-up/	1	[{"added": {}}]	17	3
226	2018-02-19 19:42:54.120954+00	Pavilion Manager Wanted	Pavilion Manager Wanted	1	[{"added": {}}]	29	3
227	2018-02-19 19:45:04.38964+00	27	Pavilion Manager Wanted	1	[{"added": {}}]	11	3
228	2018-02-19 19:47:23.814146+00	26	Nov 16 meeting new by-law clear Garbage Bag program	3		11	3
229	2018-02-19 19:50:34.238815+00	27	Pavilion Manager Wanted	2	[{"changed": {"fields": ["description"]}}]	11	3
230	2018-02-19 19:55:37.120676+00	27	Pavilion Manager Wanted	2	[{"changed": {"fields": ["description", "contact_email"]}}]	11	3
231	2018-02-19 19:57:34.657743+00	27	Pavilion Manager Wanted	2	[{"changed": {"fields": ["description"]}}]	11	3
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 231, true);


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
27	app	membershipsettings
28	app	calendarholidays
29	app	newstopics
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('django_content_type_id_seq', 29, true);


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
17	app	0002_auto_20170626_1329	2017-06-26 17:29:12.084789+00
18	app	0002_auto_20170707_2033	2017-07-08 00:34:03.093635+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: virsunen
--

SELECT pg_catalog.setval('django_migrations_id_seq', 18, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: virsunen
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
w0gnc0yuvu8uxvoufs21hd9gi1rz051g	YmU3OGM2MjNmMGZjMWRlOTRjOTc4NmIxMzU4ZmFjZGM1OThlMDZhODp7Il9hdXRoX3VzZXJfaGFzaCI6ImE1NTY1NzlmYjhkOTZkMTAxZDk3YmQ5N2NmNzc3YmRjNTMxN2Y0ODgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-09 22:58:47.831153+00
6lt4p3qkaskhv8yuerzcpy7kmf8jjoxt	NjQ3NDFkMTQ2NDRlMWM0MDE4Y2RiNGIzZTBlNzc2MTA0ZDcwNTExZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFjY2E3ZWEzNzc2MDdlMzZkYjdiNzNhNTcyNjViZDNhNTg0YWNmOWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-14 16:48:01.997174+00
ol83f600brzu5vzy6qauybou728cfm4e	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-08-15 00:54:04.102211+00
9wogv6j36pnki5q2ebcjofnqzuqpnr58	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-08-24 20:17:51.529115+00
221zz3276gvi9894306lmocrvvqdaz63	OWRmM2YyM2VlYzg1ZjAzYWIxNmIwYzE0YTEwYmRiYmM4ZTMwMDk5YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmZTk3YmVkODZkY2MzNmRlMjZjMDQzZDcyYTdiMmIwNmU1MTczMDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-11 00:47:44.899693+00
txj3tv1gpnzxyhxc4kq5wgipytmfxhtf	OGZkOGY0OTkwNzZhNjA0N2IxYzA3MWQxNTQyZDcyMTIyZWFkYjFmMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImE5MGRmNThhY2JjZGUyN2IwZTE4MjU5NzE5NTQ3NWI3ZWY2N2M3YmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMiJ9	2017-08-28 17:20:55.875503+00
rlujlrqq4y9fc45mf6m7axgy3qcb092q	OGU4NWVjNDEwZTQ5YzA2NjhhYmE5OGY3ODY0N2FiNWE4NGI3YmUwYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-08-28 18:55:31.294924+00
3k45dyqncwk9yxxfjdxouwssw67bl3dm	OWRmM2YyM2VlYzg1ZjAzYWIxNmIwYzE0YTEwYmRiYmM4ZTMwMDk5YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmZTk3YmVkODZkY2MzNmRlMjZjMDQzZDcyYTdiMmIwNmU1MTczMDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-11 15:02:33.845052+00
4objucxocn1z6bpw3ryh5b14ce5p9ssm	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-10-11 17:16:38.070643+00
zg0k2kfz9blyo4mjk3vrsur031d25ulq	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-10-27 10:58:28.992367+00
tqb0dx7demw2ynpxy9aeb4refv62x626	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-10-30 15:26:33.973795+00
kaubgibbpq3ml3ilfxjuuikj9qm6rych	NTZhMTJlYTRiOTcwYWVjM2JkMmYzNmM4ODRkNWJjZjc1M2IxODk1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjIyYTM2NjIwMGYxMjQyYjhhMjU3OWFhZmZkMTZiZmJlNjQ2NmNiYzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-13 23:40:42.294227+00
vs4o0hsw134fy0mk57r3qbeip9ys9tar	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-07-20 11:47:07.739865+00
himz9ftox5aadp7svkvdejaferf55adr	OWRiOTQ2ZjczYzc5ZDZiN2M1ZGE1OGI5NzljOWM1YjhlZGEyMjBjODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYTBlOGI5NmRiZDQ3ZDhiOWI0OTU1MmU2ZmUyNmQ2OGE2ZmQyNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-20 13:32:54.310595+00
0o5tb3imhnpymyg0iqa8r8pfbuel40t3	OGZkOGY0OTkwNzZhNjA0N2IxYzA3MWQxNTQyZDcyMTIyZWFkYjFmMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImE5MGRmNThhY2JjZGUyN2IwZTE4MjU5NzE5NTQ3NWI3ZWY2N2M3YmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMiJ9	2017-07-21 16:06:13.659062+00
qhcxl5nqyv0fztcwppsycz6uk0pqwbad	OGU4NWVjNDEwZTQ5YzA2NjhhYmE5OGY3ODY0N2FiNWE4NGI3YmUwYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-07-24 10:27:24.069154+00
s4pq4ir5fkrocc427pdhngahgagu4gsl	OWRiOTQ2ZjczYzc5ZDZiN2M1ZGE1OGI5NzljOWM1YjhlZGEyMjBjODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYTBlOGI5NmRiZDQ3ZDhiOWI0OTU1MmU2ZmUyNmQ2OGE2ZmQyNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-24 14:14:45.315129+00
f2htz35zwo0ba7gfw1bjdy7relxb01st	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-07-24 20:12:04.650677+00
k43s6ltiuq6mfj2xd3wnu82trggfa0zv	OWRiOTQ2ZjczYzc5ZDZiN2M1ZGE1OGI5NzljOWM1YjhlZGEyMjBjODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzYTBlOGI5NmRiZDQ3ZDhiOWI0OTU1MmU2ZmUyNmQ2OGE2ZmQyNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-25 20:43:38.708199+00
fwqu0brenvz633w1yyjzxh77mqtpuuc2	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-08-04 01:12:09.725544+00
nism2xchzutubr4plaqsv722gk9puzgw	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-08-10 16:28:31.402467+00
t9a98s48vtr3nyas18u9fmbs2nfrzp0v	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-08-14 13:53:42.170646+00
rq2x2vgyluvvtsz6udqq4iyziws8k5m1	NjQ3NDFkMTQ2NDRlMWM0MDE4Y2RiNGIzZTBlNzc2MTA0ZDcwNTExZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFjY2E3ZWEzNzc2MDdlMzZkYjdiNzNhNTcyNjViZDNhNTg0YWNmOWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-08-14 15:53:29.74764+00
zbokgv4ghpz7zlddst270bqskz3f5b7c	MGQ0N2M1MDZiZGUyNDg5NDdjZWRhODNmNGVlMjVjNDYwOWU5ODFmMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNiM2RhOGIyNzBiZDQxNGIxODgxYjhkNDQ0N2M0NWY0NmM3YWVlYjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-02 16:23:11.88003+00
yr4wrr07e5uju7nyo73r8owicodzx0lf	OTBmYTY2MDQ5ZGVlNTQ0NzM1NTAxM2NiMzlkN2JhYmI1ZmFkYzNmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA4ZTRhZWQ5ZDg4N2Q2MzhhM2FkYjlmYzdlYTBmOGIwMDFkNTIwOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9	2017-11-14 23:30:52.790701+00
f69ei3k8ba89c62xoyu5wfx6edprq3ev	OTBmYTY2MDQ5ZGVlNTQ0NzM1NTAxM2NiMzlkN2JhYmI1ZmFkYzNmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA4ZTRhZWQ5ZDg4N2Q2MzhhM2FkYjlmYzdlYTBmOGIwMDFkNTIwOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9	2018-01-22 15:49:52.759198+00
krkxswi8cwntwm7em0x5ptbb58tw4r3t	OTBmYTY2MDQ5ZGVlNTQ0NzM1NTAxM2NiMzlkN2JhYmI1ZmFkYzNmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA4ZTRhZWQ5ZDg4N2Q2MzhhM2FkYjlmYzdlYTBmOGIwMDFkNTIwOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9	2018-01-28 23:56:24.286837+00
hldukvnqr63pa9ikxoyfv777gnrrjs92	MTJlMzZjZDQxMTZjYzc4YzVjM2IzM2VhMjMwZGRlZmM3NWI0YTA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZTE4NzVkZWM0ZGRmMDg5MGRiMGExYmNmM2M4M2UyMmZiZWRkOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2018-03-05 19:41:36.066594+00
\.


--
-- Name: app_boardpositions app_boardpositions_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_boardpositions
    ADD CONSTRAINT app_boardpositions_pkey PRIMARY KEY (title);


--
-- Name: app_calendarholidays app_calendarholidays_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_calendarholidays
    ADD CONSTRAINT app_calendarholidays_pkey PRIMARY KEY (name);


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
-- Name: app_membershipsettings app_membershipsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_membershipsettings
    ADD CONSTRAINT app_membershipsettings_pkey PRIMARY KEY (id);


--
-- Name: app_newsitem app_newsitem_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_newsitem
    ADD CONSTRAINT app_newsitem_pkey PRIMARY KEY (id);


--
-- Name: app_newstopics app_newstopics_pkey; Type: CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_newstopics
    ADD CONSTRAINT app_newstopics_pkey PRIMARY KEY (name);


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
-- Name: app_calendarholidays_holiday_name_cabf4e57_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_calendarholidays_holiday_name_cabf4e57_like ON app_calendarholidays USING btree (name varchar_pattern_ops);


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
-- Name: app_newsitem_board_news_id_8bc65b41; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_newsitem_board_news_id_8bc65b41 ON app_newsitem USING btree (board_news_id);


--
-- Name: app_newsitem_board_news_id_8bc65b41_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_newsitem_board_news_id_8bc65b41_like ON app_newsitem USING btree (board_news_id varchar_pattern_ops);


--
-- Name: app_newsitem_committee_news_id_93a97567; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_newsitem_committee_news_id_93a97567 ON app_newsitem USING btree (committee_news_id);


--
-- Name: app_newsitem_committee_news_id_93a97567_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_newsitem_committee_news_id_93a97567_like ON app_newsitem USING btree (committee_news_id varchar_pattern_ops);


--
-- Name: app_newsitem_general_news_id_ea5ded00; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_newsitem_general_news_id_ea5ded00 ON app_newsitem USING btree (general_news_id);


--
-- Name: app_newsitem_general_news_id_ea5ded00_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_newsitem_general_news_id_ea5ded00_like ON app_newsitem USING btree (general_news_id varchar_pattern_ops);


--
-- Name: app_newstopics_name_81b44992_like; Type: INDEX; Schema: public; Owner: virsunen
--

CREATE INDEX app_newstopics_name_81b44992_like ON app_newstopics USING btree (name varchar_pattern_ops);


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
-- Name: app_newsitem app_newsitem_board_news_id_8bc65b41_fk_app_boardpositions_title; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_newsitem
    ADD CONSTRAINT app_newsitem_board_news_id_8bc65b41_fk_app_boardpositions_title FOREIGN KEY (board_news_id) REFERENCES app_boardpositions(title) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_newsitem app_newsitem_committee_news_id_93a97567_fk_app_commi; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_newsitem
    ADD CONSTRAINT app_newsitem_committee_news_id_93a97567_fk_app_commi FOREIGN KEY (committee_news_id) REFERENCES app_committeechairpositions(title) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_newsitem app_newsitem_general_news_id_ea5ded00_fk_app_newstopics_name; Type: FK CONSTRAINT; Schema: public; Owner: virsunen
--

ALTER TABLE ONLY app_newsitem
    ADD CONSTRAINT app_newsitem_general_news_id_ea5ded00_fk_app_newstopics_name FOREIGN KEY (general_news_id) REFERENCES app_newstopics(name) DEFERRABLE INITIALLY DEFERRED;


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

