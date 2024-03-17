-- public.concept определение

-- Drop table

-- DROP TABLE public.concept;

CREATE TABLE public.concept (
	cid serial4 NOT NULL,
	cname varchar NOT NULL, -- Имя типа записи справочника (параметра)
	CONSTRAINT concept_pk PRIMARY KEY (cid)
);

-- Column comments

COMMENT ON COLUMN public.concept.cname IS 'Имя типа записи справочника (параметра)';

-- Permissions

ALTER TABLE public.concept OWNER TO postgres;
GRANT ALL ON TABLE public.concept TO postgres;