library(ggplot2)

data <- read.csv("ch18p280.txt", header=TRUE);

#function to split data into bins
bin <- function(data, start, end, bincount) {
    size <- (end - start) / bincount
    r <- matrix(0, bincount);
    s <- matrix(0, bincount);
    for (i in seq(1, bincount)) {
        s[i] = start + (i - 1) * size;
    }
    for (i in seq(1, length(data))) {
        index = floor((data[i] - start) / size) + 1;
        r[index] <- r[index] + 1;
    }
    return (data.frame(start = s, count = r));
}

#function to draw bar diagram of the bins
barchart <- function(source, chtitle) {
    ggplot(data=source, aes(x=start, y=count)) +
        ggtitle(chtitle) +
        geom_bar(stat="identity") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1));
}

# pay attention it seems like book splits into bins incorrectly

png(filename="ch18p280-1.png");
barchart(source=bin(data$Difference, -30, 60, 9), "9 bins");
dev.off();
png(filename="ch18p280-2.png");
barchart(source=bin(data$Difference, -30, 60, 7), "7 bins");
dev.off();
png(filename="ch18p280-3.png");
barchart(source=bin(data$Difference, -30, 60, 16), "16 bins");
dev.off();
png(filename="ch18p280-4.png");
barchart(source=bin(data$Difference, -30, 60, 29), "29 bins");
dev.off();

