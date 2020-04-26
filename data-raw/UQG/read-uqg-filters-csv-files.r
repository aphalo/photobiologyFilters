# read all available filter data
# assumes that all files with ".CSV" are filter-data files
# STEPS
# 1) clear the workspace
# 2) read .csv files
# 3) collect all the filter_spct objects into a filter_mspct object
# 4) save the filter_mscpt object into a single Rda file in the data-raw/rda folder
library(photobiology)
rm(list = ls())
setwd("data-raw/UQG/")
file.list <- list.files(pattern = '*.CSV$', ignore.case = TRUE)
uqg.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".CSV|.csv", replacement = "", x = file.name)
  tmp.df <- read.csv(file.name, skip = 1, header = FALSE,
                     sep = ";",
                     col.names = c("w.length", "Tpc", "sd_Tpc"),
                     colClasses = c("integer", "double", "NULL"))

  properties <- if (grepl("dichroic|UVK", name)) {
    list(Rfr.constant = NA_real_,
         thickness = 1.1e-3,
         attenuation.mode = "reflection")
  } else if (grepl("2mm", name)) {
    list(Rfr.constant = 0.077,
         thickness = 2e-3,
         attenuation.mode = "absorption")
  } else if (grepl("3mm", name)) {
    list(Rfr.constant = 0.082,
         thickness = 3e-3,
         attenuation.mode = "absorption")
  }
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <- setFilterProperties(tmp.df,
                                filter.properties = properties) %>%
    #    clip_wl(c(240, NA)) %>%
    smooth_spct(method = "supsmu", strength = 0.5)
  setWhatMeasured(tmp.df,
                  paste("Glass filter:", gsub("_", "-", gsub("-", " ", name))))
  setHowMeasured(tmp.df, "Measured with an array spectrophotometer without integrating sphere.")
  comment(tmp.df) <- "Measured with an Agilent 8453 array spectrophotometer by P. J. Aphalo."
  tmp.df <- clean(tmp.df)
  uqg.lst[[gsub("_$", "", gsub("[.][.]|[.]", "_", make.names(name)))]] <- tmp.df
}
uqg.mspct <- filter_mspct(uqg.lst)
uqg.mspct <- trim_wl(uqg.mspct, range = c(NA, 1020))
setwd("../..")

save(uqg.mspct, file = "data-raw/rda/uqg.mspct.rda")


