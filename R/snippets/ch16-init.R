require(nmw)
e <- get("e", envir = asNamespace("nmw"))   # PRED가 nmw 내부 환경 e를 참조하도록 노출
InitStep(DATA, THETAinit = THETAinit, OMinit = OMinit, SGinit = SGinit,
         LB = LB, UB = UB, Pred = PRED, METHOD = "ZERO")
