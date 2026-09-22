source("data/TTE.R")

## difference estimated from a survfit result
KMdiff(r1, control = 1, percent = TRUE)

## Kaplan-Meier analysis and difference from formatted data
d3$time     <- d3$futime
d3$n.event1 <- d3$di1;  d3$n.enter1 <- d3$Yi1
d3$n.censor1 <- as.numeric(d3$fustat == 0 & d3$rx == 1)
d3$n.event2 <- d3$di2;  d3$n.enter2 <- d3$Yi2
d3$n.censor2 <- as.numeric(d3$fustat == 0 & d3$rx == 2)
RDsurv(d3, percent = TRUE)

## two-group Cox proportional hazards model
ovarian$group  <- ovarian$rx - 1        # 1 = test, 0 = control
ovarian$time   <- ovarian$futime
ovarian$status <- ovarian$fustat
Cox(ovarian)
