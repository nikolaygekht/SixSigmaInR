library(ggplot2)
errorsPerHour <- c(5,8,5,5,4,7,4,12,3,6,9,9,7,3,6,5,7,6,4,5,5,2,4,7,6)

data1 <- data.frame(value = errorsPerHour);

png(filename="ch20p363.png");
ggplot(data=data1, aes(x = value)) +
  geom_histogram()
dev.off();