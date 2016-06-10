---
title: Prairie Outpost FAQ and Glossary
output:
  html_document:
    keep_md: yes
    toc: yes
---


Here are some questions we've been asked, or are anticipating.  If you have additional questions, please ask [one of us](#contact-info-of-current-collaborators).

### What are some of the initial objectives?
We have chosen to start with some pilot projects.  These hand-picked research and QI projects have been suffering from a lack of EMR data, and will immediately benefit from the products of this system.  From a strategic perspective, we'd like these pilots to demonstrate that OUHSC research and clinical capabilities can benefit from an investment in the this system.  

In our past data & statistical projects, we have followed the adage that a successful & complex project cannot emerge immediately.  Starting small with a handful of projects will help us learn what larger technical and social obstacles need to be addressed before the system grows.

Once momentum is gained, more advanced objectives and difficult scenarios will be considered.

We don't want to compromise future capabilities just for the sake of spitting out a quick pilot product.  Our goal is to make the architecture extensible, so it can (a) meet the demands of these initial projects (while we're/I'm still learning and the budget is almost non-existent), (b) accommodate the larger problems that it will encounter in the next decade or two.

### How will statistical analysis and automated reporting be facilitated?
A consistent and accessible data layer (which is essentially the topic of this document) will provide a stable foundation for reports to be developed on top of it.  Automated and ad-hoc reports contribute to research and QI projects.

As we're currently conceptualizing the architecture, statistical analysis will occur in the "Modeling Layer", while reports will be rendered & deployed by the "Presentation Layer".  Pleas see the FAQ entry below, [What additional architectural tiers will exist?](#what-additional-architectural-tiers-will-exist).

### What additional architectural tiers will exist?
The modeling & reporting capabilities should be separate layers/tiers from the warehouse (which is the topic of this existing 'architecture' document).  For smaller projects in the past, we've started with the "Data Layer" as a foundation (which is essentially the topic of this document).  Upon this foundational layer, we add a "Modeling Layer" (primarily concerned with statistical analysis) and a "Presentation Layer" (primarily concerned with visually rendering the statistical results to a human).  Each layer is independent/agnostic of the layers above it.  For instance, changes to a webpage (ie, in the presentation layer) don't affect the structure of the data layer.

There are so many fads and changes with these two layers.  Not only do the recommended statistical procedures evolve every few years, but the presentation layer (which affects the appearance of the reports) changes even more frequently.  Our goal is to isolate the foundational data layer from the modeling & presentation layer, so that it lives unchanged as these higher layers are iterated every few years.

We're also considering that these might be the responsibility of the researcher/QIer, and not of the warehouse developers.  But we're considering the implications of which groups have responsibility for the different components.

### Are you really going to call it "Prairie Outpost"?
Probably not.  It's an internal title right now, because terms like "the database" or "the data warehouse" aren't descriptive enough to distinguish them from our other projects.  We're open to any suggested title, if it's not too vague.

### Can users enter new data?
As currently described, a PI can write data (ie, insert, modify, delete isolated points and entire records) in their own Cache (column 5), but not in the Warehouse (column 3) or the EMRs (column 1).

At least for the first pilot project or two, data should flow left-to-right.  We think this 'read-only' flow will be much easier to get through the bureaucratic channels (and the coding should be easier too).  

### How will QI projects be treated differently than research projects?
We're considering options.  As Zsolt has said, we need to "differentiate between QI and research, because the governance structure, data flow and data types will be quite different".

### How do these plans relate to an upcoming tissue repository and Zsolt's AHRQ grant for extension systems?
We're considering options now.  These projects are important for OUHSC ability to compete for grants and care for patients.  Easy compatibility is a goal of ours.   

### How definite are these plans?
We're certainly not firmly set in any position, and would like to hear your feedback. 

-------------

Glossary
=================================================
* **CDW**: clinical data warehouse
* **project lead**: an inclusive term for the OUHSC employee who is leading the research or QI project.
