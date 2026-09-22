# binomial data: a response was observed in x = 2 of n = 10 subjects.
n = 10 ;  x = 2
phat = x/n                            # maximum likelihood estimate
phat

# relative likelihood L(p)/L(phat), computed on the log scale for numerical stability.
LL = function(p) x*log(p) + (n - x)*log(1 - p)
RL = function(p) exp(LL(p) - LL(phat))

k = 1/15                              # the cutoff proposed by Fisher
Root = function(lo, hi) uniroot(function(p) RL(p) - k, c(lo, hi),
                                tol = 1e-12)$root
LI = c(lower = Root(1e-10, phat), upper = Root(phat, 1 - 1e-10))
LI            # 1/15 likelihood interval: asymmetric about phat

SE = sqrt(phat*(1 - phat)/n)
Wald = c(lower = phat - 1.96*SE, upper = phat + 1.96*SE)
Wald          # symmetric Wald CI: the lower limit is negative, outside [0, 1]
