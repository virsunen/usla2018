PGDMP                         u            usla_online    9.6.3    9.6.3     �           0    0    ENCODING    ENCODING     #   SET client_encoding = 'SQL_ASCII';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �            1259    101349    app_calendarholidays    TABLE     h   CREATE TABLE app_calendarholidays (
    name character varying(120) NOT NULL,
    date date NOT NULL
);
 (   DROP TABLE public.app_calendarholidays;
       public         virsunen    false            �          0    101349    app_calendarholidays 
   TABLE DATA               3   COPY app_calendarholidays (name, date) FROM stdin;
    public       virsunen    false    235   G       \           2606    101353 .   app_calendarholidays app_calendarholidays_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY app_calendarholidays
    ADD CONSTRAINT app_calendarholidays_pkey PRIMARY KEY (name);
 X   ALTER TABLE ONLY public.app_calendarholidays DROP CONSTRAINT app_calendarholidays_pkey;
       public         virsunen    false    235    235            Z           1259    101354 /   app_calendarholidays_holiday_name_cabf4e57_like    INDEX     }   CREATE INDEX app_calendarholidays_holiday_name_cabf4e57_like ON app_calendarholidays USING btree (name varchar_pattern_ops);
 C   DROP INDEX public.app_calendarholidays_holiday_name_cabf4e57_like;
       public         virsunen    false    235            �   4   x�s��tV����tq��4204�5��50��qt�R@�Z��p��qqq A     