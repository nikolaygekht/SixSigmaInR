library(ggplot2)

data <- read.csv("ch23p425.txt", header=TRUE);

hours <- matrix(0, 10);
min <- matrix(1000000, 10);
max <- matrix(0, 10);
sum <- matrix(0, 10);
count <- matrix(0, 10);

for (i in seq(1, length(data$Hour))) {
    s = data$Hour[i];
    d = data$Calls[i];
    count[s] = count[s] + 1;
    sum[s] = sum[s] + d;
    if (d < min[s]) {
        min[s] = d;
    }
    if (d > max[s]) {
        max[s] = d;
    }
}

range <- matrix(0, 10);
mean <- matrix(0, 10);

for (i in seq(1, length(hours))) {
    hours[i] = i;
    range[i] = max[i] - min[i];
    mean[i] = sum[i] / count[i];
}

udata <- function(r) {
    m <- mean(r);
    sd <- sd(r);
    lcl <- m - 3 * sd;
    if (lcl < 0) {
        lcl = 0;
    }
    ucl <- m + (m - lcl);
    return (data.frame(mean = m, sd = sd, ucl = ucl, lcl = lcl));
}

data1 <- data.frame(x = hours, y = mean);
cl <- udata(mean);
png(filename="ch23p425-1.png");

ggplot(data=data1, aes(x=x, y=y)) +
  geom_point(color="black", size=3) +
  geom_line(color="black") +
  geom_hline(yintercept=cl$ucl, color="gray50") +
  geom_hline(yintercept=cl$mean, color="gray25") +
  geom_hline(yintercept=cl$lcl, color="gray50");
dev.off();



data1 <- data.frame(x = hours, y = range);
cl <- udata(range);
cl;
png(filename="ch23p425-2.png");

ggplot(data=data1, aes(x=x, y=y)) +
  geom_point(color="black", size=3) +
  geom_line(color="black") +
  geom_point(data=subset(data1, y < cl$lcl | y > cl$ucl), aes(x=x, y=y), color="red", size=3) +
  geom_hline(yintercept=cl$ucl, color="gray50") +
  geom_hline(yintercept=cl$mean, color="gray25") +
  geom_hline(yintercept=cl$lcl, color="gray50");
dev.off();



