alter table "public"."helperroles" drop constraint "helperroles_person_id_fkey";

create table "public"."helpers" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "person_id" uuid not null,
    "tmp_customer_id" uuid
);


alter table "public"."helperroles" drop column "person_id";

alter table "public"."helperroles" add column "helper_id" uuid;

CREATE UNIQUE INDEX helpers_pkey ON public.helpers USING btree (id);

alter table "public"."helpers" add constraint "helpers_pkey" PRIMARY KEY using index "helpers_pkey";

alter table "public"."helperroles" add constraint "helperroles_helper_id_fkey" FOREIGN KEY (helper_id) REFERENCES helpers(id) not valid;

alter table "public"."helperroles" validate constraint "helperroles_helper_id_fkey";

alter table "public"."helpers" add constraint "helpers_person_id_fkey" FOREIGN KEY (person_id) REFERENCES persons(id) not valid;

alter table "public"."helpers" validate constraint "helpers_person_id_fkey";

grant delete on table "public"."helpers" to "anon";

grant insert on table "public"."helpers" to "anon";

grant references on table "public"."helpers" to "anon";

grant select on table "public"."helpers" to "anon";

grant trigger on table "public"."helpers" to "anon";

grant truncate on table "public"."helpers" to "anon";

grant update on table "public"."helpers" to "anon";

grant delete on table "public"."helpers" to "authenticated";

grant insert on table "public"."helpers" to "authenticated";

grant references on table "public"."helpers" to "authenticated";

grant select on table "public"."helpers" to "authenticated";

grant trigger on table "public"."helpers" to "authenticated";

grant truncate on table "public"."helpers" to "authenticated";

grant update on table "public"."helpers" to "authenticated";

grant delete on table "public"."helpers" to "service_role";

grant insert on table "public"."helpers" to "service_role";

grant references on table "public"."helpers" to "service_role";

grant select on table "public"."helpers" to "service_role";

grant trigger on table "public"."helpers" to "service_role";

grant truncate on table "public"."helpers" to "service_role";

grant update on table "public"."helpers" to "service_role";



