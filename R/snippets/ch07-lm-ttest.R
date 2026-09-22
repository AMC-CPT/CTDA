x <- mtcars[mtcars$am == 0, "mpg"]   # mpg, automatic transmission
y <- mtcars[mtcars$am == 1, "mpg"]   # mpg, manual transmission
t.test(y, x, var.equal = TRUE)
r1 <- lm(mpg ~ am, mtcars)
summary(r1)     # beta1 estimates the difference
confint(r1)     # CIs of the betas; compare with t.test
