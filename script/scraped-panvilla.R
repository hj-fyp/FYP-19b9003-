library(rvest)
#Extracting data from panvilla property (Page 1 to 10)
url <- "https://www.panvillabrunei.com/search-property-result//?location=brunei&sub_location&status=sales&category&bedrooms=0&bathrooms=0&min_price=0&max_price=500000"
webpage <- read_html(url)

panvilla_title <- webpage %>%
  html_nodes("h2.property-title") %>%
  html_text()

panvilla_prices <- webpage %>%
  html_nodes("div.property-price") %>%
  html_text()

panvilla_area <- webpage %>%
  html_nodes("div.area") %>%
  html_text()

panvilla_bedrooms <- webpage %>%
  html_nodes("div.bedrooms") %>%
  html_text()

panvilla_bathrooms<- webpage %>%
  html_nodes("div.bathrooms") %>%
  html_text()

panvilla_data <- cbind(panvilla_title,panvilla_prices,panvilla_area,panvilla_bedrooms,panvilla_bathrooms)

print(panvilla_data)
write.csv(panvilla_data,file="./panvilla1.csv",fileEncoding = "UTF-8")

#Combining Panvilla data from page 1 to 10
panvilla_1 <- read.csv("panvilla1.csv")
panvilla_2 <- read.csv("panvilla2 copy.csv")
panvilla_3 <- read.csv("panvilla3.csv")
panvilla_4 <- read.csv("panvilla4.csv")
panvilla_5 <- read.csv("panvilla5.csv")
panvilla_6 <- read.csv("panvilla6.csv")
panvilla_7 <- read.csv("panvilla7.csv")
panvilla_8 <- read.csv("panvilla8.csv")
panvilla_9 <- read.csv("panvilla9.csv")
panvilla_10 <- read.csv("panvilla10.csv")
panvilla_11 <- read.csv("panvilla12.csv")
panvilla_12 <- read.csv("panvilla12.csv")
panvilla_13 <- read.csv("panvilla13.csv")
panvilla_14 <- read.csv("panvilla14.csv")
panvilla_15 <- read.csv("panvilla15.csv")
panvilla_16 <- read.csv("panvilla16.csv")
panvilla_17 <- read.csv("panvilla17.csv")
panvilla_18 <- read.csv("panvilla18.csv")

#Binding data from page 1 to 10 (Missing property area i.e. sqft)
scraped_data <- rbind(panvilla_1,panvilla_2,panvilla_3,panvilla_4,panvilla_5,panvilla_6,panvilla_7,panvilla_8,panvilla_9,panvilla_10)
write.csv (scraped_data, file="./scraped_data1.csv",fileEncoding = "UTF-8")

#Binding data from page 11 to 18 (With property area)
scraped_data2 <- rbind(panvilla_11,panvilla_12,panvilla_13,panvilla_14,panvilla_15,panvilla_16,panvilla_17,panvilla_18)
write.csv (scraped_data2, file="./scraped_data2.csv",fileEncoding = "UTF-8")
#Important note: There is redundancy in the data!

#Cleaning scraped_data 1 i.e. page 1 to 10 of panvilla property website 

library(tidyverse)
#Seperating the property title
data <- read.csv("scraped_data1.csv")

data <- data %>%
  separate(panvilla_title, into = c("Types of property","Location"), sep = " : ")

print(data)
colnames(data)
str(data)

#Adding new columns
data$NewColumn1 <- NA
data$NewColumn2 <- NA
data$NewColumn3 <- NA
colnames(data)

#Changing column names
new_column_names1 <- c("No.","Property URL","Types of property","Location","Price","Number of bedroom","Number of bathroom","Property area","Advertising date","Number of carpark")
colnames(data) <- new_column_names1
colnames(data)

write.csv(data,file="./scraped_data1.csv",fileEncoding="UTF-8")

#Rearranging the column names to match with bruhome data
data <- read.csv("scraped_data1.csv")
colnames(data)
str(data)
new_column_order1 <- c("No.","Property.URL","Price","Location","Number.of.bedroom","Number.of.bathroom","Number.of.carpark","Property.area","Types.of.property","Advertising.date")
data <- data[,new_column_order1]

write.csv(data,file="./scraped_data1.csv",fileEncoding="UTF-8")

#To address the redundancy:Seperate the location/type and price/bedroom/bathroom
library(dplyr)

data <- read.csv("scraped_data1.csv")
columns_to_seperate <- c("Price","Number.of.bedroom","Number.of.bathroom")

seperated_price1 <- data %>% select(all_of(columns_to_seperate))
seperated_title1 <- data %>% select(-all_of(columns_to_seperate))

write.csv(seperated_price1,file="./seperated_price1.csv",fileEncoding = "UTF-8")
write.csv(seperated_title1,file="./seperated_title1.csv",fileEncoding = "UTF-8")

