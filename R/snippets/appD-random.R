(Q - (k - 1))/(sumwi - sum(wi^2)/sumwi)    # 적률법(method of moment) tau^2
tau2 <- r6$tau2;  tau2                       # metabin의 REML tau^2
wsi <- 1/(Vi + tau2);  wsi                  # 임의효과 가중치
sumwsi <- sum(wsi)
pwsi <- wsi/sumwsi*100;  pwsi
th.hat.ran <- sum(wsi*thi)/sumwsi;  th.hat.ran
seth.hat.ran <- sqrt(1/sumwsi);  seth.hat.ran
exp(th.hat.ran)                             # 원척도 임의효과 RR
exp(th.hat.ran + c(-1, 1)*1.96*seth.hat.ran)
