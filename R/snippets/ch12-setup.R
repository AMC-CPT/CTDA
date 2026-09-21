library(dobson)
class(doctors) <- "data.frame"   # tbl_df 는 reshape/subsetting 에 문제
class(beetle)  <- "data.frame"
class(Cars)    <- "data.frame"
doctors
