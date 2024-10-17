alter table "public"."albumimages" drop constraint "albumimages_customer_id_fkey";

alter table "public"."albums" drop constraint "albums_customer_id_fkey";

alter table "public"."calendars" drop constraint "calendars_customer_id_fkey";

alter table "public"."imagegames" drop constraint "imagegames_customer_id_fkey";

alter table "public"."albumimages" drop column "customer_id";

alter table "public"."calendars" drop column "customer_id";

alter table "public"."helperroles" drop column "tmp_customer_id";

alter table "public"."helpers" drop column "tmp_customer_id";

alter table "public"."persons" drop column "tmp_customer_id";

alter table "public"."users" drop column "tmp_customer_id";

