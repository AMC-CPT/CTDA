rx2 <- REG(uptake ~ Type * Treatment, d2, summarize = FALSE)
ce3 <- e3(ModelMatrix(uptake ~ Type * Treatment, d2));  t(zapsmall(ce3))
cSS(ce3[2:3, ], rx2)   # Type
cSS(ce3[4:5, ], rx2)   # Treatment
cSS(ce3[6:9, ], rx2)   # Type:Treatment
GLM(uptake ~ Type * Treatment, d2)
