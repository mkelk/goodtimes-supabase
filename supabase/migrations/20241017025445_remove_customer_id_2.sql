DROP POLICY IF EXISTS "Users can CRUD their own albums" ON "public"."albums";

alter table "public"."albums" drop column "customer_id";



