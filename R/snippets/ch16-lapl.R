InitStep(DATA, THETAinit = THETAinit, OMinit = OMinit, SGinit = SGinit, LB = LB, UB = UB,
         Pred = PRED, METHOD = "LAPL")
(EstRes <- EstStep())   # 약 4분 소요
(CovRes <- CovStep())
get("EBE", envir = e)
TabStep()
