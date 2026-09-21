Theoph   # 12명, 320 mg 경구 투여 후 24시간 동안 11회 채혈

plot(Theoph)                                 # Figure 1

dev.new()
plot(conc ~ Time, Theoph)                    # Figure 2

library(lattice)
dev.new()
xyplot(conc ~ Time | Subject, Theoph, type = "o")   # Figure 3

library(nlme)
dev.new()
plot(Theoph)                                 # Figure 4
