-- use cdw_cache_staging;
DROP TABLE if exists replace_with_schema_name.source_id;
CREATE TABLE replace_with_schema_name.source_id (
  source_id        tinyint          primary key,
  source_name      varchar(50)      null,
);

INSERT INTO replace_with_schema_name.source_id
VALUES
  (1, 'centricity'    ),
  (2, 'idx'           ),
  (3, 'osiis'         )
;
