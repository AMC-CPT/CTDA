x <- mtcars[mtcars$am == 0, "mpg"]   # 자동변속기 연비
y <- mtcars[mtcars$am == 1, "mpg"]   # 수동변속기 연비
t.test(y, x, var.equal = TRUE)
r1 <- lm(mpg ~ am, mtcars)
summary(r1)     # beta1 이 차이에 대한 추정값
confint(r1)     # beta 들의 신뢰구간; t 검정 결과와 비교
