d8 <- data.frame(trt = c(rep("Active", 3), rep("Placebo", 3)),
                 pat = c(101, 104, 107, 102, 105, 108),
                 Mo1 = c(7, 6, 8, 9, 5, 7),
                 Mo2 = c(1, 3, 3, 4, 5, 2),
                 Mo3 = c(0, 2, 3, 5, 4, 3));  d8
d9 <- reshape(d8, direction = "long", varying = list(names(d8)[3:5]),
              v.names = "score", idvar = "pat", timevar = "visit", times = 1:3);  d9
