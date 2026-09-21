DATA <- Theoph
colnames(DATA) <- c("ID", "BWT", "DOSE", "TIME", "DV")
DATA[, "ID"] <- as.numeric(as.character(DATA[, "ID"]))
IDs <- unique(DATA[, "ID"]);  nID <- length(IDs)

nTheta <- 3;  nEta <- 3;  nEps <- 2
nPara  <- nTheta + nEta*(nEta + 1)/2 + nEps        # = 11
GNames <- outer("G", 1:nEta, paste0)[1, ]          # "G1" "G2" "G3"
HNames <- outer("H", 1:nEps, paste0)[1, ]          # "H1" "H2"
iOM <- (nTheta + 1):(nTheta + nEta*(nEta + 1)/2)   # 4:9  (Omega의 자유 원소)
iSG <- (nTheta + nEta*(nEta + 1)/2 + 1):nPara      # 10:11 (Sigma의 대각)
