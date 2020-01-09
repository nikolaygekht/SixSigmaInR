data <- read.csv("ch14p222.txt", header=TRUE);

png(filename="ch14p222.png");

plot(data$Doneness, xaxt="n", main="Doneness of Cake");
axis(1, at=seq(1, length(data$Temperature)), labels=data$Temperature, las=2);

fit <- glm(data$Doneness ~ seq(1, length(data$Doneness)));
abline(fit);

grid();

dev.off();