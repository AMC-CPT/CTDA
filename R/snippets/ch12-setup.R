library(dobson)
class(doctors) <- "data.frame"   # tbl_df is awkward for reshape/subsetting
class(beetle)  <- "data.frame"
class(Cars)    <- "data.frame"
doctors
