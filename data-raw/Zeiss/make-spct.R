library(r4photobiology)
zeiss_UV_T <- read.csv("data-raw/Zeiss/UV.csv", header = FALSE, col.names = c("w.length", "Tfr"))
zeiss_UV_T <- zeiss_UV_T[order(zeiss_UV_T$w.length), ]
zeiss_UV_T.spct <- as.filter_spct(zeiss_UV_T, Tfr.type = "total")
zeiss_UV_T.spct <- fshift(zeiss_UV_T.spct)
zeiss_UV_T.spct <- clean(zeiss_UV_T.spct)
plot(zeiss_UV_T.spct)
