x <- 1:3
x[3]                    # 3
`[`(x, 3)               # the same: [ is a function too
do.call("[", list(x, 3))
