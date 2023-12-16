CREATE TABLE "public"."vehicles" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "vehicle_reg" text NOT NULL, "MOT_exp" date NOT NULL, "council_inspection_exp" date NOT NULL, "taxi_plate_exp" date NOT NULL, "insurance_exp" date NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_vehicles_updated_at"
BEFORE UPDATE ON "public"."vehicles"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_vehicles_updated_at" ON "public"."vehicles"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
