library("photobiology")
library(readr)
library(dplyr)

rm(list = ls())

files <- list.files("./data-raw/ASTER/", pattern = "*.spectrum.txt", full.names = TRUE)

materials.mspct <- list()
for (f in files) {
  tmp.header <- read_lines(f, n_max = 26)
  what.measured <- gsub("Name: *", "", tmp.header[1])
  name <- make.names(tolower(what.measured))
  tmp <- read.table(f, col.names = c("w.length", "Rfr"), skip = 26) %>%
    arrange(w.length) %>% # some files are sorted bu decreasing wavelength
    mutate(w.length = w.length * 1e3, # um -> nm
           Rfr = Rfr * 1e-2) # % -> /1
  setReflectorSpct(tmp, Rfr.type = "total")
  setWhatMeasured(tmp, what.measured)
  comment(tmp) <- paste(tmp.header, collapse = "\n")
  materials.mspct[[tolower(name)]] <- tmp
}

materials.mspct <- as.reflector_mspct(materials.mspct)
comment(materials.mspct) <- "Source: ASTER spectral library. This is a small selection. See: https://speclib.jpl.nasa.gov/."

save(materials.mspct, file = "data/materials-mspct.rda")
