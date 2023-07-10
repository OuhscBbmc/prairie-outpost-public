SELECT
  concat('[', concept_id, ']')     as concept_id
  ,vocabulary_id
  ,concat('[', icd_code, ']')       as icd_code
  ,icd_description
  ,'TRUE'                           as desired
  ,'cardiac'                        as category
  ,''                               as comments
FROM cdw_outpost.lexis.dim_dx
WHERE
  (
    vocabulary_id = 'ICD10CM'
    and
    icd_code like 'I50%'
  )
  -- or
  -- (
  --   vocabulary_id = 'ICD9CM'
  --   and
  --   icd_code like '428.%'
  -- )
  -- or
  -- icd_description like '%heart%'
ORDER BY vocabulary_id, icd_code
-- ORDER BY concept_id
