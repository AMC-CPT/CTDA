# 표준 2x2 교차설계 BE 모형: 순서 SEQ, 개체 SUBJ(SEQ 내포), 시기 PRD, 제제 TRT
# (Type 3 SS·오차항·EMS 등 ANOVA 기계장치의 상세는 분산분석 장 참조)
ci <- exp(PDIFF(log(CMAX) ~ SEQ/SUBJ + PRD + TRT, BEdata, "TRT",
                conf.level = 0.90, rev = TRUE)[1:3])
names(ci) <- c("GMR", "lower", "upper")
round(ci, 4)
# 평균생물학적동등성 판정: 90% CI가 [0.80, 1.25]에 완전히 들어가는가?
c(BE = unname((ci["lower"] > 0.80) & (ci["upper"] < 1.25)))
