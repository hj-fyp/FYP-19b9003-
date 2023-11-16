#Adjusting 'Price' variable
original_dataset$Modified.price <- original_dataset$Price / 1000

hp_plot_0$modified.price <- hp_plot_0$price / 1000

#Adjusting 'Sqft' variable 
original_dataset$Modified.sqft <- original_dataset$Sqft * 1000

#Original model 
original_dataset$Property.types <- as.factor(original_dataset$Property.types)
original_dataset$Quarters <- as.factor(original_dataset$Quarters)

model <- lm(Price ~ Sqft + Acre + Property.types + Floor + Bedrooms + Bathrooms + Quarters, data = original_dataset)
summary(model)

unique(original_dataset$Quarters)

model1 <- update(model, .~. -Quarters)
summary(model1)

model2 <- update(model1, .~. -Floor)
summary(model2)

##--MODIFIED MODEL--------------------------------------------------------------
modified_model <- lm(Modified.price ~ Modified.sqft + Acre + Property.types + Floor + Bedrooms + Bathrooms + Quarters, data = original_dataset)
summary(modified_model)

modified_model1 <- update(modified_model, .~. -Quarter)
summary(modified_model1)

modified_model2 <- update(modified_model1, .~. -Floor)
summary(modified_model2)



library(tidyverse)
library(readr)

calculate_means <- function(property_dataset, quarters, property.types){
  property_dataset %>%
    summarise(
      mean_acre = mean(acre),
      mean_sqft = mean(sqft),
      mean_bedrooms = mean(bedrooms),
      mean_bathrooms = mean(bathrooms)
    )
}

mukimdata <- read_csv(“mukimdata.csv”)
mkm_data <- mukimdata %>%
  filter(mukim %in% unique(property_dataset$mukim))

predict_price <- function(mkm_data, quarters, property.types) {
  property_means <- calculate_means(property_dataset, quarters, property.types)
  
  prediction_data <- mkm_data %>%
    reframe(
      acre = property_means$mean_acre,
      sqft = property_means$mean_sqft,
      bedrooms = property_means$mean_bedrooms,
      bathrooms = property_means$mean_bathrooms,
      mukim = mukim,
      X = X,
      Y = Y,
      quarters = as.factor(quarters), 
      property.types = as.factor(property.types)
    )
  
  predictions <- predict(predicted_model1, newdata = prediction_data)
  prediction_data$predicted.price <- predictions
  
  return(prediction_data)
}


