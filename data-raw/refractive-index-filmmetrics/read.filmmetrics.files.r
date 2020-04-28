# read all available filter data
# assumes that all files with ".txt" are filter-data files
# 1) clear the workspace
# 2) read .txt files
# 3) save collection of spectra to .rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("data-raw/refractive-index-filmmetrics")
file.list <- list.files(pattern = '*.txt$')
n_index.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".txt", replacement = "", x = file.name)
  tmp.df <- read.table(file.name, header = TRUE)
  names(tmp.df)[1] <- "w.length"
  setGenericSpct(tmp.df)
  setWhatMeasured(tmp.df, paste("Refractive index for", name))
  comment(tmp.df) <-
    paste("Refractive index 'n' as a function of wavelength for",
          name,
          ".\nSource: Refractive Index Database at",
          "https://www.filmetrics.com/refractive-index-database.")
  n_index.lst[[name]] <- tmp.df
}
refractive_index.mspct <- generic_mspct(n_index.lst)

length(refractive_index.mspct)
names(refractive_index.mspct)

setwd("../..")

save(refractive_index.mspct, file = "data/refractive-index.rda")

