# read all available filter data
# assumes that all files with ".CSV" are filter-data files
# STEPS
# 1) clear the workspace
# 2) read .csv files
# 3) collect all the filter_spct objects into a filter_mspct object
# 4) save the filter_mscpt object into a single Rda file in the data-raw/rda folder

# Now thickness and size information are extracted from file names

library(photobiology)
library(dplyr)
library(stringr)

rm(list = ls())
setwd("data-raw/photo-filters/")

file.list <- list.files(pattern = '*.CSV$', ignore.case = TRUE)

full_names <- sub(pattern = ".CSV|.csv", replacement = "", x = file.list)
length(full_names)

photo_filters.lst <- list()
stacked_filters.lst <- list()

# for quality control
filter.suppliers <- character()
filter.sizes <- character()
filter.thicknesses <- character()
filter.types <- character()
filter.labels <- character()
filter.modes <- character()

modes.map <- c(RFL = "reflection",
               LYR = "absorption.layer",
               MIX = "mixed",
               ABS = "absorption",
               STK = "stack")

for (file.name in file.list) {
  cat(file.name, ", ")
  tmp.df <- read.csv(file.name, skip = 1, header = FALSE,
                     sep = ";",
                     col.names = c("w.length", "Tpc", "sd_Tpc"),
                     colClasses = c("integer", "double", "NULL"))
  tmp.df[["Tfr"]] <- tmp.df[["Tpc"]] / 100
  tmp.df[["Tpc"]] <- NULL
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <-
    clean(tmp.df,
          range.s.data = c(0, 1))

  raw.name <- sub(pattern = ".CSV|.csv", replacement = "", x = file.name)
  split.name <- str_split(raw.name, pattern = "-")[[1]]
  num.split.parts <- length(split.name)


  if (!grepl("ABS|LYR|MIX|RFL|STK", split.name[num.split.parts])) {
    filter.mode <- NA_character_
  } else {
    filter.mode <- modes.map[split.name[num.split.parts]]
  }
  filter.modes <- c(filter.modes, filter.mode)

  filter.supplier <- split.name[1]
  filter.suppliers <- c(filter.suppliers, filter.supplier)

  filter.size <- split.name[num.split.parts - 1L]
  if (!grepl("mm$", filter.size)) {
    num.split.parts <- num.split.parts - 1L
    filter.size <- split.name[num.split.parts - 1L]
  }
  if (grepl("DDmm$", filter.size)) {
    filter.size <- NA_character_
  }
  filter.sizes <- c(filter.sizes, filter.size)

  filter.thickness.raw <- split.name[num.split.parts - 2L]
  filter.thickness <- filter.thickness.raw
  if (grepl("TTmm$", filter.thickness)) {
    filter.thickness <- NA_character_
  }
  # works but too specific regexp would be preferable
  if (grepl("2mm2mm", filter.thickness)) {
    filter.thickness <- c("2mm", "2mm")
  }
  filter.thicknesses <- c(filter.thicknesses, filter.thickness)

  filter.type <- paste(split.name[2:(num.split.parts - 3L)], collapse = " ")
  filter.types <- c(filter.types, filter.type)

  object.name <- paste(filter.supplier, gsub(" ", "_", filter.type),
                       filter.thickness.raw, filter.size, sep = "_")

  if (grepl("Baader", object.name)) {
    filter.label <- "Astrophotography filter:"
  } else if (grepl("stack", object.name)) {
    filter.label <- "Filter stack (air gap):"
  } else {
    filter.label <- "Photography filter:"
  }
  filter.labels <- c(filter.labels, filter.label)

  print(object.name)

  # object.name <- gsub("_$", "",
  #                     gsub("([a-zA-Z])[.]([a-zA-Z])", "\\1_\\2",
  #                          make.names(gsub("-ABS|-LYR|-MIX|-RFL|-STK", "", raw.name))))
  # we convert decimal markers back into dots (there should be a better way...)

  tmp.df <-
    setFilterProperties(tmp.df,
                        Rfr.constant = ifelse(grepl("UV|Protector|Skylight|IR-[6-8]|R72|Haze|RG|Night|Clear", filter.type),
                                              max(1 - max(tmp.df[["Tfr"]]), 0),
                                              NA_real_),
                        thickness = as.numeric(gsub("mm$", "", filter.thickness)) * 1e-3,
                        attenuation.mode = filter.mode)

  tmp.df <-
    smooth_spct(tmp.df, method = "supsmu", strength = 0.5)

  setWhatMeasured(tmp.df,
                  paste(filter.label, filter.type))
  setHowMeasured(tmp.df,
                 "Filters measured with an array spectrophotometer without an integrating sphere.")
  comment(tmp.df) <- paste("Measured with an Agilent 8453 array spectrophotometer by P. J. Aphalo.",
                           comment(tmp.df))

  photo_filters.lst[[object.name]] <- tmp.df
}
photography_filters.mspct <- filter_mspct(photo_filters.lst)
photography_filters.mspct <- trim_wl(photography_filters.mspct, range = c(NA, 1020))
names(photography_filters.mspct)

# quality control
unique(filter.modes)
unique(filter.suppliers)
unique(filter.sizes)
unique(filter.thicknesses)
unique(filter.types)
unique(filter.labels)

save(photography_filters.mspct, file = "../rda/photography-filters.mspct.rda")

setwd("../..")


