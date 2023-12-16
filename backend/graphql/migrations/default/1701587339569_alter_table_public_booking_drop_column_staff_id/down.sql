alter table "public"."booking" alter column "staff_id" drop not null;
alter table "public"."booking" add column "staff_id" uuid;
