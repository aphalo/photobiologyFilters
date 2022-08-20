library("photobiology")

rm(list = ls())

metals.dt <- read.table(file="data-raw/metals/Spisz.metals.data", header = TRUE)

metals.mspct <- list()
for (metal in setdiff(colnames(metals.dt), "wl")) {
  tmp <- tibble::tibble(w.length = metals.dt[["wl"]] * 1e3,
                        Rfr = metals.dt[[metal]])
  setReflectorSpct(tmp, Rfr.type = "total")
  setWhatMeasured(tmp, metal)
  comment(tmp) <- "Ernie W. Spisz, Albert J. Weigund, Robert L. Bowmun, and John R. Juck (1969)\nSOLAR ABSORPTANCES AND SPECTRAL REFLECTANCES OF 12 METALS FOR TEMPERATURES RANGING FROM 300 TO 500 K\nNASA TN D-5353, Technical Note, Washington DC, 22 pp. (Data from Table II (a))"
  metals.mspct[[tolower(metal)]] <- tmp
}

metals.mspct <- as.reflector_mspct(metals.mspct)

save(metals.mspct, file = "data/metals-mspct.rda")
