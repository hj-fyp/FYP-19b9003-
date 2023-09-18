library(tidyverse)
library(dplyr)

model <- lm(Price ~ Acre + Sqft + Property.types + Floor + Bedrooms + Bathrooms + Quarter, data = original_dataset)
summary(model)
x <- sample(1:3, size = 10, replace = TRUE)
modeest::mfv1(x)

pred_df <-
  original_dataset %>%
  summarise(
    Acre = mean(Acre),
    Sqft = mean(Sqft),
    Property.types = "Detached",
    Floor = modeest::mfv1(Floor),
    Bedrooms = modeest::mfv1(Bedrooms),
    Bathrooms = modeest::mfv1(Bathrooms)
  ) %>%
    mutate(Quarter = list(x_axis_order)) %>%
    unnest_longer(Quarter)

hp_pred <- predict(model, newdata = pred_df)

pred_df_sd <- 
  original_dataset %>% 
  summarise(
    Acre = mean(Acre),
    Sqft = mean(Sqft),
    Property.types = "Semi-detached",
    Floor = modeest:: mfv1(Floor),
    Bedrooms = modeest::mfv1(Bedrooms),
    Bathrooms = modeest::mfv1(Bathrooms)
  ) %>%
  mutate(Quarter = list(x_axis_order)) %>% 
  unnest_longer(Quarter)

hp_pred_sd <- predict(model, newdata = pred_df_sd)


pred_df_tr <-
  original_dataset %>%
  summarise(
    Acre = mean(Acre),
    Sqft = mean(Sqft),
    Property.types = "Terrace",
    Floor = modeest::mfv1(Floor),
    Bedrooms = modeest::mfv1(Bedrooms),
    Bathrooms = modeest::mfv1(Bathrooms)
  ) %>%
  mutate(Quarter = list(x_axis_order)) %>%
  unnest_longer(Quarter)

hp_pred_tr <- predict(model, newdata = pred_df_tr)

#Linear model with 'Detached'
original_dataset %>%
  group_by(Quarter) %>%
  mutate(Quarter = factor(Quarter, levels = x_axis_order)) %>%
  summarise(med = median(Price),
            avg = mean(Price)) %>%
  mutate(med = med / med[1],
         avg = avg / avg[1]) %>%
  mutate(model = hp_pred / hp_pred[1]) %>%
  pivot_longer(c(med, avg, model)) %>%
  ggplot(aes(Quarter, value, group = name, linetype = name)) +
  geom_line() +
  geom_line(data = bdcb_rppi, aes(Quarter, RPPI),
            col = "green", linetype = "solid")

original_dataset %>%
  group_by(Quarter) %>%
  mutate(Quarter = factor(Quarter, levels = x_axis_order)) %>%
  summarise(med = median(Price),
            avg = mean(Price)) %>%
  mutate(med = med / med[1],
         avg = avg / avg[1]) %>%
  mutate(model = hp_pred_sd / hp_pred_sd[1]) %>%
  pivot_longer(c(med, avg, model)) %>%
  ggplot(aes(Quarter, value, group = name, linetype = name)) +
  geom_line() +
  geom_line(data = bdcb_rppi, aes(Quarter, RPPI),
            col = "red", linetype = "solid")

original_dataset %>%
  group_by(Quarter) %>%
  mutate(Quarter = factor(Quarter, levels = x_axis_order)) %>%
  summarise(med = median(Price),
            avg = mean(Price)) %>%
  mutate(med = med / med[1],
         avg = avg / avg[1]) %>%
  mutate(model = hp_pred_tr / hp_pred_tr[1]) %>%
  pivot_longer(c(med, avg, model)) %>%
  ggplot(aes(Quarter, value, group = name, linetype = name)) + 
  geom_line() +
  geom_line(data = bdcb_rppi, aes(Quarter, RPPI),
            col = "blue", linetype = "solid")


hist(original_dataset$Price)
