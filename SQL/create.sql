--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cuscuz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuscuz (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text NOT NULL,
    ingredientes text NOT NULL,
    preco numeric(10,2) NOT NULL,
    imagem_url text NOT NULL,
    avaliacao_estrela numeric(3,2),
    CONSTRAINT cuscuz_avaliacao_estrela_check CHECK (((avaliacao_estrela >= (0)::numeric) AND (avaliacao_estrela <= (5)::numeric)))
);


ALTER TABLE public.cuscuz OWNER TO postgres;

--
-- Name: cuscuz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuscuz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cuscuz_id_seq OWNER TO postgres;

--
-- Name: cuscuz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuscuz_id_seq OWNED BY public.cuscuz.id;


--
-- Name: filings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filings (
    id integer NOT NULL,
    idfood integer NOT NULL,
    name character varying,
    price real
);


ALTER TABLE public.filings OWNER TO postgres;

--
-- Name: foods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foods (
    id integer NOT NULL,
    name character varying,
    price real
);


ALTER TABLE public.foods OWNER TO postgres;

--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    id integer NOT NULL,
    datesale timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    description character varying(255) NOT NULL,
    idfood integer NOT NULL,
    price numeric(10,2) NOT NULL,
    cpf character varying(14) NOT NULL
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_id_seq OWNER TO postgres;

--
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;


--
-- Name: sanduiches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sanduiches (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text NOT NULL,
    ingredientes text NOT NULL,
    preco numeric(10,2) NOT NULL,
    imagem_url text NOT NULL,
    avaliacao_estrela numeric(3,2),
    CONSTRAINT sanduiches_avaliacao_estrela_check CHECK (((avaliacao_estrela >= (0)::numeric) AND (avaliacao_estrela <= (5)::numeric)))
);


ALTER TABLE public.sanduiches OWNER TO postgres;

--
-- Name: sanduiches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sanduiches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sanduiches_id_seq OWNER TO postgres;

--
-- Name: sanduiches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sanduiches_id_seq OWNED BY public.sanduiches.id;


--
-- Name: tapiocas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tapiocas (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text,
    ingredientes text NOT NULL,
    preco numeric(10,2) NOT NULL,
    imagem_url text,
    avaliacao_estrela numeric(2,1) DEFAULT 0,
    CONSTRAINT tapiocas_avaliacao_estrela_check CHECK (((avaliacao_estrela >= (0)::numeric) AND (avaliacao_estrela <= (5)::numeric)))
);


ALTER TABLE public.tapiocas OWNER TO postgres;

--
-- Name: tapiocas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tapiocas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tapiocas_id_seq OWNER TO postgres;

--
-- Name: tapiocas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tapiocas_id_seq OWNED BY public.tapiocas.id;


--
-- Name: cuscuz id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuscuz ALTER COLUMN id SET DEFAULT nextval('public.cuscuz_id_seq'::regclass);


--
-- Name: sales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);


--
-- Name: sanduiches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanduiches ALTER COLUMN id SET DEFAULT nextval('public.sanduiches_id_seq'::regclass);


--
-- Name: tapiocas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tapiocas ALTER COLUMN id SET DEFAULT nextval('public.tapiocas_id_seq'::regclass);


--
-- Data for Name: cuscuz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuscuz (id, nome, descricao, ingredientes, preco, imagem_url, avaliacao_estrela) FROM stdin;
1	Cuscuz Personalizado	Monte o cuscuz do seu jeito com os recheios que preferir	Flocos de milho, escolha do cliente	6.00	https://comidinhasdochef.com/wp-content/uploads/2019/12/Cuscuz-Nordestino.jpg	5.00
2	Cuscuz com Ovo	Cuscuz simples servido com ovo frito ou cozido	Flocos de milho, ovos	7.00	https://www.deline.com.br/assets/images/recipes/cuscuz-com-ovo-e-queijo-coalho/mobile/thumb-video.jpg?v3	4.60
3	Cuscuz com Frango	Cuscuz com frango desfiado temperado e cebola	Flocos de milho, frango desfiado, cebola, temperos	10.00	https://www.deline.com.br/assets/images/recipes/cuscuz-recheado-de-frango/mobile/thumb-video.jpg?v3	4.80
4	Cuscuz com Linguiça	Cuscuz com pedaços de linguiça defumada e queijo	Flocos de milho, linguiça, queijo	11.00	https://www.delicia.com.br/wp-content/uploads/fly-images/1976/media1101farofa-cuscuz-1366x500.jpg	4.70
5	Cuscuz Doce	Cuscuz com coco ralado e leite condensado	Flocos de milho, coco ralado, leite condensado	8.50	https://static.itdg.com.br/images/360-240/af93e11f32dadc225f0d045d8243edd7/cuscuz-de-tapioca-.jpg	4.90
6	Cuscuz com Bacon	Cuscuz com pedaços crocantes de bacon e ovos	Flocos de milho, bacon, ovos	12.00	https://www.receitasagora.com.br/wp-content/uploads/2021/08/receita-de-farofa-de-cuscuz-com-bacon-430x305.jpg	4.80
7	Cuscuz com Carne Moída	Cuscuz servido com carne moída temperada e legumes	Flocos de milho, carne moída, legumes	13.00	https://i.ytimg.com/vi/mPyV3xa1tIo/maxresdefault.jpg	4.70
8	Cuscuz Especial	Cuscuz gourmet com carne de sol, queijo e banana da terra	Flocos de milho, carne de sol, queijo coalho, banana da terra	15.00	https://static.itdg.com.br/images/640-440/ca6b9efad13f99473fafd85c7d23b10f/67457-original.jpg	5.00
\.


