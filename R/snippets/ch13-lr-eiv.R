d3$di  <- d3$di1 + d3$di2               # total events
d3$Yi  <- d3$Yi1 + d3$Yi2               # total risk set
d3$Ei1 <- d3$Yi1 * d3$di / d3$Yi        # expected events, test group
d3$Ei2 <- d3$Yi2 * d3$di / d3$Yi        # expected events, control group
d3$Vi1 <- with(d3, Yi1*Yi2/(Yi - 1)*di/Yi*(1 - di/Yi))   # Kim JH, p.119
d3$Vi2 <- d3$Vi1
d3 <- d3[d3$Yi > 1, ]                    # keep rows with Yi > 1
d3
