# read all available filter data
# assumes that all files with ".txt" are filter-data files
# STEPS
# 1) clear the workspace
# 2) read .csv files
# 3) collect all the filter_spct objects into a filter_mspct object
# 4) save the filter_mscpt object into a single Rda file in the data-raw/rda folder
library(photobiology)
rm(list = ls())
setwd("data-raw/Petri_dishes/")
file.list <- list.files(pattern = '*.csv$')
petri.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".csv", replacement = "", x = file.name)
  tmp.df <- read.csv(file.name, skip = 1, header = FALSE,
                     col.names = c("w.length", "Tpc", "sd_Tpc"),
                     colClasses = c("integer", "double", "NULL"))

  properties <- switch(name,
                       glass_nn = list(Rfr.constant = 0.08,
                                       thickness = NA_real_,
                                       attenuation.mode = "absorption"),
                       PS_Sterilin101 = list(Rfr.constant = 0.104,
                                       thickness = NA_real_,
                                       attenuation.mode = "absorption"),
                       PS_Sterilin109 = list(Rfr.constant = 0.098,
                                        thickness = NA_real_,
                                        attenuation.mode = "absorption"),
                       ""
  )

  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <- setFilterProperties(tmp.df, properties) %>%
    smooth_spct(method = "supsmu", strength = 1)
  setWhatMeasured(tmp.df,
                  paste("Petri dish lid; ", ifelse(grepl("PS", name),
                                               paste("polystyrene; ", sub("PS_", "", name)),
                                               "glass")))
  setHowMeasured(tmp.df, "Measured with an array spectrophotometer without an integrating sphere.")
  tmp.df <- clean(tmp.df)
  petri.lst[[name]] <- tmp.df
}
petri_dishes.mspct <- filter_mspct(petri.lst)
setwd("../..")

save(petri_dishes.mspct, file = "data-raw/rda/petri-dishes.mspct.rda")


