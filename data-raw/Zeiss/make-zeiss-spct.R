library(photobiology)
zeiss_UV_T <- read.csv("data-raw/Zeiss/UV.csv", header = FALSE, col.names = c("w.length", "Tfr"))
zeiss_UV_T <- zeiss_UV_T[order(zeiss_UV_T$w.length), ]
zeiss_UV_T.spct <- as.filter_spct(zeiss_UV_T, Tfr.type = "total")
zeiss_UV_T.spct <- fshift(zeiss_UV_T.spct)
zeiss_UV_T.spct <- clean(zeiss_UV_T.spct)
nrow(zeiss_UV_T.spct)
range(zeiss_UV_T.spct)
zeiss_UV_T.spct <- interpolate_wl(zeiss_UV_T.spct, w.length.out = 200:1000, fill = NULL)
nrow(zeiss_UV_T.spct)
range(zeiss_UV_T.spct)
setWhatMeasured(zeiss_UV_T.spct, "Zeiss 'UV T*' filter, longpass, multi-coated; from Zeiss, Germany")
setHowMeasured(zeiss_UV_T.spct, "Digitized from plot in manufacturer's brochure.")
# plot(zeiss_UV_T.spct)

zeiss.mspct <- filter_mspct(list(Zeiss_UV_Tstar_specs = zeiss_UV_T.spct))

save(zeiss.mspct, file = "data-raw/rda/zeiss.mspct.rda")

