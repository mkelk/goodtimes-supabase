alter table "public"."invites" drop column "spent";

alter table "public"."invites" add column "spent_at" timestamp without time zone;



