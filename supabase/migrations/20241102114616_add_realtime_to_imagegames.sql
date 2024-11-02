ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."imagegames";

ALTER TABLE ONLY "public"."imagegames" REPLICA IDENTITY FULL;
