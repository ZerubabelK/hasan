alter table "public"."booking" rename column "fourth_pickup_address" to "fourth__pickup_address";
alter table "public"."booking" alter column "fourth__pickup_address" set not null;
