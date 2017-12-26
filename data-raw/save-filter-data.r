library(photobiology)
library(dplyr)

rm(list = ls())
in.path <- "data-raw/rda/"
filter.files <- list.files(in.path, "*.rda")

for (l in paste(in.path, filter.files, sep = "")) {
  load(file = l)
  print(l)
}

objects <- sub(".rda", "", filter.files)
objects <- sub("-", "_", objects)
object.mspct.lst <- mget(objects)

for (obj in objects) {
  assign(sub(".mspct", "", obj), names(get(obj)))
}

filters.mspct <-
  c(schott.mspct, courtaulds.mspct, bpi_visqueen.mspct, etola.mspct, foiltek.mspct, lee.mspct,
  mcdermit.mspct, petri_dishes.mspct, evonik.mspct, rosco.mspct, midopt.mspct,
  xl_horticulture.mspct, zeiss.mspct)

acetate <- courtaulds
acrylic <- plexiglas <- evonik
polycarbonate <- grep("PC", names(filters.mspct), value = TRUE)
polystyrene <- grep("PS", names(filters.mspct), value = TRUE)
polyester <- grep("PET", names(filters.mspct), value = TRUE)
polyvynil_chloride <- grep("PVC", names(filters.mspct), value = TRUE)
optical_glass <- union(schott, zeiss)
plastic_film <- unique(c(rosco, courtaulds, mcdermit, lee, bpi_visqueen, xl_horticulture))
plastic_sheet <- union(evonik, foiltek)

clear_filters <- grep("clear|Clear", names(filters.mspct), value = TRUE)
yellow_filters <- grep("yellow|Yellow|GG|Canary", names(filters.mspct), value = TRUE)
orange_filters <- grep("orange|Orange|OG", names(filters.mspct), value = TRUE)
green_filters <- grep("VG|green|Green", names(filters.mspct), value = TRUE)
blue_filters <- grep("GG", names(filters.mspct), value = TRUE)
blue_green_filters <- grep("BG", names(filters.mspct), value = TRUE)
red_nir_filters <- grep("Cherry|red|Red|RG", names(filters.mspct), value = TRUE)
uv_filters <- unique(c(grep("UG|UV|WG", names(filters.mspct), value = TRUE),
                   polycarbonate, polyester, acetate))
neutral_filters <- grep("NG|ND|neutral|Neutral", names(filters.mspct), value = TRUE)
heat_filters <- grep("KG|heat|Heat", names(filters.mspct), value = TRUE)

band_pass <- grep("UG|BG|BP|Bi|BN|AB|PE|DB|TB", names(filters.mspct), value = TRUE)
long_pass <- c(grep("GG|WG|OG|RG|LP", names(filters.mspct), value = TRUE), "UV_T")
short_pass <- grep("KG|SP", names(filters.mspct), value = TRUE)

save(filters.mspct,
     bpi_visqueen, courtaulds, etola, evonik, foiltek, lee, mcdermit, petri_dishes,
     plexiglas, rosco, schott, xl_horticulture, midopt,
     acetate, acrylic, plexiglas, polycarbonate, polystyrene, polyester, polyvynil_chloride,
     optical_glass, plastic_film, plastic_sheet,
     clear_filters, yellow_filters, orange_filters, green_filters, blue_green_filters,
     blue_filters, red_nir_filters, uv_filters,
     neutral_filters, heat_filters,
     band_pass, long_pass, short_pass,
     file = "data/filters-mspct.rda")

tools::resaveRdaFiles("data", compress="auto")
print(tools::checkRdaFiles("data"))
