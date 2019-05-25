library(photobiology)
library(dplyr)

rm(list = ls())
in.path <- "data-raw/rda/"
filter.files <- list.files(in.path, "*.rda")

for (l in paste(in.path, filter.files, sep = "")) {
  load(file = l)
  print(l)
}
rm(l)

objects <- sub(".rda", "", filter.files)
objects <- sub("-", "_", objects)
object.mspct.lst <- mget(objects)

for (obj in objects) {
  assign(sub(".mspct", "", obj), names(get(obj)))
}
rm(obj)

filters.mspct <-
  c(schott.mspct, courtaulds.mspct, bpi_visqueen.mspct, etola.mspct, foiltek.mspct, lee.mspct,
  mcdermit.mspct, petri_dishes.mspct, evonik.mspct, rosco.mspct, midopt.mspct, uqg.mspct,
  xl_horticulture.mspct, zeiss.mspct, glass_windows.mspct, photography_filters.mspct,
  kolarivision.mspct)

filters.mspct <- filters.mspct[sort(names(filters.mspct))]
midopt_filters <- midopt
lee_gels <- lee
rosco_gels <- rosco
theatrical_gels <- c(lee_gels, rosco_gels)
schott_filters <- schott
uqg_filters <- uqg
kolarivision_filters <- kolarivision
hoya_filters <- grep("Hoya", photography_filters, value = TRUE, ignore.case = TRUE)
firecrest_filters <- grep("Firecrest", photography_filters, value = TRUE, ignore.case = TRUE)
heliopan_filters <- grep("Heliopan", photography_filters, value = TRUE, ignore.case = TRUE)
bw_filters <- grep("BW", photography_filters, value = TRUE, ignore.case = TRUE)
zomei_filters <- grep("Zomei", photography_filters, value = TRUE, ignore.case = TRUE)
kenko_filters <- grep("Kenko", photography_filters, value = TRUE, ignore.case = TRUE)
rocolax_filters <- grep("Rocolax", photography_filters, value = TRUE, ignore.case = TRUE)
tiffen_filters <- grep("Tiffen", photography_filters, value = TRUE, ignore.case = TRUE)
haida_filters <- grep("Haida", photography_filters, value = TRUE, ignore.case = TRUE)
Haida_filters <- grep("Haida", photography_filters, value = TRUE, ignore.case = TRUE)
zeiss_filters <- grep("Zeiss", photography_filters, value = TRUE, ignore.case = TRUE)
baader_filters <- grep("Baader", photography_filters, value = TRUE, ignore.case = TRUE)
uvroptics_filters <- grep("StraightEdgeU", photography_filters, value = TRUE, ignore.case = TRUE)
fake_unbranded_filters <- grep("Knight|fake", photography_filters, value = TRUE, ignore.case = TRUE)
photography_filters <- sort(c(photography_filters, zeiss_filters, kolarivision_filters))

acetate <- courtaulds
acrylic <- plexiglas <- evonik
polycarbonate <- grep("PC", names(filters.mspct), value = TRUE)
polystyrene <- grep("PS", names(filters.mspct), value = TRUE)
polyester <- grep("PET", names(filters.mspct), value = TRUE)
polyvynil_chloride <- grep("PVC", names(filters.mspct), value = TRUE)
optical_glass <- union(schott, zeiss)
plastic_film <- unique(c(rosco, courtaulds, mcdermit, lee, bpi_visqueen, xl_horticulture))
plastic_sheet <- union(evonik, foiltek)

clear_filters <- grep("clear|Clear|protector|Protector", names(filters.mspct), value = TRUE)
yellow_filters <- grep("yellow|Yellow|GG|Canary", names(filters.mspct), value = TRUE)
orange_filters <- grep("orange|Orange|OG", names(filters.mspct), value = TRUE)
green_filters <- grep("VG|green|Green", names(filters.mspct), value = TRUE)
blue_filters <- grep("GG|82A", names(filters.mspct), value = TRUE)
blue_green_filters <- grep("BG", names(filters.mspct), value = TRUE)
red_nir_filters <- grep("Cherry|red|Red|RG|Zomei_IR|25A", names(filters.mspct), value = TRUE)
uv_filters <- unique(c(grep("UG|UV|WG", names(filters.mspct), value = TRUE),
                   polycarbonate, polyester, acetate))
neutral_filters <- grep("NG|ND|neutral|Neutral", names(filters.mspct), value = TRUE)
heat_filters <- grep("KG|heat|Heat", names(filters.mspct), value = TRUE)
uvir_cut_filters <- grep("UVIR|UV-IR", names(filters.mspct), value = TRUE)

band_pass <- grep("UG|BG|BP|Bi|BN|AB|PE|DB|TB", names(filters.mspct), value = TRUE)
long_pass <- c(grep("GG|WG|OG|RG|LP", names(filters.mspct), value = TRUE), "UV_T")
short_pass <- grep("KG|SP", names(filters.mspct), value = TRUE)

all_accessors <- sort(setdiff(ls(pattern = "*"), ls(pattern = "*.mspct")))

save(filters.mspct, all_accessors,
     bpi_visqueen, courtaulds, etola, evonik, foiltek, lee, mcdermit, petri_dishes,
     plexiglas, rosco, schott, xl_horticulture, midopt, glass_windows, uqg,
     acetate, acrylic, plexiglas, polycarbonate, polystyrene, polyester, polyvynil_chloride,
     photography_filters, hoya_filters, firecrest_filters, bw_filters, zomei_filters,
     haida_filters, kenko_filters, tiffen_filters, baader_filters, uvroptics_filters,
     heliopan_filters, rocolax_filters, zeiss_filters, kenko_filters, fake_unbranded_filters,
     lee_gels, rosco_gels, schott_filters, midopt_filters, uqg_filters, kolarivision_filters,
     uvir_cut_filters, theatrical_gels,
     optical_glass, plastic_film, plastic_sheet,
     clear_filters, yellow_filters, orange_filters, green_filters, blue_green_filters,
     blue_filters, red_nir_filters, uv_filters,
     neutral_filters, heat_filters,
     band_pass, long_pass, short_pass,
     file = "data/filters-mspct.rda")

tools::resaveRdaFiles("data", compress="auto")
print(tools::checkRdaFiles("data"))
