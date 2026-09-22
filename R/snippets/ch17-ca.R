x1 <- c(17066, 14464, 788, 126, 37)   # number without the event
y1 <- c(48, 38, 5, 1, 1)              # number with the event
n1 <- x1 + y1                         # total in each category
prop.test(x1, n1)                              # low power
prop.trend.test(x1, n1)                        # equally spaced: low power
prop.trend.test(x1, n1, c(0, 0.5, 1.5, 4, 7))  # midpoint scores
