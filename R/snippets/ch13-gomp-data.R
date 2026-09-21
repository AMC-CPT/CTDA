d1 <- read.csv("data/ExTTE.csv")
cbind(d1[1:25, ], "  " = " ", d1[26:50, ], row.names = NULL)   # 50행을 좌우로 배치
