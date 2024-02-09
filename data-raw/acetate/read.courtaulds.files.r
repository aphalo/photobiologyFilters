# read all available filter data
# assumes that all files with ".txt" are filter-data files
# assumes that all files with exactly four columns have two replicate measurements that need
# to be averaged
# STEPS
# 1) clear the workspace
# 2) read .txt files
# 3) save all the data.frames created into individual Rda file in data folder
library(photobiology)
library(dplyr)
library(stringr)
rm(list = ls())
setwd("data-raw/acetate")
file.list <- list.files(pattern = "*.txt")
acetate.lst <- list()
for (file.name in file.list) {
  NonASCII <- tools::showNonASCIIfile(file.name)
  if (length(NonASCII) > 0L) {
    cat("\nNon ASCII characters in ", file.name, ": ", NonASCII, "\n")
  } else {
    cat(".")
  }

  name <- sub(pattern = ".txt", replacement = "", x = file.name)
  thickness <- as.numeric(str_sub(name, 7, 9)) * 1e-6
  used <- grepl("age", name)
  name <- sub("Clear_", "CA_", name)
  tmp.df <- read.table(file.name, header = TRUE)
  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = transmittance / 100)

  setFilterSpct(tmp.df, Tfr.type = "total")
  setWhatMeasured(tmp.df, paste("Courtaulds cellulose (di-)acetate (CA); ", thickness, " m thick; ",
                                ifelse(used, "used", "new"), sep = ""))
  setHowMeasured(tmp.df,
                 "Filters measured with an array spectrophotometer without an integrating sphere.")
  comment(tmp.df) <- paste("Measured with a Hwelett-Packard 8453 array spectrophotometer.",
                           comment(tmp.df))
  setFilterProperties(tmp.df,
                      Rfr.constant = 0.069,
                      thickness = thickness,
                      attenuation.mode = "absorption")
  clean(tmp.df)
  acetate.lst[[name]] <- tmp.df
}
courtaulds.mspct <- filter_mspct(acetate.lst)
names(courtaulds.mspct) <- paste("Courtaulds", names(courtaulds.mspct), sep = "_")
setwd("../..")

save(courtaulds.mspct, file = "data-raw/rda/courtaulds.mspct.rda")

