#2-Sample T-test at sample data

data = read.csv("ch22p411.txt", header=TRUE);

ssd = sd(c(data$A, data$B));

power.t.test(power = 0.8, delta = 0.5, sd = ssd, sig.level = 0.05, type="two.sample", alternative="one.sided");
power.t.test(power = 0.9, delta = 0.5, sd = ssd, sig.level = 0.05, type="two.sample", alternative="one.sided");
power.t.test(power = 0.8, delta = 1, sd = ssd, sig.level = 0.05, type="two.sample", alternative="one.sided");
power.t.test(power = 0.9, delta = 1, sd = ssd, sig.level = 0.05, type="two.sample", alternative="one.sided");
power.t.test(power = 0.8, delta = 2, sd = ssd, sig.level = 0.05, type="two.sample", alternative="one.sided");
power.t.test(power = 0.9, delta = 2, sd = ssd, sig.level = 0.05, type="two.sample", alternative="one.sided");

power.t.test(n = length(data$A), delta = 0.5, sd = ssd, sig.level = 0.05, type="two.sample", alternative="one.sided");
power.t.test(n = length(data$A), delta = 1, sd = ssd, sig.level = 0.05, type="two.sample", alternative="one.sided");
power.t.test(n = length(data$A), delta = 2, sd = ssd, sig.level = 0.05, type="two.sample", alternative="one.sided");