#Removing redundancy in the seperated_title1
data <- read.csv("seperated_title1.csv")
redundancy_in_price <- c(1:10, 21:30, 41:50, 61:70, 81:90, 101:110,121:130,141:150,161:170,181:190)
redundancy_in_price
data <- data[-redundancy_in_price, ]

write.csv(data,file="./seperated_title1.csv",fileEncoding="UTF-8")

#Removing redundancy in the seperated_price1 
data <- read.csv("seperated_price1.csv")
redundancy_in_title <- seq(2, 200, by=2)
redundancy_in_title
data <- data[-redundancy_in_title, ]

write.csv(data,file="./seperated_price1.csv",fileEncoding="UTF-8")

#Binding the seperated_price1 and seperated_title1
library(tidyverse)
combined_data1 <- cbind(seperated_price1,seperated_title1)
combined_data1
colnames(combined_data1)

write.csv(combined_data1,file="./scraped_data1.csv",fileEncoding="UTF-8")


#Cleaning scraped_data2.csv
library(tidyverse)
#Seperating the property title
data <- read.csv("scraped_data2.csv")

data <- data %>%
  separate(panvilla_title, into = c("Types of property","Location"), sep = " : ")

print(data)
colnames(data)
str(data)

#Adding new columns
data$NewColumn1 <- NA
data$NewColumn2 <- NA
colnames(data)

#Changing column names
new_column_names2 <- c("No.","Property URL","Types of property","Location","Price","Property area","Number of bedroom","Number of bathroom","Number of carpark","Advertising date")
colnames(data) <- new_column_names2
colnames(data)

write.csv(data,file="./scraped_data2.csv",fileEncoding="UTF-8")

#Rearranging the column names to match with bruhome data
data <- read.csv("scraped_data2.csv")
colnames(data)
str(data)
new_column_order2 <- c("No.","Property.URL","Price","Location","Number.of.bedroom","Number.of.bathroom","Number.of.carpark","Property.area","Types.of.property","Advertising.date")
data <- data[,new_column_order2]

write.csv(data,file="./scraped_data2.csv",fileEncoding="UTF-8")

#To address the redundancy:Seperate the location/type and price/bedroom/bathroom
library(dplyr)

data <- read.csv("scraped_data2.csv")
columns_to_seperate <- c("Price","Number.of.bedroom","Number.of.bathroom")

seperated_price2 <- data %>% select(all_of(columns_to_seperate))
seperated_title2 <- data %>% select(-all_of(columns_to_seperate))

write.csv(seperated_price2,file="./seperated_price2.csv",fileEncoding = "UTF-8")
write.csv(seperated_title2,file="./seperated_title2.csv",fileEncoding = "UTF-8")

#Removing redundancy in the seperated_title1
data <- read.csv("seperated_title2.csv")
redundancy_in_price <- c(1:10, 21:30, 41:50, 61:70, 81:90, 101:110,121:130,141:150)
redundancy_in_price
data <- data[-redundancy_in_price, ]

write.csv(data,file="./seperated_title2.csv",fileEncoding="UTF-8")

#Removing redundancy in the seperated_price1 
data <- read.csv("seperated_price2.csv")
redundancy_in_title <- seq(2, 200, by=2)
redundancy_in_title
data <- data[-redundancy_in_title, ]

write.csv(data,file="./seperated_price2.csv",fileEncoding="UTF-8")

#Binding the seperated_price1 and seperated_title1
library(tidyverse)
seperated_price2 <- read.csv("seperated_price2.csv")
seperated_title1 <- read.csv("seperated_title1.csv")
combined_data2 <- cbind(seperated_price2,seperated_title2)
combined_data2
colnames(combined_data2)

write.csv(data,file="./scraped_data2.csv",fileEncoding="UTF-8")

scraped_data1 <- read.csv("scraped_data1.csv")
scraped_data2 <- read.csv("scraped_data2.csv")

#Combine both dataset 
scraped_data <- rbind(scraped_data1,scraped_data2)
colnames(scraped_data)
nrow(scraped_data1)
nrow(scraped_data2)
nrow(scraped_data)

write.csv(scraped_data,file="./panvilla.csv",fileEncoding="UTF-8")


column_order <- c("No.","Property.URL","Price","Location","Property.area","X","X.1","Types.of.property","Number.of.bedroom","Number.of.bathroom","Number.of.carpark","Advertising.date")
data <- read.csv("panvilla.csv")
data <- data[,column_order]
colnames(data)

column_names <- c("No.","Property URL","Price","Location","Build-up area","Land area","Land title","Types of property","Number of bedroom","Number of bathroom","Number of carpark","Advertising date")
colnames(data) <- column_names
colnames(data)
write.csv(data,file="./panvilla.csv",fileEncoding="UTF-8")
data$No. <- c(1:180)
data$No. <- NULL





