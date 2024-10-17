alter table "public"."helperroles" drop constraint "helperroles_user_id_fkey";

alter table "public"."helperroles" drop column "user_id";

alter table "public"."helpers" add column "user_id" uuid;

alter table "public"."helpers" add constraint "helpers_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."helpers" validate constraint "helpers_user_id_fkey";



