alter type "public"."helperroletypes" rename to "helperroletypes__old_version_to_be_dropped";

create type "public"."helperroletypes" as enum ('mainhelper', 'assistinghelper');

alter table "public"."helperroles" alter column helperrole type "public"."helperroletypes" using helperrole::text::"public"."helperroletypes";

drop type "public"."helperroletypes__old_version_to_be_dropped";



