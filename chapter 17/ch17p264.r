library(ggplot2)

xbar <- c(24.1,25.2,24.7,28.3,27.1,26.4,25.4,21.4,24.5,23.5,27.5,29.5,24.5,26.8)
mv <- mean(xbar)
dv <- sd(xbar)
mv

data1 <- data.frame(DataPoints=xbar, X=seq(1, length(xbar)));

png(filename="ch17p264.png");

ggplot(data=data1, aes(x=X, y=DataPoints)) +
  geom_point(color="black", size=3) +
  geom_line(color="black") +
  geom_hline(yintercept=mv - dv * 3, color="gray50") +
  geom_hline(yintercept=mv, color="gray25") +
  geom_hline(yintercept=mv + dv * 3, color="gray50") +
  ylim(mv - dv *4, mv + dv * 4);




dev.off();

