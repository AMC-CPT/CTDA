PDIFF(DV ~ as.factor(Dose) + SBP0 + eGFR, d6, "as.factor(Dose)",
      adj = "dunnett", ref = "0", PLOT = TRUE)
