##############################################################################
## This file is used to generate the IndexData.csv file used by the Shiny app
##############################################################################

library(Quandl)
library(dplyr)

# Pull data for last three years

SP500 = 
  Quandl("YAHOO/INDEX_GSPC", start_date="2013-01-01", end_date="2016-01-01") %>%
  transform(index = "SP", value = Close, date = Date) %>%
  select(index, date, value)
DJIA = Quandl("BCB/UDJIAD1", start_date="2013-01-01", end_date="2016-01-01") %>%
  transform(index = 'DJIA', value = Value, date = Date) %>%
  select(index, date, value)

data = rbind(SP500, DJIA)

write.csv(data, file="IndexData.csv", row.names = FALSE)

