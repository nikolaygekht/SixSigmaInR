#read data
data <- read.csv("ch14p213.txt", header=TRUE);

#plot diagram
png(filename="ch14p213.png");
par(mar = c(10, 4, 2, 2) + 0.2);
barplot(data$Denials, ylab="Denials", xlab="Payer", names.arg=data$Payer, las=2);

#trendline
fit <- glm(data$Denials ~ seq(1, length(data$Denials)));
abline(fit);

dev.off();
