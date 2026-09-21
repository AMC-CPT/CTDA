d3$di  <- d3$di1 + d3$di2               # 합산 사건수
d3$Yi  <- d3$Yi1 + d3$Yi2               # 합산 위험집합
d3$Ei1 <- d3$Yi1 * d3$di / d3$Yi        # test 군 기대 사건수
d3$Ei2 <- d3$Yi2 * d3$di / d3$Yi        # control 군 기대 사건수
d3$Vi1 <- with(d3, Yi1*Yi2/(Yi - 1)*di/Yi*(1 - di/Yi))   # 김종호 p119
d3$Vi2 <- d3$Vi1
d3 <- d3[d3$Yi > 1, ]                    # Yi > 1 인 행만 유지
d3
