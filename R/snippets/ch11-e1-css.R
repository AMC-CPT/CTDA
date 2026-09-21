rx <- REG(uptake ~ Type + Treatment, d2, summarize = FALSE)
cSS(ce1[2:3, ], rx)   # 'Type' 의 SS
cSS(ce1[4:5, ], rx)   # 'Treatment' 의 SS
