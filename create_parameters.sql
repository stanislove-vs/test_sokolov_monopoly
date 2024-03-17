-- public.parameters определение

-- Drop table

-- DROP TABLE public.parameters;

CREATE TABLE public.parameters (
	pid int8 NOT NULL,
	pconcept int8 NOT NULL,
	ptext text NULL,
	pint int8 NULL,
	pfloat float8 NULL,
	datecreate date NULL DEFAULT CURRENT_TIMESTAMP,
	datemode date NULL DEFAULT CURRENT_TIMESTAMP
);

-- Permissions

ALTER TABLE public.parameters OWNER TO postgres;
GRANT ALL ON TABLE public.parameters TO postgres;


-- public.parameters внешние включи

ALTER TABLE public.parameters ADD CONSTRAINT parameters_fk FOREIGN KEY (pid) REFERENCES public.lib(lid);
ALTER TABLE public.parameters ADD CONSTRAINT parameters_fk_1 FOREIGN KEY (pconcept) REFERENCES public.concept(cid);