--
-- Data for Name: filings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filings (id, idfood, name, price) FROM stdin;
\.


--
-- Data for Name: foods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foods (id, name, price) FROM stdin;
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (id, datesale, description, idfood, price, cpf) FROM stdin;
\.


--
-- Data for Name: sanduiches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sanduiches (id, nome, descricao, ingredientes, preco, imagem_url, avaliacao_estrela) FROM stdin;
1	Sanduíche Personalizável	Monte o sanduíche do seu jeito com os recheios que preferir	Pão, escolha do cliente	8.00	https://www.portalumami.com.br/app/uploads/2021/10/Sanduiche-de-rosbife03crop-2.jpg	5.00
3	Sanduíche de Carne	Sanduíche com carne grelhada e queijo cheddar	Pão, carne grelhada, queijo cheddar, alface, tomate	15.00	https://assets.unileversolutions.com/recipes-v2/106782.jpg	4.70
4	Sanduíche Vegetariano	Sanduíche com legumes grelhados e queijo fresco	Pão, berinjela, abobrinha, queijo fresco, alface, tomate	10.50	https://api.comidadodia.com/wp-content/uploads/2014/03/sanduiche-vegetariano.jpg	4.60
7	Sanduíche de Ovo	Sanduíche simples com ovos mexidos e temperos	Pão, ovos mexidos, manteiga, temperos	9.00	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1TJnJnTkUOSbS1u9rbXr7vTanOxjFs5dL0w&s	4.70
8	Sanduíche Especial	Sanduíche gourmet com carne, queijo brie e rúcula	Pão, carne premium, queijo brie, rúcula, molho especial	18.00	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfjd9wOmoZ-85wTwVNxFA5JIiEROJ5JfUQ2g&s	5.00
2	Sanduíche de Frango	Sanduíche com frango desfiado e molho especial	Pão, frango desfiado, molho especial, alface, tomate	12.00	https://i.ytimg.com/vi/Whyz9z_3-Zk/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AH-CYAC0AWKAgwIABABGHIgWygzMA8=&rs=AOn4CLCGFEIVS1aCiLR4IbDTRTTdiZE9eA	4.80
5	Sanduíche de Atum	Sanduíche com pasta de atum temperada	Pão, atum, maionese, alface	11.00	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkskgMT-iB4S9gbt4qaBPp1S9ZXfiwZz7D1g&s	4.90
6	Sanduíche de Bacon	Sanduíche com bacon crocante e molho barbecue	Pão, bacon, molho barbecue, queijo cheddar, cebola roxa	13.00	https://f.i.uol.com.br/folha/comida/images/11329500.jpeg	4.80
\.


--
-- Data for Name: tapiocas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tapiocas (id, nome, descricao, ingredientes, preco, imagem_url, avaliacao_estrela) FROM stdin;
3	Tapioca de Coco com Leite Condensado	Tapioca doce com sabor tropical de coco e um toque de leite condensado.	Polvilho, coco ralado, leite condensado	10.00	https://tudodereceitas.com.br/wp-content/uploads/2022/07/Tapioca-com-leite-condensado-e-coco.jpg	4.6
4	Tapioca Vegana de Legumes	Opção saudável com legumes frescos e temperos especiais.	Polvilho, cenoura ralada, abobrinha, azeite de oliva, temperos	12.00	https://i.pinimg.com/736x/25/3b/1d/253b1dad76ac72a35306d1a5d2428fa2.jpg	4.7
5	Tapioca de Chocolate com Morango	Sobremesa perfeita com chocolate derretido e pedaços de morango.	Polvilho, chocolate ao leite, morangos frescos	14.50	https://xamegobom.com.br/wp-content/uploads/2017/02/tapioca-de-chocolate-com-morango-2.jpg	4.9
6	Tapioca de Calabresa com Catupiry	Sabor marcante de calabresa combinado com a cremosidade do catupiry.	Polvilho, calabresa, catupiry, cebola caramelizada	13.50	https://claudia.abril.com.br/wp-content/uploads/2020/02/receita-tapioca-com-linguica.jpg	4.7
1	Tapioca Personalizada	Monte sua tapioca escolhendo os recheios preferidos.	Polvilho	1.50	https://cdn.casapraticaqualita.com.br/wp-content/uploads/sites/2/2017/03/shutterstock_2203479243.jpg	4.9
2	Tapioca de Carne Seca com Queijo	Uma combinação irresistível de carne seca e queijo coalho.	Polvilho, carne seca, queijo coalho	15.00	https://claudia.abril.com.br/wp-content/uploads/2020/02/receita-tapioca-carne-de-sol.jpg	4.8
\.


--
-- Name: cuscuz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuscuz_id_seq', 8, true);


--
-- Name: sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_id_seq', 1, false);


--
-- Name: sanduiches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sanduiches_id_seq', 8, true);


--
-- Name: tapiocas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tapiocas_id_seq', 6, true);


--
-- Name: cuscuz cuscuz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuscuz
    ADD CONSTRAINT cuscuz_pkey PRIMARY KEY (id);


--
-- Name: filings filings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filings
    ADD CONSTRAINT filings_pkey PRIMARY KEY (id, idfood);


--
-- Name: foods foods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foods_pkey PRIMARY KEY (id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: sanduiches sanduiches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sanduiches
    ADD CONSTRAINT sanduiches_pkey PRIMARY KEY (id);


--
-- Name: tapiocas tapiocas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tapiocas
    ADD CONSTRAINT tapiocas_pkey PRIMARY KEY (id);


--
-- Name: filings filings_idfood_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filings
    ADD CONSTRAINT filings_idfood_fkey FOREIGN KEY (idfood) REFERENCES public.foods(id);


--
-- PostgreSQL database dump complete
--

