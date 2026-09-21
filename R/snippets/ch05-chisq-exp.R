# qchisq(p, 2) 와 -2*log(1 - p) 가 같은지 확인한다.
p <- seq(0, 1, by = 0.01)
all.equal(qchisq(p, 2), -2 * log(1 - p))              # 올바른 비교: 허용오차 이내인가
all(qchisq(p, 2) == -2 * log(1 - p))                  # 잘못된 비교 (부동소수점 상등)
all(zapsmall(qchisq(p, 2) - (-2 * log(1 - p))) == 0)  # 역시 잘못된 비교
