library(readxl)
library(tidyverse)
library(dplyr)
library(writexl)

compiled_data <- read_excel("data/compiled-data.xlsx")
compiled_data

colnames(compiled_data)
# [1] "No."                  "URL"                  "Source"               "Price"               
# [5] "Land.area.(acre)"     "Build-up.area.(sqft)" "Property.types"       "Floor"               
# [9] "New.Kampong"              "Mukim"                "Bedrooms"             "Bathrooms"           
# [13] "Advertising.date"     "Land.title"      

column_names <- c("No.","URL","Source","Price","Land.area.(acre)","Build-up.area.(sqft)","Property.types","Floor","New.Kampong","Mukim","Bedrooms","Bathrooms","Advertising.date","Land.title")
colnames(compiled_data) <- column_names
colnames(compiled_data)

str(compiled_data)

unique(compiled_data$Property.types)

#Data cleaning: Property types
compiled_data <- compiled_data %>%
  mutate(New.Property.types = case_when(
    Property.types == "Detached" ~ "Detached",
    Property.types == "Semi-detached" ~ "Semi-detached",
    Property.types == "Link" ~ "Detached",
    Property.types == "Bungalow" ~ "Detached",
    Property.types == "Apartment" ~ "Apartment",
    Property.types == "Stilt" ~ "Detached",
    Property.types == "Semi Detached" ~ "Semi-detached",
    Property.types == "Semi Bungalow Home" ~ "Semi-detached",
    Property.types == "Bungalow Detached" ~ "Detached",
    Property.types == "Detached Bungalow" ~ "Detached",
    Property.types == "Terrace Bungalow" ~ "Terrace",
    Property.types == "Semi Detached Bungalow" ~ "Semi-detached",
    Property.types == "Detached Home" ~ "Detached",
    Property.types == "Town Home" ~ "Terrace",
    Property.types == "D-Linked Home" ~ "Detached",
    Property.types == "Bungalow Home" ~ "Detached",
    Property.types == "Semi-Detached" ~ "Semi-detached",
    Property.types == "Semi Bungalow" ~ "Semi-detached",
    Property.types == "Terrace" ~ "Terrace",
  ))


