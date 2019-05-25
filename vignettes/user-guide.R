## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(fig.width=8, fig.height=4)

## ------------------------------------------------------------------------
library(photobiology)
library(photobiologyWavebands)
library(photobiologyFilters)
library(ggspectra)
theme_set(theme_bw())

## ------------------------------------------------------------------------
# band_pass

## ------------------------------------------------------------------------
schott

## ------------------------------------------------------------------------
head(names(filters.mspct), 6)

## ------------------------------------------------------------------------
filters.mspct$Schott_UG11

## ------------------------------------------------------------------------
filters.mspct[["Schott_UG11"]]

## ------------------------------------------------------------------------
filters.mspct["Schott_UG11"]

## ------------------------------------------------------------------------
filters.mspct[petri_dishes]

## ------------------------------------------------------------------------
all_accessors

## ------------------------------------------------------------------------
filters.mspct[grep("UG", names(filters.mspct))]

## ------------------------------------------------------------------------
grep("UG", names(filters.mspct), value = TRUE)

## ------------------------------------------------------------------------
filters.mspct$Schott_UG11

## ------------------------------------------------------------------------
getWhatMeasured(filters.mspct$Schott_UG11)
getWhenMeasured(filters.mspct$Schott_UG11)

## ------------------------------------------------------------------------
is_normalized(filters.mspct$Schoot_UG11)

## ------------------------------------------------------------------------
cat(comment(filters.mspct$Schott_UG11), "\n")
names(filters.mspct$Schott_UG11)

## ------------------------------------------------------------------------
getTfrType(filters.mspct$Schott_UG11)

## ------------------------------------------------------------------------
autoplot(filters.mspct$MIDOPT_LP500)

## ------------------------------------------------------------------------
autoplot(filters.mspct$MIDOPT_TB550_660_850, 
         annotations = c("+", "title:what"), 
         span = 11)

## ------------------------------------------------------------------------
autoplot(filters.mspct[c("Schott_UG1", "Schott_UG11")], 
         range = c(200, 800),
         annotations = c("+", "boundaries"), 
         span = 11)

## ------------------------------------------------------------------------
ggplot(filters.mspct$Firecrest_UVIR_Cut) +
  geom_line()

## ------------------------------------------------------------------------
transmittance(filters.mspct$Firecrest_UVIR_Cut, UVA())

## ------------------------------------------------------------------------
absorbance(filters.mspct$Firecrest_UVIR_Cut, list(UVA(), NIR()))

## ------------------------------------------------------------------------
transmittance(filters.mspct[grep("UG", names(filters.mspct))], 
              list(UVB(), UVA()))

## ------------------------------------------------------------------------
head(as.data.frame(filters.mspct$Schott_UG11))

## ------------------------------------------------------------------------
attach(filters.mspct)
transmittance(Schott_UG11, UVA())
detach(filters.mspct)

## ------------------------------------------------------------------------
attach(filters.mspct)
with(Schott_UG11, range(w.length))
detach(filters.mspct)

## ------------------------------------------------------------------------
with(filters.mspct, transmittance(Schott_UG11, UVA()))

