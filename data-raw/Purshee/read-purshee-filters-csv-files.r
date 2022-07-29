# read all available filter data
# assumes that all files with ".CSV" are filter-data files
# STEPS
# 1) clear the workspace
# 2) read .csv files
# 3) collect all the filter_spct objects into a filter_mspct object
# 4) save the filter_mscpt object into a single Rda file in the data-raw/rda folder
library(dplyr)
library(photobiology)
rm(list = ls())
setwd("data-raw/Purshee/")
file.list <- list.files(pattern = '*.CSV$', ignore.case = TRUE)
purshee.lst <- list()
for (file.name in file.list) {
  name <- sub(pattern = ".CSV|.csv", replacement = "", x = file.name)
  tmp.df <- read.csv2(file.name, skip = 1, header = FALSE,
                     sep = ";",
                     col.names = c("w.length", "Tfr"),
                     colClasses = c("double", "double")) %>%
    group_by(w.length) %>%
    summarize(Tfr = median(Tfr))


  properties <- if (grepl("JB", name)) {
    list(Rfr.constant = 0.082,
         thickness = 2e-3,
         attenuation.mode = "absorption")
  } else if (grepl("QB", name)) {
    list(Rfr.constant = 0.084,
         thickness = 2e-3,
         attenuation.mode = "absorption")
  }
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <- setFilterProperties(tmp.df,
                                filter.properties = properties) %>%
    clean()  %>%
#    smooth_spct(method = "supsmu", strength = 0.5) %>%
    thin_wl()
  setWhatMeasured(tmp.df,
                  paste("Glass filter:", gsub("_", "-", gsub("-", " ", name))))
  setHowMeasured(tmp.df, "From seller specifications.")
  comment(tmp.df) <- "Yixing Purshee Optical Elements Co., Ltd at Aliexpress."
  tmp.df <- clean(tmp.df)
  purshee.lst[[gsub("_$", "", gsub("[.][.]|[.]", "_", make.names(name)))]] <- tmp.df
}
purshee.mspct <- filter_mspct(purshee.lst)
purshee.mspct <- trim_wl(purshee.mspct, range = c(NA, 1020))
names(purshee.mspct) <- paste("Purshee", names(purshee.mspct), sep = "_")
purshee_filters <- names(purshee.mspct)
setwd("../..")

save(purshee.mspct, purshee_filters, file = "data-raw/rda/purshee.mspct.rda")


