
accident <- read.csv("ACCIDENT.csv")
person <- read.csv("PERSON.csv")

common_columns <- intersect(names(accident), names(person))
intersection <- merge(accident, person, by=common_columns)

library(dplyr)

injury_severity_counts <- person %>%
  group_by(INJ_SEV) %>%
  summarise(count = n())

vehicle <- read.csv("VEHICLE.CSV")
merged_data <- left_join(accident, vehicle, by="CASENUM")
dimensions <- dim(merged_data)

num_missing_values <- sum(is.na(merged_data$VEH_NO)) 


