library(ggplot2)

data <- read.csv("ch23p442.txt", header=TRUE);

mr <- function(data, i, w) {
    sdata <- data[seq(i - w + 1, i)];
    return (abs(max(sdata) - min(sdata)));
}

imr_calc <- function(data) {
    mv1 = mean(data);
    sd1 = sd(data);
    ucl1 = mv1 + 3 * sd1;
    lcl1 = mv1 - 3 * sd1;

    if (lcl1 < 0) {
        lcl1 = 0;
    }

    imr <- matrix(NA, length(data));

    ssd = 0;
    for (i in seq(2, length(data))) {
        imr[i] = mr(data, i, 2);
        if (i > 2) {
            ssd = ssd + (imr[i] - imr[i - 1]) ** 2;
        }
    }

    mv2 = sum(imr[seq(2, length(imr))]) / (length(imr) - 2 + 1);

    sssd = sqrt(0.5 * ssd / (length(imr) - 1));

    ucl2 = mv2 + 3 * sssd;
    lcl2 = mv2 - 3 * sssd;

    if (lcl2 < 0) {
        lcl2 = 0;
    }

    return (data.frame(x = seq(1, length(data)), y1 = data, y2 = imr,
                       mv1 = mv1, ucl1 = ucl1, lcl1 = lcl1,
                       mv2 = mv2, ucl2 = ucl2, lcl2 = lcl2));
}

imr_draw <- function(dx, dy, mv, ucl, lcl) {
    data1 <- data.frame(x=dx, y=dy);
    ggplot(data=data1, aes(x=x, y=y)) +
       geom_point(color="black", size=3) +
       geom_line(color="black") +
       geom_point(data=subset(data1, !is.nan(y) & (y < lcl | y > ucl)), aes(x=x, y=y), color="red", size=3) +
       geom_hline(yintercept=ucl, color="gray50") +
       geom_hline(yintercept=mv, color="gray25") +
       geom_hline(yintercept=lcl, color="gray50");
}


#
# do imr of completed calls
#
imr_data <- imr_calc(data$Completed);
imr_data;

png(filename="ch23p442-1.png");
imr_draw(imr_data$x, imr_data$y1, imr_data$mv1, imr_data$ucl1, imr_data$lcl1);
dev.off();
png(filename="ch23p442-2.png");
imr_draw(imr_data$x, imr_data$y2, imr_data$mv2, imr_data$ucl2, imr_data$lcl2);
dev.off();

unresolved = matrix(0, length(data$Completed));
unresolved[1] = data$Incoming[1] - data$Completed[1];
for (i in seq(2, length(unresolved))) {
    unresolved[i] = data$Incoming[i] - data$Completed[i] + unresolved[i - 1];
}

imr_data <- imr_calc(unresolved);
imr_data;

png(filename="ch23p442-3.png");
imr_draw(imr_data$x, imr_data$y1, imr_data$mv1, imr_data$ucl1, imr_data$lcl1);
dev.off();
png(filename="ch23p442-4.png");
imr_draw(imr_data$x, imr_data$y2, imr_data$mv2, imr_data$ucl2, imr_data$lcl2);
dev.off();

tr = t.test(data$Incoming, data$Completed);
tr;