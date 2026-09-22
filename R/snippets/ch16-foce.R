InitStep(DATA, THETAinit = THETAinit, OMinit = OMinit, SGinit = SGinit, LB = LB, UB = UB,
         Pred = PRED, METHOD = "COND")
(EstRes <- EstStep())   # takes about 2 minutes
(CovRes <- CovStep())   # takes about 1 minute
get("EBE", envir = e)   # FOCE/LAPL estimate the EBEs at every iteration
TabStep()
