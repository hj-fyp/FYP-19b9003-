#Data cleaning - Q3 2023

#Reading Q3 data from excel
install.packages("readxl")
library(readxl)
??readxl

data <- read_excel("new-q3-2023.xlsx")
View(data)

#Seperating Location (Kampong) into Location (Kampong) & District
install.packages("tidyr")
library(tidyr)
str(data)

data <- separate (data,'Location (Kampong)',into = c ("Location (Kampong), District"), sep = ",")

#Updating the excel
install.packages("writexl")
library(writexl)
??writexl
write_xlsx(data,path="new-q3-2023.xlsx")


#Extracting the storey no.
install.packages("dplyr")
??dplyr
library(dplyr)

quarterly_data <- read_excel("data/quarterly-data.xlsx")
View(quarterly_data)

quarter3_2023 <- read_excel("data/quarterly-data.xlsx",sheet = "Q3 2023")
View(quarter3_2023)

storey <- function(property_type) {
  if (property_type %in% c("2 Storey Semi Detached", "2 Storey Detached House", "2 Storey Terrace House")) {
    return(2)
  } else if (property_type %in% c("Bungalow", "Semi Bungalow")) {
    return(1)
  } else if (property_type %in% c("3 Storey Semi Detached", "3 Storey Terrace House")) {
    return(3)
  } else {
    return(NA)
  }
}

quarter3_2023 <- quarter3_2023 %>% 
  mutate(Storey = sapply(`Types of property`, storey))


install.packages("writexl")
library(writexl)
write_xlsx(list(Quarterly_Data = quarter3_2023), path = "quarterly-data.xlsx")



