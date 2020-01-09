data <- read.csv("ch14p222.txt", header=TRUE);

png(filename="ch14p222.png");

plot(data$Donenees, xaxt="n", main="Donenees of Cake");
axis(1, at=seq(1, length(data$Temperature)), labels=data$Temperature, las=2);

fit <- glm(data$Donenees ~ seq(1, length(data$Donenees)));
abline(fit);

grid();

dev.off();