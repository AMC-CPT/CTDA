# Check whether qchisq(p, 2) and -2*log(1 - p) are equal.
p <- seq(0, 1, by = 0.01)
all.equal(qchisq(p, 2), -2 * log(1 - p))              # right: within tolerance?
all(qchisq(p, 2) == -2 * log(1 - p))                  # wrong: floating-point equality
all(zapsmall(qchisq(p, 2) - (-2 * log(1 - p))) == 0)  # also wrong
