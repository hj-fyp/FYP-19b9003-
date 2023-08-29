library(rvest)
#Scrapping the property location: In sets of numbers because there are open connections in some webpages
base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #12-480
multiples_of_12 <- seq(from=12,to=480,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome1_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome1_location <- rbind(bruhome1_location,location_data)
}

bruhome1_location

write.csv(bruhome1_location,file="./bruhomelocation1.csv",fileEncoding = "UTF-8")


base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #492-504
multiples_of_12 <- seq(from=492,to=504,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome2_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome2_location <- rbind(bruhome2_location,location_data)
}

bruhome2_location

write.csv(bruhome2_location,file="./bruhomelocation2.csv",fileEncoding = "UTF-8")

base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #528-540
multiples_of_12 <- seq(from=528,to=540,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome3_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome3_location <- rbind(bruhome3_location,location_data)
}

bruhome3_location

write.csv(bruhome2_location,file="./bruhomelocation3.csv",fileEncoding = "UTF-8")

base_url <-  "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #552-732
multiples_of_12 <- seq(from=552,to=732,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome4_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome4_location <- rbind(bruhome4_location,location_data)
}

bruhome4_location

write.csv(bruhome4_location,file="./bruhomelocation4.csv",fileEncoding = "UTF-8")

base_url <-  "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #756-840
multiples_of_12 <- seq(from=756,to=840,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome5_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome5_location <- rbind(bruhome5_location,location_data)
}

bruhome5_location

write.csv(bruhome5_location,file="./bruhomelocation5.csv",fileEncoding = "UTF-8")

base_url <-  "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #852-864
multiples_of_12 <- seq(from=852,to=864,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome6_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome6_location <- rbind(bruhome6_location,location_data)
}

bruhome6_location

write.csv(bruhome6_location,file="./bruhomelocation6.csv",fileEncoding = "UTF-8")

base_url <-  "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #888-948
multiples_of_12 <- seq(from=888,to=948,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome7_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome7_location <- rbind(bruhome7_location,location_data)
}

bruhome7_location

write.csv(bruhome7_location,file="./bruhomelocation7.csv",fileEncoding = "UTF-8")

base_url <-  "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #972-1020
multiples_of_12 <- seq(from=972,to=1032,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome8_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome8_location <- rbind(bruhome8_location,location_data)
}

bruhome8_location

write.csv(bruhome8_location,file="./bruhomelocation8.csv",fileEncoding = "UTF-8")

base_url <-  "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #1044-1320
multiples_of_12 <- seq(from=1044,to=1320,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome9_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome9_location <- rbind(bruhome9_location,location_data)
}

bruhome9_location

write.csv(bruhome9_location,file="./bruhomelocation9.csv",fileEncoding = "UTF-8")


base_url <-  "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #1332-1800
multiples_of_12 <- seq(from=1332,to=1800,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome10_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome10_location <- rbind(bruhome10_location,location_data)
}

bruhome10_location

write.csv(bruhome10_location,file="./bruhomelocation10.csv",fileEncoding = "UTF-8")


base_url <-  "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #1812-1920
multiples_of_12 <- seq(from=1812,to=1920,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome11_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome11_location <- rbind(bruhome11_location,location_data)
}

bruhome11_location

write.csv(bruhome11_location,file="./bruhomelocation11.csv",fileEncoding = "UTF-8")

base_url <-  "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #1932 - 2472
multiples_of_12 <- seq(from=1932,to=2472,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome12_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome12_location <- rbind(bruhome12_location,location_data)
}

bruhome12_location

write.csv(bruhome12_location,file="./bruhomelocation12.csv",fileEncoding = "UTF-8")

base_url <-  "https://www.bruhome.com/v3/buy.asp?p_=buy&offset=" #2484 - 2544
multiples_of_12 <- seq(from=2472,to=2544,by=12)
multiples_of_12
page_numbers <- multiples_of_12

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome13_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome13_location <- rbind(bruhome13_location,location_data)
}

bruhome13_location

