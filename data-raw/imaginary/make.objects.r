library(photobiology)

black_body.spct <- reflector_spct(w.length=c(200,900), Rfr = 0)
white_body.spct <- reflector_spct(w.length=c(200,900), Rfr = 1)

save(black_body.spct, white_body.spct, file = "data/img.bodies.spct.rda")
