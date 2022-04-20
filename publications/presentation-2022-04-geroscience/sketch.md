N3C sketch
========================================================
author:
date:
autosize: true

At Glance
========================================================

* Dataset
* Computing Environment
* Collaborations

Dataset
========================================================

* 1.5M detailed longitudinal patient records since 2018, from 70+ US Institutions.
* Each COVID-positive patient is matched with 2 controls.
* Identifying variables are removed (*e.g.*, names and IDs).
* For most research projects, zip codes are masked and dates are shifted.
* These are available for a few projects that undergo more vetting and justifiably require it (*e.g.*, a comparison of rural and urban patients).

Computing Environment
========================================================

* NIH's servers contains everything you need to manipulation and analyze.
  * Specifically, the Palantir Foundry cluster has an Apache Spark foundation.

* Data are never downloaded unless they're
  * aggregated to large cell sizes and
  * approved by a committee.

* Contains tools familiar to most data scientists and statisticians:
  * R & Python (and most of their packages)
  * SQL
  * (Git for advanced scenarios)

Collaborations
========================================================

* Most projects involve 5+ researchers from 3+ institutions.
  * mix & match skills and interests
* 30 "Domain Teams"

Slide With Code
========================================================


```r
summary(cars)
```

```
     speed           dist
 Min.   : 4.0   Min.   :  2.00
 1st Qu.:12.0   1st Qu.: 26.00
 Median :15.0   Median : 36.00
 Mean   :15.4   Mean   : 42.98
 3rd Qu.:19.0   3rd Qu.: 56.00
 Max.   :25.0   Max.   :120.00
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](sketch-figure/unnamed-chunk-2-1.png)
