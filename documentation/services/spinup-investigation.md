# Spinup CDW Investigation Steps

# Definitions


# Steps

## Determine Project Tag

This name will be used in many places, including the (a) GitHub repository, (b) fileserver space, (c) CDW staging area, and (d) REDCap project.

The name should incorporate (a) PI's last name, (b) rough content area, (c) sequential index.  Examples include 'gillaspy-weedn-obesity-1', 'blucker-obesity-1', 'blucker-obesity-2', and 'obanion-adhd-1'.  Only lowercase letters, digits, and dashes are allowed; for the CDW staging area, we'll replace the dashes with underscores.

## GitHub repository

The version-controls software [GitHub](https://github.com/OuhscBbmc) is used to manage a lot of the BBMC assignments, code, and aggregated/de-identified reports. No data or PHI gets on GitHub (or ever leaves IT-approved storage devices, like file servers or databases).

1. Create the repository.
1. Create a [Team](https://help.github.com/articles/setting-up-teams/) with read & write (but not admin) privileges for the repository.
1. Add the CDW staff to the team: [zantry](https://github.com/orgs/OuhscBbmc/people/zantry), [genevamarshall](https://github.com/orgs/OuhscBbmc/people/genevamarshall), [mand9472](https://github.com/orgs/OuhscBbmc/people/mand9472), [wibeasley](https://github.com/orgs/OuhscBbmc/people/wibeasley), & [DavidBard](https://github.com/orgs/OuhscBbmc/people/DavidBard).  Because no PHI is contained in the repository, this list can include CDW staff that aren't included in the IRB proposal.
1. When the collaborators create their accounts, add them to the team after confirming they have enabled [two-factor authentication](https://help.github.com/articles/about-two-factor-authentication/).
1. Add the file structure skeleton.

## Confirm IRB protocol

Ask for the IRB-approved document (not just their draft) of the protocol.  
1. Confirm they have permission to access PHI through the EMR/CDW.  (This is just an initial screen; we'll check the features more granularly later.)
1. Confirm the appropriate CDW team has permission.
1. save the document in the repository at `documentation/irb/`.


## Establish/confirm collaborator accounts

Send the following emails to collaborators:

1. OUHSC LDAP accounts (use [this skeleton](https://github.com/OuhscBbmc/BbmcResources/blob/master/instructions/username.md))
1. REDCap instance (use [this skeleton](https://github.com/OuhscBbmc/BbmcResources/blob/master/instructions/redcap.md))
1. GitHub repository (use [this skeleton](https://github.com/OuhscBbmc/BbmcResources/blob/master/instructions/github.md)).


## Metadata files

Zabrina works with the investigators to complete the metadata necessary for the specific project.  See [these examples](https://github.com/OuhscBbmc/prairie-outpost-public/tree/master/metadata).


## Fileserver space

Ideally all PHI is contained within the warehouse and the REDCap cache.  However, some times the project requires storing files with PHI fileserver space.

Geneva
1. creates a folder in the top-level of the BBMC fileserver.
1. completes the request to Peds IS (incorporating the usernames from the intro email to), which should take about a day.
1. asks the investigators to double-check they have access to the space.


## CDW Cache Staging


## REDCap project

1.  Create roles & assign users
    * `admin` has all rights *except* API.  Includes Zabrina, Will(a), David(a), & Sree(a).
    * `api` has only API rights.  Includes Will & Sree.
    * `investigator` has insert/update/delete right.  But cannot modify the data structure or user rights.  The user cannot access the API until they've had training (how to secure the token and extracted PHI).

1. Save the data dictionary/structure (but not the data itself) in `database/cache-dictionary.csv` of the code repository.