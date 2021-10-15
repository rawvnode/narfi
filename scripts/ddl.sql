-- public.cities definition

-- Drop table

-- DROP TABLE public.cities;

CREATE TABLE public.cities (
	id serial4 NOT NULL,
	year_reported int4 NOT NULL,
	account_number int4 NULL,
	organization varchar(255) NULL,
	city varchar(255) NOT NULL,
	country varchar(255) NOT NULL,
	cdp_region varchar(255) NOT NULL,
	reporting_authority varchar(255) NULL,
	"access" varchar(64) NULL,
	first_time_discloser varchar(255) NULL,
	population_year int4 NOT NULL,
	city_location point NOT NULL,
	last_update timestamp NOT NULL,
	population int8 NULL,
	CONSTRAINT cities_pkey PRIMARY KEY (id)
);

-- public.city_population definition

-- Drop table

-- DROP TABLE public.city_population;

CREATE TABLE public.city_population (
	account_number int4 NULL,
	city varchar(255) NULL,
	population int4 NULL,
	id serial4 NOT NULL
);

-- public.city_responses definition

-- Drop table

-- DROP TABLE public.city_responses;

CREATE TABLE public.city_responses (
	id serial4 NOT NULL,
	year_reported int4 NOT NULL,
	account_number int4 NULL,
	organization varchar(255) NULL,
	country varchar(255) NOT NULL,
	cdp_region varchar(255) NOT NULL,
	parent_section varchar(255) NOT NULL,
	"section" varchar(255) NOT NULL,
	question_number varchar(96) NOT NULL,
	question_name text NOT NULL,
	column_number int4 NOT NULL,
	column_name varchar(255) NOT NULL,
	"row_number" int4 NOT NULL,
	row_name varchar(255) NOT NULL,
	response_answer text NOT NULL,
	CONSTRAINT city_responses_pkey PRIMARY KEY (id)
);

-- public.meat_water_lookup definition

-- Drop table

-- DROP TABLE public.meat_water_lookup;

CREATE TABLE public.meat_water_lookup (
	id serial4 NOT NULL,
	meat_type varchar(64) NOT NULL,
	water_needed_litres int4 NOT NULL,
	CONSTRAINT meat_water_lookup_pk PRIMARY KEY (id, meat_type)
);




