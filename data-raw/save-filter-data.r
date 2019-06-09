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
lee_gels <- lee_filters <- lee
rosco_gels <- rosco_filters <- rosco
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
courtaulds_filters <- courtaulds
xl_horticulture_filters <- xl_horticulture
bpi_visqueen_filters <- bpi_visqueen
etola_filters <- etola
foiltek_filters <- foiltek
evonik_filters <- evonik
mcdermit_filters <- mcdermit

acetate_filters <- courtaulds_filters
acrylic_filters <- plexiglas_filters <- evonik_filters <- evonik_filters
polycarbonate_filters <- grep("PC", names(filters.mspct), value = TRUE)
polystyrene_filters <- grep("PS", names(filters.mspct), value = TRUE)
polyester_filters <- grep("PET", names(filters.mspct), value = TRUE)
polyvynil_chloride_filters <- grep("PVC", names(filters.mspct), value = TRUE)
optical_glass_filters <- union(schott_filters, zeiss_filters)
plastic_film_filters <- plastic_films <-
  unique(c(rosco_filters, courtaulds_filters,
           mcdermit_filters, lee_filters,
           bpi_visqueen_filters, xl_horticulture_filters))
plastic_sheet_filters <- plastic_sheets <- union(evonik_filters, foiltek_filters)

clear_filters <- grep("clear|Clear|protector|Protector", names(filters.mspct), value = TRUE)
yellow_filters <- grep("yellow|Yellow|GG|Canary", names(filters.mspct), value = TRUE)
orange_filters <- grep("orange|Orange|OG", names(filters.mspct), value = TRUE)
green_filters <- grep("VG|green|Green", names(filters.mspct), value = TRUE)
blue_filters <- grep("GG|82A", names(filters.mspct), value = TRUE)
blue_green_filters <- grep("BG", names(filters.mspct), value = TRUE)
red_nir_filters <- grep("Cherry|red|Red|RG|Zomei_IR|25A", names(filters.mspct), value = TRUE)
uv_filters <- unique(c(grep("UG|UV|WG", names(filters.mspct), value = TRUE),
                   polycarbonate_filters, polyester_filters, acetate_filters))
neutral_filters <- grep("NG|ND|neutral|Neutral", names(filters.mspct), value = TRUE)
heat_filters <- grep("KG|heat|Heat", names(filters.mspct), value = TRUE)
uvir_cut_filters <- grep("UVIR|UV-IR", names(filters.mspct), value = TRUE)

band_pass_filters <- grep("UG|BG|BP|Bi|BN|AB|PE|DB|TB", names(filters.mspct), value = TRUE)
long_pass_filters <- c(grep("GG|WG|OG|RG|LP", names(filters.mspct), value = TRUE), "UV_T")
short_pass_filters <- grep("KG|SP", names(filters.mspct), value = TRUE)

# all_accessors <- sort(setdiff(ls(pattern = "*"), ls(pattern = "*.mspct")))
all_filter_accessors <- sort(grep("_filters$", ls(pattern = "*"), value = TRUE))

save(filters.mspct, all_filter_accessors,
     bpi_visqueen_filters, courtaulds_filters, etola_filters, evonik_filters, foiltek_filters,
     lee_filters, lee_gels, mcdermit_filters, petri_dishes, plexiglas_filters,
     rosco_filters, rosco_gels, schott_filters, xl_horticulture_filters, midopt_filters,
     glass_windows, uqg_filters, kolarivision_filters,
     acetate_filters, acrylic_filters, polycarbonate_filters,
     polystyrene_filters, polyester_filters, polyvynil_chloride_filters,
     photography_filters, hoya_filters, firecrest_filters, bw_filters, zomei_filters,
     haida_filters, kenko_filters, tiffen_filters, baader_filters, uvroptics_filters,
     heliopan_filters, rocolax_filters, zeiss_filters, kenko_filters, fake_unbranded_filters,
     uvir_cut_filters, theatrical_gels, optical_glass_filters,
     plastic_films, plastic_sheets, plastic_film_filters, plastic_sheet_filters,
     clear_filters, yellow_filters, orange_filters, green_filters, blue_green_filters,
     blue_filters, red_nir_filters, uv_filters,
     neutral_filters, heat_filters,
     band_pass_filters, long_pass_filters, short_pass_filters,
     file = "data/filters-mspct.rda")

tools::resaveRdaFiles("data", compress="auto")
print(tools::checkRdaFiles("data"))
