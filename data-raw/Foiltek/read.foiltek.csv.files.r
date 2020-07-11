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
    Clear_PC_UV = "Polycarbonate (PC)",
    Clear_PET_G = "Polyethylene terephthalate (PET), 'polyester'",
    Clear_PS = "Polystyrene (PS)",
    Clear_PVC = "Polyvinyl chloride (PVC)",
    ""
  )
  properties <- switch(name,
                     Clear_PC = list(Rfr.constant = 0.105,
                                     thickness = 2e-3,
                                     attenuation.mode = "absorption"),
                     Clear_PC_UV = list(Rfr.constant = 0.10,
                                        thickness = 3e-3,
                                        attenuation.mode = "absorption"),
                     Clear_PET_G = list(Rfr.constant = 0.097,
                                      thickness = 3e-3,
                                      attenuation.mode = "absorption"),
                     Clear_PS = list(Rfr.constant = 0.099,
                                     thickness = 3e-3,
                                     attenuation.mode = "absorption"),
                     Clear_PVC = list(Rfr.constant = 0.08,
                                      thickness = 1.5e-3,
                                      attenuation.mode = "absorption"),
                     ""
  )

  tmp.df <- read.csv(file.name, skip=1, header=FALSE, col.names=c("w.length", "Tpc", "sd_Tpc"),
                     colClasses = c("numeric", "numeric", "NULL"))

  tmp.df <- transmute(tmp.df, w.length = w.length, Tfr = Tpc / 100)
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <- setFilterProperties(tmp.df, properties) %>%
    smooth_spct(method = "supsmu", strength = 0.5)
  setWhatMeasured(tmp.df, paste(material, "; clear sheet; new", sep = ""))
  setHowMeasured(tmp.df, "Measured with an array spectrophotometer without an integrating sphere.")
  tmp.df <- clean(tmp.df)
  foiltek.lst[[name]] <- tmp.df
}
foiltek.mspct <- filter_mspct(foiltek.lst)
names(foiltek.mspct) <- paste(ifelse(grepl("PC_UV", names(foiltek.mspct)), "Macrolife", "Foiltek"),
                              names(foiltek.mspct), sep = "_")
setwd("./../..")

save(foiltek.mspct, file = "data-raw/rda/foiltek.mspct.rda")

