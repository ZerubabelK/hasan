alter table "public"."booking" alter column "vehicle_id" drop not null;
alter table "public"."booking" add column "vehicle_id" uuid;
