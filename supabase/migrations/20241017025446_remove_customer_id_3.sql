DROP POLICY IF EXISTS "Users can CRUD their own imagegames" ON "public"."imagegames";

ALTER TABLE "public"."imagegames" DROP COLUMN "customer_id" CASCADE;



