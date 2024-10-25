alter table "public"."albumimages" drop constraint "albumimages_album_id_fkey";

alter table "public"."albumimages" drop constraint "albumimages_image_id_fkey";

alter table "public"."albumimages" drop constraint "albumimages_user_id_fkey";

alter table "public"."albums" drop constraint "albums_user_id_fkey";

alter table "public"."calendar_items" drop constraint "calendar_items_calendar_id_fkey";

alter table "public"."calendars" drop constraint "calendars_user_id_fkey";

alter table "public"."helperroles" drop constraint "helperroles_helper_id_fkey";

alter table "public"."helpers" drop constraint "helpers_person_id_fkey";

alter table "public"."helpers" drop constraint "helpers_user_id_fkey";

alter table "public"."imagegames" drop constraint "imagegames_user_id_fkey";

alter table "public"."persons" drop constraint "persons_opt_auth_id_fkey";

alter table "public"."users" drop constraint "users_person_id_fkey";

alter table "public"."albumimages" add constraint "albumimages_album_id_fkey" FOREIGN KEY (album_id) REFERENCES albums(id) ON DELETE CASCADE not valid;

alter table "public"."albumimages" validate constraint "albumimages_album_id_fkey";

alter table "public"."albumimages" add constraint "albumimages_image_id_fkey" FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE CASCADE not valid;

alter table "public"."albumimages" validate constraint "albumimages_image_id_fkey";

alter table "public"."albumimages" add constraint "albumimages_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."albumimages" validate constraint "albumimages_user_id_fkey";

alter table "public"."albums" add constraint "albums_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."albums" validate constraint "albums_user_id_fkey";

alter table "public"."calendar_items" add constraint "calendar_items_calendar_id_fkey" FOREIGN KEY (calendar_id) REFERENCES calendars(id) ON DELETE CASCADE not valid;

alter table "public"."calendar_items" validate constraint "calendar_items_calendar_id_fkey";

alter table "public"."calendars" add constraint "calendars_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."calendars" validate constraint "calendars_user_id_fkey";

alter table "public"."helperroles" add constraint "helperroles_helper_id_fkey" FOREIGN KEY (helper_id) REFERENCES helpers(id) ON DELETE CASCADE not valid;

alter table "public"."helperroles" validate constraint "helperroles_helper_id_fkey";

alter table "public"."helpers" add constraint "helpers_person_id_fkey" FOREIGN KEY (person_id) REFERENCES persons(id) ON DELETE CASCADE not valid;

alter table "public"."helpers" validate constraint "helpers_person_id_fkey";

alter table "public"."helpers" add constraint "helpers_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."helpers" validate constraint "helpers_user_id_fkey";

alter table "public"."imagegames" add constraint "imagegames_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."imagegames" validate constraint "imagegames_user_id_fkey";

alter table "public"."persons" add constraint "persons_opt_auth_id_fkey" FOREIGN KEY (opt_auth_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."persons" validate constraint "persons_opt_auth_id_fkey";

alter table "public"."users" add constraint "users_person_id_fkey" FOREIGN KEY (person_id) REFERENCES persons(id) ON DELETE CASCADE not valid;

alter table "public"."users" validate constraint "users_person_id_fkey";



