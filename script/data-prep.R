library(readxl)
library(tidyverse)
library(dplyr)
library(writexl)

original_dataset <- read_excel("data/complete dataset/compiled-data.xlsx")
original_dataset

colnames(original_dataset)
# [1] "No."                  "URL"                  "Source"               "Price"               
# [5] "Land.area.(acre)"     "Build-up.area.(sqft)" "Property.types"       "Floor"               
# [9] "New.Kampong"          "Mukim"                "Bedrooms"             "Bathrooms"           
# [13] "Advertising.date"    "Land.title"      

column_names <- c("No.","URL","Source","Price","Land.area.(acre)","Build-up.area.(sqft)","Property.types","Floor","New.Kampong","Mukim","Bedrooms","Bathrooms","Advertising.date","Land.title")
colnames(original_dataset) <- column_names
colnames(original_dataset)
# [1] "No."                  "URL"                 
# [3] "Source"               "Price"               
# [5] "Land.area.(acre)"     "Build-up.area.(sqft)"
# [7] "Property.types"       "Floor"               
# [9] "New.Kampong"          "Mukim"               
# [11] "Bedrooms"             "Bathrooms"           
# [13] "Advertising.date"     "Land.title"

str(original_dataset)

#Data Preparation: Property types
unique(original_dataset$Property.types)

original_dataset <- original_dataset %>%
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

colnames(original_dataset)
unique(original_dataset$New.Property.types)

