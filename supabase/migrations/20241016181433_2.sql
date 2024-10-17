-- Now create a HelperRole for each Helper that is a Helper
insert into "public"."helperroles" (helperrole, helper_id, tmp_customer_id)
    select 'mainhelper', h.id as hid, u.tmp_customer_id
    from "public"."helpers" h
    inner join "public"."users" u on h.tmp_customer_id = u.tmp_customer_id