PGDMP      "                }         
   carsharing    16.8    16.8 z    K           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            L           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            M           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            N           1262    20403 
   carsharing    DATABASE     m   CREATE DATABASE carsharing WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru';
    DROP DATABASE carsharing;
                postgres    false            �            1259    22336    address_type    TABLE     p   CREATE TABLE public.address_type (
    id_type integer NOT NULL,
    type_address character varying NOT NULL
);
     DROP TABLE public.address_type;
       public         heap    postgres    false            �            1259    22335    address_type_id_type_seq    SEQUENCE     �   CREATE SEQUENCE public.address_type_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.address_type_id_type_seq;
       public          postgres    false    220            O           0    0    address_type_id_type_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.address_type_id_type_seq OWNED BY public.address_type.id_type;
          public          postgres    false    219            �            1259    22437    apartment_rental    TABLE     �   CREATE TABLE public.apartment_rental (
    id_rental integer NOT NULL,
    user_id integer,
    apartment_number integer NOT NULL,
    building_id integer,
    rent_cost numeric(10,2)
);
 $   DROP TABLE public.apartment_rental;
       public         heap    postgres    false            �            1259    22436    apartment_rental_id_rental_seq    SEQUENCE     �   CREATE SEQUENCE public.apartment_rental_id_rental_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.apartment_rental_id_rental_seq;
       public          postgres    false    230            P           0    0    apartment_rental_id_rental_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.apartment_rental_id_rental_seq OWNED BY public.apartment_rental.id_rental;
          public          postgres    false    229            �            1259    22393    booking    TABLE     �   CREATE TABLE public.booking (
    id_booking integer NOT NULL,
    guest_id integer,
    service_id integer,
    check_in date NOT NULL,
    paid boolean
);
    DROP TABLE public.booking;
       public         heap    postgres    false            �            1259    22392    booking_id_booking_seq    SEQUENCE     �   CREATE SEQUENCE public.booking_id_booking_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.booking_id_booking_seq;
       public          postgres    false    226            Q           0    0    booking_id_booking_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.booking_id_booking_seq OWNED BY public.booking.id_booking;
          public          postgres    false    225            �            1259    22371    building    TABLE     �   CREATE TABLE public.building (
    id_building integer NOT NULL,
    address integer,
    house_number integer,
    management_start date,
    floors integer,
    apartments integer,
    construction_year integer,
    total_area numeric(10,2)
);
    DROP TABLE public.building;
       public         heap    postgres    false            �            1259    22370    building_id_building_seq    SEQUENCE     �   CREATE SEQUENCE public.building_id_building_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.building_id_building_seq;
       public          postgres    false    222            R           0    0    building_id_building_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.building_id_building_seq OWNED BY public.building.id_building;
          public          postgres    false    221            �            1259    22513    building_log    TABLE     �   CREATE TABLE public.building_log (
    id_log integer NOT NULL,
    building_id integer,
    log_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    description text
);
     DROP TABLE public.building_log;
       public         heap    postgres    false            �            1259    22512    building_log_id_log_seq    SEQUENCE     �   CREATE SEQUENCE public.building_log_id_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.building_log_id_log_seq;
       public          postgres    false    240            S           0    0    building_log_id_log_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.building_log_id_log_seq OWNED BY public.building_log.id_log;
          public          postgres    false    239            �            1259    22454    building_maintenance    TABLE     �   CREATE TABLE public.building_maintenance (
    id_maintenance integer NOT NULL,
    building_id integer,
    description text
);
 (   DROP TABLE public.building_maintenance;
       public         heap    postgres    false            �            1259    22453 '   building_maintenance_id_maintenance_seq    SEQUENCE     �   CREATE SEQUENCE public.building_maintenance_id_maintenance_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.building_maintenance_id_maintenance_seq;
       public          postgres    false    232            T           0    0 '   building_maintenance_id_maintenance_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.building_maintenance_id_maintenance_seq OWNED BY public.building_maintenance.id_maintenance;
          public          postgres    false    231            �            1259    22410    guest    TABLE     ,  CREATE TABLE public.guest (
    id_guest integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    secondname character varying NOT NULL,
    passport character varying NOT NULL,
    phone character varying NOT NULL,
    address character varying NOT NULL
);
    DROP TABLE public.guest;
       public         heap    postgres    false            �            1259    22409    guest_id_guest_seq    SEQUENCE     �   CREATE SEQUENCE public.guest_id_guest_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.guest_id_guest_seq;
       public          postgres    false    228            U           0    0    guest_id_guest_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.guest_id_guest_seq OWNED BY public.guest.id_guest;
          public          postgres    false    227            �            1259    22480    housing_damage_report    TABLE     �   CREATE TABLE public.housing_damage_report (
    id_report integer NOT NULL,
    building_id integer,
    user_id integer,
    description text
);
 )   DROP TABLE public.housing_damage_report;
       public         heap    postgres    false            �            1259    22479 #   housing_damage_report_id_report_seq    SEQUENCE     �   CREATE SEQUENCE public.housing_damage_report_id_report_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.housing_damage_report_id_report_seq;
       public          postgres    false    236            V           0    0 #   housing_damage_report_id_report_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.housing_damage_report_id_report_seq OWNED BY public.housing_damage_report.id_report;
          public          postgres    false    235            �            1259    22468    rent_payment    TABLE     �   CREATE TABLE public.rent_payment (
    id_payment integer NOT NULL,
    rental_id integer,
    amount numeric(10,2) NOT NULL,
    payment_date date NOT NULL
);
     DROP TABLE public.rent_payment;
       public         heap    postgres    false            �            1259    22467    rent_payment_id_payment_seq    SEQUENCE     �   CREATE SEQUENCE public.rent_payment_id_payment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.rent_payment_id_payment_seq;
       public          postgres    false    234            W           0    0    rent_payment_id_payment_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.rent_payment_id_payment_seq OWNED BY public.rent_payment.id_payment;
          public          postgres    false    233            �            1259    22499    resident_feedback    TABLE     s   CREATE TABLE public.resident_feedback (
    id_feedback integer NOT NULL,
    user_id integer,
    message text
);
 %   DROP TABLE public.resident_feedback;
       public         heap    postgres    false            �            1259    22498 !   resident_feedback_id_feedback_seq    SEQUENCE     �   CREATE SEQUENCE public.resident_feedback_id_feedback_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.resident_feedback_id_feedback_seq;
       public          postgres    false    238            X           0    0 !   resident_feedback_id_feedback_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.resident_feedback_id_feedback_seq OWNED BY public.resident_feedback.id_feedback;
          public          postgres    false    237            �            1259    22542    resident_loyalty_program    TABLE     �   CREATE TABLE public.resident_loyalty_program (
    id_loyalty integer NOT NULL,
    user_id integer,
    points integer DEFAULT 0,
    tier character varying
);
 ,   DROP TABLE public.resident_loyalty_program;
       public         heap    postgres    false            �            1259    22541 '   resident_loyalty_program_id_loyalty_seq    SEQUENCE     �   CREATE SEQUENCE public.resident_loyalty_program_id_loyalty_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.resident_loyalty_program_id_loyalty_seq;
       public          postgres    false    244            Y           0    0 '   resident_loyalty_program_id_loyalty_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.resident_loyalty_program_id_loyalty_seq OWNED BY public.resident_loyalty_program.id_loyalty;
          public          postgres    false    243            �            1259    22528    resident_notifications    TABLE     |   CREATE TABLE public.resident_notifications (
    id_notification integer NOT NULL,
    user_id integer,
    message text
);
 *   DROP TABLE public.resident_notifications;
       public         heap    postgres    false            �            1259    22527 *   resident_notifications_id_notification_seq    SEQUENCE     �   CREATE SEQUENCE public.resident_notifications_id_notification_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.resident_notifications_id_notification_seq;
       public          postgres    false    242            Z           0    0 *   resident_notifications_id_notification_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.resident_notifications_id_notification_seq OWNED BY public.resident_notifications.id_notification;
          public          postgres    false    241            �            1259    21762    role    TABLE     a   CREATE TABLE public.role (
    id_role integer NOT NULL,
    roles character varying NOT NULL
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    21761    role_id_role_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.role_id_role_seq;
       public          postgres    false    216            [           0    0    role_id_role_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.role_id_role_seq OWNED BY public.role.id_role;
          public          postgres    false    215            �            1259    22383    services    TABLE     �   CREATE TABLE public.services (
    id_service integer NOT NULL,
    type_service character varying,
    status character varying
);
    DROP TABLE public.services;
       public         heap    postgres    false            �            1259    22382    services_id_service_seq    SEQUENCE     �   CREATE SEQUENCE public.services_id_service_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.services_id_service_seq;
       public          postgres    false    224            \           0    0    services_id_service_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.services_id_service_seq OWNED BY public.services.id_service;
          public          postgres    false    223            �            1259    21771    users    TABLE     d  CREATE TABLE public.users (
    id_users integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    sname character varying NOT NULL,
    role2 integer,
    login character varying NOT NULL,
    password character varying NOT NULL,
    count integer,
    active boolean,
    date date,
    is_first_login boolean
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    21770    users_id_users_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_users_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.users_id_users_seq;
       public          postgres    false    218            ]           0    0    users_id_users_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.users_id_users_seq OWNED BY public.users.id_users;
          public          postgres    false    217            b           2604    22339    address_type id_type    DEFAULT     |   ALTER TABLE ONLY public.address_type ALTER COLUMN id_type SET DEFAULT nextval('public.address_type_id_type_seq'::regclass);
 C   ALTER TABLE public.address_type ALTER COLUMN id_type DROP DEFAULT;
       public          postgres    false    219    220    220            g           2604    22440    apartment_rental id_rental    DEFAULT     �   ALTER TABLE ONLY public.apartment_rental ALTER COLUMN id_rental SET DEFAULT nextval('public.apartment_rental_id_rental_seq'::regclass);
 I   ALTER TABLE public.apartment_rental ALTER COLUMN id_rental DROP DEFAULT;
       public          postgres    false    229    230    230            e           2604    22396    booking id_booking    DEFAULT     x   ALTER TABLE ONLY public.booking ALTER COLUMN id_booking SET DEFAULT nextval('public.booking_id_booking_seq'::regclass);
 A   ALTER TABLE public.booking ALTER COLUMN id_booking DROP DEFAULT;
       public          postgres    false    226    225    226            c           2604    22374    building id_building    DEFAULT     |   ALTER TABLE ONLY public.building ALTER COLUMN id_building SET DEFAULT nextval('public.building_id_building_seq'::regclass);
 C   ALTER TABLE public.building ALTER COLUMN id_building DROP DEFAULT;
       public          postgres    false    221    222    222            l           2604    22516    building_log id_log    DEFAULT     z   ALTER TABLE ONLY public.building_log ALTER COLUMN id_log SET DEFAULT nextval('public.building_log_id_log_seq'::regclass);
 B   ALTER TABLE public.building_log ALTER COLUMN id_log DROP DEFAULT;
       public          postgres    false    240    239    240            h           2604    22457 #   building_maintenance id_maintenance    DEFAULT     �   ALTER TABLE ONLY public.building_maintenance ALTER COLUMN id_maintenance SET DEFAULT nextval('public.building_maintenance_id_maintenance_seq'::regclass);
 R   ALTER TABLE public.building_maintenance ALTER COLUMN id_maintenance DROP DEFAULT;
       public          postgres    false    232    231    232            f           2604    22413    guest id_guest    DEFAULT     p   ALTER TABLE ONLY public.guest ALTER COLUMN id_guest SET DEFAULT nextval('public.guest_id_guest_seq'::regclass);
 =   ALTER TABLE public.guest ALTER COLUMN id_guest DROP DEFAULT;
       public          postgres    false    228    227    228            j           2604    22483    housing_damage_report id_report    DEFAULT     �   ALTER TABLE ONLY public.housing_damage_report ALTER COLUMN id_report SET DEFAULT nextval('public.housing_damage_report_id_report_seq'::regclass);
 N   ALTER TABLE public.housing_damage_report ALTER COLUMN id_report DROP DEFAULT;
       public          postgres    false    236    235    236            i           2604    22471    rent_payment id_payment    DEFAULT     �   ALTER TABLE ONLY public.rent_payment ALTER COLUMN id_payment SET DEFAULT nextval('public.rent_payment_id_payment_seq'::regclass);
 F   ALTER TABLE public.rent_payment ALTER COLUMN id_payment DROP DEFAULT;
       public          postgres    false    233    234    234            k           2604    22502    resident_feedback id_feedback    DEFAULT     �   ALTER TABLE ONLY public.resident_feedback ALTER COLUMN id_feedback SET DEFAULT nextval('public.resident_feedback_id_feedback_seq'::regclass);
 L   ALTER TABLE public.resident_feedback ALTER COLUMN id_feedback DROP DEFAULT;
       public          postgres    false    238    237    238            o           2604    22545 #   resident_loyalty_program id_loyalty    DEFAULT     �   ALTER TABLE ONLY public.resident_loyalty_program ALTER COLUMN id_loyalty SET DEFAULT nextval('public.resident_loyalty_program_id_loyalty_seq'::regclass);
 R   ALTER TABLE public.resident_loyalty_program ALTER COLUMN id_loyalty DROP DEFAULT;
       public          postgres    false    243    244    244            n           2604    22531 &   resident_notifications id_notification    DEFAULT     �   ALTER TABLE ONLY public.resident_notifications ALTER COLUMN id_notification SET DEFAULT nextval('public.resident_notifications_id_notification_seq'::regclass);
 U   ALTER TABLE public.resident_notifications ALTER COLUMN id_notification DROP DEFAULT;
       public          postgres    false    241    242    242            `           2604    21765    role id_role    DEFAULT     l   ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_role_seq'::regclass);
 ;   ALTER TABLE public.role ALTER COLUMN id_role DROP DEFAULT;
       public          postgres    false    215    216    216            d           2604    22386    services id_service    DEFAULT     z   ALTER TABLE ONLY public.services ALTER COLUMN id_service SET DEFAULT nextval('public.services_id_service_seq'::regclass);
 B   ALTER TABLE public.services ALTER COLUMN id_service DROP DEFAULT;
       public          postgres    false    223    224    224            a           2604    21774    users id_users    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN id_users SET DEFAULT nextval('public.users_id_users_seq'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN id_users DROP DEFAULT;
       public          postgres    false    217    218    218            0          0    22336    address_type 
   TABLE DATA           =   COPY public.address_type (id_type, type_address) FROM stdin;
    public          postgres    false    220   ٖ       :          0    22437    apartment_rental 
   TABLE DATA           h   COPY public.apartment_rental (id_rental, user_id, apartment_number, building_id, rent_cost) FROM stdin;
    public          postgres    false    230   ��       6          0    22393    booking 
   TABLE DATA           S   COPY public.booking (id_booking, guest_id, service_id, check_in, paid) FROM stdin;
    public          postgres    false    226   �       2          0    22371    building 
   TABLE DATA           �   COPY public.building (id_building, address, house_number, management_start, floors, apartments, construction_year, total_area) FROM stdin;
    public          postgres    false    222   �       D          0    22513    building_log 
   TABLE DATA           R   COPY public.building_log (id_log, building_id, log_time, description) FROM stdin;
    public          postgres    false    240   {�       <          0    22454    building_maintenance 
   TABLE DATA           X   COPY public.building_maintenance (id_maintenance, building_id, description) FROM stdin;
    public          postgres    false    232   ə       8          0    22410    guest 
   TABLE DATA           ^   COPY public.guest (id_guest, name, surname, secondname, passport, phone, address) FROM stdin;
    public          postgres    false    228   ��       @          0    22480    housing_damage_report 
   TABLE DATA           ]   COPY public.housing_damage_report (id_report, building_id, user_id, description) FROM stdin;
    public          postgres    false    236   k�       >          0    22468    rent_payment 
   TABLE DATA           S   COPY public.rent_payment (id_payment, rental_id, amount, payment_date) FROM stdin;
    public          postgres    false    234   ��       B          0    22499    resident_feedback 
   TABLE DATA           J   COPY public.resident_feedback (id_feedback, user_id, message) FROM stdin;
    public          postgres    false    238   ՚       H          0    22542    resident_loyalty_program 
   TABLE DATA           U   COPY public.resident_loyalty_program (id_loyalty, user_id, points, tier) FROM stdin;
    public          postgres    false    244   �       F          0    22528    resident_notifications 
   TABLE DATA           S   COPY public.resident_notifications (id_notification, user_id, message) FROM stdin;
    public          postgres    false    242   ;�       ,          0    21762    role 
   TABLE DATA           .   COPY public.role (id_role, roles) FROM stdin;
    public          postgres    false    216   w�       4          0    22383    services 
   TABLE DATA           D   COPY public.services (id_service, type_service, status) FROM stdin;
    public          postgres    false    224   Û       .          0    21771    users 
   TABLE DATA           |   COPY public.users (id_users, name, surname, sname, role2, login, password, count, active, date, is_first_login) FROM stdin;
    public          postgres    false    218   ,�       ^           0    0    address_type_id_type_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.address_type_id_type_seq', 10, true);
          public          postgres    false    219            _           0    0    apartment_rental_id_rental_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.apartment_rental_id_rental_seq', 1, true);
          public          postgres    false    229            `           0    0    booking_id_booking_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.booking_id_booking_seq', 1, true);
          public          postgres    false    225            a           0    0    building_id_building_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.building_id_building_seq', 21, true);
          public          postgres    false    221            b           0    0    building_log_id_log_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.building_log_id_log_seq', 1, true);
          public          postgres    false    239            c           0    0 '   building_maintenance_id_maintenance_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.building_maintenance_id_maintenance_seq', 1, true);
          public          postgres    false    231            d           0    0    guest_id_guest_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.guest_id_guest_seq', 1, true);
          public          postgres    false    227            e           0    0 #   housing_damage_report_id_report_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.housing_damage_report_id_report_seq', 1, true);
          public          postgres    false    235            f           0    0    rent_payment_id_payment_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.rent_payment_id_payment_seq', 1, true);
          public          postgres    false    233            g           0    0 !   resident_feedback_id_feedback_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.resident_feedback_id_feedback_seq', 1, true);
          public          postgres    false    237            h           0    0 '   resident_loyalty_program_id_loyalty_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.resident_loyalty_program_id_loyalty_seq', 1, true);
          public          postgres    false    243            i           0    0 *   resident_notifications_id_notification_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.resident_notifications_id_notification_seq', 1, true);
          public          postgres    false    241            j           0    0    role_id_role_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.role_id_role_seq', 1, false);
          public          postgres    false    215            k           0    0    services_id_service_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.services_id_service_seq', 3, true);
          public          postgres    false    223            l           0    0    users_id_users_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_id_users_seq', 8, true);
          public          postgres    false    217            v           2606    22343    address_type address_type_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.address_type
    ADD CONSTRAINT address_type_pkey PRIMARY KEY (id_type);
 H   ALTER TABLE ONLY public.address_type DROP CONSTRAINT address_type_pkey;
       public            postgres    false    220            �           2606    22442 &   apartment_rental apartment_rental_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.apartment_rental
    ADD CONSTRAINT apartment_rental_pkey PRIMARY KEY (id_rental);
 P   ALTER TABLE ONLY public.apartment_rental DROP CONSTRAINT apartment_rental_pkey;
       public            postgres    false    230            |           2606    22398    booking booking_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id_booking);
 >   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_pkey;
       public            postgres    false    226            �           2606    22521    building_log building_log_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.building_log
    ADD CONSTRAINT building_log_pkey PRIMARY KEY (id_log);
 H   ALTER TABLE ONLY public.building_log DROP CONSTRAINT building_log_pkey;
       public            postgres    false    240            �           2606    22461 .   building_maintenance building_maintenance_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.building_maintenance
    ADD CONSTRAINT building_maintenance_pkey PRIMARY KEY (id_maintenance);
 X   ALTER TABLE ONLY public.building_maintenance DROP CONSTRAINT building_maintenance_pkey;
       public            postgres    false    232            x           2606    22376    building building_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_pkey PRIMARY KEY (id_building);
 @   ALTER TABLE ONLY public.building DROP CONSTRAINT building_pkey;
       public            postgres    false    222            ~           2606    22417    guest guest_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.guest
    ADD CONSTRAINT guest_pkey PRIMARY KEY (id_guest);
 :   ALTER TABLE ONLY public.guest DROP CONSTRAINT guest_pkey;
       public            postgres    false    228            �           2606    22487 0   housing_damage_report housing_damage_report_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.housing_damage_report
    ADD CONSTRAINT housing_damage_report_pkey PRIMARY KEY (id_report);
 Z   ALTER TABLE ONLY public.housing_damage_report DROP CONSTRAINT housing_damage_report_pkey;
       public            postgres    false    236            �           2606    22473    rent_payment rent_payment_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.rent_payment
    ADD CONSTRAINT rent_payment_pkey PRIMARY KEY (id_payment);
 H   ALTER TABLE ONLY public.rent_payment DROP CONSTRAINT rent_payment_pkey;
       public            postgres    false    234            �           2606    22506 (   resident_feedback resident_feedback_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.resident_feedback
    ADD CONSTRAINT resident_feedback_pkey PRIMARY KEY (id_feedback);
 R   ALTER TABLE ONLY public.resident_feedback DROP CONSTRAINT resident_feedback_pkey;
       public            postgres    false    238            �           2606    22550 6   resident_loyalty_program resident_loyalty_program_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.resident_loyalty_program
    ADD CONSTRAINT resident_loyalty_program_pkey PRIMARY KEY (id_loyalty);
 `   ALTER TABLE ONLY public.resident_loyalty_program DROP CONSTRAINT resident_loyalty_program_pkey;
       public            postgres    false    244            �           2606    22535 2   resident_notifications resident_notifications_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.resident_notifications
    ADD CONSTRAINT resident_notifications_pkey PRIMARY KEY (id_notification);
 \   ALTER TABLE ONLY public.resident_notifications DROP CONSTRAINT resident_notifications_pkey;
       public            postgres    false    242            r           2606    21769    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    216            z           2606    22390    services services_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id_service);
 @   ALTER TABLE ONLY public.services DROP CONSTRAINT services_pkey;
       public            postgres    false    224            t           2606    21778    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_users);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            �           2606    22448 2   apartment_rental apartment_rental_building_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.apartment_rental
    ADD CONSTRAINT apartment_rental_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.building(id_building);
 \   ALTER TABLE ONLY public.apartment_rental DROP CONSTRAINT apartment_rental_building_id_fkey;
       public          postgres    false    222    230    4728            �           2606    22443 .   apartment_rental apartment_rental_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.apartment_rental
    ADD CONSTRAINT apartment_rental_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 X   ALTER TABLE ONLY public.apartment_rental DROP CONSTRAINT apartment_rental_user_id_fkey;
       public          postgres    false    230    4724    218            �           2606    22404    booking booking_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id_service);
 I   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_service_id_fkey;
       public          postgres    false    4730    224    226            �           2606    22377    building building_address_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_address_fkey FOREIGN KEY (address) REFERENCES public.address_type(id_type);
 H   ALTER TABLE ONLY public.building DROP CONSTRAINT building_address_fkey;
       public          postgres    false    4726    220    222            �           2606    22522 *   building_log building_log_building_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.building_log
    ADD CONSTRAINT building_log_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.building(id_building);
 T   ALTER TABLE ONLY public.building_log DROP CONSTRAINT building_log_building_id_fkey;
       public          postgres    false    4728    222    240            �           2606    22462 :   building_maintenance building_maintenance_building_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.building_maintenance
    ADD CONSTRAINT building_maintenance_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.building(id_building);
 d   ALTER TABLE ONLY public.building_maintenance DROP CONSTRAINT building_maintenance_building_id_fkey;
       public          postgres    false    4728    222    232            �           2606    22488 <   housing_damage_report housing_damage_report_building_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.housing_damage_report
    ADD CONSTRAINT housing_damage_report_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.building(id_building);
 f   ALTER TABLE ONLY public.housing_damage_report DROP CONSTRAINT housing_damage_report_building_id_fkey;
       public          postgres    false    236    4728    222            �           2606    22493 8   housing_damage_report housing_damage_report_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.housing_damage_report
    ADD CONSTRAINT housing_damage_report_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 b   ALTER TABLE ONLY public.housing_damage_report DROP CONSTRAINT housing_damage_report_user_id_fkey;
       public          postgres    false    218    236    4724            �           2606    22474 (   rent_payment rent_payment_rental_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rent_payment
    ADD CONSTRAINT rent_payment_rental_id_fkey FOREIGN KEY (rental_id) REFERENCES public.apartment_rental(id_rental);
 R   ALTER TABLE ONLY public.rent_payment DROP CONSTRAINT rent_payment_rental_id_fkey;
       public          postgres    false    230    4736    234            �           2606    22507 0   resident_feedback resident_feedback_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resident_feedback
    ADD CONSTRAINT resident_feedback_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 Z   ALTER TABLE ONLY public.resident_feedback DROP CONSTRAINT resident_feedback_user_id_fkey;
       public          postgres    false    4724    218    238            �           2606    22551 >   resident_loyalty_program resident_loyalty_program_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resident_loyalty_program
    ADD CONSTRAINT resident_loyalty_program_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 h   ALTER TABLE ONLY public.resident_loyalty_program DROP CONSTRAINT resident_loyalty_program_user_id_fkey;
       public          postgres    false    4724    244    218            �           2606    22536 :   resident_notifications resident_notifications_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resident_notifications
    ADD CONSTRAINT resident_notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 d   ALTER TABLE ONLY public.resident_notifications DROP CONSTRAINT resident_notifications_user_id_fkey;
       public          postgres    false    242    218    4724            �           2606    21779    users users_role2_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role2_fkey FOREIGN KEY (role2) REFERENCES public.role(id_role);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role2_fkey;
       public          postgres    false    216    218    4722            0   �   x�}�]
�0���S� �Xm����i-�� �O"O`����
�7r�6�C*!��mv6��	)O���2�(#�U��+��(9����PŰc�  �R� r�z���`��戗�A����M����^x�qk@�Uxf���^@W nM����{ 
z�&8i@g�����U��n�c'f�H9�5=1Ӫ������
��|�Ob;4��
�5�      :      x�3�4�4��4�440�30������ !��      6      x�3�4B##S]3]#��=... /O�      2   T  x�m�ۍ$1�o*��x��D0�Ǳ�Z���i��c�!!'e���U�E���B��F�@"����r���hN �W��k �FN&9yW�V�[!	�l�Ѕ��'Z�~V��	��=͍:(���H�ܪ�ty�J��zE%wSэ���T���Ym�,YG���1'���d?(�$Z�&r�z};:(�f��@�h�01�y��� �`�-�_�,�{�Fy�r5�h�3E�:���~��n���ۓ�{L=�a@I�56��h��Kq\A��Y���E O:��95Z}?z�O&�]s6��e(���Z76�>����{Q��f��w<��B]~�      D   >   x�3�4�4202�50�50V00�#��.6]�u��b7��qa�-6]�z����=... 6�      <   &   x�3�4估����.칰��^��.6�\1z\\\ �R      8   \   x�3�0�¦.�3.컰	�clhdljd̩mdlij`idl�y���n=�s.��pa�����������6��]�Ļ/�p��qqq Q�5[      @   '   x�3�4�/쾰�.�U���b������ r�      >   #   x�3�4�440�30�4202�50�50����� <�;      B   ,   x�! ��1	1	Отличный дом
\.


8��      H      x�3�4�440�L��O�����  �j      F   ,   x�! ��1	1	Пришла почта
\.


4;      ,   <   x�1 ��1	Администратор
2	Клиент
\.


��      4   Y   x�3⼰�{/6]�z����;.��0,���˘����/l���b����HǦ�.l�-@��\��� u��h������� �pAf      .   Q   x�3�L,O�cC(i�Y�id`d�k`�k`ę�e�Y���eؤ����ؤ9/̸��{��.lB�rb�-����� ?"1~     