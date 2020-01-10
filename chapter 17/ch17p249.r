library(ggplot2)

data <- read.csv("ch17p249.txt", header=TRUE);

data1 <- data.frame(Hour=data$Hour,Calls=data$Calls);

png(filename="ch17p249v.png");

ggplot(data=data1, aes(x=Hour, y=Calls)) +
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1));

dev.off();

png(filename="ch17p249h.png");
ggplot(data=data1, aes(x=Hour, y=Calls)) +
  geom_bar(stat="identity") +
  coord_flip();

dev.off();