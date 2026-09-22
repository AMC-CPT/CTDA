cA <- rep(A, each = length(B));  cB <- rep(B, length(A))
p  <- as.vector(t(Post))
nsamp <- 1000
set.seed(1)                                 # reproducibility
idx <- sample(length(p), size = nsamp, replace = TRUE, prob = p/sum(p))   # Monte Carlo
samp_A <- cA[idx];  samp_B <- cB[idx]
samps <- data.frame(ind = 1:nsamp, alpha = samp_A, beta = samp_B)
p.cut <- 0.3                                # MTD: dose with DLT probability 0.3
samps$MTD <- (log(p.cut/(1 - p.cut)) - samps$alpha)/samps$beta
samps[samps$MTD < 0,   "MTD"] <- -1         # left boundary
samps[samps$MTD > 100, "MTD"] <- 101        # right boundary
vQ <- c(0.025, 0.05, 0.25, 0.5, 0.75, 0.95, 0.975)
t5 <- rbind(quantile(samps$alpha, vQ), quantile(samps$beta, vQ), quantile(samps$MTD, vQ))
rownames(t5) <- c("Alpha", "Beta", "MTD")
round(t5, 3)
