#function returns probability to observe `case` when the process average is `mean`
#when data fits the poisson distribution
#e.g. if process average is 10, poisson(10, 15) will give probablity to observe
#15 in the process
poisson <- function(average, case) {
    return ( ((exp(1) ** (-average)) * (average ** case)) / factorial(case) );
}

poisson(10, 15);
s <- 0;
cases <- seq(0, 14);
outcomes <- matrix(0, length(cases));
for (i in seq(1, length(cases))) {
    outcomes[i] = poisson(10, cases[i]);
    s <- s + outcomes[i];
}
s
1 - s;


library(ggplot2)

data1 <- data.frame(cases=cases,outcomes=outcomes);

png(filename="ch20p365.png");

ggplot(data=data1, aes(x=cases, y=outcomes)) +
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1));

dev.off();
