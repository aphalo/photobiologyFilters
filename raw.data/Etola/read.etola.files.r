# read all available filter data
# assumes that all files with ".txt" are filter-data files
# assumes that all files with exactly four columns have two replicate measurements that need
# to be averaged
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save collection of spectra to .rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("raw.data/Etola")
file.list <- system('ls *.txt', intern = TRUE)
etola.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern=".txt", replacement="", x=file.name)
  tmp.df <- read.table(file.name, header=TRUE)
  if (ncol(tmp.df) == 4) {
    tmp.df <- transmute(tmp.df, w.length = w.length.1,
                        Tfr = (transmittance.1 + transmittance.2) / 200)
  } else if (ncol(tmp.df) == 2) {
    tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = transmittance / 100)
  } else { 
    stop("ncol != 2 || ncol!=4")
  }
  setFilterSpct(tmp.df, Tfr.type = "total")
  clean(tmp.df)
  etola.lst[[name]] <- tmp.df
}
etola.mspct <- filter_mspct(etola.lst)
setwd("../..")

save(etola.mspct, file = "data/etola.mspct.rda")
