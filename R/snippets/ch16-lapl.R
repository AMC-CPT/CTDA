InitStep(DATA, THETAinit = THETAinit, OMinit = OMinit, SGinit = SGinit, LB = LB, UB = UB,
         Pred = PRED, METHOD = "LAPL")
(EstRes <- EstStep())   # takes about 4 minutes
(CovRes <- CovStep())
get("EBE", envir = e)
TabStep()