#Data Preparation: Kampong
original_dataset <- original_dataset %>%
  mutate(Kampong = case_when(
    New.Kampong == "Mulaut" ~ "Mulaut",
    New.Kampong == "Bebatik" ~ "Bebatik",
    New.Kampong == "Sungai Hanching" ~ "Sungai Hanching",
    New.Kampong == "Mata-mata" ~ "Mata-Mata",
    New.Kampong == "Mata mata" ~ "Mata-Mata",
    New.Kampong == "Bengkurong" ~ "Bengkurong",
    New.Kampong == "Sungai Liang" ~ "Sungai Liang",
    New.Kampong == "Batong" ~ "Batong",
    New.Kampong == "Beribi" ~ "Beribi",
    New.Kampong == "Pangkalan Gadong" ~ "Pengkalan Gadong",
    New.Kampong == "Jangsak" ~ "Jangsak",
    New.Kampong == "Jerudong" ~ "Jerudong",
    New.Kampong == "Junjongan" ~ "Junjongan",
    New.Kampong == "Katok" ~ "Katok",
    New.Kampong == "Kiulap" ~ "Kiulap",
    New.Kampong == "Limau Manis" ~ "Limau Manis",
    New.Kampong == "Lumapas" ~ "Lumapas",
    New.Kampong == "Lumut" ~ "Lumut",
    New.Kampong == "Madang" ~ "Madang",
    New.Kampong == "Masin" ~ "Masin",
    New.Kampong == "Menglait" ~ "Menglait",
    New.Kampong == "Mentiri" ~ "Mentiri",
    New.Kampong == "Parit" ~ "Parit",
    New.Kampong == "Perumahan Negara Rimba Kawasan 1" ~ "Perumahan Negara Rimba Kawasan 1",
    New.Kampong == "Selayun" ~ "Sengkurong",                                       
    New.Kampong == "Subok" ~ "Subok",                                         
    New.Kampong == "Sungai Tilong" ~ "Sungai Tilong",                                 
    New.Kampong == "Tanah Jambu" ~ "Tanah Jambu",                                 
    New.Kampong == "Tanjong Bunut" ~ "Tanjong Bunut",                                 
    New.Kampong == "Tanjong Nangka" ~ "Tanjong Nangka",                                
    New.Kampong == "Telanai" ~ "Telanai",                                       
    New.Kampong == "Tungku" ~ "Tungku",                                        
    New.Kampong == "Kuala Tutong" ~ "Kuala Tutong",                                
    New.Kampong == "Pasai" ~ "Pasai",                                        
    New.Kampong == "Lambak A" ~ "Lambak A",                                    
    New.Kampong == "Salambigar" ~ "Salambigar",
    New.Kampong == "Kilanas" ~ "Kilanas",
    New.Kampong == "Sengkurong B" ~ "Sengkurong B",                                 
    New.Kampong == "Penabai" ~ "Penabai",                                      
    New.Kampong == "PEKAN KUALA BELAIT" ~ "Pekan Kuala Belait",                           
    New.Kampong == "Kulapis" ~ "Kulapis",                                     
    New.Kampong == "Sengkurong A" ~ "Sengkurong A",                               
    New.Kampong == "Tagap" ~ "Tagap",                                         
    New.Kampong == "Kapok" ~ "Kapok",                                       
    New.Kampong == "Manggis" ~ "Manggis",
    New.Kampong == "Belimbing" ~ "Belimbing",
    New.Kampong == "Perumahan Negara Rimba Kawasan 2" ~ "Perumahan Negara Rimba Kawasan 2",            
    New.Kampong == "Kota Batu" ~ "Kota Batu",                                     
    New.Kampong == "Serasa" ~ "Serasa",                                       
    New.Kampong == "Perkhemahan Berakas" ~ "Perkhemahan Berakas",                         
    New.Kampong == "Kiarong" ~ "Kiarong",                                     
    New.Kampong == "Kasat" ~ "Kasat",
    New.Kampong == "STKRJ Tungku Kawasan 3" ~ "STKRJ Tungku Kawasan 3",
    New.Kampong == "Lambak Kiri" ~ "Lambak Kiri", 
    New.Kampong == "Kianggeh" ~ "Kianggeh",                                    
    New.Kampong == "Sengkurong" ~ "Sengkurong",                                  
    New.Kampong == "Mata-Mata" ~ "Mata-Mata",                                     
    New.Kampong == "Sg. Hanching" ~ "Sungai Hanching",
    New.Kampong == "Bebatik Kulapis" ~ "Kulapis",                               
    New.Kampong == "Tutong" ~ "Kuala Tutong",
    New.Kampong == "Lumut Bay 2" ~ "Lumut",
    New.Kampong == "Sg. Liang" ~ "Sungai Liang",                                     
    New.Kampong == "Pandan A" ~ "Pandan 'A'",                                    
    New.Kampong == "Sg. Akar" ~ "Sungai Akar",
    New.Kampong == "Serusop" ~ "Serusop",                                       
    New.Kampong == "Bangsingong" ~ "Keriam",                                  
    New.Kampong == "Panchor" ~ "Panchor",                                      
    New.Kampong == "Sg. Tilong" ~ "Sungai Tilong",                                    
    New.Kampong == "Dadap" ~ "Kilanas",                                         
    New.Kampong == "Kelugos" ~ "Sungai Kelugos",                                     
    New.Kampong == "Berakas" ~ "Perkhemahan Berakas",                                    
    New.Kampong == "Kuala Lurah" ~ "Kuala Lurah",                                  
    New.Kampong == "Rimba" ~ "Rimba",
    New.Kampong == "Lambak" ~ "Lambak",
    New.Kampong == "Sg. Tilomg" ~ "Sungai Tilong",
    New.Kampong == "Pekan Tutong" ~ "Kuala Tutong",                                  
    New.Kampong == "Pandan" ~ "Pandan 'A'",
    New.Kampong == "Sg. Lalit" ~ "Sungai Lalit",                                    
    New.Kampong == "Tanjong Maya" ~ "Tanjong Maya",                                
    New.Kampong == "Keriam" ~ "Keriam",                                       
    New.Kampong == "Ban 3A" ~ "Mulaut",                                        
    New.Kampong == "Sg. Kuru" ~ "Sungai Kuru",                                      
    New.Kampong == "Mumong" ~ "Mumong",                                       
    New.Kampong == "Bukit Panggal" ~ "Bukit Panggal",                                
    New.Kampong == "Sg. Tali" ~ "Sungai Tali",
    New.Kampong == "Kilugus" ~ "Kilugus",                                       
    New.Kampong == "Wasan" ~ "Wasan",                                         
    New.Kampong == "Birau" ~ "Birau",                                        
    New.Kampong == "Sengkarai" ~ "Sengkarai",                                   
    New.Kampong == "Sg. Bakong" ~ "Sungai Bakong",                                    
    New.Kampong == "Jln Kecil Sengkarai" ~ "Sengkarai",                          
    New.Kampong == "Bebatik Kilanas" ~ "Kilanas",
    New.Kampong == "Batu Besurat" ~ "Tungku",                                 
    New.Kampong == "Luagan Dudok" ~ "Luagan Dudok",                                 
    New.Kampong == "Luangan Dudok" ~ "Luagan Dudok",                                
    New.Kampong == "Telisai" ~ "Telisai",                                      
    New.Kampong == "Pasai" ~ "Pasai",                              
    New.Kampong == "Kiudang" ~ "Kiudang",                                       
    New.Kampong == "Panchor Dulit" ~ "Panchor Dulit",                                
    New.Kampong == "Panchor Murai" ~ "Panchor Murai",                                 
    New.Kampong == "Sg. Tampoi" ~ "Sungai Tampoi",                                   
    New.Kampong == "Salar" ~ "Salar",                                         
    New.Kampong == "Sg. Tampot" ~ "Sungai Tampoi",                                    
    New.Kampong == "Jerudoong" ~ "Jerudong",                                     
    New.Kampong == "Sg. Asam" ~ "Sungai Asam",                                     
    New.Kampong == "Lambak Kanan" ~ "Lambak",
    New.Kampong == "Sungai Sulok" ~ "Sungai Sulok",                                
    New.Kampong == "Parit (Seringan)" ~ "Parit",                             
    New.Kampong == "Buang Tekurok" ~ "Buang Tekurok",                                 
    New.Kampong == "Sungai Akar" ~ "Sungai Akar",                                   
    New.Kampong == "Not Specified" ~ NA,                                 
    New.Kampong == "Penanjong" ~ "Penanjong",                                     
    New.Kampong == "Lumapas 'A'" ~ "Lumapas",                                   
    New.Kampong == "Jalan Muara" ~ "Mentiri",                                   
    New.Kampong == "Jerudong\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Jerudong",      
    New.Kampong == "Kiarong\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Kiarong",       
    New.Kampong == "Parit\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Parit",        
    New.Kampong == "Selayun\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Sengkurong",       
    New.Kampong == "Berakas\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Perkhemahan Berakas",       
    New.Kampong == "Lumapas\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Lumapas",       
    New.Kampong == "Jangsak\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Jangsak",       
    New.Kampong == "Limau Manis\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Limau Manis",  
    New.Kampong == "Tanjung Bunut\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Tanjung Bunut", 
    New.Kampong == "Lumut\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Lumut",       
    New.Kampong == "Sengkurong\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Sengkurong",    
    New.Kampong == "Kapok\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Kapok",         
    New.Kampong == "Tanah Jambu\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Tanah Jambu",   
    New.Kampong == "Bebatek Kilanas\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Kilanas",   
    New.Kampong == "Rimba\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Rimba",
    New.Kampong == "Subok\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Subok",         
    New.Kampong == "Sengkurong ‘B’" ~ "Sengkurong",                                
    New.Kampong == "Tanjung Bunut \r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Tanjung Bunut", 
    New.Kampong == "Bunut\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Tanjung Bunut",       
    New.Kampong == "Sengkurong A\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Sengkurong",  
    New.Kampong == "Mulaut\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Mulaut",        
    New.Kampong == "Batu Bersurat" ~ "Tungku",                                 
    New.Kampong == "Bengkurong, Masin" ~ "Bengkurong",                             
    New.Kampong == "Kebangsaan Lama" ~ "Sungai Akar",                              
    New.Kampong == "Breaks" ~ NA,                                        
    New.Kampong == "Madewa" ~ "Madewa",                                        
    New.Kampong == "Jangsak\r\n" ~ "Jangsak",                                   
    New.Kampong == "Kulapis\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Kulapis",      
    New.Kampong == "Lambak Kanan ‘B’" ~ "Lambak",                             
    New.Kampong == "Serambungun\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Serambangun", 
    New.Kampong == "Berakas\r\n" ~ "Perkhemahan Berakas",                                   
    New.Kampong == "Mata-mata\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Mata-Mata",  
    New.Kampong == "Mentiri\r\n" ~ "Mentiri",                                   
    New.Kampong == "Mentiri\r\n\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Mentiri",         
    New.Kampong == "Kilanas\r\n\t\t\t\t\t\t\t\t\t\t\t\t\r\n" ~ "Kilanas",       
    New.Kampong == "Kilanas\t\t\t\t\t\t\t\t\t\r\n" ~ "Kilanas",                 
    New.Kampong == "Tanah Jambu\r\n" ~ "Tanah Jambu",
    
  ))

