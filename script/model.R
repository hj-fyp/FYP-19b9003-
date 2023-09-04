library(readxl)

# Linear model: Full model
dataset1 <- read_xlsx("property-dataset.xlsx") 
dataset1
View(dataset1)

str(dataset1)
dataset1$Price <- as.numeric(dataset1$Price)
dataset1$`Land.area.(acre)` <- as.numeric(dataset1$`Land.area.(acre)`)
dataset1$`Build-up.area.(sqft)` <- as.numeric(dataset1$`Build-up.area.(sqft)`)
dataset1$Property.types <- as.factor(dataset1$Property.types)
dataset1$Property.types <- as.numeric(dataset1$Property.types)
dataset1$New.Kampong <- as.factor(dataset1$New.Kampong)
dataset1$New.Kampong <- as.numeric(dataset1$New.Kampong)
dataset1$Mukim <- as.factor(dataset1$Mukim)
dataset1$Mukim <- as.numeric(dataset1$Mukim)
dataset1$Land.title <- as.factor(dataset1$Land.title)
dataset1$Land.title <- as.numeric(dataset1$Land.title)

model1 <- lm (Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + Property.types + Floor + New.Kampong + Mukim + Bedrooms + Bathrooms + Quarters + Land.title, data = dataset1)
summary(model1)

# Call:
#   lm(formula = Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + 
#        Property.types + Floor + New.Kampong + Mukim + Bedrooms + 
#        Bathrooms + Quarters + Land.title, data = dataset1)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -401943  -26773   -3304   25536  533098 
# 
# Coefficients:
# Estimate Std. Error t value Pr(>|t|)    
# (Intercept)            -27011.033  30106.309  -0.897 0.370000    
# `Land.area.(acre)`     292662.148  45826.728   6.386 3.55e-10 ***
# `Build-up.area.(sqft)`     76.893      3.754  20.485  < 2e-16 ***
# Property.types         -10028.543   5184.994  -1.934 0.053593 .  
# Floor                    1937.750   7293.361   0.266 0.790577    
# New.Kampong                82.137    103.817   0.791 0.429174    
# Mukim                   -2381.919    475.633  -5.008 7.36e-07 ***
#   Bedrooms                20931.494   5345.622   3.916 0.000101 ***
#   Bathrooms               15740.331   3664.564   4.295 2.05e-05 ***
#   Quarters                 2668.361   2303.539   1.158 0.247200    
# Land.title              -7178.066   8314.600  -0.863 0.388334    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 60000 on 566 degrees of freedom
# (502 observations deleted due to missingness)
# Multiple R-squared:  0.8093,	Adjusted R-squared:  0.8059 
# F-statistic: 240.2 on 10 and 566 DF,  p-value: < 2.2e-16

# Linear model : Quarter 3 2022

dataset2 <- read_xlsx("quarterly-list.xlsx", sheet = "Q3 2022")
colnames(dataset2)
column_names <- c("URL","Source","Price","Land.area.(acre)","Build-up.area.(sqft)","Property.types","Floor","New.Kampong","Mukim","Bedrooms","Bathrooms","Advertising.date","Land.title")
colnames(dataset2) <- column_names

dataset2$Price <- as.numeric(dataset2$Price)
dataset2$`Land.area.(acre)` <- as.numeric(dataset2$`Land.area.(acre)`)
dataset2$`Build-up.area.(sqft)` <- as.numeric(dataset2$`Build-up.area.(sqft)`)
dataset2$Property.types <- as.factor(dataset2$Property.types)
dataset2$Property.types <- as.numeric(dataset2$Property.types)
dataset2$New.Kampong <- as.factor(dataset2$New.Kampong)
dataset2$New.Kampong <- as.numeric(dataset2$New.Kampong)
dataset2$Mukim <- as.factor(dataset2$Mukim)
dataset2$Mukim <- as.numeric(dataset2$Mukim)
dataset2$Land.title <- as.factor(dataset2$Land.title)
dataset2$Land.title <- as.numeric(dataset2$Land.title)


model2 <- lm(Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + Property.types + Floor + New.Kampong + Mukim + Bedrooms + Bathrooms, data = dataset2)
summary(model2)

