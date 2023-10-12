library(dplyr)

data <- read.csv("dataset.csv")

data_filtered <- data %>%
  filter(Income > 30000)

data_selected <- data_filtered %>%
  select(Id, Year_Birth, Education, Marital_Status, Income, Response)

data_mutated <- data_selected %>%
  mutate(Age = 2023 - Year_Birth, Rich_flag = Income > 80000)

average_income_by_education <- data_mutated %>%
  group_by(Education) %>%
  summarize(Average_Income = mean(Income))

final_data <- data_mutated %>%
  left_join(average_income_by_education, by = "Education")

head(final_data)
