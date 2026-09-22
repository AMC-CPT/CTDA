Theoph   # 12 subjects, 11 samples over 24 h after 320 mg by mouth

plot(Theoph)                                 # Figure 1

dev.new()
plot(conc ~ Time, Theoph)                    # Figure 2

library(lattice)
dev.new()
xyplot(conc ~ Time | Subject, Theoph, type = "o")   # Figure 3

library(nlme)
dev.new()
plot(Theoph)                                 # Figure 4
