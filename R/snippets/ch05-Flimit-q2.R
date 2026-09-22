# Upper-tail probabilities of the chi-square and F distributions when q = 2
x <- 1:10
n <- 108
p <- 7
q <- 2
1 - pchisq(x, q)       # using the chi-square distribution
1 - pf(x/q, q, n - p)  # using the F distribution