write.csv(bruhome13_location,file="./bruhomelocation13.csv",fileEncoding = "UTF-8")

#Combine the data
csv_file1 <- read.csv("bruhomelocation1.csv")
csv_file2 <- read.csv("bruhomelocation2.csv")
csv_file3 <- read.csv("bruhomelocation3.csv")
csv_file4 <- read.csv("bruhomelocation4.csv")
csv_file5 <- read.csv("bruhomelocation5.csv")
csv_file6 <- read.csv("bruhomelocation6.csv")
csv_file7 <- read.csv("bruhomelocation7.csv")
csv_file8 <- read.csv("bruhomelocation8.csv")
csv_file9 <- read.csv("bruhomelocation9.csv")
csv_file10 <- read.csv("bruhomelocation10.csv")
csv_file11 <- read.csv("bruhomelocation11.csv")
csv_file12 <- read.csv("bruhomelocation12.csv")
csv_file13 <- read.csv("bruhomelocation13.csv")

bruhome_data <- rbind(csv_file1,csv_file2,csv_file3,csv_file4,csv_file5,csv_file6,csv_file7,csv_file8,csv_file9,csv_file10,csv_file11,csv_file12,csv_file13)
write.csv(bruhome_data, file="./bruhomelocation.csv",fileEncoding = "UTF-8")

#Scrapping property location
base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset="
multiples_of_12 <- seq(from=12,to=2544,by=12)
multiples_of_12

error_pages <- c(516,744,876,960,1032)

page_numbers <- multiples_of_12[!multiples_of_12 %in% error_pages]
print(page_numbers)

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome_location <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-address") %>% 
    html_text()
  
  location_data <- data.frame(url=url,title=title)
  
  bruhome_location <- rbind(bruhome_location,location_data)
}

bruhome_location

write.csv(bruhome_location,file="./bruhomelocation.csv",fileEncoding = "UTF-8")


#Scrapping property types
base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset="
multiples_of_12 <- seq(from=12,to=2544,by=12)
multiples_of_12

error_pages <- c(516,744,876,960,1032)

page_numbers <- multiples_of_12[!multiples_of_12 %in% error_pages]
print(page_numbers)

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome_price <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("div.property-price") %>% 
    html_text()
  
  price_data <- data.frame(url=url,title=title)
  
  bruhome_price <- rbind(bruhome_price,price_data)
}

bruhome_price

write.csv(bruhome_price,file="./bruhomeprice.csv",fileEncoding = "UTF-8")

#Scrapping property types
base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset="
multiples_of_12 <- seq(from=12,to=2544,by=12)
multiples_of_12

error_pages <- c(516,744,876,960,1032)

page_numbers <- multiples_of_12[!multiples_of_12 %in% error_pages]
print(page_numbers)

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome_types <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.badge.badge-md.badge-primary") %>% 
    html_text()
  
  propertytypes_data <- data.frame(url=url,title=title)
  
  bruhome_types <- rbind(bruhome_types,propertytypes_data)
}

bruhome_types

write.csv(bruhome_types,file="./bruhometype.csv",fileEncoding = "UTF-8")

#Scrapping number of bedroom
base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset="
multiples_of_12 <- seq(from=12,to=2544,by=12)
multiples_of_12

error_pages <- c(516,744,876,960,1032)

page_numbers <- multiples_of_12[!multiples_of_12 %in% error_pages]
print(page_numbers)

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome_bedroom <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("li.flex-fill.property-bed") %>% 
    html_text()
  
  bedrooms_data <- data.frame(url=url,title=title)
  
  bruhome_bedroom <- rbind(bruhome_bedroom,bedrooms_data)
}

bruhome_bedroom

write.csv(bruhome_bedroom,file="./bruhomebedroom.csv",fileEncoding = "UTF-8")

#Scrapping number of bathroom
base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset="
multiples_of_12 <- seq(from=12,to=2544,by=12)
multiples_of_12

error_pages <- c(516,744,876,960,1032)

