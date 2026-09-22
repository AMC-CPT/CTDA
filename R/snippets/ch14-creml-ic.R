m2LL <- 2*r2$value;  m2LL                                    # -2 log likelihood
2*nParA + m2LL                                               # AIC  (nlme)
2*nParR + m2LL   # AIC  (SAS, random effects only)
2*nParA + m2LL + 2*nParA*(nParA + 1)/(nRec - nParA - 1)      # AICc (nlme)
2*nParR + m2LL + 2*nParR*(nParR + 1)/(nRec - nParR - 1)      # AICc (SAS)
nParA*log(nRec - nParF) + m2LL                               # BIC  (nlme)
nParR*log(nID) + m2LL                                        # BIC  (SAS)
-r2$value                                                    # log likelihood
