---
title       : IndexStat
subtitle    : An easy tool for Stock Market Index Analysis
author      : Andrew Scott
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Overview and Why?

This application is a simple tool for calculating basic statistics about two of the most well known stock indexes in the United States.

Once a stock index and date range are selected:

- A simple line plot of the index closing values is displayed.
- Statistics are calculated and displayed about the behavior of the index closing values.

All the code for this presentation and the application can be found at the github link below.

GitHub Repository: https://github.com/andrewtscott/CourseraDataProducts  
Application Link: https://andrewts.shinyapps.io/IndexStats


--- 

## Where's the data?

The data used for this application was collected from datasets hosted on quandl.com

-  **S&P 500**: https://www.quandl.com/data/YAHOO/INDEX_GSPC-S-P-500-Index
-  **Dow Jones**: https://www.quandl.com/data/BCB/UDJIAD1-Dow-Jones-Industrial-Average



The dataset currently consists of 1,504 observations between the two indexes. Here are some quick calculated information about each index's dataset.

Index     | Earliest Date    | Latest Date      | Highest Day Closing     | Lowest Day Closing     | Average
----------|------------------|------------------|-------------------------|------------------------|---------
Dow Jones | 2013-01-02 | 2015-12-24 | 18,312.39   | 13,328.85  | 16,452.17
S&P 500   | 2013-01-02 | 2015-12-24 | 2,130.82   | 1,457.15  | 1,877.78

---

## What Calculations?

---

## Why Use it?




