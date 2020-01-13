#1-sample T-test

#sample size
N = 500;
#Mean & deviation
hm = 175;
hd = 2.2;
#confidence level 95%
conf = 0.95
#null mean and deviation
nm = 168;

#type I error risk
alpha = 0.05;

#do hipotesis test
v <- t.test(rnorm(N, hm, hd), mu=nm, alternative="greater", conf.level=conf);

v;

if (v$p.value < alpha) {
    "alternative";
} else {
    "null";
}


