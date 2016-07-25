Metadata
====================================

Our workflow is built around a series of explicit metadata tables.  We can't fully automate the system, but we're hoping that the metadata files will

* improve clarity and communication between the investigator and the CDW staff,
* increase the CDW staff's efficiency of querying and manipulating data (on the first run, and on subsequent runs).

These metadata files are completed by the investigator and by the CDW staff as the project parameters are being defined.  These are only example datasets --project-specific datasets should be saved in their *private* project-specific repository.

In the document below, the first table enumerates the metadata tables available to an investigator.  The remaining tables document the columns within each table.

Table of Contents of Metadata Files
--------------------------------------------

| File Name | Description |
| :-------- | :---------- |
| [`metadata-dx`](metadata-dx.csv) | ICD-9 (and eventually ICD-10) diagnoses relevant to the investigation. |
| [`metadata-medlist`](metadata-medlist.csv) | The 'medlist' table in Centricity defines many lookup values, such as those for race and ethnicity. |
| [`metadata-obs-header`](metadata-obs-header.csv) | Defines the types of observations to be considered. |
| [`metadata-order`](metadata-order.csv) | Labs and tests relevant to the investigation. |


Terms
--------------------------------------------
* *investigator*: the person ...
*todo*: add more terms

Data Dictionaries of Metadata Files
--------------------------------------------


--------------------------------------------------------------------

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



--------------------------------------------------------------------

#### [`metadata-medlist`](metadata-medlist.csv)
These values show the possible levels within some important Centricity variables.  The `level_centricity` EMR value was selected by the clinician.  Many times a study sample will be too small to consider each level separately, so the investigator can specify how the Centricity levels should map to the desired *new* levels.  For instance, the [example file](./metadata-medlist.csv)  preserves the race levels for `black`, `white`, and `hispanic`, while combining the remaining levels into either `other` or `unknown`.  

The `retain_patient` field indicates which patients should be included/excluded in the investigation.  This permits a clear specification for an investigation focused on a specific target population (*e.g.*, hispanic females).

Many times an investigator's grouping decisions are necessitated by statistical limitations.  Depending on the goals, some levels that occur infrequently in our regional population cannot be reliabily estimated.  We encourage the investigator to repeatedly try different groupings to strike a good balance.  We've designed the Prairie Outpost so that subsequent runs (after the investigator modified the metadata) should require minimal time from our staff.


| Variable | Description |
| :-------- | :---------- |
| `table_name` | 'Table Name' in Centricity.  This shows the variables' groupings. |
| `medlist_id` | ID value within Centricity. |
| `level_by_centricity` | Level assigned within Centricity. |
| `level_by_investigator` | New level assigned by the investigator. |
| `retain_patient` | Should patients with this value be included in the investigation? |


Constraints & Validation Checks:

* All cells must be nonmissing.
* `medlist_id` cannot be repeated across multiple rows.
* `table_name`, `medlist_id`, and `level_by_centricity` must be found in the CDW (specifically, `TABLENAME`, `MEDLISTID`, and `DESCRIPTION` in `[ML].[DIAGNOSIS]`).  *A warning is thrown otherwise.*
* `medlist_id` cannot be repeated across multiple rows.
* The `table_name` and `level_by_centricity` combination must be unique.



--------------------------------------------------------------------

#### [`metadata-obs-header`](metadata-obs-header.csv)
The 'obs' (short for 'observation') values in Centricity are classified single values; they can be numbers, dates, or text.  Obs typically lead to values that are cleaner, better structured, and better classified than values recovered from Centricity's free-text 'documents'.

The investigator should specify minimum and maximum reasonable values (for numbers and dates).  Values outside this range are set to missing.  This range is one place we can reduce the implausible values from polluting the analysis.

There are thousands of possible obs headers.  The Prairie Outpost staff will make an educated guess which headers the investigators might consider to include (based on their initial description).  However it is the investigators' responsibility to confirm that this list contains all the desired headers.

| Variable | Description |
| :-------- | :---------- |
| `hdid` | The ID for the observation 'header' in Centricity.  This specifies the type of observation. |
| `header` | A short English name of the header in Centricity. |
| `description` | A longer description of the header, which typically specifies the units. |
| `reasonable_min` | The minimum reasonable value --assigned by the investigator. (If the value type isn't a number or date, please specify `NA`.) |
| `reasonable_max` | The maximum reasonable value --assigned by the investigator. (If the value type isn't a number or date, please specify `NA`.) |
| `retain_obs` | Should this type of observation be included in the investigation? |


Constraints & Validation Checks:

* All cells must be nonmissing.  `NA` should be entered as the min & max value associated with a text observation.
* `hdid` cannot be repeated across multiple rows.
* `hdid`, `header`, and `name_long` must be found in the CDW (specifically, `HDID`, `NAME`, and `DESCRIPTION` in `[ML].[OBSHEAD]`).  *A warning is thrown otherwise.*



--------------------------------------------------------------------

#### [`metadata-order`](metadata-order.csv)
category_name,category_id,test,order_code,order_description,desired,comments



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
