# Load dependencies
library(ralger)
library(dplyr)
library(magrittr)

# Scrape Table
data <- ralger::table_scrap("https://goldprice.org/cryptocurrency-price") %>%
  select(-8) %>% 
  mutate(DateTime = Sys.time()) 

# Append CSV
write.table(data, "data/data.csv", 
            sep = ",", col.names = !file.exists("data/data.csv"),
            append = T, row.names = F)