# Call:
#   lm(formula = Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + 
#        Property.types + Floor + New.Kampong + Mukim + Bedrooms + 
#        Bathrooms, data = dataset2)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -206844  -32712   -1102   27744  566311 
# 
# Coefficients:
#                          Estimate Std. Error t value Pr(>|t|)    
# (Intercept)            -1.627e+05  4.670e+04  -3.484 0.000593 ***
# `Land.area.(acre)`      7.457e+05  1.235e+05   6.039 6.32e-09 ***
# `Build-up.area.(sqft)`  3.926e+01  9.389e+00   4.181 4.15e-05 ***
# Property.types          9.019e+03  1.201e+04   0.751 0.453450    
# Floor                  -1.598e+04  1.895e+04  -0.843 0.399967    
# New.Kampong             4.469e+02  3.082e+02   1.450 0.148508    
# Mukim                  -4.214e+03  9.947e+02  -4.236 3.31e-05 ***
# Bedrooms                5.528e+04  7.502e+03   7.369 3.21e-12 ***
# Bathrooms               2.554e+04  6.742e+03   3.789 0.000194 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 66200 on 226 degrees of freedom
# (20 observations deleted due to missingness)
# Multiple R-squared:  0.7517,	Adjusted R-squared:  0.7429 
# F-statistic: 85.51 on 8 and 226 DF,  p-value: < 2.2e-16
# Linear model : Q4 2022

dataset3 <- read_xlsx("quarterly-list.xlsx", sheet = "Q4 2022")
colnames(dataset3)
column_names <- c("URL","Source","Price","Land.area.(acre)","Build-up.area.(sqft)","Property.types","Floor","New.Kampong","Mukim","Bedrooms","Bathrooms","Advertising.date","Land.title")
colnames(dataset3) <- column_names
View(dataset3)

dataset3$Price <- as.numeric(dataset3$Price)
dataset3$`Land.area.(acre)` <- as.numeric(dataset3$`Land.area.(acre)`, na.rm=TRUE)
dataset3$`Build-up.area.(sqft)` <- as.numeric(dataset3$`Build-up.area.(sqft)`)
dataset3$Property.types <- as.numeric(dataset3$Property.types, na.rm = TRUE)
dataset3$New.Kampong <- as.numeric(dataset3$New.Kampong, na.rm = TRUE)
dataset3$Mukim <- as.numeric(dataset3$Mukim, na.rm = TRUE)
dataset3$Land.title <- as.numeric(dataset3$Land.title, na.rm = TRUE)

model3 <- lm(Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + Property.types + Floor + New.Kampong + Mukim + Land.title + Bedrooms + Bathrooms, data = dataset3)
summary(model3)

# Call:
#   lm(formula = Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + 
#        Property.types + Floor + New.Kampong + Mukim + Land.title + 
#        Bedrooms + Bathrooms, data = dataset3)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -39.217  -4.741   0.098   5.620  20.111 
# 
# Coefficients:
#                        Estimate Std. Error t value Pr(>|t|)    
# (Intercept)             7.26597    8.97308   0.810    0.420    
# `Land.area.(acre)`      0.06639    0.04172   1.591    0.114    
# `Build-up.area.(sqft)`  0.40808    0.04139   9.859  < 2e-16 ***
# Property.types          0.51003    2.44537   0.209    0.835    
# Floor                   4.26047    2.84819   1.496    0.137    
# New.Kampong             0.06237    0.05418   1.151    0.252    
# Mukim                  -0.66298    0.16474  -4.024 9.95e-05 ***
# Land.title             -5.30201    3.51864  -1.507    0.134    
# Bedrooms                1.46322    1.59299   0.919    0.360    
# Bathrooms               0.34024    1.23943   0.275    0.784    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 9.695 on 122 degrees of freedom
# (66 observations deleted due to missingness)
# Multiple R-squared:  0.7956,	Adjusted R-squared:  0.7805 
# F-statistic: 52.77 on 9 and 122 DF,  p-value: < 2.2e-16
# 

# Linear model : Q1 2023
dataset4 <- read_xlsx("quarterly-list.xlsx", sheet = "Q1 2023")
colnames(dataset4)
column_names <- c("URL","Source","Price","Land.area.(acre)","Build-up.area.(sqft)","Property.types","Floor","New.Kampong","Mukim","Bedrooms","Bathrooms","Advertising.date","Land.title")
colnames(dataset4) <- column_names

