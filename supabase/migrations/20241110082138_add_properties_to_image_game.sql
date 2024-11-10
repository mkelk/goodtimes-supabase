alter table "public"."imagegames" add column "name" text not null default ''::text;

alter table "public"."imagegames" add column "saved_state" json not null default '{}'::json;

alter table "public"."imagegames" add column "sort_order" integer not null default 9999;



