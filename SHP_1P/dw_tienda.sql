--
-- PostgreSQL database dump
--

\restrict 7ppUhFRY3DvJlxcyW2fWk4l19DVf2cOuq7ed6gLhKulYMJKUiy7g9n37cojJaZL

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-06-09 03:30:01

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
-- TOC entry 220 (class 1259 OID 18392)
-- Name: dim_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_cliente (
    id_cliente integer NOT NULL,
    nombre character varying(100),
    email character varying(100),
    ciudad character varying(100),
    genero character varying(20)
);


ALTER TABLE public.dim_cliente OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18391)
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_cliente_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 219
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_cliente_id_cliente_seq OWNED BY public.dim_cliente.id_cliente;


--
-- TOC entry 222 (class 1259 OID 18400)
-- Name: dim_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_producto (
    id_producto integer NOT NULL,
    nombre_producto character varying(100),
    categoria character varying(50),
    precio_unitario numeric(10,2)
);


ALTER TABLE public.dim_producto OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18399)
-- Name: dim_producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_producto_id_producto_seq OWNER TO postgres;

--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 221
-- Name: dim_producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_producto_id_producto_seq OWNED BY public.dim_producto.id_producto;


--
-- TOC entry 226 (class 1259 OID 18416)
-- Name: dim_region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_region (
    id_region integer NOT NULL,
    ciudad character varying(100),
    estado character varying(100),
    pais character varying(50)
);


ALTER TABLE public.dim_region OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18415)
-- Name: dim_region_id_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_region_id_region_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_region_id_region_seq OWNER TO postgres;

--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 225
-- Name: dim_region_id_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_region_id_region_seq OWNED BY public.dim_region.id_region;


--
-- TOC entry 224 (class 1259 OID 18408)
-- Name: dim_tiempo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_tiempo (
    id_tiempo integer NOT NULL,
    fecha date,
    dia integer,
    mes integer,
    anio integer,
    trimestre integer,
    nombre_mes character varying(20)
);


ALTER TABLE public.dim_tiempo OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18407)
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_tiempo_id_tiempo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_tiempo_id_tiempo_seq OWNER TO postgres;

--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 223
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_tiempo_id_tiempo_seq OWNED BY public.dim_tiempo.id_tiempo;


--
-- TOC entry 228 (class 1259 OID 18424)
-- Name: fact_ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_ventas (
    id_venta integer NOT NULL,
    id_cliente integer,
    id_producto integer,
    id_tiempo integer,
    id_region integer,
    cantidad integer,
    total_venta numeric(10,2)
);


ALTER TABLE public.fact_ventas OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18423)
-- Name: fact_ventas_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_ventas_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fact_ventas_id_venta_seq OWNER TO postgres;

--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 227
-- Name: fact_ventas_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_ventas_id_venta_seq OWNED BY public.fact_ventas.id_venta;


--
-- TOC entry 4876 (class 2604 OID 18395)
-- Name: dim_cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.dim_cliente_id_cliente_seq'::regclass);


--
-- TOC entry 4877 (class 2604 OID 18403)
-- Name: dim_producto id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_producto ALTER COLUMN id_producto SET DEFAULT nextval('public.dim_producto_id_producto_seq'::regclass);


--
-- TOC entry 4879 (class 2604 OID 18419)
-- Name: dim_region id_region; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_region ALTER COLUMN id_region SET DEFAULT nextval('public.dim_region_id_region_seq'::regclass);


--
-- TOC entry 4878 (class 2604 OID 18411)
-- Name: dim_tiempo id_tiempo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tiempo ALTER COLUMN id_tiempo SET DEFAULT nextval('public.dim_tiempo_id_tiempo_seq'::regclass);


--
-- TOC entry 4880 (class 2604 OID 18427)
-- Name: fact_ventas id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.fact_ventas_id_venta_seq'::regclass);


