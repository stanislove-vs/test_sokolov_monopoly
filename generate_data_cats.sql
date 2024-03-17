-- DROP FUNCTION public.generate_data_cats(float8);

CREATE OR REPLACE FUNCTION public.generate_data_cats(mb double precision)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
DECLARE
    msg VARCHAR(255); -- Результат выполения
    row_count integer; -- Кол-во строк для заполнения 
   	row_size float = 0.000023; -- Размер строки в Мб
BEGIN 
	-- Подсчёт количества строк 
    row_count := CAST(Mb / row_size AS int);
    -- Всавка новых значений 
   	FOR i IN 1..row_count LOOP
	   	INSERT  INTO  public.cats DEFAULT VALUES;
   	END LOOP;
    msg := 'Вставлено ' || CAST(row_count AS VARCHAR) || ' строк(-и)';
    RETURN msg;
   	
    -- Обработка ошибок 
	EXCEPTION
	    WHEN OTHERS THEN
	        GET STACKED DIAGNOSTICS msg = MESSAGE_TEXT;
	        msg := 'Произошла ошибка: ' || msg;
	       	RETURN msg;
	       
END;
$function$
;

-- Permissions

ALTER FUNCTION public.generate_data_cats(float8) OWNER TO postgres;
GRANT ALL ON FUNCTION public.generate_data_cats(float8) TO postgres;
