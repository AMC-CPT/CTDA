require(nmw)
e <- get("e", envir = asNamespace("nmw")) # expose nmw's environment e to PRED
InitStep(DATA, THETAinit = THETAinit, OMinit = OMinit, SGinit = SGinit,
         LB = LB, UB = UB, Pred = PRED, METHOD = "ZERO")
