library(ggplot2)

detached_data <- subset(property_dataset, Property.types == "Detached")
semi_detached_data <- subset(property_dataset, Property.types == "Semi-detached")
terrace_data <- subset(property_dataset, Property.types == "Terrace")

#Plot: Boxplot
boxplot_data <- rbind(detached_data, semi_detached_data, terrace_data)

boxplot <- ggplot(boxplot_data, aes(x = Property.types, y = Price)) +
             geom_boxplot() +
             labs(x = "Property Type", y = "Price") +
             ggtitle("Box Plot of Price by Property Type")

#Plot: Histogram
ggplot(property_dataset, aes(x = Price, fill = Property.types)) +
  geom_histogram(binwidth = 10000, position = "dodge") +
  labs(x = "Price", y = "Frequency") +
  ggtitle("Histogram of Price by Property Type") +
  scale_fill_manual(values = c("Detached" = "purple", "Semi-detached" = "pink", "Terrace" = "red"))

shapiro.test(property_dataset$Price)

#Save the plots
ggsave("box_plot.png", plot = boxplot, width = 6, height = 4)
ggsave("histogram.png", plot = last_plot(), width = 6, height = 4)

property_counts <- table(property_dataset$Property.types)
property_counts_df <- as.data.frame(property_counts)
colnames(property_counts_df) <- c("Property.type", "Count")

custom_colors <- c("maroon", "pink", "brown")

# Create the pie chart with custom colors
ggplot(property_counts_df, aes(x = "", y = Count, fill = Property.type)) +
  geom_bar(stat = "identity", width = 1, color = "black", size = 1) +
  coord_polar(theta = "y") +
  labs(fill = "Property Type") +
  scale_fill_manual(values = custom_colors) +  # Set custom colors
  ggtitle("Distribution of Property Types")
