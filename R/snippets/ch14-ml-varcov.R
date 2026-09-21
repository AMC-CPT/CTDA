getVarCov(Orth.ML, type = "random.effects")   # G matrix
getVarCov(Orth.ML, type = "conditional")      # R matrix
getVarCov(Orth.ML, type = "marginal")         # V matrix
VarCorr(Orth.ML)                              # G matrix의 상관계수
