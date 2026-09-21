library(ggplot2)
ggplot(data.frame(lh), aes(x = 1, y = as.numeric(lh))) + geom_violin()
