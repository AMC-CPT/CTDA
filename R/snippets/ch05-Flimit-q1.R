# Upper-tail probabilities of the chi-square and F distributions when q = 1
x <- 1:10              # quantiles
n <- 108               # number of observation records
p <- 7
q <- 1
1 - pchisq(x, q)       # using the chi-square distribution
1 - pf(x/q, q, n - p)  # using the F distribution
