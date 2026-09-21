exp(PDIFF(log(CMAX) ~ ADM/SEQ/SUBJ + PRD + TRT, BEdata, "TRT",
          conf.level = 0.9, rev = TRUE)[1:3])   # 점추정, 하한, 상한
