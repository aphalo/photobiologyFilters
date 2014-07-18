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
setwd("raw_data")
file.list <- system('ls *.txt', intern=TRUE)
for (file.name in file.list) {
  df.name <- paste(sub(pattern=".txt", replacement="", x=file.name), "spct", sep=".")
  tmp.df <- read.table(file.name, header=TRUE)
  if (ncol(tmp.df) == 4) {
    tmp.df <- transform(tmp.df, 
                        w.length = w.length.1, 
                        Tpc = (transmittance.1 + transmittance.2) / 2)
    tmp.df <- transform(tmp.df, 
                        Tfr = Tpc / 100)
    tmp.df <- tmp.df[,c("w.length","Tpc","Tfr")]
    class(tmp.df) <- c("filter.spct", "generic.spct", class(tmp.df))
    setDT(tmp.df)
    assign(df.name, tmp.df)
    save(list=df.name, file=paste("../data/", df.name, ".rda", sep=""))
  } else if (ncol(tmp.df) == 2) {
    tmp.df$Tpc <- tmp.df$transmittance
    tmp.df$transmittance <- NULL
    tmp.df$Tfr <- tmp.df$Tpc / 100
    class(tmp.df) <- c("filter.spct", "generic.spct", class(tmp.df))
    setDT(tmp.df)
    assign(df.name, tmp.df)
    save(list=df.name, file=paste("../data/", df.name, ".rda", sep=""))
  }
}
setwd("./..")
