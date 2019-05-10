library(photobiology)
Kolari_HM <- read.csv("data-raw/Kolarivision/Kolari-Vision-Hot-Mirror.csv", header = FALSE, col.names = c("w.length", "Tfr"), skip = 1)
Kolari_HM <- Kolari_HM[order(Kolari_HM$w.length), ]
Kolari_HM <- as.filter_spct(Kolari_HM, Tfr.type = "total")
Kolari_HM <- fshift(Kolari_HM)
Kolari_HM <- clean(Kolari_HM)
nrow(Kolari_HM)
range(Kolari_HM)
Kolari_HM <- interpolate_wl(Kolari_HM, w.length.out = 200:1000, fill = NULL)
nrow(Kolari_HM)
range(Kolari_HM)
setWhatMeasured(Kolari_HM, "Kolari Vision Color Correcting Hot Mirror Filter")
comment(Kolari_HM)  <- "Kolari Vision Color Correcting Hot Mirror Filter (UV/IR Cut Filter) – AR Coated\n digitized data from supplier's description."
# plot(zeiss_UV_T.spct)

kolarivision.mspct <- filter_mspct(list(Kolari_UVIR_Cut_specs = Kolari_HM))

save(kolarivision.mspct, file = "data-raw/rda/kolarivision.mspct.rda")

