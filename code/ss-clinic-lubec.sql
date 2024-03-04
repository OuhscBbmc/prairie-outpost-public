-- use cdw_cache_staging;
DROP TABLE if exists replace_with_schema_name.ss_clinic_location_epic_example;
CREATE TABLE replace_with_schema_name.ss_clinic_location_epic_example (
  location_name         varchar(50)      primary key,
);

INSERT INTO replace_with_schema_name.ss_clinic_location_epic_example
VALUES
  --Pediatric Primary Care Clinics
  ('OUCP GRAND PRAIRIE PEDIATRICS'),
  ('OUCP LATINO CLINIC'),
  ('OUCP SOONER PEDIATRICS'),
  ('OUCP SOONER PEDIATRICS NORTH'),
  ('OUCP SOUTHWEST PEDIATRICS'),
  --Internal Medicine Clinic
  ('OUP INTERNAL MEDICINE'),
  --Family Medicine Clinics
  ('OUP FAMILY MEDICINE CENTER'),
  --Off Site Family Medicine Clinics
  ('OUP EDMOND AT FOUNTAIN LAKE'),
  ('OUP CANYON PARK FAMILY MEDICINE'),
  --Adolescent Medicine
  ('OUCP ADOLESCENT MEDICINE')
;
