PGDMP  /    	                 }         
   carsharing    16.8    16.8 �    f           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            g           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            h           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            i           1262    20403 
   carsharing    DATABASE     m   CREATE DATABASE carsharing WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru';
    DROP DATABASE carsharing;
                postgres    false            �            1259    21817    booking    TABLE     �   CREATE TABLE public.booking (
    id_booking integer NOT NULL,
    guest_id integer,
    car_id integer,
    check_in date NOT NULL,
    check_out date NOT NULL,
    paid boolean
);
    DROP TABLE public.booking;
       public         heap    postgres    false            �            1259    21816    booking_id_booking_seq    SEQUENCE     �   CREATE SEQUENCE public.booking_id_booking_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.booking_id_booking_seq;
       public          postgres    false    226            j           0    0    booking_id_booking_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.booking_id_booking_seq OWNED BY public.booking.id_booking;
          public          postgres    false    225            �            1259    21794    car    TABLE     �   CREATE TABLE public.car (
    id_car integer NOT NULL,
    category integer,
    brand character varying NOT NULL,
    number character varying NOT NULL,
    mileage character varying NOT NULL,
    status character varying NOT NULL
);
    DROP TABLE public.car;
       public         heap    postgres    false            �            1259    21793    car_id_car_seq    SEQUENCE     �   CREATE SEQUENCE public.car_id_car_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.car_id_car_seq;
       public          postgres    false    222            k           0    0    car_id_car_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.car_id_car_seq OWNED BY public.car.id_car;
          public          postgres    false    221            �            1259    21785    car_type    TABLE     m   CREATE TABLE public.car_type (
    id_type integer NOT NULL,
    type_category character varying NOT NULL
);
    DROP TABLE public.car_type;
       public         heap    postgres    false            �            1259    21784    car_type_id_type_seq    SEQUENCE     �   CREATE SEQUENCE public.car_type_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.car_type_id_type_seq;
       public          postgres    false    220            l           0    0    car_type_id_type_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.car_type_id_type_seq OWNED BY public.car_type.id_type;
          public          postgres    false    219            �            1259    21879    damage_report    TABLE     �   CREATE TABLE public.damage_report (
    id_report integer NOT NULL,
    car_id integer,
    user_id integer,
    report_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    description text
);
 !   DROP TABLE public.damage_report;
       public         heap    postgres    false            �            1259    21878    damage_report_id_report_seq    SEQUENCE     �   CREATE SEQUENCE public.damage_report_id_report_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.damage_report_id_report_seq;
       public          postgres    false    234            m           0    0    damage_report_id_report_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.damage_report_id_report_seq OWNED BY public.damage_report.id_report;
          public          postgres    false    233            �            1259    21941    discount    TABLE     �   CREATE TABLE public.discount (
    id_discount integer NOT NULL,
    code character varying NOT NULL,
    amount numeric(5,2)
);
    DROP TABLE public.discount;
       public         heap    postgres    false            �            1259    21940    discount_id_discount_seq    SEQUENCE     �   CREATE SEQUENCE public.discount_id_discount_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.discount_id_discount_seq;
       public          postgres    false    242            n           0    0    discount_id_discount_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.discount_id_discount_seq OWNED BY public.discount.id_discount;
          public          postgres    false    241            �            1259    21899    feedback    TABLE     j   CREATE TABLE public.feedback (
    id_feedback integer NOT NULL,
    user_id integer,
    message text
);
    DROP TABLE public.feedback;
       public         heap    postgres    false            �            1259    21898    feedback_id_feedback_seq    SEQUENCE     �   CREATE SEQUENCE public.feedback_id_feedback_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.feedback_id_feedback_seq;
       public          postgres    false    236            o           0    0    feedback_id_feedback_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.feedback_id_feedback_seq OWNED BY public.feedback.id_feedback;
          public          postgres    false    235            �            1259    21808    guest    TABLE     *  CREATE TABLE public.guest (
    id_guest integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    secondname character varying NOT NULL,
    passport character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL
);
    DROP TABLE public.guest;
       public         heap    postgres    false            �            1259    21807    guest_id_guest_seq    SEQUENCE     �   CREATE SEQUENCE public.guest_id_guest_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.guest_id_guest_seq;
       public          postgres    false    224            p           0    0    guest_id_guest_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.guest_id_guest_seq OWNED BY public.guest.id_guest;
          public          postgres    false    223            �            1259    21913    location_log    TABLE     �   CREATE TABLE public.location_log (
    id_log integer NOT NULL,
    car_id integer,
    log_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    latitude numeric(9,6),
    longitude numeric(9,6)
);
     DROP TABLE public.location_log;
       public         heap    postgres    false            �            1259    21912    location_log_id_log_seq    SEQUENCE     �   CREATE SEQUENCE public.location_log_id_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.location_log_id_log_seq;
       public          postgres    false    238            q           0    0    location_log_id_log_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.location_log_id_log_seq OWNED BY public.location_log.id_log;
          public          postgres    false    237            �            1259    21967    loyalty_program    TABLE     �   CREATE TABLE public.loyalty_program (
    id_loyalty integer NOT NULL,
    user_id integer,
    points integer DEFAULT 0,
    tier character varying
);
 #   DROP TABLE public.loyalty_program;
       public         heap    postgres    false            �            1259    21966    loyalty_program_id_loyalty_seq    SEQUENCE     �   CREATE SEQUENCE public.loyalty_program_id_loyalty_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.loyalty_program_id_loyalty_seq;
       public          postgres    false    246            r           0    0    loyalty_program_id_loyalty_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.loyalty_program_id_loyalty_seq OWNED BY public.loyalty_program.id_loyalty;
          public          postgres    false    245            �            1259    21851    maintenance    TABLE     �   CREATE TABLE public.maintenance (
    id_maintenance integer NOT NULL,
    car_id integer,
    description text,
    scheduled_date date
);
    DROP TABLE public.maintenance;
       public         heap    postgres    false            �            1259    21850    maintenance_id_maintenance_seq    SEQUENCE     �   CREATE SEQUENCE public.maintenance_id_maintenance_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.maintenance_id_maintenance_seq;
       public          postgres    false    230            s           0    0    maintenance_id_maintenance_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.maintenance_id_maintenance_seq OWNED BY public.maintenance.id_maintenance;
          public          postgres    false    229            �            1259    21926    notifications    TABLE     �   CREATE TABLE public.notifications (
    id_notification integer NOT NULL,
    user_id integer,
    message text,
    read boolean DEFAULT false
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false            �            1259    21925 !   notifications_id_notification_seq    SEQUENCE     �   CREATE SEQUENCE public.notifications_id_notification_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.notifications_id_notification_seq;
       public          postgres    false    240            t           0    0 !   notifications_id_notification_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.notifications_id_notification_seq OWNED BY public.notifications.id_notification;
          public          postgres    false    239            �            1259    21865    payment    TABLE     �   CREATE TABLE public.payment (
    id_payment integer NOT NULL,
    rental_id integer,
    amount numeric(10,2) NOT NULL,
    payment_date date NOT NULL,
    method character varying
);
    DROP TABLE public.payment;
       public         heap    postgres    false            �            1259    21864    payment_id_payment_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_id_payment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_id_payment_seq;
       public          postgres    false    232            u           0    0    payment_id_payment_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_id_payment_seq OWNED BY public.payment.id_payment;
          public          postgres    false    231            �            1259    21834    rental    TABLE     �   CREATE TABLE public.rental (
    id_rental integer NOT NULL,
    user_id integer,
    car_id integer,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone,
    cost numeric(10,2)
);
    DROP TABLE public.rental;
       public         heap    postgres    false            �            1259    21950    rental_discount    TABLE     q   CREATE TABLE public.rental_discount (
    id integer NOT NULL,
    rental_id integer,
    discount_id integer
);
 #   DROP TABLE public.rental_discount;
       public         heap    postgres    false            �            1259    21949    rental_discount_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rental_discount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.rental_discount_id_seq;
       public          postgres    false    244            v           0    0    rental_discount_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.rental_discount_id_seq OWNED BY public.rental_discount.id;
          public          postgres    false    243            �            1259    21833    rental_id_rental_seq    SEQUENCE     �   CREATE SEQUENCE public.rental_id_rental_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.rental_id_rental_seq;
       public          postgres    false    228            w           0    0    rental_id_rental_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.rental_id_rental_seq OWNED BY public.rental.id_rental;
          public          postgres    false    227            �            1259    21762    role    TABLE     a   CREATE TABLE public.role (
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
       public          postgres    false    216            x           0    0    role_id_role_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.role_id_role_seq OWNED BY public.role.id_role;
          public          postgres    false    215            �            1259    21982    user_activity    TABLE     �   CREATE TABLE public.user_activity (
    id_activity integer NOT NULL,
    user_id integer,
    action text,
    action_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.user_activity;
       public         heap    postgres    false            �            1259    21981    user_activity_id_activity_seq    SEQUENCE     �   CREATE SEQUENCE public.user_activity_id_activity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.user_activity_id_activity_seq;
       public          postgres    false    248            y           0    0    user_activity_id_activity_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.user_activity_id_activity_seq OWNED BY public.user_activity.id_activity;
          public          postgres    false    247            �            1259    21771    users    TABLE     d  CREATE TABLE public.users (
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
       public          postgres    false    218            z           0    0    users_id_users_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.users_id_users_seq OWNED BY public.users.id_users;
          public          postgres    false    217            o           2604    21820    booking id_booking    DEFAULT     x   ALTER TABLE ONLY public.booking ALTER COLUMN id_booking SET DEFAULT nextval('public.booking_id_booking_seq'::regclass);
 A   ALTER TABLE public.booking ALTER COLUMN id_booking DROP DEFAULT;
       public          postgres    false    226    225    226            m           2604    21797 
   car id_car    DEFAULT     h   ALTER TABLE ONLY public.car ALTER COLUMN id_car SET DEFAULT nextval('public.car_id_car_seq'::regclass);
 9   ALTER TABLE public.car ALTER COLUMN id_car DROP DEFAULT;
       public          postgres    false    221    222    222            l           2604    21788    car_type id_type    DEFAULT     t   ALTER TABLE ONLY public.car_type ALTER COLUMN id_type SET DEFAULT nextval('public.car_type_id_type_seq'::regclass);
 ?   ALTER TABLE public.car_type ALTER COLUMN id_type DROP DEFAULT;
       public          postgres    false    220    219    220            s           2604    21882    damage_report id_report    DEFAULT     �   ALTER TABLE ONLY public.damage_report ALTER COLUMN id_report SET DEFAULT nextval('public.damage_report_id_report_seq'::regclass);
 F   ALTER TABLE public.damage_report ALTER COLUMN id_report DROP DEFAULT;
       public          postgres    false    233    234    234            z           2604    21944    discount id_discount    DEFAULT     |   ALTER TABLE ONLY public.discount ALTER COLUMN id_discount SET DEFAULT nextval('public.discount_id_discount_seq'::regclass);
 C   ALTER TABLE public.discount ALTER COLUMN id_discount DROP DEFAULT;
       public          postgres    false    241    242    242            u           2604    21902    feedback id_feedback    DEFAULT     |   ALTER TABLE ONLY public.feedback ALTER COLUMN id_feedback SET DEFAULT nextval('public.feedback_id_feedback_seq'::regclass);
 C   ALTER TABLE public.feedback ALTER COLUMN id_feedback DROP DEFAULT;
       public          postgres    false    236    235    236            n           2604    21811    guest id_guest    DEFAULT     p   ALTER TABLE ONLY public.guest ALTER COLUMN id_guest SET DEFAULT nextval('public.guest_id_guest_seq'::regclass);
 =   ALTER TABLE public.guest ALTER COLUMN id_guest DROP DEFAULT;
       public          postgres    false    224    223    224            v           2604    21916    location_log id_log    DEFAULT     z   ALTER TABLE ONLY public.location_log ALTER COLUMN id_log SET DEFAULT nextval('public.location_log_id_log_seq'::regclass);
 B   ALTER TABLE public.location_log ALTER COLUMN id_log DROP DEFAULT;
       public          postgres    false    237    238    238            |           2604    21970    loyalty_program id_loyalty    DEFAULT     �   ALTER TABLE ONLY public.loyalty_program ALTER COLUMN id_loyalty SET DEFAULT nextval('public.loyalty_program_id_loyalty_seq'::regclass);
 I   ALTER TABLE public.loyalty_program ALTER COLUMN id_loyalty DROP DEFAULT;
       public          postgres    false    246    245    246            q           2604    21854    maintenance id_maintenance    DEFAULT     �   ALTER TABLE ONLY public.maintenance ALTER COLUMN id_maintenance SET DEFAULT nextval('public.maintenance_id_maintenance_seq'::regclass);
 I   ALTER TABLE public.maintenance ALTER COLUMN id_maintenance DROP DEFAULT;
       public          postgres    false    229    230    230            x           2604    21929    notifications id_notification    DEFAULT     �   ALTER TABLE ONLY public.notifications ALTER COLUMN id_notification SET DEFAULT nextval('public.notifications_id_notification_seq'::regclass);
 L   ALTER TABLE public.notifications ALTER COLUMN id_notification DROP DEFAULT;
       public          postgres    false    240    239    240            r           2604    21868    payment id_payment    DEFAULT     x   ALTER TABLE ONLY public.payment ALTER COLUMN id_payment SET DEFAULT nextval('public.payment_id_payment_seq'::regclass);
 A   ALTER TABLE public.payment ALTER COLUMN id_payment DROP DEFAULT;
       public          postgres    false    232    231    232            p           2604    21837    rental id_rental    DEFAULT     t   ALTER TABLE ONLY public.rental ALTER COLUMN id_rental SET DEFAULT nextval('public.rental_id_rental_seq'::regclass);
 ?   ALTER TABLE public.rental ALTER COLUMN id_rental DROP DEFAULT;
       public          postgres    false    227    228    228            {           2604    21953    rental_discount id    DEFAULT     x   ALTER TABLE ONLY public.rental_discount ALTER COLUMN id SET DEFAULT nextval('public.rental_discount_id_seq'::regclass);
 A   ALTER TABLE public.rental_discount ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244            j           2604    21765    role id_role    DEFAULT     l   ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_role_seq'::regclass);
 ;   ALTER TABLE public.role ALTER COLUMN id_role DROP DEFAULT;
       public          postgres    false    216    215    216            ~           2604    21985    user_activity id_activity    DEFAULT     �   ALTER TABLE ONLY public.user_activity ALTER COLUMN id_activity SET DEFAULT nextval('public.user_activity_id_activity_seq'::regclass);
 H   ALTER TABLE public.user_activity ALTER COLUMN id_activity DROP DEFAULT;
       public          postgres    false    248    247    248            k           2604    21774    users id_users    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN id_users SET DEFAULT nextval('public.users_id_users_seq'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN id_users DROP DEFAULT;
       public          postgres    false    217    218    218            M          0    21817    booking 
   TABLE DATA           Z   COPY public.booking (id_booking, guest_id, car_id, check_in, check_out, paid) FROM stdin;
    public          postgres    false    226   ��       I          0    21794    car 
   TABLE DATA           O   COPY public.car (id_car, category, brand, number, mileage, status) FROM stdin;
    public          postgres    false    222   �       G          0    21785    car_type 
   TABLE DATA           :   COPY public.car_type (id_type, type_category) FROM stdin;
    public          postgres    false    220   @�       U          0    21879    damage_report 
   TABLE DATA           ]   COPY public.damage_report (id_report, car_id, user_id, report_date, description) FROM stdin;
    public          postgres    false    234   ��       ]          0    21941    discount 
   TABLE DATA           =   COPY public.discount (id_discount, code, amount) FROM stdin;
    public          postgres    false    242   �       W          0    21899    feedback 
   TABLE DATA           A   COPY public.feedback (id_feedback, user_id, message) FROM stdin;
    public          postgres    false    236   ;�       K          0    21808    guest 
   TABLE DATA           \   COPY public.guest (id_guest, name, surname, secondname, passport, phone, email) FROM stdin;
    public          postgres    false    224   ��       Y          0    21913    location_log 
   TABLE DATA           U   COPY public.location_log (id_log, car_id, log_time, latitude, longitude) FROM stdin;
    public          postgres    false    238   �       a          0    21967    loyalty_program 
   TABLE DATA           L   COPY public.loyalty_program (id_loyalty, user_id, points, tier) FROM stdin;
    public          postgres    false    246   5�       Q          0    21851    maintenance 
   TABLE DATA           Z   COPY public.maintenance (id_maintenance, car_id, description, scheduled_date) FROM stdin;
    public          postgres    false    230   _�       [          0    21926    notifications 
   TABLE DATA           P   COPY public.notifications (id_notification, user_id, message, read) FROM stdin;
    public          postgres    false    240   ��       S          0    21865    payment 
   TABLE DATA           V   COPY public.payment (id_payment, rental_id, amount, payment_date, method) FROM stdin;
    public          postgres    false    232   ��       O          0    21834    rental 
   TABLE DATA           X   COPY public.rental (id_rental, user_id, car_id, start_time, end_time, cost) FROM stdin;
    public          postgres    false    228   6�       _          0    21950    rental_discount 
   TABLE DATA           E   COPY public.rental_discount (id, rental_id, discount_id) FROM stdin;
    public          postgres    false    244   t�       C          0    21762    role 
   TABLE DATA           .   COPY public.role (id_role, roles) FROM stdin;
    public          postgres    false    216   ��       c          0    21982    user_activity 
   TABLE DATA           R   COPY public.user_activity (id_activity, user_id, action, action_time) FROM stdin;
    public          postgres    false    248   �       E          0    21771    users 
   TABLE DATA           |   COPY public.users (id_users, name, surname, sname, role2, login, password, count, active, date, is_first_login) FROM stdin;
    public          postgres    false    218   F�       {           0    0    booking_id_booking_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.booking_id_booking_seq', 1, false);
          public          postgres    false    225            |           0    0    car_id_car_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.car_id_car_seq', 1, false);
          public          postgres    false    221            }           0    0    car_type_id_type_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.car_type_id_type_seq', 1, false);
          public          postgres    false    219            ~           0    0    damage_report_id_report_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.damage_report_id_report_seq', 1, true);
          public          postgres    false    233                       0    0    discount_id_discount_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.discount_id_discount_seq', 1, true);
          public          postgres    false    241            �           0    0    feedback_id_feedback_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.feedback_id_feedback_seq', 1, true);
          public          postgres    false    235            �           0    0    guest_id_guest_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.guest_id_guest_seq', 1, false);
          public          postgres    false    223            �           0    0    location_log_id_log_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.location_log_id_log_seq', 1, true);
          public          postgres    false    237            �           0    0    loyalty_program_id_loyalty_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.loyalty_program_id_loyalty_seq', 1, true);
          public          postgres    false    245            �           0    0    maintenance_id_maintenance_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.maintenance_id_maintenance_seq', 1, true);
          public          postgres    false    229            �           0    0 !   notifications_id_notification_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.notifications_id_notification_seq', 1, true);
          public          postgres    false    239            �           0    0    payment_id_payment_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.payment_id_payment_seq', 1, true);
          public          postgres    false    231            �           0    0    rental_discount_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.rental_discount_id_seq', 1, true);
          public          postgres    false    243            �           0    0    rental_id_rental_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.rental_id_rental_seq', 1, true);
          public          postgres    false    227            �           0    0    role_id_role_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.role_id_role_seq', 1, false);
          public          postgres    false    215            �           0    0    user_activity_id_activity_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.user_activity_id_activity_seq', 1, true);
          public          postgres    false    247            �           0    0    users_id_users_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_id_users_seq', 1, false);
          public          postgres    false    217            �           2606    21822    booking booking_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id_booking);
 >   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_pkey;
       public            postgres    false    226            �           2606    21801    car car_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (id_car);
 6   ALTER TABLE ONLY public.car DROP CONSTRAINT car_pkey;
       public            postgres    false    222            �           2606    21792    car_type car_type_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.car_type
    ADD CONSTRAINT car_type_pkey PRIMARY KEY (id_type);
 @   ALTER TABLE ONLY public.car_type DROP CONSTRAINT car_type_pkey;
       public            postgres    false    220            �           2606    21887     damage_report damage_report_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.damage_report
    ADD CONSTRAINT damage_report_pkey PRIMARY KEY (id_report);
 J   ALTER TABLE ONLY public.damage_report DROP CONSTRAINT damage_report_pkey;
       public            postgres    false    234            �           2606    21948    discount discount_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_pkey PRIMARY KEY (id_discount);
 @   ALTER TABLE ONLY public.discount DROP CONSTRAINT discount_pkey;
       public            postgres    false    242            �           2606    21906    feedback feedback_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id_feedback);
 @   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_pkey;
       public            postgres    false    236            �           2606    21815    guest guest_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.guest
    ADD CONSTRAINT guest_pkey PRIMARY KEY (id_guest);
 :   ALTER TABLE ONLY public.guest DROP CONSTRAINT guest_pkey;
       public            postgres    false    224            �           2606    21919    location_log location_log_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.location_log
    ADD CONSTRAINT location_log_pkey PRIMARY KEY (id_log);
 H   ALTER TABLE ONLY public.location_log DROP CONSTRAINT location_log_pkey;
       public            postgres    false    238            �           2606    21975 $   loyalty_program loyalty_program_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.loyalty_program
    ADD CONSTRAINT loyalty_program_pkey PRIMARY KEY (id_loyalty);
 N   ALTER TABLE ONLY public.loyalty_program DROP CONSTRAINT loyalty_program_pkey;
       public            postgres    false    246            �           2606    21858    maintenance maintenance_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.maintenance
    ADD CONSTRAINT maintenance_pkey PRIMARY KEY (id_maintenance);
 F   ALTER TABLE ONLY public.maintenance DROP CONSTRAINT maintenance_pkey;
       public            postgres    false    230            �           2606    21934     notifications notifications_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id_notification);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    240            �           2606    21872    payment payment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id_payment);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    232            �           2606    21955 $   rental_discount rental_discount_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.rental_discount
    ADD CONSTRAINT rental_discount_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.rental_discount DROP CONSTRAINT rental_discount_pkey;
       public            postgres    false    244            �           2606    21839    rental rental_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_pkey PRIMARY KEY (id_rental);
 <   ALTER TABLE ONLY public.rental DROP CONSTRAINT rental_pkey;
       public            postgres    false    228            �           2606    21769    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    216            �           2606    21990     user_activity user_activity_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_pkey PRIMARY KEY (id_activity);
 J   ALTER TABLE ONLY public.user_activity DROP CONSTRAINT user_activity_pkey;
       public            postgres    false    248            �           2606    21778    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_users);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            �           2606    21828    booking booking_car_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(id_car);
 E   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_car_id_fkey;
       public          postgres    false    4743    226    222            �           2606    21823    booking booking_guest_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES public.guest(id_guest);
 G   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_guest_id_fkey;
       public          postgres    false    4745    224    226            �           2606    21802    car car_category_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_category_fkey FOREIGN KEY (category) REFERENCES public.car_type(id_type);
 ?   ALTER TABLE ONLY public.car DROP CONSTRAINT car_category_fkey;
       public          postgres    false    222    220    4741            �           2606    21888 '   damage_report damage_report_car_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.damage_report
    ADD CONSTRAINT damage_report_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(id_car);
 Q   ALTER TABLE ONLY public.damage_report DROP CONSTRAINT damage_report_car_id_fkey;
       public          postgres    false    4743    234    222            �           2606    21893 (   damage_report damage_report_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.damage_report
    ADD CONSTRAINT damage_report_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 R   ALTER TABLE ONLY public.damage_report DROP CONSTRAINT damage_report_user_id_fkey;
       public          postgres    false    218    234    4739            �           2606    21907    feedback feedback_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 H   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_user_id_fkey;
       public          postgres    false    4739    236    218            �           2606    21920 %   location_log location_log_car_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.location_log
    ADD CONSTRAINT location_log_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(id_car);
 O   ALTER TABLE ONLY public.location_log DROP CONSTRAINT location_log_car_id_fkey;
       public          postgres    false    238    4743    222            �           2606    21976 ,   loyalty_program loyalty_program_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.loyalty_program
    ADD CONSTRAINT loyalty_program_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 V   ALTER TABLE ONLY public.loyalty_program DROP CONSTRAINT loyalty_program_user_id_fkey;
       public          postgres    false    246    4739    218            �           2606    21859 #   maintenance maintenance_car_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maintenance
    ADD CONSTRAINT maintenance_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(id_car);
 M   ALTER TABLE ONLY public.maintenance DROP CONSTRAINT maintenance_car_id_fkey;
       public          postgres    false    230    4743    222            �           2606    21935 (   notifications notifications_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 R   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_user_id_fkey;
       public          postgres    false    240    4739    218            �           2606    21873    payment payment_rental_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_rental_id_fkey FOREIGN KEY (rental_id) REFERENCES public.rental(id_rental);
 H   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_rental_id_fkey;
       public          postgres    false    228    4749    232            �           2606    21845    rental rental_car_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(id_car);
 C   ALTER TABLE ONLY public.rental DROP CONSTRAINT rental_car_id_fkey;
       public          postgres    false    228    4743    222            �           2606    21961 0   rental_discount rental_discount_discount_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rental_discount
    ADD CONSTRAINT rental_discount_discount_id_fkey FOREIGN KEY (discount_id) REFERENCES public.discount(id_discount);
 Z   ALTER TABLE ONLY public.rental_discount DROP CONSTRAINT rental_discount_discount_id_fkey;
       public          postgres    false    4763    244    242            �           2606    21956 .   rental_discount rental_discount_rental_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rental_discount
    ADD CONSTRAINT rental_discount_rental_id_fkey FOREIGN KEY (rental_id) REFERENCES public.rental(id_rental);
 X   ALTER TABLE ONLY public.rental_discount DROP CONSTRAINT rental_discount_rental_id_fkey;
       public          postgres    false    228    244    4749            �           2606    21840    rental rental_user_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 D   ALTER TABLE ONLY public.rental DROP CONSTRAINT rental_user_id_fkey;
       public          postgres    false    4739    228    218            �           2606    21991 (   user_activity user_activity_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id_users);
 R   ALTER TABLE ONLY public.user_activity DROP CONSTRAINT user_activity_user_id_fkey;
       public          postgres    false    4739    248    218            �           2606    21779    users users_role2_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role2_fkey FOREIGN KEY (role2) REFERENCES public.role(id_role);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role2_fkey;
       public          postgres    false    4737    218    216            M   (   x�3�4A#S]S]#Cdf	��1YcN<�1z\\\ ���      I   >  x����n�@�ϛ�� �3��X�	� q�b�%����N�5�p�� ��\J�g�}#f�VJq���;�|�� ����&;/ˢ�o��"���1�2���8ÄT�>�,|�p��yO�F��
۰6�)���$���b�=��_�8�
���*mu���62�Ö�ʶ<�A���"qaR�ƺC�t0[�DX�YrA*�xB~���E���=K����\�~�]�E�ib�$�q���\'g�A\ĹK�I�rxw���&�(\�'(���v�+��<!�[�&k ���q��tpJ�	�EI�앯>�����<�ds	THZ�nNkg�1
�L���T5VXGy����`�8@�*a��Z��N$�:.l�C!g��0;#��'�St�ÿ�3�.˪����Q=�$��%�)e{��@���;"aW~:��$��:��$���]3�(,@')�d�g�Cow4���.,�m�zX��({��OԨ�[^�ejTӸt�����F�!j����h�b���~��ͯ�*gqN�J�8Oŕ���Y��E��B&�a���><��zt5�      G   f   x���	�@E��U14���
.Y%��,�E���(���dƇ؉,L��&fN����dքN6v�OUjX[PKT��������4��x%�f/o��)�=      U   J   x�3�4B##S]S]##+0⼰�.6(\ؤpa�}v)\�pa��& so������\1z\\\ �� >      ]      x�3�LN,*��44�30������ /�      W   5   x�3�4�0�bӅ�v\l���b���
6\��wao��$����� ���      K   b   x�E�=
�0�9�J��ġ�<�K �.���6�Z��y�@�)5��$'�0⶜��ji�q�O��/�O�+o!����x:À>YU���ֈ���-#      Y   3   x�3�4�4202�50�52R00�#NS#=c# �D�������+F��� �9@      a      x�3�4�440�L��I�����  zg      Q   ?   x�3�4�0��/6 �Mv]ؠ b\l���� �xaǅ��9��LuLu���b���� ��       [   9   x�3�4�0�bÅ6]��qa녽@�V���v]���w��bӅ�%\1z\\\ ���      S   /   x�3�4�440�30�4202�50�52�0���.l������ ��R      O   .   x�3�4B##S]S]##+ B3���p��qqq 3	�      _      x�3�4�4����� �X      C   [   x���	�@ ��b�n,F/31�Oį�َ\�yR�g����Ƃ�,x��L��.�';�Q.����B�|�Ƃ������:<�JT��y:�      c   4   x�3�4�0�®�Mv\�ta녽�FF��&�FF
&V@����� �Z,      E   ^   x�m�K
� �ϻ�$Q��t�ϺE��ߢ�(�l�quW*L,O�'M�!�&J��Գ����_�k�I������q�Di7��!���)�     