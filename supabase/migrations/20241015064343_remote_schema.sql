

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";





SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."albumimages" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "album_id" "uuid" NOT NULL,
    "image_id" "uuid" NOT NULL,
    "sort_order" integer NOT NULL,
    "customer_id" "uuid" NOT NULL,
    "caption" "text" DEFAULT ''::"text" NOT NULL
);

ALTER TABLE ONLY "public"."albumimages" REPLICA IDENTITY FULL;


ALTER TABLE "public"."albumimages" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."albums" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text" DEFAULT ''::"text" NOT NULL,
    "customer_id" "uuid" NOT NULL,
    "sort_order" integer DEFAULT 99999 NOT NULL
);

ALTER TABLE ONLY "public"."albums" REPLICA IDENTITY FULL;


ALTER TABLE "public"."albums" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."calendar_items" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "calendar_id" "uuid" DEFAULT "gen_random_uuid"(),
    "description" "text",
    "starts_at" timestamp with time zone,
    "ends_at" timestamp with time zone,
    "is_all_day" boolean
);

ALTER TABLE ONLY "public"."calendar_items" REPLICA IDENTITY FULL;


ALTER TABLE "public"."calendar_items" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."calendars" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text",
    "customer_id" "uuid" DEFAULT "gen_random_uuid"()
);


ALTER TABLE "public"."calendars" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."customers" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "auth_user_id" "uuid" NOT NULL,
    "customerconf" "json" DEFAULT '{}'::"json" NOT NULL
);


ALTER TABLE "public"."customers" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."imagegames" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "image_id" "uuid",
    "customer_id" "uuid" NOT NULL,
    "game_type" "text" NOT NULL
);


ALTER TABLE "public"."imagegames" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."images" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text" NOT NULL,
    "size" bigint NOT NULL,
    "type" "text" NOT NULL
);


ALTER TABLE "public"."images" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."logs" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "level" "text",
    "message" "text",
    "details" "json",
    "client_id" "text",
    "timestamp" "text"
);


ALTER TABLE "public"."logs" OWNER TO "postgres";


ALTER TABLE "public"."logs" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."logs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY "public"."albumimages"
    ADD CONSTRAINT "albumimages_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."albums"
    ADD CONSTRAINT "albums_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."calendar_items"
    ADD CONSTRAINT "calendar_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."calendars"
    ADD CONSTRAINT "calendars_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."imagegames"
    ADD CONSTRAINT "games_puzzles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."images"
    ADD CONSTRAINT "images_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."logs"
    ADD CONSTRAINT "logs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."customers"
    ADD CONSTRAINT "user_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."customers"
    ADD CONSTRAINT "user_user_id_key" UNIQUE ("auth_user_id");



ALTER TABLE ONLY "public"."albumimages"
    ADD CONSTRAINT "albumimages_album_id_fkey" FOREIGN KEY ("album_id") REFERENCES "public"."albums"("id");



ALTER TABLE ONLY "public"."albumimages"
    ADD CONSTRAINT "albumimages_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id");



ALTER TABLE ONLY "public"."albumimages"
    ADD CONSTRAINT "albumimages_image_id_fkey" FOREIGN KEY ("image_id") REFERENCES "public"."images"("id");



ALTER TABLE ONLY "public"."albums"
    ADD CONSTRAINT "albums_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id");



ALTER TABLE ONLY "public"."calendar_items"
    ADD CONSTRAINT "calendar_items_calendar_id_fkey" FOREIGN KEY ("calendar_id") REFERENCES "public"."calendars"("id");



ALTER TABLE ONLY "public"."calendars"
    ADD CONSTRAINT "calendars_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id");



ALTER TABLE ONLY "public"."imagegames"
    ADD CONSTRAINT "imagegames_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id");



ALTER TABLE ONLY "public"."customers"
    ADD CONSTRAINT "user_user_id_fkey" FOREIGN KEY ("auth_user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



CREATE POLICY "Users can CRUD their own albums" ON "public"."albums" USING (("auth"."uid"() = "customer_id")) WITH CHECK (("auth"."uid"() = "customer_id"));



CREATE POLICY "Users can CRUD their own imagegames" ON "public"."imagegames" USING (("auth"."uid"() = "customer_id")) WITH CHECK (("auth"."uid"() = "customer_id"));





ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."albumimages";



ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."albums";



ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."calendar_items";



GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";


















































































































































































































GRANT ALL ON TABLE "public"."albumimages" TO "anon";
GRANT ALL ON TABLE "public"."albumimages" TO "authenticated";
GRANT ALL ON TABLE "public"."albumimages" TO "service_role";



GRANT ALL ON TABLE "public"."albums" TO "anon";
GRANT ALL ON TABLE "public"."albums" TO "authenticated";
GRANT ALL ON TABLE "public"."albums" TO "service_role";



GRANT ALL ON TABLE "public"."calendar_items" TO "anon";
GRANT ALL ON TABLE "public"."calendar_items" TO "authenticated";
GRANT ALL ON TABLE "public"."calendar_items" TO "service_role";



GRANT ALL ON TABLE "public"."calendars" TO "anon";
GRANT ALL ON TABLE "public"."calendars" TO "authenticated";
GRANT ALL ON TABLE "public"."calendars" TO "service_role";



GRANT ALL ON TABLE "public"."customers" TO "anon";
GRANT ALL ON TABLE "public"."customers" TO "authenticated";
GRANT ALL ON TABLE "public"."customers" TO "service_role";



GRANT ALL ON TABLE "public"."imagegames" TO "anon";
GRANT ALL ON TABLE "public"."imagegames" TO "authenticated";
GRANT ALL ON TABLE "public"."imagegames" TO "service_role";



GRANT ALL ON TABLE "public"."images" TO "anon";
GRANT ALL ON TABLE "public"."images" TO "authenticated";
GRANT ALL ON TABLE "public"."images" TO "service_role";



GRANT ALL ON TABLE "public"."logs" TO "anon";
GRANT ALL ON TABLE "public"."logs" TO "authenticated";
GRANT ALL ON TABLE "public"."logs" TO "service_role";



GRANT ALL ON SEQUENCE "public"."logs_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."logs_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."logs_id_seq" TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";






























RESET ALL;