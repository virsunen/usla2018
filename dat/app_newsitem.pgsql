PGDMP                         u            usla_online    9.6.3    9.6.3     �           0    0    ENCODING    ENCODING     #   SET client_encoding = 'SQL_ASCII';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �            1259    85107    app_newsitem    TABLE     i  CREATE TABLE app_newsitem (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    description text NOT NULL,
    publish_date date NOT NULL,
    pdf_file character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    author_id integer,
    board_news_id character varying(100),
    committee_news_id character varying(100)
);
     DROP TABLE public.app_newsitem;
       public         virsunen    false            �            1259    85105    app_newsitem_id_seq    SEQUENCE     u   CREATE SEQUENCE app_newsitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.app_newsitem_id_seq;
       public       virsunen    false    210            �           0    0    app_newsitem_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE app_newsitem_id_seq OWNED BY app_newsitem.id;
            public       virsunen    false    209            Z           2604    85110    app_newsitem id    DEFAULT     d   ALTER TABLE ONLY app_newsitem ALTER COLUMN id SET DEFAULT nextval('app_newsitem_id_seq'::regclass);
 >   ALTER TABLE public.app_newsitem ALTER COLUMN id DROP DEFAULT;
       public       virsunen    false    210    209    210            �          0    85107    app_newsitem 
   TABLE DATA               �   COPY app_newsitem (id, title, description, publish_date, pdf_file, image, author_id, board_news_id, committee_news_id) FROM stdin;
    public       virsunen    false    210   F       �           0    0    app_newsitem_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('app_newsitem_id_seq', 11, true);
            public       virsunen    false    209            a           2606    85115    app_newsitem app_newsitem_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY app_newsitem
    ADD CONSTRAINT app_newsitem_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.app_newsitem DROP CONSTRAINT app_newsitem_pkey;
       public         virsunen    false    210    210            [           1259    85345    app_newsitem_author_id_22adb0b7    INDEX     V   CREATE INDEX app_newsitem_author_id_22adb0b7 ON app_newsitem USING btree (author_id);
 3   DROP INDEX public.app_newsitem_author_id_22adb0b7;
       public         virsunen    false    210            \           1259    101355 #   app_newsitem_board_news_id_8bc65b41    INDEX     ^   CREATE INDEX app_newsitem_board_news_id_8bc65b41 ON app_newsitem USING btree (board_news_id);
 7   DROP INDEX public.app_newsitem_board_news_id_8bc65b41;
       public         virsunen    false    210            ]           1259    101331 (   app_newsitem_board_news_id_8bc65b41_like    INDEX     w   CREATE INDEX app_newsitem_board_news_id_8bc65b41_like ON app_newsitem USING btree (board_news_id varchar_pattern_ops);
 <   DROP INDEX public.app_newsitem_board_news_id_8bc65b41_like;
       public         virsunen    false    210            ^           1259    101343 '   app_newsitem_committee_news_id_93a97567    INDEX     f   CREATE INDEX app_newsitem_committee_news_id_93a97567 ON app_newsitem USING btree (committee_news_id);
 ;   DROP INDEX public.app_newsitem_committee_news_id_93a97567;
       public         virsunen    false    210            _           1259    101337 ,   app_newsitem_committee_news_id_93a97567_like    INDEX        CREATE INDEX app_newsitem_committee_news_id_93a97567_like ON app_newsitem USING btree (committee_news_id varchar_pattern_ops);
 @   DROP INDEX public.app_newsitem_committee_news_id_93a97567_like;
       public         virsunen    false    210            b           2606    85346 <   app_newsitem app_newsitem_author_id_22adb0b7_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY app_newsitem
    ADD CONSTRAINT app_newsitem_author_id_22adb0b7_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.app_newsitem DROP CONSTRAINT app_newsitem_author_id_22adb0b7_fk_auth_user_id;
       public       virsunen    false    210            d           2606    101356 L   app_newsitem app_newsitem_board_news_id_8bc65b41_fk_app_boardpositions_title    FK CONSTRAINT     �   ALTER TABLE ONLY app_newsitem
    ADD CONSTRAINT app_newsitem_board_news_id_8bc65b41_fk_app_boardpositions_title FOREIGN KEY (board_news_id) REFERENCES app_boardpositions(title) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.app_newsitem DROP CONSTRAINT app_newsitem_board_news_id_8bc65b41_fk_app_boardpositions_title;
       public       virsunen    false    210            c           2606    101344 A   app_newsitem app_newsitem_committee_news_id_93a97567_fk_app_commi    FK CONSTRAINT     �   ALTER TABLE ONLY app_newsitem
    ADD CONSTRAINT app_newsitem_committee_news_id_93a97567_fk_app_commi FOREIGN KEY (committee_news_id) REFERENCES app_committeechairpositions(title) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.app_newsitem DROP CONSTRAINT app_newsitem_committee_news_id_93a97567_fk_app_commi;
       public       virsunen    false    210            �   `  x����n�0Ư�St�
N��j2u^���Ą8`���-c��V��nɖ4���w�~�Z�*��k����aR׌4�µ����XA�i��'^�N�?A9e��ZE5Tj��0��XՒ�"��x�D�A��G�Ǹ�$�F�H?:��L�(C�VĶ$��ݳ������7�P(I�qD8���(UeEB���;��d�&qfr�~��TB���.�ZZ�1>�F������۾���
�ն�.	�$�%�4��Q�7y���+Dkb=��5�?�;���/}1�r���"߯�|I4���M�/�T	Hu��B��6��i��m��5�f�I���U�_&��{�/9��Х��     