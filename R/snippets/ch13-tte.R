source("data/TTE.R")

## survfit 결과로부터 차이 추정
KMdiff(r1, control = 1, percent = TRUE)

## 정형화한 자료로부터 Kaplan-Meier 분석과 차이 추정
d3$time     <- d3$futime
d3$n.event1 <- d3$di1;  d3$n.enter1 <- d3$Yi1
d3$n.censor1 <- as.numeric(d3$fustat == 0 & d3$rx == 1)
d3$n.event2 <- d3$di2;  d3$n.enter2 <- d3$Yi2
d3$n.censor2 <- as.numeric(d3$fustat == 0 & d3$rx == 2)
RDsurv(d3, percent = TRUE)

## 두 군 Cox 비례위험 모형
ovarian$group  <- ovarian$rx - 1        # 1 = test, 0 = control
ovarian$time   <- ovarian$futime
ovarian$status <- ovarian$fustat
Cox(ovarian)
