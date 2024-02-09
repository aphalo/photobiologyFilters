# read all available filter data
# assumes that all files with ".csv" are filter-data files
# 1) clear the workspace
# 2) read .csv files
# 3) save the collection of sppectra object to an Rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("data-raw/Plexiglas")
file.list <- list.files(pattern = '*.csv$')
plexiglas.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".csv", replacement = "", x = file.name)
  tmp.df <- read.csv(file.name, skip=1, header=FALSE, col.names=c("w.length", "Tpc", "sd_Tpc"),
                     colClasses = c("numeric", "numeric", "NULL"))
  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = Tpc / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <- setFilterProperties(tmp.df,
                                Rfr.constant = 0.065,
                                thickness = 3e-3,
                                attenuation.mode = "absorption") %>%
#    clip_wl(c(240, NA)) %>%
    smooth_spct(method = "supsmu", strength = 0.5)
  setWhatMeasured(tmp.df,
                  paste("Poly(methyl methacrylate) (PMMA) 'acrylic' sheet; Plexiglas '",
                                gsub("_", " ", name), "'; 0.002 m thick; new; from Evonik Industries, Germany",
                  sep = ""))
  setHowMeasured(tmp.df, "Measured with an array spectrophotometer without an integrating sphere.")
  comment(tmp.df) <- paste("Measured with an Agilent 8453 array spectrophotometer by P. J. Aphalo.",
                           comment(tmp.df))
  clean(tmp.df)
  plexiglas.lst[[name]] <- tmp.df
}
evonik.mspct <- filter_mspct(plexiglas.lst)

names(evonik.mspct) <- paste("Evonik", names(evonik.mspct), sep = "_")
setwd("../..")

save(evonik.mspct, file = "data-raw/rda/evonik.mspct.rda")

