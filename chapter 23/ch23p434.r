#1) the books seems to be misleading on the formula, the minitab formula is explained here:
#https://blog.minitab.com/blog/marilyn-wheatleys-blog/methods-and-formulas3a-how-are-i-mr-chart-control-limits-calculated
#https://support.minitab.com/en-us/minitab/18/help-and-how-to/quality-and-process-improvement/control-charts/how-to/variables-charts-for-individuals/i-mr-chart/methods-and-formulas/methods-and-formulas-for-individuals-chart/

#the source data does not match the chart displayed, and the calculated numbers do not have exact match
#either the data are wrong or some critical parameters of I-MR chart is omitted

library(ggplot2)

sales <- c(19,17,17,18,20,23,22,17,18,19,18,20,21,19,24,16,15,20,21,20,19,20);
i = 2
sales[seq(i - 1, i)];

pts = seq(1, length(sales));
msales = mean(sales);
sdsales = sd(sales);
uclsales = mean(sales) + 3 * sd(sales);
lclsales = mean(sales) - 3 * sd(sales);

png(filename="ch23p434-1.png");

data1 <- data.frame(x = pts, y = sales);
ggplot(data=data1, aes(x=x, y=y)) +
  geom_point(color="black", size=3) +
  geom_line(color="black") +
  geom_point(data=subset(data1, !is.nan(y) & (y < lclsales | y > uclsales)), aes(x=x, y=y), color="red", size=3) +
  geom_hline(yintercept=uclsales, color="gray50") +
  geom_hline(yintercept=msales, color="gray25") +
  geom_hline(yintercept=lclsales, color="gray50");
dev.off();

imr <- matrix(NA, length(sales));

mr <- function(data, i, w) {
    sdata <- data[seq(i - w + 1, i)];
    return (abs(max(sdata) - min(sdata)));
}

ssd = 0;
for (i in seq(2, length(sales))) {
    imr[i] = mr(sales, i, 2);
    if (i > 2) {
        ssd = ssd + (imr[i] - imr[i - 1]) ** 2;
    }
}

meanmr = sum(imr[seq(2, length(imr))]) / (length(imr) - 2 + 1);
sssd = sqrt(0.5 * ssd / (length(imr) - 1));
sssd;
uclmr = meanmr + 3 * sssd;
lclmr = meanmr - 3 * sssd;
if (lclmr < 0) {
    lclmr = 0;
}

png(filename="ch23p434-2.png");

data1 <- data.frame(x = pts, y = imr);
ggplot(data=data1, aes(x=x, y=y)) +
  geom_point(color="black", size=3) +
  geom_line(color="black") +
  geom_point(data=subset(data1, !is.nan(y) & (y < lclmr | y > uclmr)), aes(x=x, y=y), color="red", size=3) +
  geom_hline(yintercept=uclmr, color="gray50") +
  geom_hline(yintercept=meanmr, color="gray25") +
  geom_hline(yintercept=lclmr, color="gray50");
dev.off();
