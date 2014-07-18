# read all available filter data
# assumes that all files with ".txt" are filter-data files
# assumes that all files with exactly four columns have two replicate measurements that need
# to be averaged
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save all the data.frames created into a single Rda file in data folder
library(data.table)
rm(list = ls())
setwd("raw_data/Schott/done/")
file.list <- system('ls *.csv', intern=TRUE)
for (file.name in file.list) {
  dt.name <- paste(sub(pattern=".csv", replacement="", x=file.name), "spct", sep=".")
  tmp.df <- read.csv(file.name, header=FALSE, col.names=c("w.length", "Tfr"))
  class(tmp.df) <- c("filter.spct", "generic.spct", class(tmp.df))
  setDT(tmp.df)
  setkey(tmp.df, w.length)
  tmp.dt <- copy(tmp.df)
  tmp.dt[ , Tpc := Tfr * 100]
  assign(dt.name, tmp.dt)
  save(list=dt.name, file=paste("../../../data/", dt.name, ".rda", sep=""))
}
setwd("./../../..")

