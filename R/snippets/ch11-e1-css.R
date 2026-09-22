rx <- REG(uptake ~ Type + Treatment, d2, summarize = FALSE)
cSS(ce1[2:3, ], rx)   # SS of 'Type'
cSS(ce1[4:5, ], rx)   # SS of 'Treatment'
