require(lattice)
DATA <- Theoph
colnames(DATA) <- c("ID", "BWT", "DOSE", "TIME", "DV")
DATA[, "ID"] <- as.numeric(as.character(DATA[, "ID"]))
xyplot(DV ~ TIME | as.factor(ID), data = DATA, type = "b")
