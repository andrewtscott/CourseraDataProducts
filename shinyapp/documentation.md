## Documentation

### Overview

The purpose of this application is to display a plot and calculated statistics for a given stock index and 
date range for analysis. This data was collected from the following links for all dates starting from 2013-01-01.

-  https://www.quandl.com/data/YAHOO/INDEX_GSPC-S-P-500-Index
-  https://www.quandl.com/data/BCB/UDJIAD1-Dow-Jones-Industrial-Average

You can find the sourcecode for the application at following github repository: https://github.com/andrewtscott/CourseraDataProducts

### Parameters

There are two parameters that must be selected. Please see below for an overview of both variables.

- Stock Index: The stock index that you would like to perform the analysis on. Currently the Dow Jones Industrial Average (DJIA) and S&P 500 (SP).
- Date Range: The date range that should be analyzed. Default range is last 30 days of available data for a given index. When a stock index is selected the system will set the minimum and maximum available dates to the minimum and maximum available in the dataset.

### Results

#### Summary Tab

The summary tab consists of the plot and the calculations. The plot is a simple line plot displaying the closing index value over the time period selected for that index. The calculations are summary statistics generated from the parameters supplied. Below is an overview of the calculated statistics.

- **Days In Range**: The number of records that are present for the parameters specified.
- **Average**: The average closing value for the index.
- **Minimum**: The lowest closing value for the index.
- **Maximum**: The highest closing value for the index.
- **Percentage Change**: The percentage change in closing value for an index between the start and end of the time period. Calculated using the following formula: `(last value - first value) / first value * 100`

#### Data Tab

The data tab provides a raw view into the data records used for processing.

