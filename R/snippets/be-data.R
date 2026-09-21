library(sasLM)
# sasLM의 BEdata: 2x2 교차 생동시험의 Cmax (Bae & Kang 2017). 한 대상자가 두 번 측정.
str(BEdata)
# 설계 배치: 순서군(SEQ) x 시기(PRD)
with(BEdata, table(SEQ, PRD))
