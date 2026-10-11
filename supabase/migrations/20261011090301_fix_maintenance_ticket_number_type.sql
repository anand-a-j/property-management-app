BEGIN;

-- 1. Remove the identity property if it exists
ALTER TABLE public.maintenance_requests
    ALTER COLUMN ticket_number DROP IDENTITY IF EXISTS;

-- 2. Convert the column to text
ALTER TABLE public.maintenance_requests
    ALTER COLUMN ticket_number TYPE text
    USING ticket_number::text;

COMMIT;