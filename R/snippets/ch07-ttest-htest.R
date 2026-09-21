attr(t.val, "names") <- "t"
attr(Df, "names") <- "df"
attr(ci, "conf.level") <- 1 - alpha
attr(sampMeans, "names") <- c("mean of x", "mean of y")
attr(nullHypo, "names") <- "difference in means"

r2 <- list()
r2$statistic <- t.val
r2$parameter <- Df
r2$p.value <- p.val
r2$conf.int <- ci
r2$estimate <- sampMeans
r2$null.value <- nullHypo
r2$stderr <- SE
r2$alternative <- "two.sided"
r2$method <- "Welch Two Sample t-test"
r2$data.name <- "x and y"
class(r2) <- "htest"
r2
