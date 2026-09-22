# R's built-in anscombe data: four pairs (x1,y1) ... (x4,y4), 11 observations each
Stat = function(k) {
  x = anscombe[[paste0("x", k)]]
  y = anscombe[[paste0("y", k)]]
  r1 = lm(y ~ x)
  c("mean.x" = mean(x), "var.x" = var(x),      # mean x, sample variance x
    "mean.y" = mean(y), "var.y" = var(y),      # mean y, sample variance y
    "cor" = cor(x, y),                         # correlation coefficient
    "intercept" = coef(r1)[[1]], "slope" = coef(r1)[[2]],
    "R.squared" = summary(r1)$r.squared)       # coefficient of determination
}
Res = sapply(1:4, Stat)                        # columns = data sets 1-4
colnames(Res) = paste0("data", 1:4)
round(Res, 3)   # eight summary statistics are essentially the same in all four
