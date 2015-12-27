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
<style>
  em {
    font-style: italic;
  }
  strong {
    font-weight: bold;
  }
</style>

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



The dataset currently consists of 1,504 observations between the two indexes. Here are some quick calculated information about the dataset for each index.

Index     | Earliest Date    | Latest Date      | Highest Day Closing     | Lowest Day Closing     | Average
----------|------------------|------------------|-------------------------|------------------------|---------
Dow Jones | 2013-01-02 | 2015-12-24 | 18,312.39   | 13,328.85  | 16,452.17
S&P 500   | 2013-01-02 | 2015-12-24 | 2,130.82   | 1,457.15  | 1,877.78

---

## What Calculations?

Besides the line plot the following statistics are calculated on-the-fly for each parameter set:

- **Days In Range**: The number of records that are present for the parameters specified.
- **Average**: The average closing value for the index.
- **Minimum**: The lowest closing value for the index.
- **Maximum**: The highest closing value for the index.
- **Percentage Change**: The percentage change in closing value for an index between the start and end of the time period. Calculated using the following formula: `(last value - first value) / first value * 100`

---

## Why Use it?

Let me close with a few reasons why you should use IndexStats as a first stop for stock market index information needs:

- **Easy To Use** - Get the answers you need in a few clicks.  
- **Open Source** - Pull down the code and extend it to your heart's content.  
- **On-the-fly Visualization** - See the trends behind the numbers.


