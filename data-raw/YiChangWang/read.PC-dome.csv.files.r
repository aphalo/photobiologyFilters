# read all available filter data
# assumes that all files with ".txt" are filter-data files
# assumes that all files with exactly four columns have two replicate measurements that need
# to be averaged
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save all the data.frames created into a single Rda file in data folder
library(photobiology)
library(dplyr)
rm(list = ls())
setwd("data-raw/YiChangWang/")
file.list <- list.files(pattern = "*.CSV$")
file.list <- grep("DOME", file.list, value = TRUE)

domes.lst <- list()
for (file.name in file.list) {
  NonASCII <- tools::showNonASCIIfile(file.name)
  if (length(NonASCII) > 0L) {
    cat("\nNon ASCII characters in ", file.name, ": ", NonASCII, "\n")
  } else {
    cat(".")
  }

  name <- sub(pattern=".csv|.CSV", replacement="", x=file.name) |> tolower()
  material <- "Polycarbonate (PC)"

  properties <- list(Rfr.constant = 0.105,
                     thickness = 1e-3,
                     attenuation.mode = "absorption")

  tmp.df <- read.csv(file.name, skip=1, header=FALSE, col.names=c("w.length", "Tpc", "sd_Tpc"),
                     colClasses = c("numeric", "numeric", "NULL"), sep = ";")

  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = Tpc / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <- setFilterProperties(tmp.df, properties) %>%
    smooth_spct(method = "supsmu", strength = 0.5)
  setWhatMeasured(tmp.df, paste(material, "; new; clear dome with 2\" diameter sold for surveilance camera", sep = ""))
  setHowMeasured(tmp.df, "Measured with an array spectrophotometer without an integrating sphere.")
  tmp.df <- clean(tmp.df)
  domes.lst[[name]] <- tmp.df
}
domes.mspct <- filter_mspct(domes.lst)
autoplot(domes.mspct)
domes.mspct <- domes.mspct["dome2"]

names(domes.mspct) <- paste("no_brand_PC", names(domes.mspct), sep = "_")

autoplot(domes.mspct)

setwd("./../..")

save(domes.mspct, file = "data-raw/rda/domes.mspct.rda")

