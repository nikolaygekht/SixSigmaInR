library(ggplot2)
library(e1071)

data <- c(19.2,20.8,26.3,28.9,30.7,31.0,33.4,33.8,38.2,40.7,41.8,42.4,43.9,44.8,45.8,47.1,47.3,47.4,47.5,48.1,48.8,49.0,49.2,49.3,50.0,50.4,51.4,51.8,51.9,52.5,52.7,53.1,53.2,53.2,54.6,55.2,56.1,57.5,58.0,58.9,60.1,60.4,61.0,61.5,61.6,61.6,61.8,61.8,61.9,71.3);


bin <- function(data, from, to, binsize) {
    #bin start
    bins <- seq(from, to, by=binsize);

    #prepare matrix to count elements
    counts <- matrix(0, length(bins));

    #count elements into bin
    for (i in seq(1, length(data))) {
        #note +2 instead of +1.
        #logically +1 is correct, however book data seems to
        #misplace data into bin so I have to make this
        #adjustment to generate the same data.
        index <- trunc((data[i] - 10) / binsize) + 2;
        counts[index] <- counts[index] + 1;
    }

    return (data.frame(start = bins, count = counts));
}

bardata <- bin(data, 10, 75, 5);

bardata;

png(filename="ch18p294-1.png");
    ggplot(data=bardata, aes(x=start, y=count)) +
        geom_bar(stat="identity") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1));
dev.off();

stderror <- function(data) {
   return(sd(data) / length(data));

}

mode <- function(v) {
   uniqv <- unique(v)
   return (uniqv[which.max(tabulate(match(v, uniqv)))]);
}

#calculate statistics
#note that kurtosis and skewness do not match the book
mean(data);
stderror(data);
median(data);
mode(data);
sd(data);
var(data);
kurtosis(data);
skewness(data);
range(data);
max(data) - min(data);
min(data);
max(data);
sum(data);
length(data);

cfd <- matrix(0, length(bardata$count));
binonly <- matrix(0, length(bardata$count));
expected <- matrix(0, length(bardata$count));
samplesize <- length(data);

for (i in seq(1, length(cfd))) {
    cfd[i] = pnorm(10 + (i - 1) * 5, mean = mean(data), sd = sd(data));
    if (i == 1) {
        binonly[i] = cfd[i];
    } else {
        binonly[i] = cfd[i] - cfd[i - 1];
    }
    expected[i] = binonly[i] * samplesize;

}

fulldata <- data.frame(bin = bardata$start, observed = bardata$count, cfd = cfd, binonly = binonly, expected = expected, final = (expected - bardata$count) ** 2 / expected);
fulldata;
sum(fulldata$final);
pchisq(sum(fulldata$final), df=11, lower.tail=FALSE);
