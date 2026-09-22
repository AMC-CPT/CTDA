d1 <- read.csv("data/ExTTE.csv")
cbind(d1[1:25, ], "  " = " ", d1[26:50, ], row.names = NULL)   # 50 rows side by side
