ciSurv = function(pe, se, surv, conf.level=0.95)
{
  logse = se/-log(surv)
  ci = c(max(0, exp(log(pe) - qnorm(0.5 + conf.level/2)*logse)),
         min(1, exp(log(pe) + qnorm(0.5 + conf.level/2)*logse)))
  return(ci)
}

KMdiff = function(r1, conf.level=0.95, event=F, control=2, percent=F)
{
  if (!control %in% c(1, 2)) stop("control should be 1 or 2 (stratum number of the control group)")
  if ("survfit" %in% class(r1)) {
    s1 = summary(r1)
    s0 = with(s1, table(strata))
    if (length(s0) == 1) stop("No strata to compare!")
    if (control == 1) {   # first stratum is the control group
      i1 = sum(s0)        # test: last row of the second stratum
      i2 = s0[1]          # control: last row of the first stratum
    } else {              # second stratum is the control group
      i1 = s0[1]          # test: last row of the first stratum
      i2 = sum(s0)        # control: last row of the second stratum
    }
    d0 = as.data.frame(s1[c("surv", "std.err")])
    d0 = d0[d0$std.err > 0, ]
    RowName0 = names(s0)
    if (control == 1) RowName0 = rev(RowName0) 
  } else { # rbinded table output of KMtable; the caller (RDsurv) fixes i1 = test, i2 = control
    d0 = r1$d0
    i1 = r1$i1
    i2 = r1$i2
    RowName0 = c("Test", "Control")
  }

  pe1 = ifelse(event, 1 - d0[i1, "surv"], d0[i1, "surv"])
  ci1 = ciSurv(pe1, d0[i1, "std.err"], d0[i1, "surv"], conf.level=conf.level)
  
  pe2 = ifelse(event, 1 - d0[i2, "surv"], d0[i2, "surv"])
  ci2 = ciSurv(pe2, d0[i2, "std.err"], d0[i2, "surv"], conf.level=conf.level)

  pe3 = pe1 - pe2   # test - control
  se3 = sqrt(d0[i1, "std.err"]^2 + d0[i2, "std.err"]^2)
  ci3 = pe3 + c(-1, 1)*qnorm(0.5 + conf.level/2)*se3

  Res = as.data.frame(cbind(c(pe1, pe2, pe3), rbind(ci1, ci2, ci3)))
  if (percent) Res = Res*100
  rownames(Res) = c(RowName0, "Difference")
  colnames(Res) = c("PE", "LowerCL", "UpperCL")
  if (percent) colnames(Res) = paste0(colnames(Res), "(%)")
  attr(Res, "conf.level") = conf.level
  return(Res)
}

KMtable = function(d1, conf.level=0.95) # requires n.enter[1], n.censor, n.event
{
  nr1 = nrow(d1)
  d1[1, "n.risk"] = d1[1, "n.enter"]
  for (i in 2:nr1) {
    d1[i, "n.enter"] = d1[i - 1, "n.enter"] - d1[i - 1, "n.censor"]  - d1[i - 1, "n.event"]
    d1[i, "n.risk"] = d1[i, "n.enter"] - d1[i, "n.censor"]/2
  }

  d1$surv = cumprod(1 - d1$n.event/d1$n.risk)
  se0 = sqrt(cumsum(d1$n.event/d1$n.risk/(d1$n.risk - d1$n.event)))
  d1$std.err = d1$surv*se0  # Greenwood formula
  d1$ll = pmax(0, exp(log(d1$surv) - qnorm(0.5 + conf.level/2)*se0))
  d1$ul = pmin(1, exp(log(d1$surv) + qnorm(0.5 + conf.level/2)*se0))

  return(d1)
}

LogRank = function(d0, n1, n2) # requires di1, di2, Yi1, Yi2
{
  d0$di = d0$di1 + d0$di2
  d0$Yi = d0$Yi1 + d0$Yi2
  d0$Ei1 = d0$Yi1 * d0$di/d0$Yi
  d0$Ei2 = d0$Yi2 * d0$di/d0$Yi
  d0$Vi1 = with(d0, Yi1*Yi2/(Yi - 1)*di/Yi*(1 - di/Yi)) # Kim JH p119
  d0$Vi2 = with(d0, Yi1*Yi2/(Yi - 1)*di/Yi*(1 - di/Yi))
  d0 = d0[d0$Yi > 1, ]

  O1 = sum(d0$di1)
  O2 = sum(d0$di2)
  E1 = sum(d0$Ei1)
  E2 = sum(d0$Ei2)
  V1 = sum(d0$Vi1)
  V2 = sum(d0$Vi2)
  Chi1 = (O1 - E1)^2/E1
  Chi2 = (O2 - E2)^2/E2
  Chi0 = (E1 - O1)^2/V1 

  r4 = list()
  r4$n = c(Test = n1, Control = n2)
  r4$obs = c(O1, O2)
  r4$exp = c(E1, E2)
  r4$var = matrix(c(V1, -V1, -V2, V2), nrow=2)
  r4$chisq = Chi0                       # Kim JH p121 eq 6.10
  r4$pvalue = 1 - pchisq(Chi0, 1)

  require(survival)
  class(r4) = "survdiff"  
  return(r4)
}

