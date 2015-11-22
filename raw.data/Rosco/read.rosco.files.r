# read all available filter data
# assumes that all files with ".txt" are filter-data files
# assumes that all files with exactly four columns have two replicate measurements that need
# to be averaged
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save all the data.frames created into individual Rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("raw.data/Rosco")
file.list <- system('ls *.txt', intern=TRUE)
rosco.lst <- list()
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
  tmp.df <- mutate(tmp.df, Tfr = ifelse(Tfr < 1e-5, 1e-5, Tfr))
  setFilterSpct(tmp.df, Tfr.type = "total")
  rosco.lst[[name]] <- tmp.df
}
rosco.mspct <- filter_mspct(rosco.lst)
setwd("../..")

save(rosco.mspct, file = "data/rosco.mspct.rda")

