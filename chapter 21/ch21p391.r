#one sample wilcox
alpha = 0.05;
null = 3;
br <- c(4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,3,3,3,3,3,3,3,3,3,6,6,6,6,6,6,6,6,7,7,5,5,5,5,4,4,4,4,3,3,3,2,2,2,2,1,1,1);
v <- wilcox.test(br, mu=null, alternative="greater", exact=TRUE, conf.int=TRUE, conf.level=0.95);
v;
if (v$p.value < alpha) {
    "alternative";
} else {
    "null";
}


