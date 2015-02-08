# read all available filter data
# assumes that all files with ".txt" are filter-data files
# assumes that all files with exactly four columns have two replicate measurements that need
# to be averaged
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save all the data.frames created into a single Rda file in data folder
library(photobiology)
rm(list = ls())
setwd("raw.data/Foiltek/")
file.list <- shell('ls *.CSV', intern=TRUE)
for (file.name in file.list) {
  dt.name <- paste(sub(pattern=".CSV", replacement="", x=file.name), "spct", sep=".")
  tmp.df <- read.csv(file.name, skip=1, header=FALSE, col.names=c("w.length", "Tpc", "sd_Tpc"), 
                     colClasses = c("numeric", "numeric", "NULL"))
  tmp.df <- setDT(tmp.df)
  setkey(tmp.df, w.length)
  tmp.df[ , Tfr := Tpc / 100]
  tmp.df[ , Tpc := NULL]
  setFilterSpct(tmp.df)
  assign(dt.name, tmp.df)
  save(list=dt.name, file=paste("../../data/", dt.name, ".rda", sep=""))
}
# rm(list = ls())
setwd("./../..")

