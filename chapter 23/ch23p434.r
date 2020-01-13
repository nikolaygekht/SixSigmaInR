#seems like data in book is incorrect, tried to reproduce simularly behaving I-MR diagram

library(ggplot2)

data <- c(19,17,17,18,20,23,22.5,18,19,19.5,18,20.5,21,22,19,25,15,15,21,20.5,20,19.5,20.5);

udata <- function(r) {
    m <- mean(r);
    sd <- sd(r);
    lcl <- m - 3 * sd;
    if (lcl < 0) {
        c <- lcl;
        lcl = 0;
    } else {
        c <- 0;
    }
    ucl <- m + 3 * sd;
    return (data.frame(mean = m, sd = sd, ucl = ucl, lcl = lcl));
}

pts <- seq(1, length(data));
mrs <- matrix(NaN, length(data));

for (i in seq(1, length(data))) {
    pts[i] = i;
    s = 0;
    if (i > 1) {
        mrs[i] = abs(data[i] - data[i - 1]);
    }
}

for (i in seq(3, length(data))) {
    mrs[i] = (mrs[i - 1] + mrs[i]) / 2;
}


data1 <- data.frame(x = pts, y = data);
cl <- udata(data1$y);
png(filename="ch23p434-1.png");

ggplot(data=data1, aes(x=x, y=y)) +
  geom_point(color="black", size=3) +
  geom_line(color="black") +
  geom_point(data=subset(data1, !is.nan(y) & (y < cl$lcl | y > cl$ucl)), aes(x=x, y=y), color="red", size=3) +
  geom_hline(yintercept=cl$ucl, color="gray50") +
  geom_hline(yintercept=cl$mean, color="gray25") +
  geom_hline(yintercept=cl$lcl, color="gray50");
dev.off();



data1 <- data.frame(x = pts, y = mrs);
data1$y[1] = data1$y[2];
cl <- udata(data1$y);
cl;
data1$y[1] = NaN;
png(filename="ch23p434-2.png");

ggplot(data=data1, aes(x=x, y=y)) +
  geom_point(color="black", size=3) +
  geom_line(color="black") +
  geom_point(data=subset(data1, !is.nan(y) &  (y < cl$lcl | y > cl$ucl)), aes(x=x, y=y), color="red", size=3) +
  geom_hline(yintercept=cl$ucl, color="gray50") +
  geom_hline(yintercept=cl$mean, color="gray25") +
  geom_hline(yintercept=cl$lcl, color="gray50");
dev.off();


