# read all available filter data
# assumes that all files with ".txt" are filter-data files
# assumes that all files with exactly four columns have two replicate measurements that need
# to be averaged
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save all the data.frames created into a single Rda file in data folder
rm(list = ls())
setwd("raw_data/Schott")
file.list <- system('ls *.txt', intern=TRUE)
for (file.name in file.list) {
  df.name <- paste(sub(pattern=".txt", replacement="", x=file.name), "data", sep=".")
  assign(df.name, read.table(file.name, header=TRUE))
  assign(df.name, transform(get(df.name), transmittance = Ti * 100))
  save(list=df.name, file=paste("../../data/", df.name, ".rda", sep=""))
}
setwd("./../..")
