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
  c(schott.mspct, acetate.mspct, bpi_visqueen.mspct, etola.mspct, foiltek.mspct, lee.mspct,
  mcdermit.mspct, petri_dishes.mspct, plexiglas.mspct, rosco.mspct,
  xl_horticulture.mspct)

save(filters.mspct,
     acetate, bpi_visqueen, etola, foiltek, lee, mcdermit, petri_dishes,
     plexiglas, rosco, schott, xl_horticulture,
     file = "data/filters-mspct.rda")

tools::resaveRdaFiles("data", compress="auto")
print(tools::checkRdaFiles("data"))
