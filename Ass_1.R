#Ass1

random_vector <- runif(50) 
sum_of_elements <- 0
for(element in random_vector) {
  sum_of_elements <- sum_of_elements + element
}
mean_value <- sum_of_elements / length(random_vector)
print(mean_value)
