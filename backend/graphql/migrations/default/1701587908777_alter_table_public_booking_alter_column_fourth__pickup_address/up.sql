alter table "public"."booking" alter column "fourth__pickup_address" drop not null;
alter table "public"."booking" rename column "fourth__pickup_address" to "fourth_pickup_address";
