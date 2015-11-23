# read all available filter data
# assumes that all files with ".txt" are filter-data files
# STEPS
# 1) clear the workspace
# 2) read .csv files
# 3) save all the data.frames created into a single Rda file in data folder
library(photobiology)
rm(list = ls())
setwd("raw.data/Petri_dishes/")
file.list <- shell('ls *.csv', intern = TRUE)
petri.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".csv", replacement = "", x = file.name)
  tmp.df <- read.csv(file.name, skip = 1, header = FALSE, 
                     col.names = c("w.length", "Tpc", "sd_Tpc"), 
                     colClasses = c("integer", "double", "NULL"))
  tmp.df[["Tfr"]] <- tmp.df[["Tpc"]] / 100
  tmp.df[["Tpc"]] <- NULL
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <- clean(tmp.df)
  petri.lst[[name]] <- tmp.df
}
petri_dishes.mspct <- filter_mspct(petri.lst)
setwd("../..")

save(petri_dishes.mspct, file = "data/petri.dishes.mspct.rda")


