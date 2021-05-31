N3C and Inter-Institutional Trends in Medical Research
===================================

* N3C Presentation for SOMI in Developmental & Behavioral Pediatrics Section
* Beasley, W. H., Marshall, G., Thumann, A., Bard, D. E., "N3C and Inter-Institutional Trends in Medical Research", SOMI, Developmental & Behavioral Pediatrics Section, OKC, Invited, Oral Presentation. May 28, 2021.

Human Components
-----------------------------------

* The National COVID Cohort Collaborative (N3C) is NIH-funded
* 56+ Contributing Institutions
* 100s+ of researchers, clinicians, & data scientists
* 1.6M covid patients; 5.9M comparison patients
* 31 [Domain Teams](https://covid.cd2h.org/domain-teams), including

   * Pediatrics
   * Rural Health
   * Social Determinants of Health

Future for Research
-----------------------------------

* We believe that inter-institutional collaboration will grow a lot in the next decade for some fields.  We're already seeing that it's required for some types of funding.
* Most of these studies are observational. 
* They'll never replace well-designed prospective investigations.

* Will be important for fields where

  * rich intra-individual data is required.  (If it's just a 30 minute on-line survey, then a single site is fine.)
  * the signal to noise ratio is weak.  (Started w/ rare side effects of medications)
  * one site can't capture the whole nation.  (Philly & Portland may have the best researchers in a certain subspecialty, but they don't have partnerships or experience with Native American and Cuban American populations.)
  * the protocol can be roughly consistent across sites.  (Or at least data capture the differences.)
  * the data structure is roughly consistent across sites.  (Or at least can be transformed into something consistent.)


Inter-institutional Collaboration
-----------------------------------

*  Exists at many levels with different groups of people.  The 8 CTRs have at least five distinct levels of groups.  Most people are in 2-3 levels of groups, bur rarely lead a group in 2+ levels.  Schools trade responsibilities, depending on their strengths & staffing levels.  

  * pursuing funding (site PIs)
  * contributing data (EMR specialists, dbas, & informaticians)
  * developing clinical hypotheses & publishing (MD & PhD investigators & practitioners)
  * data wrangling (database admins, statisticians)
  * analyzing & modeling (statisticians & investigators)
  
* We've learned a lot from each other (crossing levels & schools).  It's fun working with another expert where you trade techniques & ideas.
  

OMOP Common Data Model (CDM)
-----------------------------------

* An important piece to the "data structure is roughly consistent across sites" requirement above. 
  
* **Common Tables**: the [CDM defines ~40 database tables](https://ohdsi.github.io/CommonDataModel/cdm60.html), such as

  * `person`
  * `visit_occurrence` & `visit_detail`
  * `drug_exposure` (medication)
  * `condition_occurrence` (diagnosis)
  * `measurement` & `observation` (an individual data point like BMI or an ACE item)
  
* **Common Vocabulary** for variables: everything is given an unique integer value that leverages existing standards like ICD, RxNorm, & Loinc.  Many have hierarchical relationships.
  * Every site reports ["8532"](https://athena.ohdsi.org/search-terms/terms/8532), not "Female", "female", "F", "0", or "2".
  * An "inpatient visit" ([9201](https://athena.ohdsi.org/search-terms/terms/9201)) subsumes "Inpatient Hospital", "Inpatient Nursery", "Inpatinet Psychiatric Facility", & "Isolation in inpatient setting".  This allows contributing sites to be as specific as possible, while allowing the analyst to choose the desired resolution.

* Concept Sets: (also called "codesets") collection of `concept_id` values that define a collection of interest.  For example, 10k codes used by the group studying steroids' relationship with covid outcomes.  

* An EMR isn't OMOP-compliant, but an EMR is transformed into an OMOP-compliant database/warehouse.

Computing Components
-----------------------------------

* R & Python
* Spark & SQL
* Contour
* Enclave 
* This entire cluster runs on NIH computers and is accessible only through the web browser for authorized researchers

Demo 1
-----------------------------------

synpuf


Demo 2
-----------------------------------

Site quality scorecard


Demo 3
-----------------------------------

glmnet


Likely Roles for DBP Reseachers
-----------------------------------

* Important beyond covid
  * already long-haul covid funding is in motion that will expand N3C's original boundaries.
  * there's nothing about OMOP & Spark that's specific to covid.  It should be able to accommodate anything captured in EMR or medical billing systems.

* Realistically, many of you can't learn OMOP, SQL, & R for your first project.  Good news that it's not necessary.  
  
* Attend domain team meetings and potentially join long-term.  You'll be collaborating with other schools.

* Approach Geneva or me with your own idea.  We'll see if there's an existing similar project you'd like to join.  If not, we can help you write your own proposal to be approved by an N3C governance board.  If it requires something like zipcodes, you may need OU IRB approval too.

* Advantages of N3C and EMR research
  * Dataset is already collected.  Don't need to design a study and get it approved
  * IRB is typically exempt.  For N3C specifically, you'll need
    * HIPAA form 9 waiver ("Representation for Research on Limited Data Sets of PHI")
    * Protocol
    * Copy of OU & N3C DUA (data use agreement)

* Disadvantages
  * observational data (not controlled & prospective)
  * step learning curve if you don't already know Spark & R.  (Alternatively, you can work with someone like Geneva or me)

Communication & Collaboration
-----------------------------------

* Big group meetings
* Small group meetings
* Slack, Google Groups, & Google Drive

Resources
----------------------------------

* General Info: https://covid.cd2h.org/
* General Info: https://ncats.nih.gov/n3c
* N3C tutorials: https://covid.cd2h.org/tutorials
* OMOP tutorials: https://www.ohdsi.org/tutorial-workshops/
* Book of OHDSI (online): https://ohdsi.github.io/TheBookOfOhdsi/
* OMOP CDM definitions: https://ohdsi.github.io/CommonDataModel/cdm60.html#Clinical_Data_Tables
* OMOP CDM subset for N3C: https://ncats.nih.gov/files/OMOP_CDM_COVID.pdf
* Explore OMOP Vocabulary with Athena: https://athena.ohdsi.org/search-terms/terms
* OHDSI (pronounced "Odyssey"; Observational Health Data Sciences and Informatics) is the group that manages OMOP and associated tools & conferences: https://www.ohdsi.org/
