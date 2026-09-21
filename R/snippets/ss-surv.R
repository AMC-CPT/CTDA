# 생존: 위험비 HR=0.7, 양측 alpha=0.05, 검정력 0.80 -> 필요 사건 수와 총 대상자 수
HR <- 0.7;  a <- 0.05;  pw <- 0.80
d <- 4 * (qnorm(1 - a/2) + qnorm(pw))^2 / log(HR)^2   # Schoenfeld 사건 수
c(events = ceiling(d), n_total = ceiling(d / 0.5))    # 전체 사건확률 psi=0.5 가정