--
-- TOC entry 5043 (class 0 OID 18392)
-- Dependencies: 220
-- Data for Name: dim_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_cliente (id_cliente, nombre, email, ciudad, genero) FROM stdin;
1	Ana	ana@gmail.com	Puebla	F
2	Luis	luis@gmail.com	Veracruz	M
3	Carlos	carlos@gmail.com	Orizaba	M
4	María	maria@gmail.com	Xalapa	F
5	Ana	ana@gmail.com	Puebla	F
6	Luis	luis@gmail.com	Veracruz	M
7	Carlos	carlos@gmail.com	Orizaba	M
8	María	maria@gmail.com	Xalapa	F
9	Ana	ana@gmail.com	Puebla	F
10	Luis	luis@gmail.com	Veracruz	M
11	Carlos	carlos@gmail.com	Orizaba	M
12	María	maria@gmail.com	Xalapa	F
13	Ana	ana@gmail.com	Puebla	F
14	Luis	luis@gmail.com	Veracruz	M
15	Carlos	carlos@gmail.com	Orizaba	M
16	María	maria@gmail.com	Xalapa	F
17	Ana	ana@gmail.com	Puebla	F
18	Luis	luis@gmail.com	Veracruz	M
19	Carlos	carlos@gmail.com	Orizaba	M
20	María	maria@gmail.com	Xalapa	F
21	Ana	ana@gmail.com	Puebla	F
22	Luis	luis@gmail.com	Veracruz	M
23	Carlos	carlos@gmail.com	Orizaba	M
24	María	maria@gmail.com	Xalapa	F
\.


--
-- TOC entry 5045 (class 0 OID 18400)
-- Dependencies: 222
-- Data for Name: dim_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_producto (id_producto, nombre_producto, categoria, precio_unitario) FROM stdin;
1	Laptop	Tecnología	15000.00
2	Mouse	Tecnología	400.00
3	Teclado	Tecnología	700.00
4	Monitor	Tecnología	4000.00
5	Laptop	Tecnología	15000.00
6	Mouse	Tecnología	400.00
7	Teclado	Tecnología	700.00
8	Monitor	Tecnología	4000.00
9	Laptop	Tecnología	15000.00
10	Mouse	Tecnología	400.00
11	Teclado	Tecnología	700.00
12	Monitor	Tecnología	4000.00
13	Laptop	Tecnología	15000.00
14	Mouse	Tecnología	400.00
15	Teclado	Tecnología	700.00
16	Monitor	Tecnología	4000.00
17	Laptop	Tecnología	15000.00
18	Mouse	Tecnología	400.00
19	Teclado	Tecnología	700.00
20	Monitor	Tecnología	4000.00
21	Laptop	Tecnología	15000.00
22	Mouse	Tecnología	400.00
23	Teclado	Tecnología	700.00
24	Monitor	Tecnología	4000.00
\.


--
-- TOC entry 5049 (class 0 OID 18416)
-- Dependencies: 226
-- Data for Name: dim_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_region (id_region, ciudad, estado, pais) FROM stdin;
1	Puebla	Puebla	México
2	Veracruz	Veracruz	México
3	Orizaba	Veracruz	México
4	Xalapa	Veracruz	México
5	Puebla	Puebla	México
6	Veracruz	Veracruz	México
7	Orizaba	Veracruz	México
8	Xalapa	Veracruz	México
9	Puebla	Puebla	México
10	Veracruz	Veracruz	México
11	Orizaba	Veracruz	México
12	Xalapa	Veracruz	México
13	Puebla	Puebla	México
14	Veracruz	Veracruz	México
15	Orizaba	Veracruz	México
16	Xalapa	Veracruz	México
17	Puebla	Puebla	México
18	Veracruz	Veracruz	México
19	Orizaba	Veracruz	México
20	Xalapa	Veracruz	México
\.


