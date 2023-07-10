SELECT
  concept_id
  ,vocabulary_id
  ,concat('[', icd_code, ']')  as icd_code
  ,icd_description
  ,'TRUE'                      as desired
  ,'cardiac'                   as category
  ,''                          as comments
FROM cdw_outpost.lexis.dim_dx
WHERE
  vocabulary_id = 'ICD10CM'
  and
  icd_code like 'I50%'
