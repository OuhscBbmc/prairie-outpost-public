rm(list = ls(all.names = TRUE)) # Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.

# ---- load-sources ------------------------------------------------------------
# Call `base::source()` on any repo file that defines functions needed below.  Ideally, no real operations are performed.

# ---- load-packages -----------------------------------------------------------
# Attach these packages so their functions don't need to be qualified: http://r-pkgs.had.co.nz/namespace.html#search-path

# Verify these packages are available on the machine, but their functions need to be qualified: http://r-pkgs.had.co.nz/namespace.html#search-path
requireNamespace("readr"        )
requireNamespace("tidyr"        )
requireNamespace("dplyr"        ) # Avoid attaching dplyr, b/c its function names conflict with a lot of packages (esp base, stats, and plyr).
requireNamespace("checkmate"    ) # For asserting conditions meet expected patterns/conditions. # remotes::install_github("mllg/checkmate")
# requireNamespace("odbc"         ) # For communicating with SQL Server over a locally-configured DSN.  Uncomment if you use 'upload-to-db' chunk.
requireNamespace("OuhscMunge"   ) # remotes::install_github(repo="OuhscBbmc/OuhscMunge")

# ---- declare-globals ---------------------------------------------------------
# Constant values that won't change.
config                         <- config::get()

# Execute to specify the column types.  It might require some manual adjustment (eg doubles to integers).
#   OuhscMunge::readr_spec_aligned(config$path_metadata_ss_dx)
col_types <- readr::cols_only(
  `concept_id`        = readr::col_character(),
  `vocabulary_id`     = readr::col_character(),
  `icd_code`          = readr::col_character(),
  `icd_description`   = readr::col_character(),
  `desired`           = readr::col_logical(),
  `category`          = readr::col_character(),
  # `comments`          = readr::col_character()
)

# ---- load-data ---------------------------------------------------------------
# Read the CSVs
ds <- readr::read_csv(config$path_metadata_ss_dx  , col_types=col_types)

rm(col_types)

# ---- tweak-data --------------------------------------------------------------
# OuhscMunge::column_rename_headstart(ds) # Help write `dplyr::select()` call.
ds <-
  ds |>
  dplyr::select(    # `dplyr::select()` drops columns not included.
    concept_id                     = `concept_id`,
    vocabulary_id                  = `vocabulary_id`,
    icd_code                       = `icd_code`,
    icd_description                = `icd_description`,
    desired                        = `desired`,
    category                       = `category`,
    # comments                       = `comments`,
  ) |>
  dplyr::filter(desired) |>
  dplyr::mutate(
    concept_id  = sub("^\\[(.+?)\\]$", "\\1", concept_id),
    concept_id  = as.integer(concept_id),
    icd_code    = sub("^\\[(.+?)\\]$", "\\1", icd_code),
  ) |>
  dplyr::arrange(vocabulary_id, icd_code) # |>
  # tibble::rowid_to_column("subject_id") # Add a unique index if necessary

# ---- verify-values -----------------------------------------------------------
# OuhscMunge::verify_value_headstart(ds)
if (is.null(config$omop_concept_min  )) stop ("Uncomment `config$omop_concept_min`.")
if (is.null(config$omop_concept_local)) stop ("Uncomment `config$omop_concept_local`.")
if (is.null(config$pattern_icd10cm   )) stop ("Uncomment `config$pattern_icd10cm`.")

checkmate::assert_integer(  ds$concept_id      , any.missing=F , lower=config$omop_concept_min, upper=config$omop_concept_local , unique=T)
checkmate::assert_character(ds$vocabulary_id   , any.missing=F , pattern="^ICD10CM$"              )
checkmate::assert_character(ds$icd_code        , any.missing=F , pattern=config$pattern_icd10cm   )
checkmate::assert_character(ds$icd_description , any.missing=F , pattern="^.{2,255}$"             )
checkmate::assert_logical(  ds$desired         , any.missing=F                                    )
checkmate::assert_character(ds$category        , any.missing=F , pattern="^.{2,15}$"              )

combo <- paste(ds$vocabulary_id, ds$icd_code)
checkmate::assert_character(combo, any.missing = FALSE, unique = TRUE)

# ---- specify-columns-to-upload -----------------------------------------------
# Print colnames that `dplyr::select()`  should contain below:
#   cat(paste0("    ", colnames(ds), collapse=",\n"))

# Define the subset of columns that will be needed in the analyses.
#   The fewer columns that are exported, the fewer things that can break downstream.

ds_slim <-
  ds |>
  # dplyr::slice(1:100) |>
  dplyr::select(
    concept_id,
    vocabulary_id,
    icd_code,
    icd_description,
    category,
    # desired,
  )

# ---- save-to-db --------------------------------------------------------------
# If a database already exists, this single function uploads to a SQL Server database.
OuhscMunge::upload_sqls_odbc(
  d             = ds_slim,
  schema_name   = config$schema_name,
  table_name    = "ss_dx",
  dsn_name      = config$dsn_staging,
  # timezone      = config$time_zone_local, # Uncomment if uploading non-UTC datetimes
  clear_table   = T,
  create_table  = F
) # 0.012 minutes

# DROP TABLE if exists [schema-name].ss_dx;
# CREATE TABLE [schema-name].ss_dx(
# 	concept_id             int          primary key,
# 	vocabulary_id          varchar(10)  NOT NULL,
# 	icd_code               varchar(8)   NOT NULL,
# 	icd_description        varchar(255) NOT NULL,
# 	category               varchar(15)  NOT NULL,
# );
#
# CREATE unique index uq_**schema-name**_ss_dx ON [schema-name].ss_dx (vocabulary_id, icd_code);

