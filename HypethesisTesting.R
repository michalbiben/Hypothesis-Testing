# Hypothesis Testing

# H0: The median age of houses inland is same as the median age of houses near bay
# H1: The median age of houses inland is not same as the median age of houses near bay

# Import packages and read the data-set

library(dplyr)
library(data.table)
library(stringr)
library(lubridate)
library(tidyr)
library(ggplot2)

housing = fread('housing.csv')

housing %>% select(ocean_proximity) %>% group_by(ocean_proximity) %>% summarise(value_counts=n())

# Select the data needed for hypothesis

inland = housing %>% filter(ocean_proximity=='INLAND') %>% select(housing_median_age)
nearbay = housing %>% filter(ocean_proximity=='NEAR BAY') %>% select(housing_median_age)

# Choose random samples of 2000 observations

rand_inland = sample_n(inland, size=2000)
rand_nearbay = sample_n(nearbay, size=2000)

# Conduct a t-test

t.test(rand_inland, rand_nearbay, paired = FALSE, 'two.sided')



