create type "public"."wizard_status" as enum ('not_relevant', 'in_progress', 'done');

create table "public"."start_wizard_status" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "overall_status" wizard_status not null default 'not_relevant'::wizard_status,
    "done_at" timestamp without time zone,
    "calendar_status" wizard_status not null default 'not_relevant'::wizard_status,
    "calendar_done_at" timestamp without time zone,
    "album_status" wizard_status not null default 'not_relevant'::wizard_status,
    "album_done_at" timestamp without time zone,
    "jigsaw_status" wizard_status not null default 'not_relevant'::wizard_status,
    "jigsaw_done_at" timestamp without time zone,
    "user_id" uuid not null
);


CREATE UNIQUE INDEX start_wizard_status_pkey ON public.start_wizard_status USING btree (id);

alter table "public"."start_wizard_status" add constraint "start_wizard_status_pkey" PRIMARY KEY using index "start_wizard_status_pkey";

alter table "public"."start_wizard_status" add constraint "start_wizard_status_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."start_wizard_status" validate constraint "start_wizard_status_user_id_fkey";

grant delete on table "public"."start_wizard_status" to "anon";

grant insert on table "public"."start_wizard_status" to "anon";

grant references on table "public"."start_wizard_status" to "anon";

grant select on table "public"."start_wizard_status" to "anon";

grant trigger on table "public"."start_wizard_status" to "anon";

grant truncate on table "public"."start_wizard_status" to "anon";

grant update on table "public"."start_wizard_status" to "anon";

grant delete on table "public"."start_wizard_status" to "authenticated";

grant insert on table "public"."start_wizard_status" to "authenticated";

grant references on table "public"."start_wizard_status" to "authenticated";

grant select on table "public"."start_wizard_status" to "authenticated";

grant trigger on table "public"."start_wizard_status" to "authenticated";

grant truncate on table "public"."start_wizard_status" to "authenticated";

grant update on table "public"."start_wizard_status" to "authenticated";

grant delete on table "public"."start_wizard_status" to "service_role";

grant insert on table "public"."start_wizard_status" to "service_role";

grant references on table "public"."start_wizard_status" to "service_role";

grant select on table "public"."start_wizard_status" to "service_role";

grant trigger on table "public"."start_wizard_status" to "service_role";

grant truncate on table "public"."start_wizard_status" to "service_role";

grant update on table "public"."start_wizard_status" to "service_role";



