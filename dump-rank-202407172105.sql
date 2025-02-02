PGDMP                         |           rank    14.1    14.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    33246    rank    DATABASE     `   CREATE DATABASE rank WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE rank;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    33248 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false    3            �            1259    33247    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    3    210            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    209            �            1259    33257    player_profiles    TABLE     �  CREATE TABLE public.player_profiles (
    id integer NOT NULL,
    solo_competitive_rank integer,
    competitive_rank integer,
    rank_tier integer,
    leaderboard_rank integer,
    profile_personaname character varying,
    profile_name character varying,
    profile_plus boolean,
    profile_cheese integer,
    profile_steamid character varying,
    profile_avatar character varying,
    profile_avatarmedium character varying,
    profile_avatarfull character varying,
    profile_profileurl character varying,
    profile_last_login character varying,
    profile_loccountrycode character varying,
    profile_is_contributor boolean,
    profile_is_subscriber boolean,
    profile_account_id character varying
);
 #   DROP TABLE public.player_profiles;
       public         heap    postgres    false    3            �            1259    33256    player_profiles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.player_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.player_profiles_id_seq;
       public          postgres    false    3    212            �           0    0    player_profiles_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.player_profiles_id_seq OWNED BY public.player_profiles.id;
          public          postgres    false    211            a           2604    33251    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            b           2604    33260    player_profiles id    DEFAULT     x   ALTER TABLE ONLY public.player_profiles ALTER COLUMN id SET DEFAULT nextval('public.player_profiles_id_seq'::regclass);
 A   ALTER TABLE public.player_profiles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �          0    33248 
   migrations 
   TABLE DATA           ;   COPY public.migrations (id, "timestamp", name) FROM stdin;
    public          postgres    false    210   �       �          0    33257    player_profiles 
   TABLE DATA           �  COPY public.player_profiles (id, solo_competitive_rank, competitive_rank, rank_tier, leaderboard_rank, profile_personaname, profile_name, profile_plus, profile_cheese, profile_steamid, profile_avatar, profile_avatarmedium, profile_avatarfull, profile_profileurl, profile_last_login, profile_loccountrycode, profile_is_contributor, profile_is_subscriber, profile_account_id) FROM stdin;
    public          postgres    false    212   �       �           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);
          public          postgres    false    209                        0    0    player_profiles_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.player_profiles_id_seq', 6, true);
          public          postgres    false    211            f           2606    33264 .   player_profiles PK_60488bbe49c4612fce78e0a1875 
   CONSTRAINT     n   ALTER TABLE ONLY public.player_profiles
    ADD CONSTRAINT "PK_60488bbe49c4612fce78e0a1875" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.player_profiles DROP CONSTRAINT "PK_60488bbe49c4612fce78e0a1875";
       public            postgres    false    212            d           2606    33255 )   migrations PK_8c82d7f526340ab734260ea46be 
   CONSTRAINT     i   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.migrations DROP CONSTRAINT "PK_8c82d7f526340ab734260ea46be";
       public            postgres    false    210            �      x������ � �      �   �  x����j�0���S�V�H����6�Ki(�w�"٣]���ֆ��c�%I�C�f����Sܞ��`�g�}�.�麭�m������w�X�����%$ �%�D��w����}�aߋ>s��r[�z�UѣM�1)h�F�u�{
M䆢u��n�i�_7���\f:l6'Ҁ�wm~�`��6���DU���,�] ^�_N-и���bp�
 i�ˡJ<Fc�8������㋘R��0�X�<��+h���1j�`4j�lC�!d�����M���ͅ�'�����,��^�;���s%����?���?��r(�J���E�h�)b
�bҊ9�:t�	$j?K�\�{d�f~D�������B�����0�o���SZ�衼eY>�e     