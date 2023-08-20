# generate and read data 

# load library
library(tidyverse)

setwd("/Users/cc/Desktop/govhack data /GovHack-2023/registration_data /")

colnames 

# Create an empty data frame to store the results
data <- data.frame()

# Loop through the years
for (i in 2015:2023) {
  filename <- paste("registered-vehicles-by-postcode-at-30-june-", 2015, ".csv", sep = "")
  temp <- read.csv(filename)
  
  # Correct column names assignment
  colnames(temp) <- colnames
  
  temp2 <- temp %>%
    filter(str_detect(VEHICLE_NUMBER_OF_CYLINDERS, "Cylinders")) %>% # filter out only fuel vehicles 
    mutate(
      YEAR_OF_STATISTICS = i,
      VEHICLE_AGE = i - as.numeric(gsub(",", "",YEAR_OF_MANUFACTURE)),
      IS_OVER_5_YEARS_OLD = VEHICLE_AGE >= 5,
      IS_OVER_10_YEARS_OLD = VEHICLE_AGE >= 10
    ) %>%
    group_by(OWNER_POST_CODE) %>%
    summarise(
      YEAR_OF_STATISTICS = i,
      TOTAL_NUMBERS = sum(TOTAL_VEHICLES),
      OVER_5_YEARS_OLD = sum(IS_OVER_5_YEARS_OLD),
      OVER_10_YEARS_OLD = sum(IS_OVER_10_YEARS_OLD)
    )
  
  data <- rbind(data, temp2)
}

write_csv(data, "suburbs_vehicals registration.csv")














i <-2023
filename <- paste("registered-vehicles-by-postcode-at-30-june-", i, ".csv", sep = "")
temp <- read.csv(filename)
temp <- temp %>% filter(str_detect(VEHICLE_NUMBER_OF_CYLINDERS, "Cylinders")) %>% group_by(OWNER_POST_CODE) %>% 
  summarise(sum(TOTAL_VEHICLES), YEAR_OF_STATISTICS = i) 
data <- rbind(data, temp)




colnames(temp) <-colnames(data1)
colnames(temp)
colnames(data)

data1 <- read.csv("registered-vehicles-by-postcode-at-30-june-2015.csv")

data1 <- data1 %>% mutate(is_fuel = str_detect(VEHICLE_NUMBER_OF_CYLINDERS, "Cylinders"))

colnames(data1)


data_by_suburbs <- data %>%filter(is_fuel = TRUE) %>% group_by(OWNER_POST_CODE) %>% summarise(sum(TOTAL_VEHICLES))
                        

data_by_suburbs <- data_by_suburbs %>% mutate(YEAR_OF_STATISTICS = '2015')

unique(data_by_suburbs$OWNER_POST_CODE)




###
