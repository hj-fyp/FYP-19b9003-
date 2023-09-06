library(ggplot2)
library(tidyverse)
library(dplyr)

#Data aggregation: Calculate the average property price for each quarter
original_dataset <- original_dataset %>%
  mutate(Quarter = case_when(
    Quarters == "0" ~ "Q 3 2022",
    Quarters == "1" ~ "Q 4 2022",
    Quarters == "2" ~ "Q 1 2023",
    Quarters == "3" ~ "Q 2 2023",
    Quarters == "4" ~ "Q 3 2023"
))

original_dataset_agg <- original_dataset %>%
  group_by(Quarter) %>%
  summarize(Avg_Price = mean(Price))

original_dataset_agg
# # A tibble: 5 × 2
# Quarter  Avg_Price
# <chr>        <dbl>
# 1 Q 1 2023   290609.
# 2 Q 2 2023   243765 
# 3 Q 3 2022   305625.
# 4 Q 3 2023   312563.
# 5 Q 4 2022   310439.

summary(original_dataset$Price)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 96000  225000  268000  293631  335000 1600000 

write_xlsx(original_dataset,"data/compiled dataset/modified-dataset.xlsx")

