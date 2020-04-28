## ---- echo=FALSE--------------------------------------------------------------
knitr::opts_chunk$set(fig.width=8, fig.height=4)

## -----------------------------------------------------------------------------
library(photobiology)
library(photobiologyWavebands)
library(photobiologyFilters)
library(ggspectra)
theme_set(theme_bw())

## -----------------------------------------------------------------------------
band_pass_filters

## -----------------------------------------------------------------------------
schott_filters

## -----------------------------------------------------------------------------
head(names(filters.mspct), 6)

## -----------------------------------------------------------------------------
filters.mspct$Schott_UG11

## -----------------------------------------------------------------------------
filters.mspct[["Schott_UG11"]]

## -----------------------------------------------------------------------------
filters.mspct["Schott_UG11"]

## -----------------------------------------------------------------------------
filters.mspct[petri_dishes]

## -----------------------------------------------------------------------------
all_filter_accessors

## -----------------------------------------------------------------------------
filters.mspct[grep("UG", names(filters.mspct))]

## -----------------------------------------------------------------------------
grep("UG", names(filters.mspct), value = TRUE)

## -----------------------------------------------------------------------------
filters.mspct$Schott_UG11

## -----------------------------------------------------------------------------
filter_properties(filters.mspct$Schott_UG11)

## -----------------------------------------------------------------------------
what_measured(filters.mspct$Schott_UG11)

## -----------------------------------------------------------------------------
how_measured(filters.mspct$Schott_UG11)

## -----------------------------------------------------------------------------
is_normalized(filters.mspct$Schoot_UG11)

## -----------------------------------------------------------------------------
cat(comment(filters.mspct$Schott_UG11), "\n")

## -----------------------------------------------------------------------------
getTfrType(filters.mspct$Schott_UG11)

## -----------------------------------------------------------------------------
convertThickness(filters.mspct$Schott_UG11, thickness = 4e-3)

## -----------------------------------------------------------------------------
convertTfrType(filters.mspct$Schott_UG11, Tfr.type = "total")

## -----------------------------------------------------------------------------
any2Afr(filters.mspct$Schott_UG11, action = "replace")

## -----------------------------------------------------------------------------
any2A(filters.mspct$Schott_UG11, action = "replace")

## -----------------------------------------------------------------------------
autoplot(filters.mspct$MIDOPT_LP500)

## -----------------------------------------------------------------------------
autoplot(filters.mspct$MIDOPT_LP500,
         annotations = list(c("-", "peaks"), c("+", "wls")))

## -----------------------------------------------------------------------------
autoplot(filters.mspct$MIDOPT_TB550_660_850, 
         annotations = c("+", "title:none:none:what", "wls"), 
         w.band = VIS_bands(),
         range = c(500, 910),
         span = 11)

## -----------------------------------------------------------------------------
autoplot(filters.mspct[c("Schott_UG1", "Schott_UG11")], 
         range = c(200, 900),
         annotations = c("+", "boundaries"), 
         span = 11)

## -----------------------------------------------------------------------------
thin_and_thick.mspct <- 
  filter_mspct(list("1 mm" = filters.mspct$Schott_UG11,
                    "3 mm" = convertThickness(filters.mspct$Schott_UG11,
                                              thickness = 3e-3)))
autoplot(thin_and_thick.mspct,
         range = c(200, 900),
         annotations = c("+", "boundaries"),
         span = 101)

## -----------------------------------------------------------------------------
stack.spct <- filters.mspct$Haida_Clear_Night_NanoPro * filters.mspct$Firecrest_UVIR_Cut
                    
autoplot(stack.spct,
         range = c(NA, 1400),
         w.band = c(UV_bands(), IR_bands("CIE")),
         annotations = c("+", "boundaries", "wls"),
         span = 21) +
  geom_line(data = filters.mspct$Haida_Clear_Night_NanoPro, colour = "purple") +
  geom_vline(xintercept = c(589, 589.6), linetype = "dotted") # Na emission lines

## -----------------------------------------------------------------------------
ggplot(filters.mspct$Firecrest_UVIR_Cut) +
  geom_line()

## -----------------------------------------------------------------------------
transmittance(filters.mspct$Firecrest_UVIR_Cut, UVA())

## -----------------------------------------------------------------------------
absorbance(filters.mspct$Firecrest_UVIR_Cut, list(UVA(), NIR()))

## -----------------------------------------------------------------------------
transmittance(filters.mspct[grep("UG", names(filters.mspct))], 
              list(UVB(), UVA()))

## -----------------------------------------------------------------------------
head(as.data.frame(filters.mspct$Schott_UG11))

## -----------------------------------------------------------------------------
attach(filters.mspct)
transmittance(Schott_UG11, UVA())
detach(filters.mspct)

## -----------------------------------------------------------------------------
attach(filters.mspct)
with(Schott_UG11, range(w.length))
detach(filters.mspct)

## -----------------------------------------------------------------------------
with(filters.mspct, transmittance(Schott_UG11, UVA()))