dataset4$Price <- as.numeric(dataset4$Price)
dataset4$`Land.area.(acre)` <- as.numeric(dataset4$`Land.area.(acre)`, na.rm=TRUE)
dataset4$`Build-up.area.(sqft)` <- as.numeric(dataset4$`Build-up.area.(sqft)`)
dataset4$Property.types <- as.factor(dataset4$Property.types)
dataset4$Property.types <- as.numeric(dataset4$Property.types, na.rm = TRUE)
dataset4$New.Kampong <- as.factor(dataset4$New.Kampong)
dataset4$New.Kampong <- as.numeric(dataset4$New.Kampong, na.rm = TRUE)
dataset4$Mukim <- as.factor(dataset4$Mukim)
dataset4$Mukim <- as.numeric(dataset4$Mukim, na.rm = TRUE)
dataset4$Land.title <- as.factor(dataset4$Land.title)
dataset4$Land.title <- as.numeric(dataset4$Land.title, na.rm = TRUE)

model4 <- lm(Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + Property.types + Floor + New.Kampong + Mukim + Land.title + Bedrooms + Bathrooms, data = dataset4)
summary(model4)

# Call:
#   lm(formula = Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + 
#        Property.types + Floor + New.Kampong + Mukim + Land.title + 
#        Bedrooms + Bathrooms, data = dataset4)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -126679  -17792    3961   18347  126108 
# 
# Coefficients:
#                         Estimate Std. Error t value Pr(>|t|)    
# (Intercept)            -68716.386  34490.834  -1.992 0.048140 *  
# `Land.area.(acre)`        899.804    194.115   4.635 7.65e-06 ***
# `Build-up.area.(sqft)`     87.486      6.814  12.839  < 2e-16 ***
# Property.types           1403.183   8226.302   0.171 0.864788    
# Floor                   11236.607  10282.811   1.093 0.276241    
# New.Kampong               508.833    239.220   2.127 0.035041 *  
# Mukim                   -2768.621    695.227  -3.982 0.000106 ***
# Land.title              -4249.056  11587.873  -0.367 0.714370    
# Bedrooms                14345.648   7244.055   1.980 0.049483 *  
# Bathrooms                7029.807   5617.247   1.251 0.212699    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 38000 on 151 degrees of freedom
# (39 observations deleted due to missingness)
# Multiple R-squared:  0.9325,	Adjusted R-squared:  0.9285 
# F-statistic: 231.7 on 9 and 151 DF,  p-value: < 2.2e-16

dataset5 <- read_xlsx("quarterly-list.xlsx", sheet = "Q2 2023")
colnames(dataset5)
column_names <- c("URL","Source","Price","Land.area.(acre)","Build-up.area.(sqft)","Property.types","Floor","New.Kampong","Mukim","Bedrooms","Bathrooms","Advertising.date","Land.title")
colnames(dataset5) <- column_names
View(dataset5)

dataset5$Price <- as.numeric(dataset5$Price)
dataset5$`Land.area.(acre)` <- as.numeric(dataset5$`Land.area.(acre)`, na.rm=TRUE)
dataset5$`Build-up.area.(sqft)` <- as.numeric(dataset5$`Build-up.area.(sqft)`)
dataset5$Property.types <- as.factor(dataset5$Property.types)
dataset5$Property.types <- as.numeric(dataset5$Property.types, na.rm = TRUE)
dataset5$New.Kampong <- as.factor(dataset5$New.Kampong)
dataset5$New.Kampong <- as.numeric(dataset5$New.Kampong, na.rm = TRUE)
dataset5$Mukim <- as.factor(dataset5$Mukim)
dataset5$Mukim <- as.numeric(dataset5$Mukim, na.rm = TRUE)
dataset5$Land.title <- as.factor(dataset5$Land.title)
dataset5$Land.title <- as.numeric(dataset5$Land.title, na.rm = TRUE)

model5 <- lm(Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + Property.types + Floor + New.Kampong + Mukim + Land.title + Bedrooms + Bathrooms, data = dataset5)
summary(model5)

