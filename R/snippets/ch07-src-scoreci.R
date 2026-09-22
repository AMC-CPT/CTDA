ScoreCI <- function(y, n, conf.level = 0.95) {
  z <- qnorm(0.5 + conf.level/2);  z2 <- z^2
  mp <- (y + 0.5*z2)/(n + z2)                    # midpoint (not the point estimate)
  eb <- z/(n + z2) * sqrt(y*(n - y)/n + z2/4)    # margin of error
  data.frame(PE = y/n, Lower = mp - eb, Upper = mp + eb)
}
