cmpChi(r6b, r6a)                    # Wilks 근사 (n이 작으면 too liberal)
require(LBI)
LRT(nrow(d6), 5, 4, r6a$`-2LL`/(-2), r6b$`-2LL`/(-2))   # F 분포 이용 (더 정확)
