alter table "public"."helperroles" add column "tmp_customer_id" uuid;

alter table "public"."persons" add column "tmp_customer_id" uuid;

alter table "public"."users" add column "tmp_customer_id" uuid;



