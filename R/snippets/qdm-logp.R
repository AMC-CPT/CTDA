# LogP (partition coefficient) and oral bioavailability F of 45 drugs
d = read.csv("data/LogP-F.csv")
nrow(d)
cor(d$LogP, d$F)             # correlation of the two: close to 0

Opt = d$LogP > 0 & d$LogP < 3                     # the textbook's optimal range
c(n.in = sum(Opt), n.out = sum(!Opt))             # drugs inside/outside the range
t1 = t.test(d$F[Opt], d$F[!Opt])                  # Welch t test
c(F.in = t1$estimate[[1]], F.out = t1$estimate[[2]],
  p.value = t1$p.value)      # mean F does not differ inside and outside