unique(original_dataset$Kampong)
View(original_dataset)

#Data Preparation: Mukim
original_dataset <- original_dataset %>%
  mutate(New.Mukim = case_when(
    Kampong == "Mulaut" ~ "Sengkurong",
    Kampong == "Bebatik" ~ "Pengkalan Batu",
    Kampong == "Sungai Hanching" ~ "Berakas 'B'",
    Kampong == "Mata-Mata" ~ "Gadong 'B'",
    Kampong == "Bengkurong" ~ "Kilanas",
    Kampong == "Sungai Liang" ~ "Liang",
    Kampong == "Batong" ~ "Pengkalan Batu",
    Kampong == "Beribi" ~ "Gadong 'B'",
    Kampong == "Pengkalan Gadong" ~ "Gadong 'B'",
    Kampong == "Jangsak" ~ "Kilanas",
    Kampong == "Jerudong" ~ "Sengkurong",
    Kampong == "Junjongan" ~ "Pengkalan Batu",
    Kampong == "Katok" ~ "Gadong 'A'",
    Kampong == "Kiulap" ~ "Gadong 'B'",
    Kampong == "Limau Manis" ~ "Pengkalan Batu",
    Kampong == "Lumapas" ~ "Lumapas",
    Kampong == "Lumut" ~ "Liang",
    Kampong == "Madang" ~ "Berakas 'B'",
    Kampong == "Masin" ~ "Pengkalan Batu",
    Kampong == "Menglait" ~ "Gadong 'B'",
    Kampong == "Mentiri" ~ "Mentiri",
    Kampong == "Parit" ~ "Amo", 
    Kampong == "Perumahan Negara Rimba Kawasan 1" ~ "Gadong 'A'",
    Kampong == "Sengkurong" ~ "Sengkurong",
    Kampong == "Subok" ~ "Kota Batu",
    Kampong == "Sungai Tilong" ~ "Berakas 'B'",
    Kampong == "Tanah Jambu" ~ "Mentiri",
    Kampong == "Tanjong Bunut" ~ "Kilanas",
    Kampong == "Tanjong Nangka" ~ "Sengkurong",
    Kampong == "Telanai" ~ "Kilanas",
    Kampong == "Tungku" ~ "Gadong 'A'",
    Kampong == "Kuala Tutong" ~ "Pekan Tutong",
    Kampong == "Pasai" ~ "Sengkurong",
    Kampong == "Lambak A" ~ "Berakas 'A'",
    Kampong == "Salambigar" ~ "Berakas 'B'",
    Kampong == "Penabai" ~ "Pekan Tutong",
    Kampong == "Pekan Kuala Belait" ~ "Kuala Belait",
    Kampong == "Kulapis" ~ "Sengkurong",
    Kampong == "Tagap" ~ "Sengkurong",
    Kampong == "Kapok" ~ "Serasa",
    Kampong == "Manggis" ~ "Berakas 'B'",
    Kampong == "Belimbing" ~ "Kota Batu",
    Kampong == "Perumahan Negara Rimba Kawasan 2" ~ "Gadong 'A'",
    Kampong == "Kota Batu" ~ "Kota Batu", 
    Kampong == "Serasa" ~ "Serasa",
    Kampong == "Perkhemahan Berakas" ~ "Berakas 'A'",
    Kampong == "Kiarong" ~ "Gadong 'B'",
    Kampong == "Kasat" ~ "Lumapas",
    Kampong == "Kianggeh" ~ "Kianggeh",
    Kampong == "Mata-Mata" ~ "Gadong 'B'",
    Kampong == "Pandan 'A'" ~ "Kuala Belait",
    Kampong == "Sungai Akar" ~ "Berakas 'B'",
    Kampong == "Serusop" ~ "Berakas 'A'",
    Kampong == "Keriam" ~ "Keriam",
    Kampong == "Panchor" ~ "Mentiri",
    Kampong == "Dadap" ~ "Kilanas",
    Kampong == "Sungai Kelugos" ~ "Keriam",
    Kampong == "Kuala Lurah" ~ "Pengkalan Batu",
    Kampong == "Rimba" ~ "Gadong 'A'",
    Kampong == "Sungai Lalit" ~ "Liang",
    Kampong == "Tanjong Maya" ~ "Tanjong Maya",
    Kampong == "Keriam" ~ "Keriam",
    Kampong == "Sungai Kuru" ~ "Liang",
    Kampong == "Mumong" ~ "Kuala Belait",
    Kampong == "Bukit Panggal" ~ "Keriam",
    Kampong == "Sungai Tali" ~ "Liang",
    Kampong == "Kilugus" ~ "Lumapas",
    Kampong == "Wasan" ~ "Pengkalan Batu",
    Kampong == "Birau" ~ "Kiudang",
    Kampong == "Sengkarai" ~ "Pekan Tutong",
    Kampong == "Sungai Bakong" ~ "Liang",
    Kampong == "Batu Besurat" ~ "Gadong",
    Kampong == "Luagan Dudok" ~ "Keriam",
    Kampong == "Telisai" ~ "Telisai",
    Kampong == "Kiudang" ~ "Kiudang",
    Kampong == "Panchor Murai" ~ "Pengkalan Batu",
    Kampong == "Sungai Tampoi" ~ "Sengkurong",
    Kampong == "Salar" ~ "Mentiri",
    Kampong == "Sungai Asam" ~ "Lumapas",
    Kampong == "Sungai Sulok" ~ "Bangar",
    Kampong == "Buang Tekurok" ~ "Lumapas",
    Kampong == "Penanjong" ~ "Pekan Tutong",
    Kampong == "Tanjung Bunut" ~ "Kilanas",
    Kampong == "Baru Besurat" ~ "Gadong",
    Kampong == "Madewa" ~ "Kilanas",
    Kampong == "Serambangun" ~ "Pekan Tutong",
    Kampong == "Bebatik Kilanas" ~ "Kilanas",
    Kampong == "Rimba" ~ "Gadong 'A'",
    Kampong == "Kilanas" ~ "Kilanas",
    Kampong == "Sengkurong B" ~ "Sengkurong",
    Kampong == "Lambak" ~ "Berakas 'A'"
    
  ))

