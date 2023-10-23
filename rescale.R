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

