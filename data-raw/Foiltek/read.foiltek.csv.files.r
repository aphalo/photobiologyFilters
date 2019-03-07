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
setwd("data-raw/Foiltek/")
file.list <- list.files(pattern = "*.csv$")
foiltek.lst <- list()
for (file.name in file.list) {
  NonASCII <- tools::showNonASCIIfile(file.name)
  if (length(NonASCII) > 0L) {
    cat("\nNon ASCII characters in ", file.name, ": ", NonASCII, "\n")
  } else {
    cat(".")
  }

  name <- sub(pattern=".csv", replacement="", x=file.name)
  material <- switch(name,
    Clear_PC = "Polycarbonate (PC)",
    Clear_PET = "Polyethylene terephthalate (PET), 'polyester'",
    Clear_PS = "Polystyrene (PS)",
    Clear_PVC = "Polyvinyl chloride (PVC)",
    ""
  )
  tmp.df <- read.csv(file.name, skip=1, header=FALSE, col.names=c("w.length", "Tpc", "sd_Tpc"),
                     colClasses = c("numeric", "numeric", "NULL"))

  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = Tpc / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  setWhatMeasured(tmp.df, paste(material, "; clear sheet; new", sep = ""))
  tmp.df <- clean(tmp.df)
  foiltek.lst[[name]] <- tmp.df
}
foiltek.mspct <- filter_mspct(foiltek.lst)
setwd("./../..")

save(foiltek.mspct, file = "data-raw/rda/foiltek.mspct.rda")

