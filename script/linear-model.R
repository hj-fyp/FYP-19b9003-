library(tidyverse)
library(dplyr)
library(readxl)

#Linear model: Full model
attach(original_dataset)
str(original_dataset)

original_dataset$Property.types <- as.factor(original_dataset$Property.types)
original_dataset$Quarters <- as.factor(original_dataset$Quarters)

model <- lm(Price ~ Acre + Sqft + Property.types + Floor + Bedrooms + Bathrooms + Quarters, data = original_dataset)
summary(model)
# 
# Call:
#   lm(formula = Price ~ Acre + Sqft + Property.types + Floor + Bedrooms + 
#        Bathrooms + Quarters, data = original_dataset)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -368415  -30365   -1541   26014  821867 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)                 -1.216e+05  1.348e+04  -9.026  < 2e-16 ***
#   Acre                         4.744e+05  4.359e+04  10.885  < 2e-16 ***
#   Sqft                         6.100e+01  3.257e+00  18.729  < 2e-16 ***
#   Property.typesSemi-detached -7.258e+02  5.192e+03  -0.140 0.888852    
# Property.typesTerrace       -2.541e+04  7.601e+03  -3.343 0.000858 ***
#  Floor                        3.496e+03  6.398e+03   0.546 0.584935    
# Bedrooms                     3.224e+04  3.779e+03   8.531  < 2e-16 ***
# Bathrooms                    1.916e+04  2.943e+03   6.511 1.15e-10 ***
# Quarters1                    1.626e+03  6.291e+03   0.259 0.796058    
# Quarters2                   -6.586e+03  6.260e+03  -1.052 0.293054    
# Quarters3                   -9.527e+02  6.513e+03  -0.146 0.883734    
# Quarters4                    9.672e+03  6.157e+03   1.571 0.116514    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 66020 on 1061 degrees of freedom
# Multiple R-squared:  0.7454,	Adjusted R-squared:  0.7428 
# F-statistic: 282.4 on 11 and 1061 DF,  p-value: < 2.2e-16

mod_bb <- lm(Price ~ Acre + Sqft + Floor + Bedrooms + Bathrooms + Quarters, data = original_dataset)
summary(mod_bb)

# Call:
#   lm(formula = Price ~ Acre + Sqft + Floor + Bedrooms + Bathrooms + 
#        Quarters, data = original_dataset)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -392060  -30510    -823   26329  816228 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -1.235e+05  1.325e+04  -9.322  < 2e-16 ***
# Acre         5.079e+05  4.033e+04  12.594  < 2e-16 ***
# Sqft         6.082e+01  3.271e+00  18.592  < 2e-16 ***
# Floor        1.576e+03  6.352e+03   0.248    0.804    
# Bedrooms     3.171e+04  3.791e+03   8.362  < 2e-16 ***
# Bathrooms    1.985e+04  2.936e+03   6.762 2.25e-11 ***
# Quarters1    1.168e+03  6.315e+03   0.185    0.853    
# Quarters2   -7.003e+03  6.289e+03  -1.114    0.266    
# Quarters3   -3.812e+03  6.417e+03  -0.594    0.553    
# Quarters4    9.547e+03  6.119e+03   1.560    0.119    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 66350 on 1063 degrees of freedom
# Multiple R-squared:  0.7424,	Adjusted R-squared:  0.7402 
# F-statistic: 340.4 on 9 and 1063 DF,  p-value: < 2.2e-16

mod_types <- lm(Price ~ Acre + Sqft + Floor + Property.types + Quarters, data = original_dataset)
summary(mod_types)

# Call:
#   lm(formula = Price ~ Acre + Sqft + Floor + Property.types + Quarters, 
#      data = original_dataset)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -464743  -29822   -3794   25557 1063240 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)                 -65470.531  13022.755  -5.027 5.83e-07 ***
# Acre                        577700.198  46647.016  12.385  < 2e-16 ***
# Sqft                            85.961      2.935  29.289  < 2e-16 ***
# Floor                        43433.446   6180.562   7.027 3.75e-12 ***
# Property.typesSemi-detached  -9972.306   5592.876  -1.783 0.074866 .  
# Property.typesTerrace       -31617.099   8227.121  -3.843 0.000129 ***
# Quarters1                     4259.234   6836.599   0.623 0.533415    
# Quarters2                    -5119.726   6795.383  -0.753 0.451369    
# Quarters3                     5890.906   7060.800   0.834 0.404293    
# Quarters4                    11496.701   6693.712   1.718 0.086172 .  
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 71790 on 1063 degrees of freedom
# Multiple R-squared:  0.6984,	Adjusted R-squared:  0.6959 
# F-statistic: 273.5 on 9 and 1063 DF,  p-value: < 2.2e-16

log_model <- lm(log(Price) ~ Acre + Sqft + Property.types + Floor + Bedrooms + Bathrooms + Quarters, data = original_dataset)
summary(log_model)

# Call:
#   lm(formula = log(Price) ~ Acre + Sqft + Property.types + Floor + 
#        Bedrooms + Bathrooms + Quarters, data = original_dataset)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -0.82567 -0.10336 -0.00077  0.10156  0.83153 
# 
# Coefficients:
#                                 Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)                  1.127e+01  3.419e-02 329.650  < 2e-16 ***
#   Acre                         1.071e+00  1.135e-01   9.434  < 2e-16 ***
#   Sqft                         1.394e-04  8.439e-06  16.513  < 2e-16 ***
#   Property.typesSemi-detached -5.066e-02  1.348e-02  -3.758 0.000181 ***
#   Property.typesTerrace       -1.742e-01  1.963e-02  -8.875  < 2e-16 ***
#   Floor                        1.495e-01  1.658e-02   9.017  < 2e-16 ***
#   Bedrooms                     6.617e-02  9.840e-03   6.725 2.86e-11 ***
#   Bathrooms                    6.548e-02  7.649e-03   8.561  < 2e-16 ***
#   Quarters                     4.126e-03  3.678e-03   1.122 0.262155    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.1724 on 1065 degrees of freedom
# Multiple R-squared:  0.7697,	Adjusted R-squared:  0.768 
# F-statistic:   445 on 8 and 1065 DF,  p-value: < 2.2e-16
