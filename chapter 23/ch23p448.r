#https://support.minitab.com/en-us/minitab/19/help-and-how-to/quality-and-process-improvement/control-charts/how-to/attributes-charts/c-chart/methods-and-formulas/methods-and-formulas/

library(ggplot2)

data <- read.csv("ch23p448.txt", header=TRUE);

mr = mean(data$Defects);
sdv = sqrt(mr);
lcl = mr - sdv * 3;
if (lcl < 0) {
    lcl = 0;
}
ucl = mr + sdv * 3;

png(filename="ch23p448.png");
data1 <- data.frame(x = seq(1, length(data$Defects)), y = data$Defects);
ggplot(data=data1, aes(x=x, y=y)) +
  geom_point(color="black", size=3) +
  geom_line(color="black") +
  geom_point(data=subset(data1, !is.nan(y) & (y < lcl | y > ucl)), aes(x=x, y=y), color="red", size=3) +
  geom_hline(yintercept=ucl, color="gray50") +
  geom_hline(yintercept=mr, color="gray25") +
  geom_hline(yintercept=lcl, color="gray50");
dev.off();