page_numbers <- multiples_of_12[!multiples_of_12 %in% error_pages]
print(page_numbers)

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome_bathroom <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("li.flex-fill.property-bath") %>% 
    html_text()
  
  bathrooms_data <- data.frame(url=url,title=title)
  
  bruhome_bathroom <- rbind(bruhome_bathroom,bathrooms_data)
}

bruhome_bathroom

write.csv(bruhome_bathroom,file="./bruhomebathroom.csv",fileEncoding = "UTF-8")

#Scrapping number of carpark
base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset="
multiples_of_12 <- seq(from=12,to=2544,by=12)
multiples_of_12

error_pages <- c(516,744,876,960,1032)

page_numbers <- multiples_of_12[!multiples_of_12 %in% error_pages]
print(page_numbers)

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome_carpark <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("li.flex-fill.property-m-sqft") %>% 
    html_text()
  
  carpark_data <- data.frame(url=url,title=title)
  
  bruhome_carpark <- rbind(bruhome_carpark,carpark_data)
}

bruhome_carpark

write.csv(bruhome_carpark,file="./bruhomecarpark.csv",fileEncoding = "UTF-8")

#Scrapping advertising dates
base_url <- "https://www.bruhome.com/v3/buy.asp?p_=buy&offset="
multiples_of_12 <- seq(from=12,to=2544,by=12)
multiples_of_12

error_pages <- c(516,744,876,960,1032)

page_numbers <- multiples_of_12[!multiples_of_12 %in% error_pages]
print(page_numbers)

bruhome_urls <- paste0(base_url,page_numbers)
bruhome_urls

bruhome_advdates <- data.frame()

for (url in bruhome_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("span.property-agent-date") %>% 
    html_text()
  
  advertisementdates_data <- data.frame(url=url,title=title)
  
  bruhome_advdates <- rbind(bruhome_advdates,advertisementdates_data)
}

bruhome_advdates

write.csv(bruhome_advdates,file="./bruhomerelativedates.csv",fileEncoding = "UTF-8")

#Changing the relative dates to actual dates
library(rvest)
library(lubridate)

data <- read.csv("bruhomerelativedates.csv")

colnames(data)
colnames(data)[colnames(data) == "title"] <- "advertising_date"

write.csv(data, "updated_bruhomerelativedates.csv", row.names = FALSE)

data <- read.csv("updated_bruhomerelativedates.csv")
help("lubridate")

convert_relative_to_date <- function(relative_dates) {
  parts <- strsplit(relative_dates, " ")
  num <- as.numeric(parts[[1]][1])
  unit <- tolower(parts[[1]][2])
  
  if (unit == "day" || unit == "days") {
    return(Sys.Date() - days(num))
  } else if (unit == "week" || unit == "weeks") {
    return(Sys.Date() - weeks(num))
  } else if (unit == "month" || unit == "months") {
    return(Sys.Date() - months(num))
  } else {
    return(NA)
  }
  
}


data$advertising_date <- sapply(data$advertising_date, convert_relative_to_date)
write.csv(data,"updated_bruhomedates.csv",row.names = FALSE)

data <- read.csv("updated_bruhomedates.csv")
convert_numeric_to_date <- function(numeric_date) {
  return(as.Date(numeric_date, origin = "1970-01-01"))
}

data$actual_advertising_date <- convert_numeric_to_date(data$advertising_date)

write.csv(data, "bruhomedates.csv", row.names = FALSE)

data <- read.csv("bruhomedates.csv")

data <- data[, -which(names(data) == "advertising_date")]
write.csv(data, "advertisingdate.csv", row.names = FALSE)

library(readr)
#Combine data
csv_1 <- read.csv("bruhomeprice.csv")
csv_2 <- read.csv("bruhomelocation.csv")
csv_3 <- read.csv("bruhomebedroom.csv")
csv_4 <- read.csv("bruhomebathroom.csv")
csv_5 <- read.csv("bruhomecarpark.csv")
csv_6 <- read.csv("bruhometype.csv")
csv_7 <- read.csv("bruhomedates.csv")

