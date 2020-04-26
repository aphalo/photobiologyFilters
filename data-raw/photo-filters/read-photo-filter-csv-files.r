# read all available filter data
# assumes that all files with ".CSV" are filter-data files
# STEPS
# 1) clear the workspace
# 2) read .csv files
# 3) collect all the filter_spct objects into a filter_mspct object
# 4) save the filter_mscpt object into a single Rda file in the data-raw/rda folder
library(photobiology)
rm(list = ls())
setwd("data-raw/photo-filters/")
file.list <- list.files(pattern = '*.CSV$', ignore.case = TRUE)
photo_filters.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".CSV|.csv", replacement = "", x = file.name)
  tmp.df <- read.csv(file.name, skip = 1, header = FALSE,
                     sep = ";",
                     col.names = c("w.length", "Tpc", "sd_Tpc"),
                     colClasses = c("integer", "double", "NULL"))
  tmp.df[["Tfr"]] <- tmp.df[["Tpc"]] / 100
  tmp.df[["Tpc"]] <- NULL
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <-
    clean(tmp.df,
          range.s.data = c(0, 1)) %>%
    setFilterProperties(Rfr.constant = ifelse(grepl("UV|Protector|Skylight|IR-[6-8]|R72|Haze|RG|Night|Clear", name),
                                              max(1 - max(tmp.df[["Tfr"]]), 0),
                                              NA_real_),
                        thickness = NA_real_,
                        attenuation.mode = ifelse(grepl("UVIR|Baader|StraightEdgeU", name),
                                                        "reflection", "absorption")) %>%
    #    clip_wl(c(240, NA)) %>%
    smooth_spct(method = "supsmu", strength = 0.5)
  setWhatMeasured(tmp.df,
                  paste("Photography filter:", gsub("_", "-", gsub("-", " ", name))))
  setHowMeasured(tmp.df, "Individual filters measured with an array spectrophotometer without an integrating sphere.")
  comment(tmp.df) <- "Measured with an Agilent 8453 array spectrophotometer by P. J. Aphalo."
  photo_filters.lst[[gsub("_$", "", gsub("[.][.]|[.]", "_", make.names(name)))]] <- tmp.df
}
photography_filters.mspct <- filter_mspct(photo_filters.lst)
photography_filters.mspct <- trim_wl(photography_filters.mspct, range = c(NA, 1020))
setwd("../..")

save(photography_filters.mspct, file = "data-raw/rda/photography-filters.mspct.rda")


