library(ggplot2)

data <- read.csv("ch17p255.txt", header=TRUE);

data1 <- rbind(data.frame(Hour = data$Hour, Calls = data$TeamA, Team="A"),
               data.frame(Hour = data$Hour, Calls = data$TeamB, Team="B"));

png(filename="ch17p255.png");

ggplot(data1, aes(x=Hour, y=Calls, fill=Team)) +
    geom_bar(stat="identity") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1));

dev.off();