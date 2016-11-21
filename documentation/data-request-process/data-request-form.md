---
title: "Data Request Form Items"
author: "zantry"
date: "June 9, 2016"
output:
  html_document:
    keep_md: yes
    number_sections: yes
    toc: 4
---
###Items for Specific Patient Information Request 

####For each patient, required items are:  
* **FlowCast ID**  
* **Last Name**  
* **First Name**  
* **Middle Name**  
* **DOB**  
*Preferred formats are excel or csv*  


####Additional Patient Information (As Applicable)

* **Provider**  
      * List of all providers, will need first and last name, with correct spelling
* **Specialty**
      * Which specialty(ies) does the user need the information from?
* **Location of Care**  
      * May be more than one
      * Which location of care(s) does the user need the information from?
* **Diagnosis Codes** 
      * Need specific ICD-9 codes and name of diagnosis
      * Will need ICD 10 codes when applicable  
* **CPT Codes**  
      * Will need the name and exact code used in EMR when using the order module as well as real CPT Code
* **Medications**  
* **Allergies** 
      *  Allergies can be entered in manually, these are called uncoded allergeis!
* **Insurance Provider**  
* **Visit Date Range** 
      * e.g. All Visits from 01-01-2015 to 02-01-2015
* **Visit Type**
* **Form Names**
      * Name of the forms used to document in EMR  
* **Field Names**  
      * Name of the fields where the information is entered in EMR   
      * The field names will allow us to identify the obsterms needed on our end e.g. WEIGHT, WEIGHT %Tile, BMI   
* **Field Values**  
      * Obsterm values on our end e.g. 130lbs, 43, 25  
      * Could be ranges of values e.g.  All patients with BMI of 35 and higher
  
###Items for Generalized Information Request   
*When the request doesn't identifity specific patients, but wants all patients meeting specific criteria*  

* **DOB Range**  
      * e.g. 01-01-2012 to 01-01-2015  
* **Race**  (All races available in EMR below, ALL option added if specific races do not matter)
      * American Indian or Alaska Native  
      * Asian  
      * Native Hawaiian or Other Pacific Islander  
      * Black or African American  
      * White  
      * Patient Declined  
      * State Prohibited  
      * Unspecified  
      * ALL  
* **Gender**  (All genders in EMR listed below, ALL option added if specific races do not matter)
      * Male  
      * Female  
      * ALL  
* **Providers**  
      * List of all providers, will need first and last name, with correct spelling
* **Speciality**  
      * Which specialty(ies) does the user need the information from?
* **Location of Care**
      * May be more than one
      * Which location of care(s) does the user need the information from?
* **Diagnosis Codes**  
      * Need specific ICD-9 codes and name of diagnosis
      * Will need ICD 10 codes when applicable  
* **CPT Codes**  
      * Will need the name and exact code used in EMR when using the order module as well as real CPT Code
* **Medications**  
* **Allergies**  
      *  Allergies can be entered in manually, these are called uncoded allergeis!
* **Insurance Provider**  
* **Visit Date Range** *(Required)*    
      * e.g. All Visits from 01-01-2015 to 02-01-2015
* **Visit Type**
* **Form Names**  
      * Name of the forms used to document in EMR  
* **Field Names**  
      * Name of the fields where the information is entered in EMR    
      * The field names will allow us to identify the obsterms needed on our end e.g. WEIGHT, WEIGHT %Tile, BMI
* **Field Values**   
      * Obsterm values on our end e.g. 130lbs, 43, 25  
      * Could be ranges of values e.g.  All patients with BMI of 35 and higher
  
