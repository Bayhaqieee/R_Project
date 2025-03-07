library(dpylr)
library(ggplot2)

# Inspect Dataset
data <- iris
head(data)
summary(data)

# Filter Species and Sepal.Length
filter(data, Species == "setosa") %>%
  summarize(avg_sepal_length = mean(Sepal.Length))

# Visualize Sepal Length and Width
ggplot(data, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
  geom_point() +
  labs(title="Sepal Length vs Width", x="Sepal Length", y="Sepal Width")

# Histogram of Petal Length
ggplot(data, aes(x=Petal.Length, fill=Species)) + 
  geom_histogram(binwidth=0.5, alpha=0.6, position="dodge") +
  labs(title="Petal Length Distribution")
