#read data and add rate
data <- read.csv("ch13p201.txt", header=TRUE);
data$ReturnsRate <- data$NumberOfReturns / data$NumberOfSales * 100;

#
png(filename="ch13p201.png");
plot(data$ReturnsRate, type="l", x.names=data$Month, las=2, ylim=c(0, max(data$ReturnsRate)));
abline(h=median(data$ReturnsRate));

dev.off();