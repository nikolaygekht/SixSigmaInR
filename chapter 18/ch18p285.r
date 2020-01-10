library(ggplot2)

#source data
data <- c(56.1,38.2,47.1,48.1,60.1,45.8,33.4,49.2,53.1,41.8,19.2,49.3,49.0,61.8,42.4,53.2,61.6,20.8,55.2,57.5,48.8,28.9,33.8,53.2,58.0,47.3,51.4,61.5,58.9,60.4,30.7,52.5,40.7,44.8,54.6,61.6,31.0,52.7,47.5,26.3,71.3,61.8,51.9,43.9,50.0,47.4,61.9,51.8,50.4,61.0);
#size of a bin
binsize = 5;
#bin start
bins <- seq(10, 75, by=binsize);
#prepare matrix to count elements
counts <- matrix(0, length(bins));

#count elements into bin
for (i in seq(1, length(data))) {
    index <- (data[i] - 10) / binsize + 1;
    counts[index] <- counts[index] + 1;
}


#create barchart
bardata <- data.frame(start = bins, count = counts);

png(filename="ch18p285.png");
    ggplot(data=bardata, aes(x=start, y=count)) +
        geom_bar(stat="identity") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1));
dev.off();