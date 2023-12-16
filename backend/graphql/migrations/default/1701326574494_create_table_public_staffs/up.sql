CREATE TABLE "public"."staffs" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "staff_id" varchar NOT NULL, "name" text NOT NULL, "role" text NOT NULL, "taxi_badge_exp" date NOT NULL, "passport_badge_exp" date NOT NULL, "bio_badge_exp" date NOT NULL, "DVLA_badge_exp" date NOT NULL, "AIB_badge_exp" date NOT NULL, "first_aid_badge_exp" date NOT NULL, "safeguarding_badge_exp" date NOT NULL, "disability_badge_exp" date NOT NULL, "epilepsy_badge_exp" date NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_public_staffs_updated_at"
BEFORE UPDATE ON "public"."staffs"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_staffs_updated_at" ON "public"."staffs"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
