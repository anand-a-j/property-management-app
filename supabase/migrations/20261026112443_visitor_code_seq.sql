CREATE SEQUENCE public.visitor_code_seq;

ALTER TABLE public.visitor
    ADD COLUMN visitor_code TEXT UNIQUE;

CREATE OR REPLACE FUNCTION public.set_visitor_code()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.visitor_code IS NULL THEN
        NEW.visitor_code :=
            'VIS-' ||
            TO_CHAR(CURRENT_TIMESTAMP, 'YYYY') ||
            '-' ||
            LPAD(
                NEXTVAL('public.visitor_code_seq')::TEXT,
                6,
                '0'
            );
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_set_visitor_code
BEFORE INSERT ON public.visitor
FOR EACH ROW
EXECUTE FUNCTION public.set_visitor_code();

-- Make the code mandatory for future records.
ALTER TABLE public.visitor
    ALTER COLUMN visitor_code SET NOT NULL;