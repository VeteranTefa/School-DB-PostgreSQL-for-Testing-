PGDMP                           y            School    13.1    13.1     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16481    School    DATABASE     l   CREATE DATABASE "School" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "School";
                postgres    false            ?            1259    16573    courses    TABLE     t   CREATE TABLE public.courses (
    code character varying(20) NOT NULL,
    c_name character varying(30) NOT NULL
);
    DROP TABLE public.courses;
       public         heap    postgres    false            ?            1259    16603    levelcourses    TABLE     k   CREATE TABLE public.levelcourses (
    l_id integer NOT NULL,
    c_code character varying(20) NOT NULL
);
     DROP TABLE public.levelcourses;
       public         heap    postgres    false            ?            1259    16497    levels    TABLE     e   CREATE TABLE public.levels (
    l_id integer NOT NULL,
    l_name character varying(30) NOT NULL
);
    DROP TABLE public.levels;
       public         heap    postgres    false            ?            1259    16588    levelteacher    TABLE     [   CREATE TABLE public.levelteacher (
    l_id integer NOT NULL,
    t_id integer NOT NULL
);
     DROP TABLE public.levelteacher;
       public         heap    postgres    false            ?            1259    16482    student    TABLE     ?   CREATE TABLE public.student (
    s_id integer NOT NULL,
    s_name character varying(30) NOT NULL,
    l_id integer NOT NULL
);
    DROP TABLE public.student;
       public         heap    postgres    false            ?            1259    16578    teacher    TABLE     ?   CREATE TABLE public.teacher (
    t_id integer NOT NULL,
    t_name character varying(30) NOT NULL,
    c_code character varying(20) NOT NULL
);
    DROP TABLE public.teacher;
       public         heap    postgres    false            ?          0    16573    courses 
   TABLE DATA           /   COPY public.courses (code, c_name) FROM stdin;
    public          postgres    false    202          ?          0    16603    levelcourses 
   TABLE DATA           4   COPY public.levelcourses (l_id, c_code) FROM stdin;
    public          postgres    false    205   ?       ?          0    16497    levels 
   TABLE DATA           .   COPY public.levels (l_id, l_name) FROM stdin;
    public          postgres    false    201   ?       ?          0    16588    levelteacher 
   TABLE DATA           2   COPY public.levelteacher (l_id, t_id) FROM stdin;
    public          postgres    false    204          ?          0    16482    student 
   TABLE DATA           5   COPY public.student (s_id, s_name, l_id) FROM stdin;
    public          postgres    false    200   M       ?          0    16578    teacher 
   TABLE DATA           7   COPY public.teacher (t_id, t_name, c_code) FROM stdin;
    public          postgres    false    203   ?       9           2606    16577    courses courses_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (code);
 >   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
       public            postgres    false    202            ?           2606    16607    levelcourses levelcourses_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.levelcourses
    ADD CONSTRAINT levelcourses_pkey PRIMARY KEY (l_id, c_code);
 H   ALTER TABLE ONLY public.levelcourses DROP CONSTRAINT levelcourses_pkey;
       public            postgres    false    205    205            7           2606    16501    levels levels_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (l_id);
 <   ALTER TABLE ONLY public.levels DROP CONSTRAINT levels_pkey;
       public            postgres    false    201            =           2606    16592    levelteacher levelteacher_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.levelteacher
    ADD CONSTRAINT levelteacher_pkey PRIMARY KEY (l_id, t_id);
 H   ALTER TABLE ONLY public.levelteacher DROP CONSTRAINT levelteacher_pkey;
       public            postgres    false    204    204            5           2606    16486    student student_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (s_id);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public            postgres    false    200            ;           2606    16582    teacher teacher_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (t_id);
 >   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_pkey;
       public            postgres    false    203            A           2606    16583    teacher fk_codeid 
   FK CONSTRAINT     s   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT fk_codeid FOREIGN KEY (c_code) REFERENCES public.courses(code);
 ;   ALTER TABLE ONLY public.teacher DROP CONSTRAINT fk_codeid;
       public          postgres    false    2873    202    203            D           2606    16608    levelcourses fk_coursecode 
   FK CONSTRAINT     |   ALTER TABLE ONLY public.levelcourses
    ADD CONSTRAINT fk_coursecode FOREIGN KEY (c_code) REFERENCES public.courses(code);
 D   ALTER TABLE ONLY public.levelcourses DROP CONSTRAINT fk_coursecode;
       public          postgres    false    205    2873    202            @           2606    16502    student fk_idforlevel 
   FK CONSTRAINT     ?   ALTER TABLE ONLY public.student
    ADD CONSTRAINT fk_idforlevel FOREIGN KEY (l_id) REFERENCES public.levels(l_id) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.student DROP CONSTRAINT fk_idforlevel;
       public          postgres    false    2871    200    201            C           2606    16598    levelteacher fk_levelid 
   FK CONSTRAINT     v   ALTER TABLE ONLY public.levelteacher
    ADD CONSTRAINT fk_levelid FOREIGN KEY (l_id) REFERENCES public.levels(l_id);
 A   ALTER TABLE ONLY public.levelteacher DROP CONSTRAINT fk_levelid;
       public          postgres    false    201    204    2871            E           2606    16613    levelcourses fk_levelid 
   FK CONSTRAINT     v   ALTER TABLE ONLY public.levelcourses
    ADD CONSTRAINT fk_levelid FOREIGN KEY (l_id) REFERENCES public.levels(l_id);
 A   ALTER TABLE ONLY public.levelcourses DROP CONSTRAINT fk_levelid;
       public          postgres    false    201    205    2871            B           2606    16593    levelteacher fk_teacherid 
   FK CONSTRAINT     y   ALTER TABLE ONLY public.levelteacher
    ADD CONSTRAINT fk_teacherid FOREIGN KEY (t_id) REFERENCES public.teacher(t_id);
 C   ALTER TABLE ONLY public.levelteacher DROP CONSTRAINT fk_teacherid;
       public          postgres    false    204    2875    203            ?   j   x??1?0F???aP?t??t???F&?Dd?CoO????F???	??6?ito??^??h??????Ғ???S=?]C?!z6??o???߰?<?t??N??????Z<$q      ?   ?   x?3?L,?2??M,??y\F???E@?8Hdd????9ӊ?DbQ????--? ?=... ??6      ?   '   x?3??I-K?Q??K?2??K????a쌢?T?=... ?t      ?   ,   x?
??
  ???D?^??<҄?Pz?>}Q?~?zt^>???      ?   j   x?%???0C??cPӒ۹?????R9U????'????d?!?t????%????%u?}???{2??=;?\??8c?&?p??_lg??MB񃨪4????1????      ?   ?   x?%?;?0E?w? ?Y?c???6W?"?L???7????Z??^???&)m?`)?3?9?????z?'????})?h&??p?qG??b?N?c1????l??L:#?=??sS??
pQ?/nQ<6 ~??0?     