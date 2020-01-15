#https://support.minitab.com/en-us/minitab/19/help-and-how-to/quality-and-process-improvement/control-charts/how-to/attributes-charts/p-chart/methods-and-formulas/methods-and-formulas/
library(ggplot2)

k = 3;
data <- read.csv("ch23p452.txt", header=TRUE);

epu = data$Noncompliance / data$Calls;

mr = sum(data$Noncompliance) / sum(data$Calls);
mr;
ucl = matrix(0, length(epu));
lcl = matrix(0, length(epu));

for (i in seq(1, length(epu))) {
    v = k * sqrt(mr * (1 - mr) /  data$Calls[i]);
    ucl[i] = mr + v;
    lcl[i] = mr - v;
    if (lcl[i] < 0) {
        lcl[i] = 0;
    }
}

png(filename="ch23p452.png");
data1 <- data.frame(x = data$Hour, y = epu, lcl = lcl, ucl = ucl);
ggplot(data=data1, aes(x=x, y=y)) +
  geom_point(color="black", size=3) +
  geom_line(color="black") +
  geom_line(aes(x = x, y = lcl), color="gray50") +
  geom_step(aes(x = x, y = ucl), color="gray50") +
  #geom_point(data=subset(data1, !is.nan(y) & (y < lcl | y > ucl)), aes(x=x, y=y), color="red", size=3) +
  geom_hline(yintercept=mr, color="gray25");
dev.off();