--
-- TOC entry 5047 (class 0 OID 18408)
-- Dependencies: 224
-- Data for Name: dim_tiempo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_tiempo (id_tiempo, fecha, dia, mes, anio, trimestre, nombre_mes) FROM stdin;
1	2026-06-01	1	6	2026	2	Junio
2	2026-06-02	2	6	2026	2	Junio
3	2026-06-03	3	6	2026	2	Junio
4	2026-06-04	4	6	2026	2	Junio
5	2026-06-01	1	6	2026	2	Junio
6	2026-06-02	2	6	2026	2	Junio
7	2026-06-03	3	6	2026	2	Junio
8	2026-06-04	4	6	2026	2	Junio
9	2026-06-01	1	6	2026	2	Junio
10	2026-06-02	2	6	2026	2	Junio
11	2026-06-03	3	6	2026	2	Junio
12	2026-06-04	4	6	2026	2	Junio
13	2026-06-01	1	6	2026	2	Junio
14	2026-06-02	2	6	2026	2	Junio
15	2026-06-03	3	6	2026	2	Junio
16	2026-06-04	4	6	2026	2	Junio
17	2026-06-01	1	6	2026	2	Junio
18	2026-06-02	2	6	2026	2	Junio
19	2026-06-03	3	6	2026	2	Junio
20	2026-06-04	4	6	2026	2	Junio
\.


--
-- TOC entry 5051 (class 0 OID 18424)
-- Dependencies: 228
-- Data for Name: fact_ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_ventas (id_venta, id_cliente, id_producto, id_tiempo, id_region, cantidad, total_venta) FROM stdin;
1	1	1	1	1	1	15000.00
2	2	2	2	2	2	800.00
3	3	3	3	3	1	700.00
4	4	4	4	4	1	4000.00
5	1	1	1	1	1	15000.00
6	2	2	2	2	2	800.00
7	3	3	3	3	1	700.00
8	4	4	4	4	1	4000.00
9	1	1	1	1	1	15000.00
10	2	2	2	2	2	800.00
11	3	3	3	3	1	700.00
12	4	4	4	4	1	4000.00
13	1	1	1	1	1	15000.00
14	2	2	2	2	2	800.00
15	3	3	3	3	1	700.00
16	4	4	4	4	1	4000.00
17	1	1	1	1	1	15000.00
18	2	2	2	2	2	800.00
19	3	3	3	3	1	700.00
20	4	4	4	4	1	4000.00
\.


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 219
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_cliente_id_cliente_seq', 24, true);


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 221
-- Name: dim_producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_producto_id_producto_seq', 24, true);


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 225
-- Name: dim_region_id_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_region_id_region_seq', 20, true);


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 223
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_tiempo_id_tiempo_seq', 20, true);


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 227
-- Name: fact_ventas_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_ventas_id_venta_seq', 20, true);


--
-- TOC entry 4882 (class 2606 OID 18398)
-- Name: dim_cliente dim_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente
    ADD CONSTRAINT dim_cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4884 (class 2606 OID 18406)
-- Name: dim_producto dim_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_producto
    ADD CONSTRAINT dim_producto_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 4888 (class 2606 OID 18422)
-- Name: dim_region dim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_region
    ADD CONSTRAINT dim_region_pkey PRIMARY KEY (id_region);


--
-- TOC entry 4886 (class 2606 OID 18414)
-- Name: dim_tiempo dim_tiempo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tiempo
    ADD CONSTRAINT dim_tiempo_pkey PRIMARY KEY (id_tiempo);


--
-- TOC entry 4890 (class 2606 OID 18430)
-- Name: fact_ventas fact_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_pkey PRIMARY KEY (id_venta);


--
-- TOC entry 4891 (class 2606 OID 18431)
-- Name: fact_ventas fact_ventas_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.dim_cliente(id_cliente);


--
-- TOC entry 4892 (class 2606 OID 18436)
-- Name: fact_ventas fact_ventas_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.dim_producto(id_producto);


--
-- TOC entry 4893 (class 2606 OID 18446)
-- Name: fact_ventas fact_ventas_id_region_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_id_region_fkey FOREIGN KEY (id_region) REFERENCES public.dim_region(id_region);


--
-- TOC entry 4894 (class 2606 OID 18441)
-- Name: fact_ventas fact_ventas_id_tiempo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_id_tiempo_fkey FOREIGN KEY (id_tiempo) REFERENCES public.dim_tiempo(id_tiempo);


-- Completed on 2026-06-09 03:30:01

--
-- PostgreSQL database dump complete
--

\unrestrict 7ppUhFRY3DvJlxcyW2fWk4l19DVf2cOuq7ed6gLhKulYMJKUiy7g9n37cojJaZL

