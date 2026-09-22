cmpChi(r6b, r6a)                    # Wilks approximation (too liberal for small n)
require(LBI)
LRT(nrow(d6), 5, 4, r6a$`-2LL`/(-2), r6b$`-2LL`/(-2))   # F-based (more accurate)
