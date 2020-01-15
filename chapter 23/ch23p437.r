library(ggplot2)

data <- read.csv("ch23p437.txt", header=TRUE);

rate = data$Defects / data$Samples;

#actual formulas are here, the book misleads about the way how it is calculated
#https://support.minitab.com/en-us/minitab-express/1/help-and-how-to/control-charts/how-to/attribute-control-charts/p-chart/methods-and-formulas/methods-and-formulas/
rate = data$Defects / data$Samples;
mn = sum(data$Defects) / sum(data$Samples);

ucl = mn + 3 * sqrt(mn * (1 - mn) / mean(data$Samples));
lcl = mn - 3 * sqrt(mn * (1 - mn) / mean(data$Samples));
if (lcl < 0) {
    lcl = 0;
}

data1 <- data.frame(x = seq(1, length(rate)), y = rate);

mn
ucl
lcl

png(filename="ch23p437.png");
ggplot(data=data1, aes(x=x, y=y)) +
  geom_point(color="black", size=3) +
  geom_line(color="black") +
  geom_point(data=subset(data1, y > ucl), aes(x=x, y=y), color="red", size=3) +
  geom_hline(yintercept=ucl, color="gray50") +
  geom_hline(yintercept=mn, color="gray25") +
  geom_hline(yintercept=lcl, color="gray50");
dev.off();
