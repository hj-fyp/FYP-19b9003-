library(tidyverse)
library(ggplot2)

#   Quarter  Avg_Price  RPPI
#  <chr>        <dbl> <dbl>
# 1 Q 1 2023   290609.  95.1
# 2 Q 2 2023   243765   79.8
# 3 Q 3 2022   305625.   100  
# 4 Q 3 2023   312563.   102. 
# 5 Q 4 2022   310439.   102. 

base_quarter <- "Q 3 2022"
base_price <- original_dataset_agg$Avg_Price[original_dataset_agg$Quarter == base_quarter]

original_dataset_agg$RPPI <- (original_dataset_agg$Avg_Price / base_price) * 100

x_axis_order <- c("Q 3 2022", "Q 4 2022", "Q 1 2023", "Q 2 2023", "Q 3 2023")

original_dataset_agg$Quarter <- factor(original_dataset_agg$Quarter, levels = x_axis_order)

ggplot(data = original_dataset_agg, aes(x = Quarter, y = RPPI, group = 1)) +
  geom_line() +
  labs(x = "Quarter", y = "RPPI") +
  ggtitle("Residential Property Price Index (RPPI)")
