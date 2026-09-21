library(ggsurvfit)
ggsurvfit(r2) + add_confidence_interval() + add_censor_mark() +
  scale_color_manual(values = c("black", "#123669")) +
  scale_fill_manual(values = c("black", "#123669")) +
  geom_hline(yintercept = 0.5, linetype = 1) +
  geom_segment(aes(x = 270, xend = 270, y = 0, yend = 0.5), col = "black",   linetype = 1) +
  geom_segment(aes(x = 212, xend = 212, y = 0, yend = 0.5), col = "black",   linetype = 2) +
  geom_segment(aes(x = 310, xend = 310, y = 0, yend = 0.5), col = "black",   linetype = 2) +
  geom_segment(aes(x = 426, xend = 426, y = 0, yend = 0.5), col = "#123669", linetype = 1) +
  geom_segment(aes(x = 348, xend = 348, y = 0, yend = 0.5), col = "#123669", linetype = 2) +
  geom_segment(aes(x = 550, xend = 550, y = 0, yend = 0.5), col = "#123669", linetype = 2) +
  add_risktable(risktable_stats = "n.risk")
