library(ggplot2)

data <- read.csv("ch17p260.txt", header=TRUE);
data1 <- data.frame(PartsPerHour=data$PartsPerHour,Defects=data$Defects);
fit <- glm(data$Defects ~ data$PartsPerHour);
cf = coef(fit);
cf

png(filename="ch17p260.png");


ggplot(data=data1, aes(x=PartsPerHour, y=Defects)) +
  geom_point(color="black", size=3) +
  geom_abline(slope = cf[2], intercept = cf[1], color='black') +
  ylim(0, max(data$Defects) + 2)

dev.off();