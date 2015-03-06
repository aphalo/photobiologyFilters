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
setwd("raw.data/Schott/done/")
file.list <- system('ls *.csv', intern=TRUE)
for (file.name in file.list) {
  dt.name <- paste(sub(pattern=".csv", replacement="", x=file.name), "spct", sep=".")
  tmp.df <- read.csv(file.name, header=FALSE, col.names=c("w.length", "Tfr"))
  setDT(tmp.df)
  setkey(tmp.df, w.length)
  setFilterSpct(tmp.df, "internal")
  assign(dt.name, tmp.df)
  save(list=dt.name, file=paste("../../../data/", dt.name, ".rda", sep=""))
}
setwd("./../../..")

