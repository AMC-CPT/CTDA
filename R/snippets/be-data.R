library(sasLM)
# BEdata of sasLM: Cmax of a 2x2 crossover BE study (Bae & Kang 2017);
# each subject is measured twice.
str(BEdata)
# design layout: sequence (SEQ) x period (PRD)
with(BEdata, table(SEQ, PRD))
