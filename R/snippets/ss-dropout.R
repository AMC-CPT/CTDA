# dropout: inflate the per-group number needed for analysis (about 86) for 15% dropout
n_analyzed <- 86;  pdrop <- 0.15
ceiling(n_analyzed / (1 - pdrop))    # number to enroll per group
