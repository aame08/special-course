PGDMP                       }         	   hackathon    17.2    17.2 Y    &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            )           1262    16388 	   hackathon    DATABASE     }   CREATE DATABASE hackathon WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE hackathon;
                     postgres    false            a           1247    16453    material_type_enum    TYPE     m   CREATE TYPE public.material_type_enum AS ENUM (
    'lecture',
    'seminar',
    'homework',
    'other'
);
 %   DROP TYPE public.material_type_enum;
       public               postgres    false            �            1259    16471    courses    TABLE     �   CREATE TABLE public.courses (
    id_course integer NOT NULL,
    name_course character varying(255) NOT NULL,
    description_course text,
    teacher_id integer
);
    DROP TABLE public.courses;
       public         heap r       postgres    false            �            1259    16470    courses_id_course_seq    SEQUENCE     �   CREATE SEQUENCE public.courses_id_course_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.courses_id_course_seq;
       public               postgres    false    220            *           0    0    courses_id_course_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.courses_id_course_seq OWNED BY public.courses.id_course;
          public               postgres    false    219            �            1259    16567    feedback    TABLE     �   CREATE TABLE public.feedback (
    id_feedback integer NOT NULL,
    student_id integer,
    id_course integer,
    feedback_text text,
    feedback_date timestamp without time zone
);
    DROP TABLE public.feedback;
       public         heap r       postgres    false            �            1259    16566    feedback_id_feedback_seq    SEQUENCE     �   CREATE SEQUENCE public.feedback_id_feedback_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.feedback_id_feedback_seq;
       public               postgres    false    232            +           0    0    feedback_id_feedback_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.feedback_id_feedback_seq OWNED BY public.feedback.id_feedback;
          public               postgres    false    231            �            1259    16521    grades    TABLE     �   CREATE TABLE public.grades (
    id_grade integer NOT NULL,
    student_id integer,
    id_course integer,
    grade integer,
    comments text,
    grade_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.grades;
       public         heap r       postgres    false            �            1259    16520    grades_id_grade_seq    SEQUENCE     �   CREATE SEQUENCE public.grades_id_grade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.grades_id_grade_seq;
       public               postgres    false    226            ,           0    0    grades_id_grade_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.grades_id_grade_seq OWNED BY public.grades.id_grade;
          public               postgres    false    225            �            1259    16541    idp    TABLE     �   CREATE TABLE public.idp (
    id_idp integer NOT NULL,
    student_id integer,
    career_goals text,
    skills_to_improve text,
    progress text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.idp;
       public         heap r       postgres    false            �            1259    16540    idp_id_idp_seq    SEQUENCE     �   CREATE SEQUENCE public.idp_id_idp_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.idp_id_idp_seq;
       public               postgres    false    228            -           0    0    idp_id_idp_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.idp_id_idp_seq OWNED BY public.idp.id_idp;
          public               postgres    false    227            �            1259    16555    resumes    TABLE     �   CREATE TABLE public.resumes (
    id_resume integer NOT NULL,
    student_id integer,
    resume_url character varying(255),
    created_at timestamp without time zone
);
    DROP TABLE public.resumes;
       public         heap r       postgres    false            �            1259    16554    resumes_id_resume_seq    SEQUENCE     �   CREATE SEQUENCE public.resumes_id_resume_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.resumes_id_resume_seq;
       public               postgres    false    230            .           0    0    resumes_id_resume_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.resumes_id_resume_seq OWNED BY public.resumes.id_resume;
          public               postgres    false    229            �            1259    16485 	   schedules    TABLE     �   CREATE TABLE public.schedules (
    id_schedule integer NOT NULL,
    id_course integer,
    classroom character varying(50),
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    teacher_id integer
);
    DROP TABLE public.schedules;
       public         heap r       postgres    false            �            1259    16484    schedules_id_schedule_seq    SEQUENCE     �   CREATE SEQUENCE public.schedules_id_schedule_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.schedules_id_schedule_seq;
       public               postgres    false    222            /           0    0    schedules_id_schedule_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.schedules_id_schedule_seq OWNED BY public.schedules.id_schedule;
          public               postgres    false    221            �            1259    16502    study_materials    TABLE     -  CREATE TABLE public.study_materials (
    id_material integer NOT NULL,
    id_course integer,
    material_type public.material_type_enum NOT NULL,
    title character varying(255) NOT NULL,
    file_url character varying(255),
    uploaded_by integer,
    upload_date timestamp without time zone
);
 #   DROP TABLE public.study_materials;
       public         heap r       postgres    false    865            �            1259    16501    study_materials_id_material_seq    SEQUENCE     �   CREATE SEQUENCE public.study_materials_id_material_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.study_materials_id_material_seq;
       public               postgres    false    224            0           0    0    study_materials_id_material_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.study_materials_id_material_seq OWNED BY public.study_materials.id_material;
          public               postgres    false    223            �            1259    16593    survey_responses    TABLE     �   CREATE TABLE public.survey_responses (
    response_id integer NOT NULL,
    id_survey integer,
    student_id integer,
    response_text text
);
 $   DROP TABLE public.survey_responses;
       public         heap r       postgres    false            �            1259    16592     survey_responses_response_id_seq    SEQUENCE     �   CREATE SEQUENCE public.survey_responses_response_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.survey_responses_response_id_seq;
       public               postgres    false    236            1           0    0     survey_responses_response_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.survey_responses_response_id_seq OWNED BY public.survey_responses.response_id;
          public               postgres    false    235            �            1259    16586    surveys    TABLE     �   CREATE TABLE public.surveys (
    id_survey integer NOT NULL,
    name_survey character varying(255),
    start_date timestamp without time zone,
    end_date timestamp without time zone
);
    DROP TABLE public.surveys;
       public         heap r       postgres    false            �            1259    16585    surveys_id_survey_seq    SEQUENCE     �   CREATE SEQUENCE public.surveys_id_survey_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.surveys_id_survey_seq;
       public               postgres    false    234            2           0    0    surveys_id_survey_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.surveys_id_survey_seq OWNED BY public.surveys.id_survey;
          public               postgres    false    233            �            1259    16462    users    TABLE     T  CREATE TABLE public.users (
    id_user integer NOT NULL,
    surname_user character varying(100) NOT NULL,
    name_user character varying(100) NOT NULL,
    email_user character varying(100) NOT NULL,
    password_user character varying(100) NOT NULL,
    name_role character varying(50) NOT NULL,
    phone_user character varying(20)
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16461    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public               postgres    false    218            3           0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
          public               postgres    false    217            R           2604    16474    courses id_course    DEFAULT     v   ALTER TABLE ONLY public.courses ALTER COLUMN id_course SET DEFAULT nextval('public.courses_id_course_seq'::regclass);
 @   ALTER TABLE public.courses ALTER COLUMN id_course DROP DEFAULT;
       public               postgres    false    220    219    220            Y           2604    16570    feedback id_feedback    DEFAULT     |   ALTER TABLE ONLY public.feedback ALTER COLUMN id_feedback SET DEFAULT nextval('public.feedback_id_feedback_seq'::regclass);
 C   ALTER TABLE public.feedback ALTER COLUMN id_feedback DROP DEFAULT;
       public               postgres    false    231    232    232            U           2604    16524    grades id_grade    DEFAULT     r   ALTER TABLE ONLY public.grades ALTER COLUMN id_grade SET DEFAULT nextval('public.grades_id_grade_seq'::regclass);
 >   ALTER TABLE public.grades ALTER COLUMN id_grade DROP DEFAULT;
       public               postgres    false    226    225    226            W           2604    16544 
   idp id_idp    DEFAULT     h   ALTER TABLE ONLY public.idp ALTER COLUMN id_idp SET DEFAULT nextval('public.idp_id_idp_seq'::regclass);
 9   ALTER TABLE public.idp ALTER COLUMN id_idp DROP DEFAULT;
       public               postgres    false    228    227    228            X           2604    16558    resumes id_resume    DEFAULT     v   ALTER TABLE ONLY public.resumes ALTER COLUMN id_resume SET DEFAULT nextval('public.resumes_id_resume_seq'::regclass);
 @   ALTER TABLE public.resumes ALTER COLUMN id_resume DROP DEFAULT;
       public               postgres    false    229    230    230            S           2604    16488    schedules id_schedule    DEFAULT     ~   ALTER TABLE ONLY public.schedules ALTER COLUMN id_schedule SET DEFAULT nextval('public.schedules_id_schedule_seq'::regclass);
 D   ALTER TABLE public.schedules ALTER COLUMN id_schedule DROP DEFAULT;
       public               postgres    false    221    222    222            T           2604    16505    study_materials id_material    DEFAULT     �   ALTER TABLE ONLY public.study_materials ALTER COLUMN id_material SET DEFAULT nextval('public.study_materials_id_material_seq'::regclass);
 J   ALTER TABLE public.study_materials ALTER COLUMN id_material DROP DEFAULT;
       public               postgres    false    224    223    224            [           2604    16596    survey_responses response_id    DEFAULT     �   ALTER TABLE ONLY public.survey_responses ALTER COLUMN response_id SET DEFAULT nextval('public.survey_responses_response_id_seq'::regclass);
 K   ALTER TABLE public.survey_responses ALTER COLUMN response_id DROP DEFAULT;
       public               postgres    false    236    235    236            Z           2604    16589    surveys id_survey    DEFAULT     v   ALTER TABLE ONLY public.surveys ALTER COLUMN id_survey SET DEFAULT nextval('public.surveys_id_survey_seq'::regclass);
 @   ALTER TABLE public.surveys ALTER COLUMN id_survey DROP DEFAULT;
       public               postgres    false    233    234    234            Q           2604    16465    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public               postgres    false    217    218    218                      0    16471    courses 
   TABLE DATA           Y   COPY public.courses (id_course, name_course, description_course, teacher_id) FROM stdin;
    public               postgres    false    220   �m                 0    16567    feedback 
   TABLE DATA           d   COPY public.feedback (id_feedback, student_id, id_course, feedback_text, feedback_date) FROM stdin;
    public               postgres    false    232   sn                 0    16521    grades 
   TABLE DATA           ^   COPY public.grades (id_grade, student_id, id_course, grade, comments, grade_date) FROM stdin;
    public               postgres    false    226    o                 0    16541    idp 
   TABLE DATA           t   COPY public.idp (id_idp, student_id, career_goals, skills_to_improve, progress, created_at, updated_at) FROM stdin;
    public               postgres    false    228   `o                 0    16555    resumes 
   TABLE DATA           P   COPY public.resumes (id_resume, student_id, resume_url, created_at) FROM stdin;
    public               postgres    false    230   !p                 0    16485 	   schedules 
   TABLE DATA           h   COPY public.schedules (id_schedule, id_course, classroom, start_time, end_time, teacher_id) FROM stdin;
    public               postgres    false    222   �p                 0    16502    study_materials 
   TABLE DATA           {   COPY public.study_materials (id_material, id_course, material_type, title, file_url, uploaded_by, upload_date) FROM stdin;
    public               postgres    false    224   �p       #          0    16593    survey_responses 
   TABLE DATA           ]   COPY public.survey_responses (response_id, id_survey, student_id, response_text) FROM stdin;
    public               postgres    false    236   ~q       !          0    16586    surveys 
   TABLE DATA           O   COPY public.surveys (id_survey, name_survey, start_date, end_date) FROM stdin;
    public               postgres    false    234   r                 0    16462    users 
   TABLE DATA           s   COPY public.users (id_user, surname_user, name_user, email_user, password_user, name_role, phone_user) FROM stdin;
    public               postgres    false    218   Xr       4           0    0    courses_id_course_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.courses_id_course_seq', 2, true);
          public               postgres    false    219            5           0    0    feedback_id_feedback_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.feedback_id_feedback_seq', 2, true);
          public               postgres    false    231            6           0    0    grades_id_grade_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.grades_id_grade_seq', 2, true);
          public               postgres    false    225            7           0    0    idp_id_idp_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.idp_id_idp_seq', 2, true);
          public               postgres    false    227            8           0    0    resumes_id_resume_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.resumes_id_resume_seq', 2, true);
          public               postgres    false    229            9           0    0    schedules_id_schedule_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.schedules_id_schedule_seq', 2, true);
          public               postgres    false    221            :           0    0    study_materials_id_material_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.study_materials_id_material_seq', 2, true);
          public               postgres    false    223            ;           0    0     survey_responses_response_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.survey_responses_response_id_seq', 2, true);
          public               postgres    false    235            <           0    0    surveys_id_survey_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.surveys_id_survey_seq', 1, true);
          public               postgres    false    233            =           0    0    users_id_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_id_user_seq', 4, true);
          public               postgres    false    217            a           2606    16478    courses courses_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id_course);
 >   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
       public                 postgres    false    220            m           2606    16574    feedback feedback_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id_feedback);
 @   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_pkey;
       public                 postgres    false    232            g           2606    16529    grades grades_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id_grade);
 <   ALTER TABLE ONLY public.grades DROP CONSTRAINT grades_pkey;
       public                 postgres    false    226            i           2606    16548    idp idp_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.idp
    ADD CONSTRAINT idp_pkey PRIMARY KEY (id_idp);
 6   ALTER TABLE ONLY public.idp DROP CONSTRAINT idp_pkey;
       public                 postgres    false    228            k           2606    16560    resumes resumes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.resumes
    ADD CONSTRAINT resumes_pkey PRIMARY KEY (id_resume);
 >   ALTER TABLE ONLY public.resumes DROP CONSTRAINT resumes_pkey;
       public                 postgres    false    230            c           2606    16490    schedules schedules_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id_schedule);
 B   ALTER TABLE ONLY public.schedules DROP CONSTRAINT schedules_pkey;
       public                 postgres    false    222            e           2606    16509 $   study_materials study_materials_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.study_materials
    ADD CONSTRAINT study_materials_pkey PRIMARY KEY (id_material);
 N   ALTER TABLE ONLY public.study_materials DROP CONSTRAINT study_materials_pkey;
       public                 postgres    false    224            q           2606    16600 &   survey_responses survey_responses_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.survey_responses
    ADD CONSTRAINT survey_responses_pkey PRIMARY KEY (response_id);
 P   ALTER TABLE ONLY public.survey_responses DROP CONSTRAINT survey_responses_pkey;
       public                 postgres    false    236            o           2606    16591    surveys surveys_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.surveys
    ADD CONSTRAINT surveys_pkey PRIMARY KEY (id_survey);
 >   ALTER TABLE ONLY public.surveys DROP CONSTRAINT surveys_pkey;
       public                 postgres    false    234            ]           2606    16469    users users_email_user_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_user_key UNIQUE (email_user);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_user_key;
       public                 postgres    false    218            _           2606    16467    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            r           2606    16479    courses courses_teacher_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.users(id_user);
 I   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_teacher_id_fkey;
       public               postgres    false    218    4703    220            {           2606    16580     feedback feedback_id_course_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_id_course_fkey FOREIGN KEY (id_course) REFERENCES public.courses(id_course);
 J   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_id_course_fkey;
       public               postgres    false    4705    232    220            |           2606    16575 !   feedback feedback_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.users(id_user);
 K   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_student_id_fkey;
       public               postgres    false    4703    232    218            w           2606    16535    grades grades_id_course_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_id_course_fkey FOREIGN KEY (id_course) REFERENCES public.courses(id_course);
 F   ALTER TABLE ONLY public.grades DROP CONSTRAINT grades_id_course_fkey;
       public               postgres    false    4705    220    226            x           2606    16530    grades grades_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.users(id_user);
 G   ALTER TABLE ONLY public.grades DROP CONSTRAINT grades_student_id_fkey;
       public               postgres    false    4703    218    226            y           2606    16549    idp idp_student_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.idp
    ADD CONSTRAINT idp_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.users(id_user);
 A   ALTER TABLE ONLY public.idp DROP CONSTRAINT idp_student_id_fkey;
       public               postgres    false    4703    228    218            z           2606    16561    resumes resumes_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resumes
    ADD CONSTRAINT resumes_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.users(id_user);
 I   ALTER TABLE ONLY public.resumes DROP CONSTRAINT resumes_student_id_fkey;
       public               postgres    false    4703    218    230            s           2606    16491 "   schedules schedules_id_course_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_id_course_fkey FOREIGN KEY (id_course) REFERENCES public.courses(id_course);
 L   ALTER TABLE ONLY public.schedules DROP CONSTRAINT schedules_id_course_fkey;
       public               postgres    false    4705    220    222            t           2606    16496 #   schedules schedules_teacher_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.users(id_user);
 M   ALTER TABLE ONLY public.schedules DROP CONSTRAINT schedules_teacher_id_fkey;
       public               postgres    false    218    4703    222            u           2606    16510 .   study_materials study_materials_id_course_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_materials
    ADD CONSTRAINT study_materials_id_course_fkey FOREIGN KEY (id_course) REFERENCES public.courses(id_course);
 X   ALTER TABLE ONLY public.study_materials DROP CONSTRAINT study_materials_id_course_fkey;
       public               postgres    false    4705    220    224            v           2606    16515 0   study_materials study_materials_uploaded_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_materials
    ADD CONSTRAINT study_materials_uploaded_by_fkey FOREIGN KEY (uploaded_by) REFERENCES public.users(id_user);
 Z   ALTER TABLE ONLY public.study_materials DROP CONSTRAINT study_materials_uploaded_by_fkey;
       public               postgres    false    218    4703    224            }           2606    16601 0   survey_responses survey_responses_id_survey_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.survey_responses
    ADD CONSTRAINT survey_responses_id_survey_fkey FOREIGN KEY (id_survey) REFERENCES public.surveys(id_survey);
 Z   ALTER TABLE ONLY public.survey_responses DROP CONSTRAINT survey_responses_id_survey_fkey;
       public               postgres    false    234    4719    236            ~           2606    16606 1   survey_responses survey_responses_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.survey_responses
    ADD CONSTRAINT survey_responses_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.users(id_user);
 [   ALTER TABLE ONLY public.survey_responses DROP CONSTRAINT survey_responses_student_id_fkey;
       public               postgres    false    236    4703    218                  x�U�M
1�uz��`��� ��ngm�)��$�����p���{;8�ӝ�1�͹\ĵ�����a��ĖgA���v�C��X�ٗj[�nat������K���T����Y1�W����0!�~5�         }   x�M�1� F�N��'0�x/`i�IV��*����P�W����2��j�¤O�@�T@C�(sޙ�±w��prn�ӺD�=�\�#�����"47nl��^�+"�r����w�[k�'�,�         P   x�3�4BSN�������lN##S]C]CC+�2�AK#N׊�Ԝ�Լ��Ԣ����ļ�T�K��=... %?         �   x�m�;�0�9=� (�T6#F��h������.H�ߖ�9�̆�-*^1���!����bN��$7���!8)��9)�R#˳��	�)��@�x��usg��������e�7~"d��B�қ:�I̮��X�F�<�uwg	���l9�}�E����g�`9.���>r�OQ         X   x�3�4��())(���O�H�-�I�K����,K��/�/J-.�M�+HI�4202�50�54U0��20 ".#N#��RK�p�6C����� *!%�         D   x�3�4����U040�4202�50�50T0��20 "d1C#��1��DPE�1mfP1�=... �c         �   x�m̽
�0@���)�ms�u�&tqvJLbhrKr>���E8��A@���5{8%��Vˁ�d��as5�����5����̾����ipV/�;�J���
[��S[B���cH&Ù2�4��<R<����b������$����U�@�      #   z   x�-�A
�0D��)� ho�^\�IG�I�I���_�Y�7�0Z.OBJ�zTn�{��[�����Ќڂ��8�`&�iyq�n2�4\���{O���Ob-jҢ��+�w7��v�/�      !   @   x�3�t�/-*NUpKMMIJL�V.-*K��4202�50"+0��*[�ZW� ��         �   x���?�0G��R\˟MG�b����K$%� �酊�a�彻�%p�tg� ��x�m�pT�z���&I	�wRe"/�S����
���"����$F�km����F<���(��6���c�̱�_��=vKD$��"D� u�Y�     