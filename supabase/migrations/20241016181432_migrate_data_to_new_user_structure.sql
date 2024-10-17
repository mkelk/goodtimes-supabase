-- create persons for users, user customerid for primary key, since we want to keep this for referring
insert into "public"."persons" (tmp_customer_id)
    select id from "public"."customers";

-- create users - take over the old customer_id as the new user.id
insert into "public"."users" (id, tmp_customer_id, person_id)
    select tmp_customer_id, tmp_customer_id, id from "public"."persons";

-- enrich users with config
update "public"."users" 
    set userconf = 
    (select customerconf from "public"."customers" where id = "public"."users".tmp_customer_id);

-- null the tmp_customer_id in the persons table
update "public"."persons" 
    set tmp_customer_id = null;

-- now Users are created but we still have the tmp_customer_id in the persons table

-- Now for each old Customer, we have to create a Helper
-- First create a Person for each Helper, knowing that the tmp_customer_id is the customer_id
insert into "public"."persons" (tmp_customer_id, opt_auth_id)
    select id, auth_user_id from "public"."customers";

-- then create a Helper for each Person
insert into "public"."helpers" (person_id, tmp_customer_id)
    select id, tmp_customer_id from "public"."persons"
    where tmp_customer_id is not null;
