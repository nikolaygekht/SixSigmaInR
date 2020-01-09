data <- c(5.5, 7.5, 9.1, 4.9, 6.8, 6.1, 1, 7.5, 5.9, 9.4, 5, 3, 9.3, 7.7, 4.9, 4, 6.2);
dev = sd(data);
m = mean(data);

png(filename="ch14p238.png");

plot(data, type = "l", xaxt = "n", ylim = c(m - dev * 4, m + dev * 4));
#mean
abline(h=m);
#UCL
abline(h=m + 3 * dev, col="gray");
#LCL
abline(h=m - 3 * dev, col="gray");

grid();

dev.off();