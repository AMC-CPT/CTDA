b <- coef(r1)                       # beta hat
pihat <- exp(X %*% b)
yhat <- ni * pihat;  t(yhat)        # 적합값
pr <- (y - yhat) / sqrt(yhat);  t(pr)                      # Pearson 잔차
Di <- 2 * (y * log(y/yhat) - (y - yhat));  sum(Di)         # deviance
dr <- sign(y - yhat) * sqrt(Di);  t(dr)                    # deviance 잔차
