# chapter 5 pg 63
v <- c(67, 68, 73, 74, 81, 85, 88, 88, 90, 90, 90, 93, 94, 98, 99)
length(v)
mean(v)
median(v)
# normal distribution
rnorm(v)
# sample variance
var(v)
# standard deviation
sd(v)
# population variance
mean((v-mean(v))^2)
# population standard deviation
sqrt(mean((v-mean(v))^2))
# percentile
quantile(v, .75);
