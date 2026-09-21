par(mfrow = c(1, 2))
plot(VA$cell, main = "plot(VA$cell)", cex.axis = 0.8, cex.main = 0.9)
barplot(table(VA$cell), main = "barplot(table(VA$cell))", cex.axis = 0.8, cex.main = 0.9)
