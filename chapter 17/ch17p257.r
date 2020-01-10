library(ggplot2)

data <- read.csv("ch17p257.txt", header=TRUE);

data1 <- data.frame(Step=data$Step,Minutes=data$Minutes);

png(filename="ch17p257.png");

ggplot(data=data1, aes(x="", y=Minutes, fill=Step)) +
  geom_bar(stat="identity") +
  coord_polar("y", start=0);


dev.off();