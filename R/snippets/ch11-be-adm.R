GLM(log(CMAX) ~ ADM/SEQ/SUBJ + PRD + TRT, BEdata)
RanTest(log(CMAX) ~ ADM/SEQ/SUBJ + PRD + TRT, BEdata, Random = c("ADM", "SUBJ"))
