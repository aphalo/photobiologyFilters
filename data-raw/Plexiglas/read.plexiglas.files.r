# read all available filter data
# assumes that all files with ".csv" are filter-data files
# 1) clear the workspace
# 2) read .csv files
# 3) save the collection of sppectra object to an Rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("data-raw/Plexiglas")
file.list <- list.files(pattern = '*.csv$')
plexiglas.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".csv", replacement = "", x = file.name)
  tmp.df <- read.csv(file.name, skip=1, header=FALSE, col.names=c("w.length", "Tpc", "sd_Tpc"),
                     colClasses = c("numeric", "numeric", "NULL"))
  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = Tpc / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  clean(tmp.df)
  plexiglas.lst[[name]] <- tmp.df
}
plexiglas.mspct <- filter_mspct(plexiglas.lst)
setwd("../..")

save(plexiglas.mspct, file = "data-raw/rda/plexiglas.mspct.rda")

