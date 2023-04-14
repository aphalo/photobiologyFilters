# read all available filter data
# assumes that all files with ".txt" are filter-data files
# 1) clear the workspace
# 2) read .txt files
# 3) save collection of spectra to .rda file in data folder
library(photobiology)
library(dplyr)
library(stringr)

rm(list = ls())
setwd("data-raw/refractive-index-filmmetrics")
file_paths <- list.files(pattern = '*.csv$')
file_names <-  basename(file_paths)
obj_names <- gsub(pattern = ".csv", replacement = "", x = file_names)
what_names <- str_split(obj_names, boundary("word"), simplify = TRUE)[ , -c(2,3)]
colnames(what_names) <- c("material", "source")
n_index.lst <- list()
for (i in seq_along(file_names)) {
  tmp.df <- read.csv(file_paths[i], header = TRUE)
  names(tmp.df)[1] <- "w.length"
  if (all(is.na(tmp.df$k))) {
    tmp.df$k <- NULL
  }
  tmp.df$w.length <- tmp.df$w.length * 1e3 # um -> nm
  setGenericSpct(tmp.df)
  tmp.df <- trim_wl(tmp.df, range = c(200, 2000))
  setWhatMeasured(tmp.df,
                  if ("k" %in% colnames(tmp.df)) {
                    paste("Refractive index (n) and extinction coefficient (k) for ",
                          what_names[i, "material"])
                  } else {
                    paste("Refractive index (n) for ",
                          what_names[i, "material"])
                  })
  comment(tmp.df) <-
    paste("Source: Refractive Index Database at",
          "https://refractiveindex.info/",
          "\nOriginal dataset source (abbreviated, see database): ", what_names[i, "source"])
  n_index.lst[[what_names[i, "material"]]] <- tmp.df
}
refractive_index.mspct <- generic_mspct(n_index.lst)

length(refractive_index.mspct)
names(refractive_index.mspct)
summary(refractive_index.mspct, which.metadata = "all")

setwd("../..")

save(refractive_index.mspct, file = "data/refractive-index.rda")

