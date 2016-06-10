---
title: Scraps of Writing for Prairie Output Documentation
output:
  html_document:
    keep_md: yes
    toc: yes
---

This document contains snippets that do not (and might never) have a good home.

Human Considerations
=================================================
We're not focused solely on the code.  Instead the three of us are motivated to creat a system that is adapted to the human factors involved.  The system should 

* maximize the researcher's productivity by providing useful & accessible data structures that closely matche their objectives.
* promote best practices in security (from IT's perspective) and justified access (from the IRB's perspective).
    * For example, deliver the dataset in a container that requires authentication to access.
* minimize the unnecessary paperwork by presenting the releveant information to the IRB, and making it easier for the project lead to avoid  many of the IRB's typical objections.
* be robust and cost effective for IT administration.
* flexible to incorporate improvements or new modules by approved campus collaborators.
 
 
Additional Warehouses
=================================================
Potentially a separate warehouse potentially (that is developed and maintained by a different group on campus).  We favor modular systems whose components can be reused in different applications.  If a second group on campus has the desire and funding to build a different, yet incompatible CDW, ideally the two groups could continue collaboration on the remaining aspects of the system.  

As a first example, the caches (column 5) and should not depend on how the CDW structures its tables, so the second CDW can use that subsystem too.  Ideally this avoids wasted effort that can be invested in improving the common components.  The regulatory process is a second example; ideally the same governance board and personnel can be utilized.
    
Even if we're convinced that no other campus group will ever be interested in a second CDW, allowing for this potential encourages the system to be more flexible.  Therefore it can accommodate the inevitable inconsistencies between data sources, and the eventual updates to the CDW.
