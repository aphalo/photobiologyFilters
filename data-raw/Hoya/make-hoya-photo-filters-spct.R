library(photobiology)
library(ggspectra)
library(dplyr)

# clean up workspace
rm(list = ls(pattern = "*"))

csv_files <- list.files("./data-raw/Hoya", pattern = "csv$", full.names = TRUE)

hoya.ls <- list()

for (f in csv_files) {
  cat("Reading ", f, " ... ")
  filter_name <- paste(gsub("-", "_", gsub("\\.csv|-Tfr", "", basename(f))), "HMC", sep = "_")
  temp <- read.csv(f, header = FALSE, col.names = c("w.length", "Tfr"), skip = 1)
  temp |>
  group_by(w.length) |>
    summarise(Tfr = mean(Tfr)) -> temp
  temp <- temp[order(temp$w.length), ]
  temp <- as.filter_spct(temp, Tfr.type = "total")
#  temp <- fshift(temp)
  temp <- clean(temp)
  temp <- interpolate_wl(temp, w.length.out = 250:900, fill = NULL)
  filter_properties(temp) <- list(attenuation.mode = "absorption",
                                  Rfr.constant = 0.015, # rated 1 to 2%
                                  thickness = NA_real_)
  what_measured(temp) <- paste("Hoya photo filter \"", gsub("Hoya_", "", filter_name), "\".")
  how_measured(temp) <- "Digitized from a plot at supplier's web site: https://hoyafilter.com/ (visited 2025-03-10)."
  comment(temp)  <- "Hoya Tokina colour correction fílters. Warming (W), Cooling (C) and fluorescent light (FL) colour correction filters for photography, AR Coated. Spectral data digitized from plots in the supplier's description."

  hoya.ls[[filter_name]] <- temp
  cat("done ", filter_name)
}
hoya_photo_digitised.mspct <- as.filter_mspct(hoya.ls)
autoplot(hoya_photo_digitised.mspct[grep("FL", names(hoya_photo_digitised.mspct))])
autoplot(hoya_photo_digitised.mspct[grep("W[0-9]", names(hoya_photo_digitised.mspct))])
autoplot(hoya_photo_digitised.mspct[grep("C[0-9]", names(hoya_photo_digitised.mspct))])

save(hoya_photo_digitised.mspct,
     file = "data-raw/rda/hoya-photo-digitised.mspct.rda")

