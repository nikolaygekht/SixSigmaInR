#load data
data <- read.csv("ch14p215.txt", header=TRUE);


#draw box plot with grid
png(filename="ch14p215.png");

boxplot(data$Children, data$Adults,
        names = c("Children", "Adults"),
        ylim=c(0, 35),
        main="1-mile run test");
grid(nx=NA, ny=NULL);

dev.off();