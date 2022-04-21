N3C: National COVID Cohort Collaborative
========================================================
autosize: true
date: April 2022
author: CTR N3C Education Committee



CTR N3C Education Committee
========================================================

[Will Beasley](https://scholar.google.com/citations?user=ffsJTC0AAAAJ&hl=en), PhD<br>
*University of Oklahoma HSC, Biomedical & Behavioral Methodology Core (BBMC)*

[Shawn O'Neil](https://som.ucdenver.edu/Profiles/Faculty/Profile/35866), PhD<br>
*University of Colorado School of Medicine*

[Jerrod Anzalone](https://www.unmc.edu/bmi/current-students/student-bios/anzalone-jerrod-bio.html), MS<br>
*University of Nebraska Medical Center, Dept of Neurological Sciences*

[Sharon Patrick](https://directory.hsc.wvu.edu/Profile/67096), MS & [Amber Abel](), MS<br>
*West Virginia University, CTSI*

[Kimberly Murray](https://mmcri.org/?page_id=13959), MMP<br>
*Maine Medical Center Research Institute*

[Elizabeth Chen](https://vivo.brown.edu/display/echen13), PhD & [Karen Crowley](https://www.brown.edu/academics/medical/about-us/research/centers-institutes-and-programs/biomedical-informatics/people/data-scientists/karen-crowley-phd), PhD<br>
*Brown University, Biomedical Informatics*

Distinctive Features of N3C
========================================================

* Background
* Dataset
* Computing Environment
* Collaborations

Dataset
========================================================

* 13M patients (w/ 2B detailed longitudinal records) since 2018, from 70 US Institutions.
* Each COVID-positive patient is matched with 2 controls.
* Identifying variables are removed (*e.g.*, names and IDs).
* For most research projects, zip codes are masked and dates are shifted.
* These are available for a few projects that
  * undergo more vetting and
  * justifiably require it (*e.g.*, a comparison of rural and urban patients).

https://covid.cd2h.org/dashboard/cohort

Computing Environment
========================================================

* NIH's servers contain everything you need to manipulation and analyze.
  * The "N3C Enclave" is a Palantir Foundry cluster with an Apache Spark foundation.

* Data are never downloaded unless they're
  * aggregated to large cell sizes and
  * approved by a committee.

* Contains tools familiar to most data scientists and statisticians:
  * R & Python (and most of their packages)
  * SQL
  * (Git for advanced scenarios)

* Once approved into the N3C, a Researcher has access to data from all institutions, not just their own.

Collaborations
========================================================

Most projects involve 5+ researchers from 3+ institutions.
  * mix & match skills and interests

30 "[Domain Teams](https://covid.cd2h.org/domain-teams)", including:
  * [Elder Impact](https://covid.cd2h.org/elder)
  * [Social Determinants of Health](https://covid.cd2h.org/social-determinants)
  * [Immunosuppressed or Compromised  (ISC)](https://covid.cd2h.org/compromised)
  * [Machine Learning](https://covid.cd2h.org/machine-learning)

Initial Paperwork
========================================================

At the level of:

* Institution (4 weeks for a "DUA")
* Researcher  (5 hours of training)
* Project (2 weeks for a "DUR")

OMOP CDM
========================================================

* Heterogenous EMRs are transformed to this universal standard.
* [Table structure](https://ohdsi.github.io/CommonDataModel/cdm60.html) is standardized
* Vocabulary is standardized
* Managed by OHDSI (*ie*, "odyssey")
* Book of OHDSI: https://ohdsi.github.io/TheBookOfOhdsi/


Learning Resources
========================================================

* Initial N3C training document & videos
* Regular N3C office hours & user groups
* [Book of OHDSI](https://ohdsi.github.io/TheBookOfOhdsi/)
* [Book of N3C](https://national-covid-cohort-collaborative.github.io/book-of-n3c-v1/)
* summer short course
* Everything for Python, R, & SQL

Research with EMRs
========================================================

* *E* lectronic *M* edical (or Health) *R* ecords
  * roughly a synonym with "hospital database"
* Almost always observational
* If using outpatient outcomes, there are always holes
* Possibly inconsistent over time & clinics
* Data collection that's good for clinical care isn't necessarily good for research
* Samples are typically free, huge, & instant
* Decide if the trade offs are worth it
* EMR research will never replace RCTs, but they can
  * supplement previous RCT and
  * detect trends to pilot future RCTs.

Research with N3C
========================================================

* All the EMR pros & cons
* New Cons:
  * more heterogeneity & inconsistencies
* New pros:
  * Nation-wide collaborators
  * Nation-wide population
  * More power to detect small signals

FAIR & N3C
========================================================

Typical limitations on reproducibility with health data.

Many [FAIR](https://www.go-fair.org/fair-principles) principles are promoted with OMOP's metadata structure & Palantir Foundry's toolset.


* **OMOP tables**: follows the CDM (common data model)
  * requires N3C access
* **N3C tables**: templates and the "Knowledge Store"
  * requires N3C access
* **metadata**: OMOP concepts are portable plain-text files
  * public
* **code**: standard SQL, Python, & R engines.
  * code is portable plain-text, but the dependencies/relationships between nodes is Enclave-specific

Demo: Start w/ a patient-level Table
========================================================

N3C's Elder Impact Domain Team
========================================================

<!-- Statistician and Director of Informatics of the BBMC (Biomedical & Behavioral Methodology Core) in the College of Medicine. -->
<!-- Including the Clinical Research Data Warehouse (which is fed by the campus's EMRs). -->
