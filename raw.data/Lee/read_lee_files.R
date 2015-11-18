library(dplyr)
library(readr)
library(photobiology)

rm(list = ls())
setwd("raw.data/Lee/")
file.list <- shell('ls *.csv', intern = TRUE)

for (file.name in file.list) {
  spct.name <- paste(sub(pattern = ".csv", replacement = "", x = file.name), 
                   "spct", sep = ".")
  tmp.spct <- read_csv(file.name, col_names = c("w.length", "Tfr"), 
                     col_types = "dd")
  tmp.spct <- mutate(tmp.spct, Tfr = ifelse(Tfr < 0, 0, Tfr))
  setFilterSpct(tmp.spct)
  tmp.spct <- interpolate_spct(tmp.spct, w.length.out = 403:698, fill = 0)
  assign(spct.name, tmp.spct)
  save(list = spct.name, file = paste("../../data/", spct.name, ".rda", sep = ""))
}
# rm(list = ls())
setwd("./../..")
