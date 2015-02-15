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
setwd("raw.data")
file.list <- system('ls *.txt', intern=TRUE)
for (file.name in file.list) {
  df.name <- paste(sub(pattern=".txt", replacement="", x=file.name), "spct", sep=".")
  tmp.df <- read.table(file.name, header=TRUE)
  tmp.df <- setDT(tmp.df)
  if (ncol(tmp.df) == 4) {
    tmp.df[ , w.length := w.length.1] 
    tmp.df[ , w.length.1 := NULL] 
    tmp.df[ , w.length.2 := NULL] 
    tmp.df[, Tfr := (transmittance.1 + transmittance.2) / 200]
    tmp.df[ , transmittance.1 := NULL] 
    tmp.df[ , transmittance.2 := NULL] 
  } else if (ncol(tmp.df) == 2) {
    tmp.df[ , Tfr := transmittance / 100]
    tmp.df[ , transmittance := NULL]
  } else { 
    stop("ncol != 2 || ncol!=4")
  }
  tmp.df[ Tfr < 1e-5, Tfr := 1e-5]
  setFilterSpct(tmp.df)
  assign(df.name, tmp.df)
  save(list=df.name, file=paste("../data/", df.name, ".rda", sep=""))
}
setwd("./..")

