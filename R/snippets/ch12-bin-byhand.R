expXbhat <- exp(X %*% r6$par)
pihat <- expXbhat / (1 + expXbhat)
yhat <- n * pihat;  t(yhat)
ri <- (y - yhat) / sqrt(n * pihat * (1 - pihat));  t(ri)   # Pearson residuals
Di <- 2 * (y*log(y/yhat) + ifelse(n - y > 0, (n - y)*log((n - y)/(n - yhat)), 0))
sum(Di)                                                     # deviance
di <- sign(y - yhat) * sqrt(Di);  t(di)                     # deviance residuals
