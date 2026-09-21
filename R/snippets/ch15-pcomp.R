dA <- data.frame(No = c(1, 2), Name = c("Gut Depot", "Central"),
                 Level = c(1, 2), xPos = c(1, 1))
dB <- data.frame(From = c(1, 2, 0), To = c(2, 3, 1), Name = c("KA", "K", "F"))
par(oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0))
pComp(dA, dB, Shape = "circ", Col = "#DDEEFF", asp = 1, Cex = 0.8)
