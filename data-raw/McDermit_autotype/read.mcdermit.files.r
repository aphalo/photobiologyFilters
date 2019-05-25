# read all available filter data
# assumes that all files with ".txt" are filter-data files
# 1) clear the workspace
# 2) read .txt files
# 3) save collection of spectra to .rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("data-raw/McDermit_autotype")
file.list <- list.files(pattern = '*.txt$')
mcdermit.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".txt", replacement = "", x = file.name)
  tmp.df <- read.table(file.name, header = TRUE)
  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = transmittance / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  setWhatMeasured(tmp.df, "Polyester, clear film, 0.000125 m thick, Autostat CT5 from McDermit Autotype; new")
  tmp.df <- clean(tmp.df)
  mcdermit.lst[[name]] <- tmp.df
}
mcdermit.mspct <- filter_mspct(mcdermit.lst)
names(mcdermit.mspct) <- paste("McDermit", names(mcdermit.mspct), sep = "_")
setwd("../..")

save(mcdermit.mspct, file = "data-raw/rda/mcdermit.mspct.rda")

