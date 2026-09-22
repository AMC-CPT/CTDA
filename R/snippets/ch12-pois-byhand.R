b <- coef(r1)                       # beta hat
pihat <- exp(X %*% b)
yhat <- ni * pihat;  t(yhat)        # fitted values
pr <- (y - yhat) / sqrt(yhat);  t(pr)                      # Pearson residuals
Di <- 2 * (y * log(y/yhat) - (y - yhat));  sum(Di)         # deviance
dr <- sign(y - yhat) * sqrt(Di);  t(dr)                    # deviance residuals
