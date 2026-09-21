m2LL <- 2*r1$value;  m2LL                                    # -2 log likelihood
2*nParA + m2LL                                               # AIC
2*nParA + m2LL + 2*nParA*(nParA + 1)/(nRec - nParA - 1)      # AICc
nParA*log(nRec) + m2LL                                       # BIC (nlme)
nParA*log(nID)  + m2LL                                       # BIC (SAS)
-r1$value                                                    # log likelihood
