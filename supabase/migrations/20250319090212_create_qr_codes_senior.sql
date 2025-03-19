create table "public"."qr_codes_senior" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "used_at" timestamp with time zone,
    "user_id" uuid not null
);


alter table "public"."qr_codes_senior" enable row level security;

CREATE UNIQUE INDEX senior_qr_codes_pkey ON public.qr_codes_senior USING btree (id);

alter table "public"."qr_codes_senior" add constraint "senior_qr_codes_pkey" PRIMARY KEY using index "senior_qr_codes_pkey";

grant delete on table "public"."qr_codes_senior" to "anon";

grant insert on table "public"."qr_codes_senior" to "anon";

grant references on table "public"."qr_codes_senior" to "anon";

grant select on table "public"."qr_codes_senior" to "anon";

grant trigger on table "public"."qr_codes_senior" to "anon";

grant truncate on table "public"."qr_codes_senior" to "anon";

grant update on table "public"."qr_codes_senior" to "anon";

grant delete on table "public"."qr_codes_senior" to "authenticated";

grant insert on table "public"."qr_codes_senior" to "authenticated";

grant references on table "public"."qr_codes_senior" to "authenticated";

grant select on table "public"."qr_codes_senior" to "authenticated";

grant trigger on table "public"."qr_codes_senior" to "authenticated";

grant truncate on table "public"."qr_codes_senior" to "authenticated";

grant update on table "public"."qr_codes_senior" to "authenticated";

grant delete on table "public"."qr_codes_senior" to "service_role";

grant insert on table "public"."qr_codes_senior" to "service_role";

grant references on table "public"."qr_codes_senior" to "service_role";

grant select on table "public"."qr_codes_senior" to "service_role";

grant trigger on table "public"."qr_codes_senior" to "service_role";

grant truncate on table "public"."qr_codes_senior" to "service_role";

grant update on table "public"."qr_codes_senior" to "service_role";



