CREATE UNIQUE INDEX persons_email_key ON public.persons USING btree (email);

alter table "public"."persons" add constraint "persons_email_key" UNIQUE using index "persons_email_key";



