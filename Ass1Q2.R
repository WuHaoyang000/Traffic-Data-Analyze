# Ass1Q2


library(readr)
data <- read_csv("RandonCSV.csv")
dim(data)
head(data)
plot(x = data$x,
     y = data$y,
     main="Sccatter Plot",
     xlab="x-axis",
     ylab="y-axis",
     ylim = c(0,100)
       )

