-- public.lib определение

-- Drop table

-- DROP TABLE public.lib;

CREATE TABLE public.lib (
	lid serial4 NOT NULL,
	lconcept int8 NULL DEFAULT 0, -- Тип записи справочника
	lparent int8 NULL, -- Родительская запись справочника
	lname varchar(255) NOT NULL, -- Имя справочника
	ldescription text NULL, -- Описание записи справочника
	ldatecreate timestamptz NULL DEFAULT CURRENT_TIMESTAMP, -- Дата создания
	ldatemode timestamptz NULL DEFAULT CURRENT_TIMESTAMP, -- Дата редактирования 
	CONSTRAINT lib_pk PRIMARY KEY (lid)
);

-- Column comments

COMMENT ON COLUMN public.lib.lconcept IS 'Тип записи справочника';
COMMENT ON COLUMN public.lib.lparent IS 'Родительская запись справочника';
COMMENT ON COLUMN public.lib.lname IS 'Имя справочника';
COMMENT ON COLUMN public.lib.ldescription IS 'Описание записи справочника';
COMMENT ON COLUMN public.lib.ldatecreate IS 'Дата создания';
COMMENT ON COLUMN public.lib.ldatemode IS 'Дата редактирования ';

-- Permissions

ALTER TABLE public.lib OWNER TO postgres;
GRANT ALL ON TABLE public.lib TO postgres;


-- public.lib внешние включи

ALTER TABLE public.lib ADD CONSTRAINT lib_fk FOREIGN KEY (lconcept) REFERENCES public.concept(cid);