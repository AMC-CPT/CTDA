(Q - (k - 1))/(sumwi - sum(wi^2)/sumwi)    # method-of-moments tau^2
tau2 <- r6$tau2;  tau2                       # REML tau^2 of metabin
wsi <- 1/(Vi + tau2);  wsi                  # random-effects weights
sumwsi <- sum(wsi)
pwsi <- wsi/sumwsi*100;  pwsi
th.hat.ran <- sum(wsi*thi)/sumwsi;  th.hat.ran
seth.hat.ran <- sqrt(1/sumwsi);  seth.hat.ran
exp(th.hat.ran)                             # random-effects RR, original scale
exp(th.hat.ran + c(-1, 1)*1.96*seth.hat.ran)
