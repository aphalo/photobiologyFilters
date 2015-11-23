# read all available filter data
# assumes that all files with ".txt" are filter-data files
# assumes that all files with exactly four columns have two replicate measurements that need
# to be averaged
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save all the data.frames created into a single Rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("raw.data/Foiltek/")
file.list <- shell('ls *.csv', intern=TRUE)
foiltek.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern=".csv", replacement="", x=file.name)
  tmp.df <- read.csv(file.name, skip=1, header=FALSE, col.names=c("w.length", "Tpc", "sd_Tpc"), 
                     colClasses = c("numeric", "numeric", "NULL"))
  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = Tpc / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <- clean(tmp.df)
  foiltek.lst[[name]] <- tmp.df
}
foiltek.mspct <- filter_mspct(foiltek.lst)
setwd("./../..")

save(foiltek.mspct, file = "data/foiltek.mspct.rda")

