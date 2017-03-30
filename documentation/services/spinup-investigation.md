# Spinup CDW Investigation Steps


## Determine Project Tag

This name will be used in many places, including the (a) GitHub repository, (b) fileserver space, (c) CDW staging area, and (d) REDCap project.

The name should incorporate (a) PI's last name(s), (b) rough content area, (c) sequential index.  Examples include 'gillaspy-weedn-obesity-1', 'blucker-obesity-1', 'blucker-obesity-2', and 'obanion-adhd-1'.  Only lowercase letters, digits, and dashes are allowed; for the CDW staging area, we'll replace the dashes with underscores.  

This document's examples use the fictional project tag 'beasley-sloth-3', and usernames 'qqcdwstaff1', 'qqinvestigator2'

## GitHub repository

The version-controls software [GitHub](https://github.com/OuhscBbmc) is used to manage a lot of the BBMC assignments, code, and aggregated/de-identified reports. No data or PHI gets on GitHub (or ever leaves IT-approved storage devices, like file servers or databases).

1. Create the repository.

1. Create a [Team](https://help.github.com/articles/setting-up-teams/) with read & write (but not admin) privileges for the repository.

1. Add the CDW staff to the team: [zantry](https://github.com/orgs/OuhscBbmc/people/zantry), [genevamarshall](https://github.com/orgs/OuhscBbmc/people/genevamarshall), [mand9472](https://github.com/orgs/OuhscBbmc/people/mand9472), [wibeasley](https://github.com/orgs/OuhscBbmc/people/wibeasley), & [DavidBard](https://github.com/orgs/OuhscBbmc/people/DavidBard).  Because no PHI is contained in the repository, this list can include CDW staff that aren't included in the IRB proposal.

1. When the collaborators create their accounts, add them to the team.  If this is their first time in an [OuhscBbmc](https://github.com/OuhscBbmc) team, they'll first need to respond to an automated email that invites them into the organization.

    Periodically, check that [two-factor authentication](https://help.github.com/articles/about-two-factor-authentication/) is enabled for these users.  We will soon use software to [require](https://help.github.com/articles/requiring-two-factor-authentication-in-your-organization/) everyone to enable it.
1. Add the file structure skeleton.

## Confirm IRB protocol

Ask for the IRB-approved document (not just their draft) of the protocol.  
1. Confirm they have permission to access PHI through the EMR/CDW.  (This is just an initial screen; we'll check the features more granularly later.)
1. Confirm the appropriate CDW team has permission.
1. Save the document in the repository at `documentation/irb/`.


## Establish/confirm collaborator accounts

Send the following emails to collaborators:

1. OUHSC LDAP accounts (use [this skeleton](https://github.com/OuhscBbmc/BbmcResources/blob/master/instructions/username.md)).
1. REDCap instance (use [this skeleton](https://github.com/OuhscBbmc/BbmcResources/blob/master/instructions/redcap.md)).
1. GitHub repository (use [this skeleton](https://github.com/OuhscBbmc/BbmcResources/blob/master/instructions/github.md)).


## Metadata files

Zabrina works with the investigators to complete the metadata necessary for the specific project.  Start with [these templates](https://github.com/OuhscBbmc/prairie-outpost-public/tree/master/metadata).


## Fileserver space

Ideally all PHI is contained within the warehouse and the REDCap cache.  However, some times the project requires storing files with PHI fileserver space.

Geneva:
1. Creates a folder in the top-level of the BBMC fileserver.
1. Modifies the template below (incorporating the usernames from the intro email to).  The live, unredacted version is maintained at `\\redacted/BBMC/redacted/template-request-for-directory-group.txt`.
1. Checks that the names in step 5 are authorized in the most recent IRB approval.
1. Saves the request file to `\\redacted/BBMC/redacted/requests-previous/beasley-sloth-3.txt`.
1. Submits the request to Peds IS, which should take about a day.
1. Asks the investigators to double-check they have access to the space.
1. Discourages the investigators from emailing us PHI.  If it's even necessary, encourages them to store it on the file server in a file-structure that we establish.

Template to send Peds IS.  Steps 1, 2, & 5 need to be modified for each project.
> 1. Create a group called `peds-bbmc-beasley-sloth-3`.
> 2. We have already created a folder called 'beasley-sloth-3' in `\\redacted/BBMC`.  This is referred to as the 'project folder' below.
> 3. Assign the privileges of "write", "modify", "read & execute", and "list folder contents" to this group to the project folder and all its existing and future subfolders.
> 4. Assign full privileges of the `peds-bbmc-admin` group to this folder.
> 5. Assign the following existing (BBMC and non-BBMC) users to this group:
>     * Charles Watts (username qqcdwstaff1; email charles-watts@ouhsc.edu) -BBMC director
>     * Brian Jones (username qqcdwstaff2; email brian-jones-9@ouhsc.edu) -BBMC warehouse team
>     * Ronald Wood (username qqcdwstaff3; email ronald-wood-3@ouhsc.edu) -BBMC warehouse team
>     * Michael Taylor (username mtaylor; email michael-taylor-2@ouhsc.edu) -Centricity team
>     * Ian Stewart (username isteward; email ian-steward@ouhsc.edu) -Principal Investigator
>     * William Preston (username wpreston; email william-preston@ouhsc.edu) -Research Post doc
> 6. DO NOT grant permission inheritance from the bbmc root folder (ie, `\\redacted/BBMC`).  In other words, we’d like only specified BBMC members to have access to the project folder --membership in group `peds-bbmc-users` is NOT sufficient to access the folder.  (However membership in the group `peds-bbmc-admin` is sufficient.)


## Repository files

1. Assemble & configure metadata files.

1. Develop 'staging lanes' that move & manipulate project-approved data from the CDW database to the staging area database.

    Both databases live in the same SQL Server hosted by Shared Services.  Sometimes the transportation stream never leaves the server; sometimes it is processed by [R](https://www.r-project.org/) on a workstation on the network.

1. Develop 'dispense lanes' that move & manipulate project-approved data from staging area database into the REDCap project.  

    REDCap is also hosted by Shared Services.  ODBC carries data from the database to a network workstation.  The REDCap API (via our [REDCapR](https://CRAN.R-project.org/package=REDCapR) package) carries data from the workstation to the REDCap instance.

1. Develop static reports, which present the aggregated or de-identified data.  The reports' typical roles include

    * document how much data moved where & when (for the sake of validity checks).
    * present the statistical analysis.


1. Develop interactive [Shiny](https://shiny.rstudio.com/gallery/) reports  on the BBMC's server, hosted by Shared Services.  Data is either aggregated or de-identified.


## ODBC DSN

Besides a clone of the repository, the only thing on the workstation is the ODBC DSN.  These need to be set up for the outpost and cache_staging only once, with [these instructions](https://github.com/OuhscBbmc/BbmcResources/blob/master/instructions/odbc-dsn.md#create-local-dsn).

## CDW Cache Staging

The cache_staging database already exists.  Create a schema (to organize the project's tables, and keep them isolated from )

```sql
CREATE SCHEMA [beasley_sloth_3]

GRANT DELETE, INSERT, SELECT, UPDATE, VIEW DEFINITION ON [beasley_sloth_3].[tbl_obs] TO [OUHSC\qqcdwstaff1]
GRANT DELETE, INSERT, SELECT, UPDATE, VIEW DEFINITION ON [beasley_sloth_3].[tbl_obs] TO [OUHSC\qqcdwstaff2]
GRANT DELETE, INSERT, SELECT, UPDATE, VIEW DEFINITION ON [beasley_sloth_3].[tbl_obs] TO [OUHSC\qqcdwstaff3]
GO
```


## REDCap project

1.  Create roles & assign users
    * `admin` has all rights *except* API.  Includes Zabrina, Will(a), David(a), & Sree(a).
    * `api` has only API rights.  Includes Will & Sree.
    * `investigator` has insert/update/delete right.  But cannot modify the data structure or user rights.  The user cannot access the API until they've had training (how to secure the token and extracted PHI).

1. Save the data dictionary/structure (but not the data itself) in `database/cache-dictionary.csv` of the code repository.
