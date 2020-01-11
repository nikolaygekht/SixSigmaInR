library(ggplot2)

data <- read.csv("ch19p317.txt", header=TRUE);

doit <- function(x, y) {
r <- cor(x, y);
rsq <- r ** 2
n <- length(y);
rsqadj <- 1 - abs( ( (1 - rsq) * (n - 1) ) / ( (n - 1 - 1) ) )
serr <- sqrt(1 - rsqadj) * sd(y);

r
rsq
rsqadj
serr
n

fit <- lm(y ~ x)
cf <- coefficients(fit);
cf
confint(fit, level=0.95)
anova(fit)

data1 = data.frame(time=x,original=y, predicted = fitted(fit), residuals(fit))

ggplot() +
  geom_point(data=data1, aes(x=time, y=original), color="blue") +
  geom_point(data=data1, aes(x=time, y=predicted), color="red") +
  geom_abline(intercept=cf[1], slope=cf[2], color="red") +
  labs(title = "Time Line Fit Plot") +
  xlab("Time") +
  ylab("Temperature") +
  ylim(0, 80);
}

png(filename="ch19p321-1.png");
"High Correlation"
doit(data$Time, data$TemperatureA);
dev.off();

png(filename="ch19p321-2.png");
"Low Correlation"
doit(data$Time, data$TemperatureC);
dev.off();
