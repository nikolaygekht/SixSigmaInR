#read data and add rate
data <- read.csv("ch13p201.txt", header=TRUE);
data$ReturnsRate <- data$NumberOfReturns / data$NumberOfSales * 100;

#draw chart
png(filename="ch13p201.png");
#add margin for labels at bottom
par(mar = c(10, 4, 2, 2) + 0.2);
#plot return rate line
plot(data$ReturnsRate, type="l", xaxt="n", ylim=c(0, round(max(data$ReturnsRate)) + 1),
     xlab="Month", ylab="Returns per Hundred",
     main="Run Chart");
#plot median line
abline(h=median(data$ReturnsRate));
#add axis with month names
axis(1, at=seq(1, length(data$ReturnsRate)), labels=data$Month, las=2);

dev.off();