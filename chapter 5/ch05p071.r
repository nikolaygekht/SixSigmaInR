#read data, sort it and calculate percents & cummulative percent
data <- read.csv("ch05p071.txt", header=TRUE);
data <- data[order(-data$Count), ];
data$Percent <- data$Count / sum(data$Count) * 100;
data$CumPercent <- cumsum(data$Percent);

#plot paretto diagram
png(filename="ch05p071.png")
#add margin for labels at bottom
par(mar = c(10, 4, 2, 2) + 0.2)
#bar diagram of categories
barplot(data$Percent, ylab="Percent", xlab="Category", names.arg=data$Type, las=2, ylim=c(0, 100));
lines(data$CumPercent);
dev.off()