RDsurv = function(d0, conf.level=0.95, event=F, percent=F, control=2)
{
## Difference by Kaplan-Meier
  d0 = d0[order(d0$time), ]
  d1 = d0[, c("time", "n.enter1", "n.censor1", "n.event1")]
  d2 = d0[, c("time", "n.enter2", "n.censor2", "n.event2")]
  colnames(d1) = c("time", "n.enter", "n.censor", "n.event")
  colnames(d2) = c("time", "n.enter", "n.censor", "n.event")
  d1 = KMtable(d1, conf.level=conf.level)
  d2 = KMtable(d2, conf.level=conf.level)
  i1 = max(which(d1$std.err > 0))
  i2 = max(which(d2$std.err > 0))
  r1 = KMdiff(list(d0=rbind(d1, d2), i1=i1, i2=nrow(d1) + i2), event=event, control=control, percent=percent)
  r2 = d1[d1$n.event > 0, ]
  r3 = d2[d2$n.event > 0, ]

## Log-rank test
  d3 = d0
  d3$di1 = d3$n.event1
  d3$di2 = d3$n.event2
  d3$Yi1 = d3$n.enter1 - d3$n.censor1/2
  d3$Yi2 = d3$n.enter2 - d3$n.censor2/2
  r4 = LogRank(d3, d1[1, "n.enter"], d2[1, "n.enter"])
  
  Res = list(r2, r3, r1, r4)
  names(Res) = c("Test", "Control", "Difference", "Log-rank test")
  return(Res)
}

Cox = function(d0, conf.level=0.95) # requires time, status, group(0 or 1)
{
  mLL = function(b) { # Kim JH p143
    Div = vector(length=nrow(d0))
    for (i in 1:nrow(d0)) Div[i] = sum(exp(d0[d0$time >= d0[i, "time"], "group"]*b))
    return(-sum(d0$status*(d0$group*b - log(Div))))
  }

  r0 = optim(0, mLL, method="L-BFGS-B", hessian=T)
  r0$se = sqrt(diag(solve(r0$hessian)))
  r0$ci = r0$par + c(-1, 1)*qnorm(0.5 + conf.level/2)*r0$se
  r0$'exp(coef)' = c(pe=exp(r0$par), lower=exp(r0$ci[1]), upper=exp(r0$ci[2]))
  r0$'exp(-coef)' = c(pe=exp(-r0$par), lower=exp(-r0$ci[2]), upper=exp(-r0$ci[1]))  
  return(r0)
}

## ---- Self-check for the control argument of KMdiff (not run on source) ----
## control is the stratum number of the control group and Difference is
## test - control, so control=1 and control=2 must give the same two group
## rows in opposite order and a sign-flipped Difference (its CI limits swap
## and change sign). Paste the lines below into R to verify.
##   library(survival)
##   r1 = survfit(Surv(futime, fustat) ~ rx, ovarian)
##   a = KMdiff(r1, control=1, percent=TRUE)   # control = first stratum (rx=1)
##   b = KMdiff(r1, control=2, percent=TRUE)   # control = second stratum (rx=2)
##   a
##   #               PE(%) LowerCL(%) UpperCL(%)
##   # rx=2       56.41026   33.89923   93.86988
##   # rx=1       43.07692   30.61970   60.60220
##   # Difference 13.33333  -27.61158   54.27825
##   b
##   #                PE(%) LowerCL(%) UpperCL(%)
##   # rx=1        43.07692   30.61970   60.60220
##   # rx=2        56.41026   33.89923   93.86988
##   # Difference -13.33333  -54.27825   27.61158
##   stopifnot(all.equal(unlist(a[c("rx=2", "rx=1"), ]), unlist(b[c("rx=2", "rx=1"), ])),
##             all.equal(unname(unlist(a["Difference", ])),
##                       -unname(unlist(b["Difference", c(1, 3, 2)]))))
