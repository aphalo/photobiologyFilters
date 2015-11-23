# read all available filter data
# assumes that all files with ".txt" are filter-data files
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save all the data.frames created into individual Rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("raw.data/BPI")
file.list <- system('ls *.txt', intern = TRUE)
bpi_visqueen.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".txt", replacement = "", x = file.name)
  tmp.df <- read.table(file.name, header = TRUE)
  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = transmittance / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  clean(tmp.df)
  bpi_visqueen.lst[[name]] <- tmp.df
}
bpi_visqueen.mspct <- filter_mspct(bpi_visqueen.lst)
setwd("../..")

save(bpi_visqueen.mspct, file = "data/bpi.visqueen.mspct.rda")

