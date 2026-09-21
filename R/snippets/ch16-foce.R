InitStep(DATA, THETAinit = THETAinit, OMinit = OMinit, SGinit = SGinit, LB = LB, UB = UB,
         Pred = PRED, METHOD = "COND")
(EstRes <- EstStep())   # 약 2분 소요
(CovRes <- CovStep())   # 약 1분 소요
get("EBE", envir = e)   # FOCE/LAPL은 매 iteration마다 EBE 추정
TabStep()
