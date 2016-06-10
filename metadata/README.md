Metadata
====================================

Our workflow is built around a series of explicit metadata tables.  We can't fully automate the system, but we're hoping that the metadata files will
* improve clarity and communication between the investigator and the CDW staff,
* increase the CDW staff's efficiency of querying and manipulating data.

These metadata files are completed by the investigator and by the CDW staff as the project parameters are being defined.  These are only example datasets --project-specific datasets should be saved in their *private* project-specific repository.

In the document below, the first table enumerates the metadata tables available to an investigator.  The remaining tables document the columns within each table.

Table of Contents of Metadata Files
--------------------------------------------

| File Name | Description |
| :-------- | :---------- |
| [`metadata-dx`](metadata-dx.csv) | ICD-9 (and eventually ICD-10) diagnoses relevant to the investigation. |
| [`metadata-cpts`](metadata-cpts.csv) | Labs and tests relevant to the investigation. |


Data Dictionaries of Metadata Files
--------------------------------------------

#### [`metadata-dx`](metadata-dx.csv)

| Variable | Description |
| :-------- | :---------- |
| `dx_name` | English name of diagnosis. |
| `phentotype` | Phentotype of diagnosis. |
| `icd_9` | Exact ICD-9 code.  *Only one code per row.* |
| `desired` | Indicates if the dx is desired for the specific investigation.  *This allows someone to reuse the table across multiple investigations, without having to delete or recover rows.  Simply toggle its inclusion with a `TRUE`/`FALSE` value.*  |

Constraints & Validation Checks:
* All cells must be nonmissing.
* `dx_name` cannot be repeated across multiple rows.
* `dx_name` must be found in the CDW (specifically, `[ML].[DIAGNOSIS].[DESCRIPTION]`).  *A warning is thrown otherwise.*
* `icd_9` cannot be repeated across multiple rows.
* `icd_9` must be found in the CDW  (specifically, `[ML].[DIAGNOSIS].[ICDCODE]` where `[ML].[DIAGNOSIS].[CODETYPE]=1` for ICD9) or in the [ICD](https://cran.r-project.org/package=icd) R package.  *A warning is thrown otherwise.*
* The `dx_name` and `icd_9` combination must match the combination in the CDW.

#### [`metadata-cpts`](metadata-cpts.csv)

| Variable | Description |
| :-------- | :---------- |
| `test_name` | English name of the test/lab. |
| `abbreviations` | Abbreviated notation of the test. *Multiple values should be separated by a semicolon.* |
| `cpts` | CPT code. *Multiple values should be separated by a semicolon.* |
| `desired` | Indicates if the dx is desired for the specific investigation.  *This allows someone to reuse the table across multiple investigations, without having to delete or recover rows.  Its inclusion is toggled with a `TRUE`/`FALSE` value.*  |

Constraints & Validation Checks:
* All cells must be nonmissing.
* `test_name` cannot be repeated across multiple rows.
* `abbreviations` elements cannot be repeated across multiple rows.
* `abbreviations` elements must be found in the CDW.  *A warning is thrown otherwise.*
* `cpts` elements cannot be repeated across multiple rows.
* `cpts` elements must be found in the CDW.  *A warning is thrown otherwise.*
