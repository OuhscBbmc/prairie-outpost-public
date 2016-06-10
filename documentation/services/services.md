---
title: Services Available for the Prairie Outpost
output:
  html_document:
    keep_md: yes
    toc: yes
---


The best data warehouse isn't very useful if few people can incorporate it into their research and QI activities.  We need to make the data accessible to many investigators on campus, with a particular emphasis on those with limited experiences with large messy datasets..

The system should accommodate a wide spectrum of activities, ranging from relatively quick examinations of patient trends, to complicated research questions.  Initially, the system will offer four tiers of service.  Projects in Tiers 0, 1, & 2 store their cache in REDCap, while Tier 3 caches require a relational database (eg, SQL Server).

For more information about this project, please see the [repository](https://github.com/OuhscBbmc/PrairieOutpost) documents.  The 'architecture' document is most relevant

-------------

Tier 3: Multilevel (retainer + hourly fee)
=================================================

### Description

The structure of a patient's EMR data is complicated, in part because the world it's measuring is complicated.  When the questions require a structure that is too complex to fit in a single sectangular data structure, a SQL Server database is the best alternative (on this campus).  

### Motivation
{*Write something here.* }

### Illustration
An example of Tier 3 would be a database with the following tables.

* `Patient` demographics (one row per patient)
* `Provider` (one row per physician)
* `Appointment` (one row per appointment, linked to `Patient` and `Provider`)
* `Dialysis` (one row per administration, linked to `Patient`)
* `Hemo Lab Result` (one row per test, linked to `Patient`)
* `Genetic Lab Result` (one row per test, linked to `Patient`)
* `Prescription` (one row per medication, per prescription; linked to `Patient` and the prescribing `Provider`)

-------------

Tier 2: 3D box (hourly fee)
=================================================

{*I need to write several more pages about this tier. *}

### Description

If the project's dataset can be flattened into a few dimensions, REDCap is likely an appropriate container. For instance, a longitudinal sample where a patient is seen twelve times, each time with three or four suites of tests.  We expect that most of the projects will use this tier.

### Motivation
{*Write something here.* }

### Illustration
{*Write something here.* }

-------------

Tier 1: Cookie-cutter (free)
=================================================

### Description

We'd like to provide a no-cost option for users who want a (relatively) quick inspection of the data.  We hope that within a department (or patient group) there is a prototypical set of measures that accommodate the essential questions in the field.  For instance the 'nephrology template' would consist of measures w, x, y, & z.  If an investigator wants a cache of this information, the time required of CDW personnel will be minimal.  

Likewise, the details relevant to the IRB/governance will be reduced.  Because the cache conforms to a familiar, pre-approved template, they can dedicate more attention to other details (eg, if the use of data is justified for their particular goals).

### Motivation
{*Write something here.* }

### Illustration
{*Write something here.* }

-------------

Tier 0: Education (free)
=================================================

### Description

The technical aspects of Tier 0 mimic Tier 1, but it contains only fake data.  These freely available datasets have the same schema as the cookie cutter caches.  This lowers the entry barrier so it's easier/quicker for someone to determine if the CDW will likely meet their needs.  It also quickens their acquisition, so they're more likely to learn and be productive faster.  This should result in broader adoption of the CDW.

### Motivation
A Tier 0 cache is a copy of a Tier 1 cache, but contains only fake data.  Tiers 0 & 1 share the same structure, so that the potential investigator can:

1. better determine if it's worth the effort to procede with the paperwork to obtain real Tier 1 data,
2. visualize the potential dataset more accurately, which ideally will flush out problems with their current plans, and spark improvements, and
3. consume most of the effort expended on Tier 0, when the Tier 1 data arrive.  For instance, because  Tier 0 & 1 variable names are identical, the statistical analysis code can be reused.

### Illustration
{*Write something here.* }

### Details
Beyond the metadata, the *values* in Tier 0 should also mimic Tier 1.  Here's a minimum list of features to include, with (fake) examples:

* **univariate ranges**: birth weight is distrubted approximately lognormally, with mean 3.2kg, with 80% of cases between 2.2 and 3.8 kg.
* **multivariate correlations**: birth weight & height are *r* = .7.
* **data entry errors**: gestational age was entered as 68 weeks, instead of 38.
* **univariate missingness**: DOB is missing for 30% of pregnant moms, b/c they delivered outside of OU, or miscarried (but we don't know which).
* **multivariate missinginness**: a kid w/ a missing DOB is likely missing a birth weight too.

The best way to recreate these feastures is to obfuscate and anonymize existing data.  We will follow best practices, and err on the side of misrepresenting the patterns (for the sake of preventing re-identification).  In the past, we've liked methods recommended in *[Anonymizing Health Data](http://shop.oreilly.com/product/0636920029229.do)* (2013).

### Companion Report
Each Tier 0 datast wlil be accompanied by a statistical report that can serve as a type of answer key.  We'd like the user to recreate some of the report's statistics, and check if their values are consistent with the existing report.  This practice should uncover problems, such as misunderstandings in their minds, or mistakes in our documentation.  For example, we'd like them to calculate: (a) mean birth weight, (b) mean birth weight, after excluding likely data entry errors, and (c) mean birth weight, among premature infants.

-------------

Additional Services
=================================================
The tiers determine how the dataset is deployed to investigator.  There are several related services that should be considered.

### Statistical Analysis 

The data analysis is a separate service and is not included in these tiers.  It can be conducted by anyone collaborating with the project lead.  This includes a statistician (a) in the team, (b) on campus (eg, the [BBMC](http://www.ouhsc.edu/bbmc/) in Pediatrics, and the [RDAC](http://www.ouhsc.edu/bserdac/) in COPH), and (c) off campus with the appropriate approvals and [BAA](http://www.hhs.gov/ocr/privacy/hipaa/understanding/coveredentities/contractprov.html).  

Ideally, the statistician is involved at the beginning, and advices on tasks like (a) which measures are pulled from the CDS, (b) which patients are included, and (c) how the longitudinal dataset is structured.

### Data Cleanliness & Consistency

A lot of effort and software will be dedicated to preventing bad data from entering the CDW.  Inevitably, some will slip through.  Some bad data will evade detection (eg, the SBP was mis-entered as 88 instead of 82), some will be misrepresentative (eg, the SBP measurement was 88, but the machine was miscalibrated), and some will be inconsistent without an obvious resolution (eg, one EMR reports a DOB of Aug 8, while the clinic records say August 6).

The investigator has the final responsibility of what data should be included in the analyses and reports.  The investigator may benefit by collaborating with a statistician on these issues.

### Security after Data Leave the Cache

Our overall system makes it natural for the investigator to follow best security practices.  This is one reason why a dataset is not emailed as a loose Excel file, but instead provided in a REDCap database that's protected by multiple layers of security and user authentication.  REDCap provides simple descriptive reports, but not complex statistical inference (which are usually required for meaningful research publications).

The investigator has the final responsibility of securing their REDCap credentials (which are tied to the Campus's LDAP service), as well as any PHI as it's transported to statistical software.  The investigator may benefit by collaborating with a statistician or programmer on these issues.

### Incorporating an Additional External Data Source

The warehouse will rarely contain all rows and column in every table of an external data source (see column 1 in the [Architecture document](https://github.com/OuhscBbmc/PrairieOutpost)).  There may be additional costs if a project needs a portion of an extisting data source that's not currently imports.  There will likely be additional costs if an entirely new data source needs to be connected to the warehouse.

-------------

Current Collaborators
=================================================
The current draft was prepared by Will Beasley and David Bard, in [OUHSC Pediatrics](http://www.oumedicine.com/pediatrics), Biomedical and Behavioral Methodology Core ([BBMC](http://www.ouhsc.edu/BBMC/)), and Zsolt Nagykaldi, Director of Research in [OUHSC Family Medicine](http://www.oumedicine.com/familymedicine).

Support and contributions have also been given by Judith James ([OSCTR](http://osctr.ouhsc.edu/) Principal Investigator/Program Director), Joel Guthridge ([OMRF](http://omrf.org/) & [OSCTR](http://osctr.ouhsc.edu/)), and Tim VanWagoner ([OSCTR](http://osctr.ouhsc.edu/) Deputy Director), as well as from the Bob Roswell and Darrin Akins ([COM](http://www.oumedicine.com/collegeofmedicine) Associate Deans).

Steve Berry and Kelli Hirsch of [Boston Children's Hospital](http://hms.harvard.edu/about-hms/hms-affiliates/boston-childrens-hospital) graciously shared some of their plans with the PI Cache Templates.
