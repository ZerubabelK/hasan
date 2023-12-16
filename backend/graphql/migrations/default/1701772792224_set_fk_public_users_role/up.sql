alter table "public"."users"
  add constraint "users_role_fkey"
  foreign key ("role")
  references "public"."roles"
  ("name") on update no action on delete no action;