# Call:
#   lm(formula = Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + 
#        Property.types + Floor + New.Kampong + Mukim + Land.title + 
#        Bedrooms + Bathrooms, data = dataset5)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -101693  -20393    1411   21654  130557 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)            -28134.109  47289.617  -0.595 0.553009    
# `Land.area.(acre)`     476768.580 137986.059   3.455 0.000761 ***
#   `Build-up.area.(sqft)`    144.213      7.426  19.420  < 2e-16 ***
#   Property.types            919.809   8506.092   0.108 0.914069    
# Floor                   10951.113   9720.524   1.127 0.262161    
# New.Kampong               295.694    297.490   0.994 0.322241    
# Mukim                   -1060.251    929.550  -1.141 0.256305    
# Land.title               2704.033  14523.532   0.186 0.852616    
# Bedrooms               -26456.681   9872.263  -2.680 0.008399 ** 
#   Bathrooms                4710.825   5672.700   0.830 0.407940    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 38780 on 120 degrees of freedom
# (70 observations deleted due to missingness)
# Multiple R-squared:  0.9247,	Adjusted R-squared:  0.919 
# F-statistic: 163.7 on 9 and 120 DF,  p-value: < 2.2e-16

# Linear model : Q3 2023

dataset6 <- read_xlsx("quarterly-list.xlsx", sheet = "Q3 2023")
colnames(dataset6)
column_names <- c("URL","Source","Price","Land.area.(acre)","Build-up.area.(sqft)","Property.types","Floor","New.Kampong","Mukim","Bedrooms","Bathrooms","Advertising.date","Land.title")
colnames(dataset6) <- column_names
View(dataset6)

dataset6$Price <- as.numeric(dataset6$Price)
dataset6$`Land.area.(acre)` <- as.numeric(dataset6$`Land.area.(acre)`, na.rm=TRUE)
dataset6$`Build-up.area.(sqft)` <- as.numeric(dataset6$`Build-up.area.(sqft)`)
dataset6$Property.types <- as.factor(dataset6$Property.types)
dataset6$Property.types <- as.numeric(dataset6$Property.types, na.rm = TRUE)
dataset6$New.Kampong <- as.factor(dataset6$New.Kampong)
dataset6$New.Kampong <- as.numeric(dataset6$New.Kampong, na.rm = TRUE)
dataset6$Mukim <- as.factor(dataset6$Mukim)
dataset6$Mukim <- as.numeric(dataset6$Mukim, na.rm = TRUE)
dataset6$Land.title <- as.factor(dataset6$Land.title)
dataset6$Land.title <- as.numeric(dataset6$Land.title, na.rm = TRUE)

model6 <- lm(Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + Property.types + Floor + New.Kampong + Mukim + Land.title + Bedrooms + Bathrooms, data = dataset6)
summary(model6)

# Call:
#   lm(formula = Price ~ `Land.area.(acre)` + `Build-up.area.(sqft)` + 
#        Property.types + Floor + New.Kampong + Mukim + Land.title + 
#        Bedrooms + Bathrooms, data = dataset6)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -176350  -33922   -6285   26052  165250 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)            -71360.811  36135.574  -1.975  0.05020 .  
# `Land.area.(acre)`     505915.321  94784.700   5.338 3.58e-07 ***
#   `Build-up.area.(sqft)`     31.242      6.844   4.565 1.06e-05 ***
#   Property.types         -26787.771   8895.996  -3.011  0.00307 ** 
#   Floor                   39420.811  14576.211   2.704  0.00767 ** 
#   New.Kampong               112.582    324.749   0.347  0.72934    
# Mukim                   -2403.050    977.456  -2.458  0.01514 *  
#   Land.title               -430.682   2603.348  -0.165  0.86883    
# Bedrooms                39579.169   9560.380   4.140 5.89e-05 ***
#   Bathrooms               15785.111   6110.573   2.583  0.01078 *  
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 56890 on 144 degrees of freedom
# (68 observations deleted due to missingness)
# Multiple R-squared:  0.7146,	Adjusted R-squared:  0.6968 
# F-statistic: 40.07 on 9 and 144 DF,  p-value: < 2.2e-16

