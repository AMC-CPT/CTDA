sampMeans <- c(mean(x), mean(y))                 # sample means
PE <- sampMeans[1] - sampMeans[2]                # point estimate of the difference
ns <- c(length(x), length(y))                    # sample sizes
vars <- c(var(x), var(y)) / ns                   # estimated variances of the means
SE <- sqrt(sum(vars))                            # standard error
nullHypo <- 0                                    # difference under the null
t.val <- (PE - nullHypo) / SE;  t.val            # t value
dfs <- ns - 1                                    # df of each sample mean
Df <- sum(vars)^2 / sum(vars^2 / dfs);  Df       # Satterthwaite df
p.val <- 2 * pt(-abs(t.val), Df)                 # p value
alpha <- 0.05                                    # significance level
ci <- PE + c(-1, 1) * qt(1 - alpha/2, Df) * SE;  ci   # confidence interval
