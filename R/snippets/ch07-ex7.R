library(PropCIs)
riskscoreci(0, 1, 0, 1, conf.level = 0.95)$conf.int
riskscoreci(1, 1, 0, 1, conf.level = 0.95)$conf.int   # differs!
riskscoreci(2, 2, 0, 2, conf.level = 0.95)$conf.int   # differs!

library(sasLM)
RRmn1(0, 1, 0, 1)
RRmn1(1, 1, 0, 1)   # differs!
RRmn1(2, 2, 0, 2)   # differs!
