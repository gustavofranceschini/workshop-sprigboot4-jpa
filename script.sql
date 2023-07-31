
--
-- Name: tb_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_category (
    id bigint NOT NULL,
    name character varying(255)
);


--
-- Name: tb_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tb_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tb_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tb_category_id_seq OWNED BY public.tb_category.id;


--
-- Name: tb_oder; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_oder (
    id bigint NOT NULL,
    moment timestamp(6) with time zone,
    order_status integer,
    client_id bigint
);


--
-- Name: tb_oder_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tb_oder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tb_oder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tb_oder_id_seq OWNED BY public.tb_oder.id;


--
-- Name: tb_order_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_order_item (
    price double precision,
    quantity integer,
    order_id bigint NOT NULL,
    product_id integer NOT NULL
);


--
-- Name: tb_payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_payment (
    moment timestamp(6) with time zone,
    order_id bigint NOT NULL
);


--
-- Name: tb_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_product (
    id integer NOT NULL,
    description character varying(255),
    img_url character varying(255),
    name character varying(255),
    price double precision
);


--
-- Name: tb_product_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_product_category (
    product_id integer NOT NULL,
    category_id bigint NOT NULL
);


--
-- Name: tb_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tb_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tb_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tb_product_id_seq OWNED BY public.tb_product.id;


--
-- Name: tb_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_user (
    id bigint NOT NULL,
    email character varying(255),
    name character varying(255),
    password character varying(255),
    phone character varying(255)
);


--
-- Name: tb_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tb_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tb_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tb_user_id_seq OWNED BY public.tb_user.id;


--
-- Name: tb_category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_category ALTER COLUMN id SET DEFAULT nextval('public.tb_category_id_seq'::regclass);


--
-- Name: tb_oder id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_oder ALTER COLUMN id SET DEFAULT nextval('public.tb_oder_id_seq'::regclass);


--
-- Name: tb_product id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product ALTER COLUMN id SET DEFAULT nextval('public.tb_product_id_seq'::regclass);


--
-- Name: tb_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_user ALTER COLUMN id SET DEFAULT nextval('public.tb_user_id_seq'::regclass);


--
-- Name: tb_category tb_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_category
    ADD CONSTRAINT tb_category_pkey PRIMARY KEY (id);


--
-- Name: tb_oder tb_oder_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_oder
    ADD CONSTRAINT tb_oder_pkey PRIMARY KEY (id);


--
-- Name: tb_order_item tb_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT tb_order_item_pkey PRIMARY KEY (order_id, product_id);


--
-- Name: tb_payment tb_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT tb_payment_pkey PRIMARY KEY (order_id);


--
-- Name: tb_product_category tb_product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product_category
    ADD CONSTRAINT tb_product_category_pkey PRIMARY KEY (product_id, category_id);


--
-- Name: tb_product tb_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product
    ADD CONSTRAINT tb_product_pkey PRIMARY KEY (id);


--
-- Name: tb_user tb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (id);


--
-- Name: tb_order_item fk3ich0k8qtg6a11y37p4kdjmhr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT fk3ich0k8qtg6a11y37p4kdjmhr FOREIGN KEY (order_id) REFERENCES public.tb_oder(id);


--
-- Name: tb_order_item fk4h5xid5qehset7qwe5l9c997x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT fk4h5xid5qehset7qwe5l9c997x FOREIGN KEY (product_id) REFERENCES public.tb_product(id);


--
-- Name: tb_product_category fk5r4sbavb4nkd9xpl0f095qs2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product_category
    ADD CONSTRAINT fk5r4sbavb4nkd9xpl0f095qs2a FOREIGN KEY (category_id) REFERENCES public.tb_category(id);


--
-- Name: tb_payment fk60coacbeky1e899q39h0tfbk6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT fk60coacbeky1e899q39h0tfbk6 FOREIGN KEY (order_id) REFERENCES public.tb_oder(id);


--
-- Name: tb_product_category fkgbof0jclmaf8wn2alsoexxq3u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product_category
    ADD CONSTRAINT fkgbof0jclmaf8wn2alsoexxq3u FOREIGN KEY (product_id) REFERENCES public.tb_product(id);


--
-- Name: tb_oder fkjpp3376wsjg300py1je5uy2l9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_oder
    ADD CONSTRAINT fkjpp3376wsjg300py1je5uy2l9 FOREIGN KEY (client_id) REFERENCES public.tb_user(id);


--
-- PostgreSQL database dump complete
--

