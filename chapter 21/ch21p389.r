#2-sample T-test

data = read.csv("ch21p389.txt", header=TRUE);

#confidence level 95%
conf = 0.95

#type I error risk
alpha = 0.05;

#do hipotesis test
v <- t.test(data$A, data$B, alternative="greater", conf.level=conf);

v;

if (v$p.value < alpha) {
    "alternative";
} else {
    "null";
}


