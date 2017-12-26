library(photobiology)
library(dplyr)
rm(list = ls())
setwd("data-raw")
tmp.df <- read.table("various.filters.2005.data", header = TRUE)
tmp.df <- select(tmp.df, Wavelength, supergreen, superblue, multilux)
tmp.df <- transmute(tmp.df,
                    w.length = Wavelength,
                    Supergreen = supergreen / 100,
                    Superblue = superblue / 100,
                    Multilux = multilux / 100)
xl_horticulture.mspct <- split2filter_mspct(tmp.df)
setwd("..")

for (s in names(xl_horticulture.mspct)) {
  xl_horticulture.mspct[[s]] <-
  setWhatMeasured(xl_horticulture.mspct[[s]],
                  paste("'", s, "' greenhouse cladding film; new; from XL Horticulature, UK", sep = ""))
}

save(xl_horticulture.mspct, file = "data-raw/rda/xl-horticulture.mspct.rda")

