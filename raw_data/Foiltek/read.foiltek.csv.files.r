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
setwd("raw_data/Foiltek/")
file.list <- shell('ls *.CSV', intern=TRUE)
for (file.name in file.list) {
  dt.name <- paste(sub(pattern=".CSV", replacement="", x=file.name), "spct", sep=".")
  tmp.df <- read.csv(file.name, skip=1, header=FALSE, col.names=c("w.length", "Tpc", "sd_Tpc"), 
                     colClasses = c("numeric", "numeric", "NULL"))
  class(tmp.df) <- c("filter.spct", "generic.spct", class(tmp.df))
  setDT(tmp.df)
  setkey(tmp.df, w.length)
  tmp.dt <- copy(tmp.df)
  tmp.dt[ , Tfr := Tpc / 100]
  assign(dt.name, tmp.dt)
  save(list=dt.name, file=paste("../../data/", dt.name, ".rda", sep=""))
}
# rm(list = ls())
setwd("./../..")

