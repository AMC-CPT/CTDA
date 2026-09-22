# survival: HR=0.7, two-sided alpha=0.05, power 0.80 -> events and total subjects needed
HR <- 0.7;  a <- 0.05;  pw <- 0.80
d <- 4 * (qnorm(1 - a/2) + qnorm(pw))^2 / log(HR)^2   # Schoenfeld number of events
c(events = ceiling(d), n_total = ceiling(d / 0.5))  # overall event probability psi=0.5
