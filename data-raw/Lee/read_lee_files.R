library(dplyr)
library(readr)
library(photobiology)

rm(list = ls())
setwd("data-raw/Lee/")
file.list <- list.files(pattern = "*.csv$")

lee.lst <- list()
for (file.name in file.list) {
  name <- paste("Lee", sub(pattern = ".csv", replacement = "", x = file.name), sep = "_")
  tmp.spct <- read_csv(file.name, col_names = c("w.length", "Tfr"),
                     col_types = "dd")
  setFilterSpct(tmp.spct, Tfr.type = "total")
  tmp.spct <- clean(tmp.spct)
  tmp.spct <- interpolate_spct(tmp.spct, w.length.out = 403:698, fill = NA)
  tmp.spct <- setWhatMeasured(tmp.spct, paste("Theatrical 'gel'; Lee '",
                                              gsub("_", " ", name),
                                              "'; new; Lee filters, UK",
                                              " (digitized from specs.)",
                                              sep = ""))
  lee.lst[[name]] <- tmp.spct
}
lee.mspct <- filter_mspct(lee.lst)
setwd("./../..")

save(lee.mspct, file = "data-raw/rda/lee.mspct.rda")

