getVarCov(Orth.ML, type = "random.effects")   # G matrix
getVarCov(Orth.ML, type = "conditional")      # R matrix
getVarCov(Orth.ML, type = "marginal")         # V matrix
VarCorr(Orth.ML)                              # correlation of the G matrix
