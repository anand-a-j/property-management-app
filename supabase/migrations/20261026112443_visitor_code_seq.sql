-- 1. Create the sequence.
CREATE SEQUENCE public.visitor_code_seq;

-- 2. Add the visitor code column.
ALTER TABLE public.visitor
    ADD COLUMN visitor_code TEXT UNIQUE;

-- 3. Create a function to generate visitor codes.
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

-- 4. Backfill existing visitor records.
UPDATE public.visitor
SET visitor_code =
    'VIS-' ||
    TO_CHAR(CURRENT_TIMESTAMP, 'YYYY') ||
    '-' ||
    LPAD(
        NEXTVAL('public.visitor_code_seq')::TEXT,
        6,
        '0'
    )
WHERE visitor_code IS NULL;

-- 5. Make the code mandatory.
ALTER TABLE public.visitor
    ALTER COLUMN visitor_code SET NOT NULL;

-- 6. Automatically generate codes for future records.
CREATE TRIGGER trg_set_visitor_code
BEFORE INSERT ON public.visitor
FOR EACH ROW
EXECUTE FUNCTION public.set_visitor_code();