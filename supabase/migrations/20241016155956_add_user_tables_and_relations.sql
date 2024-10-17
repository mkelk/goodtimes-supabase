create type "public"."helperroletypes" as enum ('mainhelper');

create table "public"."helperroles" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "person_id" uuid not null,
    "helperrole" helperroletypes not null,
    "user_id" uuid not null
);


create table "public"."persons" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "opt_auth_id" uuid
);


create table "public"."users" (
    "created_at" timestamp with time zone not null default now(),
    "userconf" json not null default '{}'::json,
    "person_id" uuid not null default gen_random_uuid(),
    "id" uuid not null default gen_random_uuid()
);


alter table "public"."albumimages" add column "user_id" uuid;

alter table "public"."albums" add column "user_id" uuid;

alter table "public"."calendars" add column "user_id" uuid;

alter table "public"."calendars" alter column "customer_id" drop default;

alter table "public"."calendars" alter column "customer_id" set not null;

alter table "public"."imagegames" add column "user_id" uuid;

CREATE UNIQUE INDEX helperroles_pkey ON public.helperroles USING btree (id);

CREATE UNIQUE INDEX persons_pkey ON public.persons USING btree (id);

CREATE UNIQUE INDEX users_id_key ON public.users USING btree (id);

CREATE UNIQUE INDEX users_pkey ON public.users USING btree (id);

alter table "public"."helperroles" add constraint "helperroles_pkey" PRIMARY KEY using index "helperroles_pkey";

alter table "public"."persons" add constraint "persons_pkey" PRIMARY KEY using index "persons_pkey";

alter table "public"."users" add constraint "users_pkey" PRIMARY KEY using index "users_pkey";

alter table "public"."albumimages" add constraint "albumimages_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."albumimages" validate constraint "albumimages_user_id_fkey";

alter table "public"."albums" add constraint "albums_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."albums" validate constraint "albums_user_id_fkey";

alter table "public"."calendars" add constraint "calendars_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."calendars" validate constraint "calendars_user_id_fkey";

alter table "public"."helperroles" add constraint "helperroles_person_id_fkey" FOREIGN KEY (person_id) REFERENCES persons(id) not valid;

alter table "public"."helperroles" validate constraint "helperroles_person_id_fkey";

alter table "public"."helperroles" add constraint "helperroles_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."helperroles" validate constraint "helperroles_user_id_fkey";

alter table "public"."imagegames" add constraint "imagegames_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."imagegames" validate constraint "imagegames_user_id_fkey";

alter table "public"."persons" add constraint "persons_opt_auth_id_fkey" FOREIGN KEY (opt_auth_id) REFERENCES auth.users(id) not valid;

alter table "public"."persons" validate constraint "persons_opt_auth_id_fkey";

alter table "public"."users" add constraint "users_id_key" UNIQUE using index "users_id_key";

alter table "public"."users" add constraint "users_person_id_fkey" FOREIGN KEY (person_id) REFERENCES persons(id) not valid;

alter table "public"."users" validate constraint "users_person_id_fkey";

grant delete on table "public"."helperroles" to "anon";

grant insert on table "public"."helperroles" to "anon";

grant references on table "public"."helperroles" to "anon";

grant select on table "public"."helperroles" to "anon";

grant trigger on table "public"."helperroles" to "anon";

grant truncate on table "public"."helperroles" to "anon";

grant update on table "public"."helperroles" to "anon";

grant delete on table "public"."helperroles" to "authenticated";

grant insert on table "public"."helperroles" to "authenticated";

grant references on table "public"."helperroles" to "authenticated";

grant select on table "public"."helperroles" to "authenticated";

grant trigger on table "public"."helperroles" to "authenticated";

grant truncate on table "public"."helperroles" to "authenticated";

grant update on table "public"."helperroles" to "authenticated";

grant delete on table "public"."helperroles" to "service_role";

grant insert on table "public"."helperroles" to "service_role";

grant references on table "public"."helperroles" to "service_role";

grant select on table "public"."helperroles" to "service_role";

grant trigger on table "public"."helperroles" to "service_role";

grant truncate on table "public"."helperroles" to "service_role";

grant update on table "public"."helperroles" to "service_role";

grant delete on table "public"."persons" to "anon";

grant insert on table "public"."persons" to "anon";

grant references on table "public"."persons" to "anon";

grant select on table "public"."persons" to "anon";

grant trigger on table "public"."persons" to "anon";

grant truncate on table "public"."persons" to "anon";

grant update on table "public"."persons" to "anon";

grant delete on table "public"."persons" to "authenticated";

grant insert on table "public"."persons" to "authenticated";

grant references on table "public"."persons" to "authenticated";

grant select on table "public"."persons" to "authenticated";

grant trigger on table "public"."persons" to "authenticated";

grant truncate on table "public"."persons" to "authenticated";

grant update on table "public"."persons" to "authenticated";

grant delete on table "public"."persons" to "service_role";

grant insert on table "public"."persons" to "service_role";

grant references on table "public"."persons" to "service_role";

grant select on table "public"."persons" to "service_role";

grant trigger on table "public"."persons" to "service_role";

grant truncate on table "public"."persons" to "service_role";

grant update on table "public"."persons" to "service_role";

grant delete on table "public"."users" to "anon";

grant insert on table "public"."users" to "anon";

grant references on table "public"."users" to "anon";

grant select on table "public"."users" to "anon";

grant trigger on table "public"."users" to "anon";

grant truncate on table "public"."users" to "anon";

grant update on table "public"."users" to "anon";

grant delete on table "public"."users" to "authenticated";

grant insert on table "public"."users" to "authenticated";

grant references on table "public"."users" to "authenticated";

grant select on table "public"."users" to "authenticated";

grant trigger on table "public"."users" to "authenticated";

grant truncate on table "public"."users" to "authenticated";

grant update on table "public"."users" to "authenticated";

grant delete on table "public"."users" to "service_role";

grant insert on table "public"."users" to "service_role";

grant references on table "public"."users" to "service_role";

grant select on table "public"."users" to "service_role";

grant trigger on table "public"."users" to "service_role";

grant truncate on table "public"."users" to "service_role";

grant update on table "public"."users" to "service_role";



