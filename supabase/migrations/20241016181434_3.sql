
-- enrich albums with user_id
update "public"."albums" 
    set user_id = 
    (select id from "public"."users" where tmp_customer_id = "public"."albums".customer_id);

-- enrich albumimages with user_id
update "public"."albumimages" 
    set user_id = 
    (select id from "public"."users" where tmp_customer_id = "public"."albumimages".customer_id);

-- enrich calendars with user_id
update "public"."calendars" 
    set user_id = 
    (select id from "public"."users" where tmp_customer_id = "public"."calendars".customer_id);

-- enrich imagegames with user_id
update "public"."imagegames" 
        set user_id = 
    (select id from "public"."users" where tmp_customer_id = "public"."imagegames".customer_id);