#Data cleaning: Mukim
unique(compiled_data_2$New.Kampong)
compiled_data_2 <- compiled_data_2 %>%
  mutate(New.Mukim = case_when(
    New.Kampong == "Mulaut" ~ "Sengkurong",
    New.Kampong == "Bebatik Kilanas" ~ "Pengkalan Batu",
    New.Kampong == "Sungai Hanching" ~ "Berakas 'B'",
    New.Kampong == "NA" ~ "NA",
    New.Kampong == "Bengkurong" ~ "Kilanas",
    New.Kampong == "Sungai Liang" ~ "Liang",
    New.Kampong == "Batong" ~ "Pengkalan Batu",
    New.Kampong == "Beribi" ~ "Gadong 'B'",
    New.Kampong == "Pengkalan Gadong" ~ "Gadong 'B'",
    New.Kampong == "Jangsak" ~ "Kilanas",
    New.Kampong == "Jerudong" ~ "Sengkurong",
    New.Kampong == "Jungjongan" ~ "Pengkalan Batu",
    New.Kampong == "Katok" ~ "Gadong 'A'",
    New.Kampong == "Kiulap" ~ "Gadong 'B'",
    New.Kampong == "Limau Manis" ~ "Pengkalan Batu",
    New.Kampong == "Lumapas" ~ "Lumapas",
    New.Kampong == "Lumut" ~ "Liang",
    New.Kampong == "Madang" ~ "Berakas 'B'",
    New.Kampong == "Masin" ~ "Pengkalan Batu",
    New.Kampong == "Menglait" ~ "Gadong 'B'",
    New.Kampong == "Mentiri" ~ "Mentiri",
    New.Kampong == "Parit" ~ "Amo", 
    New.Kampong == "Rimba" ~ "Gadong 'A'",
    New.Kampong == "Sengkurong" ~ "Sengkurong",
    New.Kampong == "Subok" ~ "Kota Batu",
    New.Kampong == "Sungai Tilong" ~ "Berakas 'B'",
    New.Kampong == "Tanah Jambu" ~ "Mentiri",
    New.Kampong == "Tanjong Bunut" ~ "Kilanas",
    New.Kampong == "Tanjong Nangka" ~ "Sengkurong",
    New.Kampong == "Telanai" ~ "Kilanas",
    New.Kampong == "Tungku" ~ "Gadong 'A'",
    New.Kampong == "Kuala Tutong" ~ "Pekan Tutong",
    New.Kampong == "Pasai" ~ "Sengkurong",
    New.Kampong == "Lambak" ~ "Berakas 'A'",
    New.Kampong == "Salambigar" ~ "Berakas 'B'",
    New.Kampong == "Penabai" ~ "Pekan Tutong",
    New.Kampong == "Pekan Kuala Belait" ~ "Kuala Belait",
    New.Kampong == "Kulapis" ~ "Sengkurong",
    New.Kampong == "Tagap" ~ "Sengkurong",
    New.Kampong == "Kapok" ~ "Serasa",
    New.Kampong == "Manggis" ~ "Berakas 'B'",
    New.Kampong == "Belimbing" ~ "Kota Batu",
    New.Kampong == "Kota Batu" ~ "Kota Batu", 
    New.Kampong == "Serasa" ~ "Serasa",
    New.Kampong == "Perpindahan Berakas" ~ "Berakas 'A'",
    New.Kampong == "Kiarong" ~ "Gadong 'B'",
    New.Kampong == "Kasat" ~ "Lumapas",
    New.Kampong == "Kianggeh" ~ "Kianggeh",
    New.Kampong == "Mata-Mata" ~ "Gadong 'B'",
    New.Kampong == "Pandan" ~ "Kuala Belait",
    New.Kampong == "Sungai Akar" ~ "Berakas 'B'",
    New.Kampong == "Serusop" ~ "Berakas 'A'",
    New.Kampong == "Bangsingong" ~ "Keriam",
    New.Kampong == "Panchor" ~ "Mentiri",
    New.Kampong == "Dadap" ~ "Kilanas",
    New.Kampong == "Sungai Kelugos" ~ "Keriam",
    New.Kampong == "Kuala Lurah" ~ "Pengkalan Batu",
    New.Kampong == "Sungai Lalit" ~ "Liang",
    New.Kampong == "Tanjong Maya" ~ "Tanjong Maya",
    New.Kampong == "Keriam" ~ "Keriam",
    New.Kampong == "Sungai Kuru" ~ "Liang",
    New.Kampong == "Mumong" ~ "Kuala Belait",
    New.Kampong == "Bukit Panggal" ~ "Keriam",
    New.Kampong == "Sungai Tali" ~ "Liang",
    New.Kampong == "Kilugus" ~ "Lumapas",
    New.Kampong == "Wasan" ~ "Pengkalan Batu",
    New.Kampong == "Birau" ~ "Kiudang",
    New.Kampong == "Sengkarai" ~ "Pekan Tutong",
    New.Kampong == "Sungai Bakong" ~ "Liang",
    New.Kampong == "Batu Besurat" ~ "Gadong",
    New.Kampong == "Luagan Dudok" ~ "Keriam",
    New.Kampong == "Telisai" ~ "Telisai",
    New.Kampong == "Kiudang" ~ "Kiudang",
    New.Kampong == "Panchor Murai" ~ "Pengkalan Batu",
    New.Kampong == "Sungai Tampoi" ~ "Sengkurong",
    New.Kampong == "Salar" ~ "Mentiri",
    New.Kampong == "Sungai Asam" ~ "Lumapas",
    New.Kampong == "Sungai Sulok" ~ "Bangar",
    New.Kampong == "Buang Tekurok" ~ "Lumapas",
    New.Kampong == "Penanjong" ~ "Pekan Tutong",
    New.Kampong == "Tanjung Bunut" ~ "Kilanas",
    New.Kampong == "Baru Besurat" ~ "Gadong",
    New.Kampong == "Madewa" ~ "Kilanas",
    New.Kampong == "Serambangun" ~ "Pekan Tutong",
    New.Kampong == "Bebatik Kilanas" ~ "Kilanas",
    New.Kampong == "Rimba" ~ "Gadong 'A'"
    
))

#Data Cleaning: Land title
write_xlsx(compiled_data_2,"property-data.xlsx")
unique(compiled_data_2$Land.title)

compiled_data_2 <- read_xlsx("property-data.xlsx")
View(compiled_data_2)

compiled_data_2 <- compiled_data_2 %>%
  mutate(New.Land.Title = case_when(
    Land.title == "Kekal" ~ "Kekal",
    Land.title == "Lease" ~ "Lease",                 
    Land.title == "Lease (50 years)" ~ "Lease", 
    Land.title == "Lease (39 years)" ~ "Lease", 
    Land.title == "Lease (72 years)" ~ "Lease",
    Land.title == "Lease (50 years" ~ "Lease", 
    Land.title == "Lease (83 years)" ~ "Lease", 
    Land.title == "Lease (32 years)" ~ "Lease",
    Land.title == "Lease (69 years)" ~ "Lease", 
    Land.title == "Lease (35 years)" ~ "Lease", 
    Land.title == "Lease (99 years)" ~ "Lease", 
    Land.title == "Lease (55 years)" ~ "Lease",
    Land.title == "Freehold" ~ "Freehold" 
  ))

#Data Cleaning: Sorting the column names
compiled_data_2 <- compiled_data_2 %>%
  select(-Land.title)

colnames(compiled_data_2)
column_names <- c("URL","Source","Price","Land.area.(acre)","Build-up.area.(sqft)","Property.types","Floor","New.Kampong","Mukim","Bedrooms","Bathrooms","Quarters","Land.title")
colnames(compiled_data_2) <- column_names

write_xlsx(compiled_data_2,"property-dataset.xlsx")
