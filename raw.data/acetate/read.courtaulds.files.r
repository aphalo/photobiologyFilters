# read all available filter data
# assumes that all files with ".txt" are filter-data files
# assumes that all files with exactly four columns have two replicate measurements that need
# to be averaged
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save all the data.frames created into individual Rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("raw.data/acetate")
file.list <- system('ls *.txt', intern = TRUE)
acetate.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".txt", replacement = "", x = file.name)
  tmp.df <- read.table(file.name, header = TRUE)
  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = transmittance / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  clean(tmp.df)
  acetate.lst[[name]] <- tmp.df
}
acetate.mspct <- filter_mspct(acetate.lst)
setwd("../..")

save(acetate.mspct, file = "data/acetate.mspct.rda")