#Data Cleaning: Land title
unique(original_dataset$Land.title)

original_dataset <- original_dataset %>%
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

unique(original_dataset$New.Land.Title)
colnames(original_dataset)

#Data Cleaning: Removing old dataset
original_dataset <- original_dataset %>%
  select(URL, Source, Price, `Land.area.(acre)`,`Build-up.area.(sqft)`, 
         New.Property.types, Floor, Bedrooms, Bathrooms, Kampong, 
         New.Mukim, Advertising.date, New.Land.Title)

original_dataset <- original_dataset %>%
  select(-No., -Property.types,-New.Kampong, -Mukim, -Land.title)

#Data Cleaning: Changing column names
colnames(original_dataset)
column_names <- c("URL","Source","Price","Acre","Sqft","Property.types","Floor", "Bedrooms",
                  "Bathrooms", "Kampong","Mukim","Quarters","Land.title")
colnames(original_dataset) <- column_names
colnames(original_dataset)

#Create an excel file without Land.title column
write_xlsx(original_dataset,"dataset-land-title.xlsx")

original_dataset <- read_excel("data/compiled dataset/dataset-land-title.xlsx")
original_dataset <- original_dataset %>%
  select(-Land.title)

colnames(original_dataset)
View(original_dataset)

write_xlsx(original_dataset,"modified.dataset.xlsx")

#Inspecting NA rows
NA_rows <- !complete.cases(original_dataset)

NA_rows_indices <- which(NA_rows)
NA_rows_data <- original_dataset[NA_rows,]
print(NA_rows_indices)

original_dataset <- original_dataset %>%
  filter(!is.na(Kampong))
original_dataset <- original_dataset %>%
  filter(!is.na(Price))

original_dataset <- read_excel("data/compiled dataset/dataset.xlsx")
