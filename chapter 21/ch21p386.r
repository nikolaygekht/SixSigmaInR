#1 sample P-test

#sample size
N = 142;
#success count
x = 38;
#confidence level 95%
conf = 0.95
#null probability
p = 0.2;

#type I error risk
alpha = 0.05;

#do hipotesis test
v <- prop.test(x, N, p, conf.level = conf, alternative = "greater", correct = TRUE);

v;

if (v$p.value < alpha) {
    "alternative";
} else {
    "null";
}


