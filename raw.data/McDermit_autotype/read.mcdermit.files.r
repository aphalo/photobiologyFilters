# read all available filter data
# assumes that all files with ".txt" are filter-data files
# 1) clear the workspace
# 2) read .txt files
# 3) save collection of spectra to .rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("raw.data/McDermit_autotype")
file.list <- system('ls *.txt', intern = TRUE)
mcdermit.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".txt", replacement = "", x = file.name)
  tmp.df <- read.table(file.name, header = TRUE)
  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = transmittance / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <- clean(tmp.df)
  mcdermit.lst[[name]] <- tmp.df
}
mcdermit.mspct <- filter_mspct(mcdermit.lst)
setwd("../..")

save(mcdermit.mspct, file = "data/mcdermit.mspct.rda")

