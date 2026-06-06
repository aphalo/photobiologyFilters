# read all available filter data
# assumes that all files with ".CSV" are filter-data files
# STEPS
# 1) clear the workspace
# 2) read .csv files
# 3) collect all the filter_spct objects into a filter_mspct object
# 4) save the filter_mscpt object into a single Rda file in the data-raw/rda folder

# thickness and size information are extracted from file names

library(photobiology)
library(dplyr)
library(stringr)
library(ggspectra)

rm(list = ls())
setwd("./data-raw/astro-filters/")

file.list <- list.files(pattern = '*.CSV$', ignore.case = TRUE)

full_names <- sub(pattern = ".CSV|.csv", replacement = "", x = file.list)
length(full_names)

astro_filters.lst <- list()
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
               STK = "stack",
               DIF = "scattering")

for (file.name in file.list) {
  cat(file.name, ", ")
  tmp.df <- read.csv(file.name, skip = 1, header = FALSE,
                     sep = ",",
                     col.names = c("w.length", "Tpc"),
                     colClasses = c("double", "double"))
  # data digitized from bitmaps can contain duplicate rows!
  # select unique w.length values
  tmp.df <- distinct(tmp.df)
  tmp.df[["Tfr"]] <- signif(tmp.df[["Tpc"]], 5) / 100

  setFilterSpct(tmp.df, Tfr.type = "total")

  tmp.df <-  clean(tmp.df, range.s.data = c(0, 1))
  if (wl_stepsize(tmp.df)[2] > 1) {
    tmp.df <- interpolate_spct(tmp.df, 200:1100)
  }
  tmp.df <- trim_wl(tmp.df, range = c(200, 1050))

  raw.name <- sub(pattern = ".CSV|.csv", replacement = "", x = file.name)
  split.name <- str_split(raw.name, pattern = "-")[[1]]
  num.split.parts <- length(split.name)

  if (!grepl("ABS|LYR|MIX|RFL|STK|DIF", split.name[num.split.parts])) {
    filter.mode <- NA_character_
  } else {
    filter.mode <- modes.map[split.name[num.split.parts]]
  }
  filter.modes <- c(filter.modes, filter.mode)

  filter.supplier <- split.name[1]
  filter.suppliers <- c(filter.suppliers, filter.supplier)

  filter.size <- split.name[num.split.parts - 1L]
  filter.size <- gsub("inch[A-Z]$", "inch", filter.size)
  if (!grepl("inch$", filter.size)) {
    num.split.parts <- num.split.parts - 1L
    filter.size <- split.name[num.split.parts - 1L]
  }
  if (grepl("DDinch$", filter.size)) {
    filter.size <- NA_character_
  }
  filter.sizes <- c(filter.sizes, filter.size)

  filter.thickness.raw <- split.name[num.split.parts - 2L]
  filter.thickness <- filter.thickness.raw
  if (grepl("TTmm$", filter.thickness)) {
    filter.thickness <- NA_character_
  }
  filter.thicknesses <- c(filter.thicknesses, filter.thickness)

  filter.type <- paste(split.name[2:(num.split.parts - 3L)], collapse = " ")
  filter.types <- c(filter.types, filter.type)

  object.name <- paste(filter.supplier, gsub(" ", "_", filter.type),
                       filter.thickness.raw, filter.size, sep = "_")

  if (grepl("Baader|Venus|SVBONY|Angeleyes", object.name)) {
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
                        Rfr.constant = max(1 - max(tmp.df[["Tfr"]]), 0),
                        thickness = as.numeric(gsub("mm$", "", filter.thickness)) * 1e-3,
                        attenuation.mode = filter.mode)

  tmp.df <-
    smooth_spct(tmp.df, method = "supsmu", strength = 0.5)

  setWhatMeasured(tmp.df,
                  paste(filter.label, filter.supplier, filter.type))
  setHowMeasured(tmp.df,
                 "Filters measured with an array spectrophotometer without an integrating sphere.")
  comment(tmp.df) <- paste("Measured with an Agilent 8453 array spectrophotometer by P. J. Aphalo.",
                           comment(tmp.df))

  astro_filters.lst[[object.name]] <- tmp.df
}

setwd("../..")

astro_filters.mspct <- filter_mspct(astro_filters.lst)
# astro_filters.mspct <- trim_wl(astro_filters.mspct, range = c(NA, 1050))
names(astro_filters.mspct)

# quality control
unique(filter.modes)
unique(sort(filter.suppliers))
unique(filter.sizes)
unique(filter.thicknesses)
unique(sort(filter.types))
unique(filter.labels)

save(astro_filters.mspct, file = "./data-raw/rda/astro-filters.mspct.rda")

summary(astro_filters.mspct)
autoplot(astro_filters.mspct)
what_measured(astro_filters.mspct)$what.measured


