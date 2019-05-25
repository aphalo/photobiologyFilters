# read all available filter data
# assumes that all files with ".txt" are filter-data files
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save all the data.frames created into individual Rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("data-raw/BPI")
file.list <- list.files(pattern = "*.txt")
bpi_visqueen.lst <- list()
for (file.name in file.list) {
  NonASCII <- tools::showNonASCIIfile(file.name)
  if (length(NonASCII) > 0L) {
    cat("\nNon ASCII characters in ", file.name, ": ", NonASCII, "\n")
  } else {
    cat(".")
  }

  name <- sub(pattern = ".txt", replacement = "", x = file.name)
  tmp.df <- read.table(file.name, header = TRUE)
  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = transmittance / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  setWhatMeasured(tmp.df, paste(name, ", special greenhouse cladding film from BPI Agri", sep = ""))
  clean(tmp.df)
  bpi_visqueen.lst[[name]] <- tmp.df
}
bpi_visqueen.mspct <- filter_mspct(bpi_visqueen.lst)
names(bpi_visqueen.mspct) <- paste("BPI", names(bpi_visqueen.mspct), sep = "_")
setwd("../..")

save(bpi_visqueen.mspct, file = "data-raw/rda/bpi-visqueen.mspct.rda")

