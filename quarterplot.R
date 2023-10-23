library(tidyverse)
library(dplyr)
library(bruneimap)

##--DATA PREPARATION----------------------------------------------------------------------

hp_dataset <- original_dataset

hp_dataset %>%
  select(-modified.sqft, -url, -source, -quarter,-kampong, price, modified.price, acre, modified.acre, sqft, floor, bedrooms, bathrooms,
         quarters, Kampong, mukim) %>%
  rename(kampong = Kampong)

hp_dataset_bkp1 <- hp_dataset

##--LEFT JOIN----------------------------------------------------------------------

hp_dataset <- hp_dataset_bkp1

hp_dataset <- hp_dataset %>%
  rename(prev.kampong = kampong) %>%
  rename(kampong = Kampong)

hp_dataset <- hp_dataset %>%
  left_join(bn_kpg_level_data, by = "kampong") 

hp_dataset <- hp_dataset %>%
  rename(mukim = mukim.y) %>%
  left_join(mkm_sf, by = "mukim") 

hp_dataset_bkp2 <- hp_dataset
colnames(hp_dataset)

hp_dataset <- hp_dataset %>%
  select(-url,-source,-prev.kampong, -mukim.x, -quarter,-modified.sqft,-id.x,-id.y,-district.x) %>%
  rename(district = district.y)
  

##--QUARTERLY----------------------------------------------------------------------

hp_dataset0 <- hp_dataset[hp_dataset$quarters == 0, ] 
hp_dataset1 <- hp_dataset[hp_dataset$quarters == 1, ]
hp_dataset2 <- hp_dataset[hp_dataset$quarters == 2, ]
hp_dataset3 <- hp_dataset[hp_dataset$quarters == 3, ]
hp_dataset4 <- hp_dataset[hp_dataset$quarters == 4, ]


##--DATASET QUARTER == 0----------------------------------------------------------------------

attach(hp_dataset0)
mean_acre <- mean(hp_dataset0$acre)
mean_sqft <- mean(hp_dataset0$sqft)
mean_floor <- mean(hp_dataset0$floor)
mean_bedrooms <- mean(hp_dataset0$bedrooms)
mean_bathrooms <- mean(hp_dataset0$bathrooms)

new_data0 <- mutate(hp_dataset, acre = mean_acre, sqft = mean_sqft, floor = mean_floor, bedrooms = mean_bedrooms, bathrooms = mean_bathrooms)

model0 <- lm(price ~ X + Y, new_data0)
summary(model0)

predprice <- predict(model0, newdata = mkm_sf)
mkm_sf$predprice <- predprice

q0_plot <- ggplot(mkm_sf, aes(fill = predprice)) +
  geom_sf()

filename <- "mapplot0.png"

ggsave(filename, plot = q0_plot, scale = 1)

##--DATASET QUARTER == 1----------------------------------------------------------------------

attach(hp_dataset1)
mean_acre1 <- mean(hp_dataset1$acre)
mean_sqft1 <- mean(hp_dataset1$sqft)
mean_floor1 <- mean(hp_dataset1$floor)
mean_bedrooms1 <- mean(hp_dataset1$bedrooms)
mean_bathrooms1 <- mean(hp_dataset1$bathrooms)

new_data1 <- mutate(hp_dataset1, acre = mean_acre1, sqft = mean_sqft1, floor = mean_floor1, bedrooms = mean_bedrooms1, bathrooms = mean_bathrooms1)

model1 <- lm(price ~ X + Y, new_data1)
summary(model1)

new_data1$log_price <- log(new_data1$price)
new_data1$log_X <- log(new_data1$X)
new_data1$log_Y <- log(new_data1$Y)
model_log <- lm(log_price ~ log_X + log_Y, data = new_data1)
summary(model_log)

mkm_sf$log_X <- log(mkm_sf$X)
mkm_sf$log_Y <- log(mkm_sf$Y)
predprice1 <- predict(model_log, newdata = mkm_sf)

predprice1log <- predict(model_log, newdata = mkm_sf)
predictedprice1 <- exp(predprice1log)
mkm_sf$predprice1 <- predictedprice1

q1_plot <- ggplot(mkm_sf, aes(fill = predprice1)) +
  geom_sf()

filename1 <- "mapplot1.png"

ggsave(filename1, plot = q1_plot, scale = 1)

##--DATASET QUARTER == 2----------------------------------------------------------------------

attach(hp_dataset2)
mean_acre2 <- mean(hp_dataset2$acre)
mean_sqft2 <- mean(hp_dataset2$sqft)
mean_floor2 <- mean(hp_dataset2$floor)
mean_bedrooms2 <- mean(hp_dataset2$bedrooms)
mean_bathrooms2 <- mean(hp_dataset2$bathrooms)

new_data2 <- mutate(hp_dataset2, acre = mean_acre2, sqft = mean_sqft2, floor = mean_floor2, bedrooms = mean_bedrooms2, bathrooms = mean_bathrooms2)

model2 <- lm(price ~ X + Y, new_data2)
summary(model2)

predprice2 <- predict(model2, newdata = mkm_sf)
mkm_sf$predprice2 <- predprice2
unique(predprice2)

q2_plot <- ggplot(mkm_sf, aes(fill = predprice2)) +
  geom_sf()

##--DATASET QUARTER == 4----------------------------------------------------------------------

attach(hp_dataset4)

mean_acre4 <- mean(hp_dataset4$acre)
mean_sqft4 <- mean(hp_dataset4$sqft)
mean_floor4 <- mean(hp_dataset4$floor)
mean_bedrooms4 <- mean(hp_dataset4$bedrooms)
mean_bathrooms4 <- mean(hp_dataset4$bathrooms)

new_data4 <- mutate(hp_dataset4, acre = mean_acre4, sqft = mean_sqft4, floor = mean_floor4, bedrooms = mean_bedrooms4, bathrooms = mean_bathrooms4)

model4 <- lm(price ~ X + Y, new_data4)
summary(model4)

predprice4 <- predict(model4, newdata = mkm_sf)
mkm_sf$predprice4 <- predprice4
unique(predprice4)

ggplot(mkm_sf, aes(fill = predprice4)) +
  geom_sf()

##--DATASET QUARTER == 3----------------------------------------------------------------------

attach(hp_dataset3)
mean_acre3 <- mean(hp_dataset3$acre)
mean_sqft3 <- mean(hp_dataset3$sqft)
mean_floor3 <- mean(hp_dataset3$floor)
mean_bedrooms3 <- mean(hp_dataset3$bedrooms)
mean_bathrooms3 <- mean(hp_dataset3$bathrooms)

new_data3 <- mutate(hp_dataset3, acre = mean_acre3, sqft = mean_sqft3, floor = mean_floor3, bedrooms = mean_bedrooms3, bathrooms = mean_bathrooms3)

model3 <- lm(price ~ X + Y, new_data3)
summary(model3)

predprice3 <- predict(model3, newdata = mkm_sf)
mkm_sf$predprice3 <- predprice3
unique(predprice3)

ggplot(mkm_sf, aes(fill = predprice3)) +
  geom_sf()

















