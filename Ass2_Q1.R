data <- read.csv("iri.csv")

# install.packages("dplyr")

library(dplyr)

filtered_data <- data %>%
  filter(STATE_CODE == 6, grepl("^050", SHRP_ID))

summary_stats <- filtered_data %>%
  group_by(SHRP_ID) %>%
  summarise(min_IRI = min(IRI),
            max_IRI = max(IRI),
            mean_IRI = mean(IRI))

sorted_data <- summary_stats %>%
  arrange(desc(mean_IRI))

library(ggplot2)

selected_shrp_id <- sorted_data$SHRP_ID[1]
selected_data <- filtered_data[filtered_data$SHRP_ID == selected_shrp_id,]

ggplot(selected_data, aes(x = as.Date(VISIT_DATE, "%m/%d/%y"), y = IRI)) +
  geom_point() +
  ggtitle(paste("Average IRI vs Time for Section", selected_shrp_id)) +
  xlab("Time") +
  ylab("Average IRI")