bruhomedata <- cbind(csv_1,csv_2,csv_3,csv_4,csv_5,csv_6,csv_7)
write.csv(bruhomedata, file="./bruscraped_data.csv",fileEncoding = "UTF-8")
colnames(bruhome)

#Cleaning the data
library(tidyverse)
library(rvest)
library(dplyr )

#Removing columns
bruhome <- read.csv("bruscraped_data.csv")
bruhome$X.2 <= NULL
bruhome$X.5 <- NULL 
bruhome$url.6 <- NULL
bruhome$X.8 <- NULL
bruhome$url.9 <- NULL
bruhome$X.11 <- NULL
bruhome$url.12 <- NULL
bruhome$X.14 <- NULL
bruhome$url.15 <- NULL
bruhome$X.17 <- NULL
bruhome$url.18 <- NULL
bruhome$X.20 <- NULL
bruhome$url.21 <- NULL
bruhome$advertising_date <- NULL
write.csv(bruhome,file="./updatedbruhome.csv",fileEncoding="UTF-8")

column_names <- c("No.", "Property URL", "Price", "Location", "Number of bedroom", "Number of bathroom", "Number of carpark", "Types of property", "Property area", "Advertising date")
colnames(bruhome) <- column_names
bruhome$NIL <- NULL
str(bruhome)
column_order <- c("No.","Property URL","Price","Location","Property area","Types of property","Number of bedroom","Number of bathroom","Number of carpark","Advertising date")
bruhome <- bruhome[,column_order]

library(rvest)
#Extracting the sqft from the description
base_url <- "https://www.bruhome.com/v3/propertydetail.asp?p_=buy&id="
page_numbers <- (18343:18354)

sqft_urls <- paste0(base_url,page_numbers,"&req=")
sqft_urls

scraped_description <- data.frame()

for (url in sqft_urls) {
  pages <- read_html(url)
  title <- pages %>%
    html_nodes("div.col-sm-9") %>% 
    html_text()
  
  data <- data.frame(url=url,title=title)
  
  scraped_description <- rbind(scraped_description,data)
}

scraped_description

write.csv(scraped_description,file="./scraped_description1.csv",fileEncoding = "UTF-8")

install.packages("readxl")
library(readxl)

getwd()
setwd("/Users/amirabarizah/Documents/FYP /bruhome/bruhome")

data1 <- read_excel("Bruhome.xlsx")
View(data1)
colnames(data)

library(tidyr)
str(data)
colnames(data)
data <- separate(data, ...4, into = c("Location", "District"), sep = ",")
View(data)

install.packages("writexl")
library(writexl)
write_xlsx(data,"Bruhome1.xlsx")

library(readxl)
data <- read_excel("Bruhome1.xlsx")
data <- data[,!(colnames(data) %in% c("District"))]
colnames(data)


write_xlsx(data, "Bruhome1.xlsx")
install.packages("openxlsx")
library(openxlsx)
write.xlsx(data,"Bruhome1.xlsx")

library(dplyr)
data$Storey <- ifelse(
  grepl("Apartment|Bungalow|Shophouse|Light industry", data$`Types of property`, ignore.case = TRUE), 1,
  ifelse(grepl("Double storey|2 storey", data$`Types of property`, ignore.case = TRUE), 2,
         ifelse(grepl("Three storey", data$`Types of property`, ignore.case = TRUE), 3, NA_integer_)
  )
)

data$NewColumn2 <- NA
colnames(data)
new_column_names <- c("No.","Property URL","Price","Location","Build-up area (/sqft)","Land size (/ac)","Land title","Types of property","Number of bedroom","Number of bathroom","Number of carpark","Advertising date","Storey")
colnames(data) <- new_column_names
colnames(data)
write.csv(data,file="./test.csv",fileEncoding = "UTF-8")

column_order <- c("No.","Property URL","Price","Location","Storey", "Build-up area (/sqft)","Land size (/ac)","Land title","Types of property","Number of bedroom","Number of bathroom","Number of carpark","Advertising date")
data <- data [,column_order]
write.xlsx(data,"Bruhome1.xlsx")

data$Storey


