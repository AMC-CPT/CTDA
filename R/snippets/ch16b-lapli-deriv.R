FGD <- deriv(~ DOSE/(TH2*exp(ETA2))*TH1*exp(ETA1)/(TH1*exp(ETA1) - TH3*exp(ETA3))*
               (exp(-TH3*exp(ETA3)*TIME) - exp(-TH1*exp(ETA1)*TIME)),
             c("ETA1", "ETA2", "ETA3"),
             function.arg = c("TH1","TH2","TH3","ETA1","ETA2","ETA3","DOSE","TIME"),
             func = TRUE, hessian = TRUE)          # F, G(gradient), D(hessian)를 기호미분
H <- deriv(~ F + F*EPS1 + EPS2, c("EPS1", "EPS2"),
           function.arg = c("F", "EPS1", "EPS2"), func = TRUE)
