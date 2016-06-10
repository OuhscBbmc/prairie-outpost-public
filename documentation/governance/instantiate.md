---
title: Project Instantiation
output:
  html_document:
    keep_md: yes
    toc: yes
---

Architecture Overview
=================================================
* **Data Source** (column 1): Contains the information
* **Warehouse** (column 3):
* **Project Cache** (column 5): Most are in REDCap


<img src="./../architecture/images/global.png" style="width: 2000px;"/>


Benefits over ad-hoc EMR Extracts
=================================================

The only current capability on campus is to request individual extracts from the data source stewards.  This new approach will provide:

* Coordinated datasets across sources (combining patients and variables)
* Automated updates to datasets (important for on-going QA)
* More secure delivery through REDCap (instead of loose Excel files)
* More streamlined IRB approval (hopefully)
* More consistent experience for multiple research/QA investigations

Overall Goals
=================================================
* Existing investigations can proceed quicker and more frequently.
* More complicated investigation are possible (by combining patients & measurements across data sources).
* The process is more user-friendly and consistent across different investigations.

Instantiation Activities
=================================================
Creating and maintaining the warehouse ecosystem involves three different levels:

* **Ecosystem** (eg, configuring the database VM)
* **Data source** (eg, connecting an EMR's feed to the warehouse)
* **Project** (eg, processing data from specific patients for a single IRB-approved investigation)

### Per Ecosystem

These steps are required for the overall ecosystem.  This work is required once for our *campus*, and doesn't need to be replicated for each additional data sources or investigation.

1. Planning meetings with Campus IT and shared services.
1. Campus IT security review (and annual re-reviews).
1. Creating multiple VMs (virtual machines)
    * *HSC Warehouse*: One Windows Server VM hosting the SQL Server (figure's third column).
    * *Ellis Island and Dispensary*: One Windows Server VM runing R and C# (figure's second and fourth column).
    * *Project Cache*: Two Windows Servers compose one REDCap instance (figure's fifth column).
1. Installing and patching software on each machine.
    * OSes
    * Database Servers (SQL Server and MySQL)
    * Database admin tools (SQL Server Management Studio, MySQL Workbench, phpMyAdmin)
    * Application software (R and C#)
1. Establish and maintaining secure connections between the 2nd, 3rd, 4th, and 5th columns.
    * Network/firewall permissions between the different machines.
    * Specific user accounts on each machine (eg, OS accounts plus DB accounts).
1. Assembling team
    * DBA for warehouse (schema, performance, reliability & backups, security, communication w/ IT & S2).
    * Former EMR report writer (expertise at the connections between a pt visit and a db record).
    * REDCap administrator
    * Statistician (manipulate and/or analyze data)

### Per Data Source

Necessary for each data source (eg, once for Centricity, once for Meditech, once for Crib Notes).

1. Agreement with data source owner.
1. Establish a periodic automated data feed.
    * Configure transport layer & software
1. Secure licenses for GUI and specialized software (eg, Crystal Reports & Centricity front-end).
1. Learn data source.
    * Database schema
        * Which 15 tables (out of the 200) are relevant to the current goals)?
        * How are these tables related to each other?
    * Sampling plan (and sources of missingness)
    * {Screenshot of part of Centricity schema}
1. Write code to:
    * Transform EAV schema into warehouse-friendly schema.
    * Combine measures from different data sources
    * Link clients from different data sources
    * {Screenshot of wide to long transformation}
    * {Screenshot of warehouse schema}

### Per Project

Necessary for each investigation (eg, once for Gillaspy/Weedn, once for Myers, once for ).

1. IRB approval for investigation
1. IRB approval for warehouse collaborators
1. Understand research goals & specifics
1. Project-specific coding
    * Create code repository for
1. Write code to transform warehouse into research-friendly schema.
1. Establish REDCap cache
    * Create schema {Screenshot of REDCap project}
    * Create user account
    * Create API token
    * Create starter script in R or SAS
1. Write code to transfer data from warehouse to cache
1. Educate researchers how
    * to keep data secure once it's in the cache.
    * their cache's schema relates to their research question.
    * to analyze their data (if they're doing the analysis)
1. If BERD/BBMC is doing the analysis, keep the structure as reproducible as possible, while protecting PHI.
    * {Screenshot of R}
    * {Screenshot of GitHub}

### Live demo of REDCap Project Cache
-leads into the advantage of REDCap
-demo of using with R & SAS
-Benefits of using REDCap for the cache
-REDCap from Qualtrics

Open to any Campus Collaborators
=================================================

With the appropriate IRB approval, this system is open to anyone on campus, including:

* Statisticians analyzing the project caches (eg, BERD & BBMC)
* Applied researchers or QA investigators (last column)
* Departments adding their own data source to the ecosystem (first column)
* Departments who want a separate warehouse & data sources, but want to reuse the distribution mechanism.

[Notes: we want the whole campus to benefit, and we're not possessive or worried we'll run out of work.]

Possible Service Tiers
=================================================

* Tier 3: Multilevel (retainer + hourly fee)
* Tier 2: 3D box (hourly fee)
* Tier 1: Dept Cookie-cutter (free)
* Tier 0: Education (free)

Services like statistical analysis are considered separate.  The BBMC has statisticians available for consulting, but it's not tightly bundled with the warehouse services.  We want you to be free to analyze your own study, or include other statistical support groups (eg, BERD and RDAC).

Misc
=================================================

1. Design benefits
    * For the subspecialties, a wider collection/net starts to escape limitation of case-control-like designs
1. Advatanges of starting small, compared to MyHealthNet
    * Pitfalls of relying on standardization that exists in those biggies
    * NOT missing context of a standardized tag
        * Context (were they fasting before the blood test)?
        * Sampling (who didn't the measure -eg, Fields)
    * Not a black box.  We'll share the code that took the data from datasource to project cache    

Future
=================================================

1. Scalability
    * More projects
    * More data per project
    * More frequent updates per project
1. Federal reporting benefits of combining data sources (eg, Adam's example...)
1. [i2b2](https://www.i2b2.org/) benefits
    * Learn from/with other institutions
    * Cheaper code development & maintenance.

-------------

Current Collaborators
=================================================
The current draft was prepared by Will Beasley and David Bard, in [OUHSC Pediatrics](http://www.oumedicine.com/pediatrics), Biomedical and Behavioral Methodology Core ([BBMC](http://www.ouhsc.edu/BBMC/)).
