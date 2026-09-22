# contour labels overlap and flip in the narrow panels: turn them off
# and draw fewer levels.
oPar <- par(mfrow = c(1, 2))
contour(A, B, Pri,   xlab = expression(beta[0]), ylab = expression(beta[1]),
        main = "Joint Prior",     nlevels = 8, drawlabels = FALSE)
contour(A, B, nPost, xlab = expression(beta[0]), ylab = expression(beta[1]),
        main = "Joint Posterior", nlevels = 8, drawlabels = FALSE)
par(oPar)
