library(tools)
library(readxl)
library(photobiology)

old.filters <- c("WG295", "WG305", "WG320", "WG335", "WG360")
filter.names <- paste("Schott_", old.filters, sep = "")

old_schott_filters.mspct <- filter_mspct()

for (i in seq_along(old.filters)) {
  temp.spct <- read_excel("data-raw/Schott-old-Andreas-Albert/WG-Filter-Transmission.xls",
                           sheet = old.filters[i], range = "A3:F603",
                           col_names = c("w.length", "Tpc"),
                           col_types = c("numeric", rep("skip", 3), "numeric", "skip"))
  setFilterSpct(temp.spct, Tfr.type = "total")
  temp.spct <- smooth_spct(temp.spct, method = "supsmu")
  setWhatMeasured(temp.spct,
                  what.measured = paste(gsub("_", " ", filter.names[i]),
                                        "; no longer available.",
                                        sep = ""))
  setHowMeasured(temp.spct,
                 "Mean of three filters which had been in use for several years.")
  comment(tmp.df) <- "Measured with HMGU-EUS Biochrom4060 scanning spectrophotometer by Andreas Albert."
  old_schott_filters.mspct[[filter.names[i]]] <- temp.spct
}

save(old_schott_filters.mspct, file = "data-raw/rda/old-schott-filters.mspct.rda")
