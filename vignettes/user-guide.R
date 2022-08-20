## ---- echo=FALSE--------------------------------------------------------------
knitr::opts_chunk$set(fig.width=8, fig.height=4)

## -----------------------------------------------------------------------------
library(photobiology)
library(photobiologyWavebands)
library(photobiologyFilters)
library(ggspectra)
theme_set(theme_bw())

## -----------------------------------------------------------------------------
class(filters.mspct)

## -----------------------------------------------------------------------------
class(filters.mspct[[1]])

## -----------------------------------------------------------------------------
class(metals.mspct)

## -----------------------------------------------------------------------------
class(metals.mspct[[1]])

## -----------------------------------------------------------------------------
class(materials.mspct)

## -----------------------------------------------------------------------------
class(materials.mspct[[1]])

## -----------------------------------------------------------------------------
class(refractive_index.mspct)

## -----------------------------------------------------------------------------
class(refractive_index.mspct[[1]])

## -----------------------------------------------------------------------------
colnames(filters.mspct[[1]])

## -----------------------------------------------------------------------------
colnames(metals.mspct[[1]])

## -----------------------------------------------------------------------------
colnames(materials.mspct[[1]])

## -----------------------------------------------------------------------------
colnames(refractive_index.mspct[[1]])

## -----------------------------------------------------------------------------
band_pass_filters

## -----------------------------------------------------------------------------
schott_filters

## ---- eval=FALSE--------------------------------------------------------------
#  help(schott_filters)

## -----------------------------------------------------------------------------
names(metals.mspct)

## -----------------------------------------------------------------------------
names(materials.mspct)

## -----------------------------------------------------------------------------
names(refractive_index.mspct)

## -----------------------------------------------------------------------------
head(names(filters.mspct), 20)

## -----------------------------------------------------------------------------
if (utils::packageVersion('photobiology') > "0.10.4.9001") {
  print(colnames(spct_metadata(filters.mspct[1:5])))
  spct_metadata(filters.mspct[1:5])[ , c("spct.idx", "what.measured")]
}

## -----------------------------------------------------------------------------
filters.mspct$Schott_UG11

## -----------------------------------------------------------------------------
filters.mspct[["Schott_UG11"]]

## -----------------------------------------------------------------------------
filters.mspct["Schott_UG11"]

## -----------------------------------------------------------------------------
filters.mspct[petri_dishes]

## -----------------------------------------------------------------------------
all_filter_selectors

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
         annotations = list(c("+", "boundaries"), c("-", "peaks")),
         span = 21) +
  geom_line(data = filters.mspct$Haida_Clear_Night_NanoPro, colour = "purple") +
  geom_vline(xintercept = c(589, 589.6), linetype = "dotted") # Na emission lines

## -----------------------------------------------------------------------------
ggplot(filters.mspct$Firecrest_UVIR_Cut) +
  geom_line() +
  scale_x_wl_continuous() +
  scale_y_Tfr_total_continuous()

## -----------------------------------------------------------------------------
autoplot(metals.mspct$gold, range = c(NA, 800))

## -----------------------------------------------------------------------------
autoplot(materials.mspct$grass, range = c(NA, 800))

## -----------------------------------------------------------------------------
transmittance(filters.mspct$Firecrest_UVIR_Cut, UVA())

## -----------------------------------------------------------------------------
absorbance(filters.mspct$Firecrest_UVIR_Cut, list(UVA(), NIR()))

## -----------------------------------------------------------------------------
transmittance(filters.mspct[grep("UG", names(filters.mspct))], 
              list(UVB(), UVA()))

## -----------------------------------------------------------------------------
reflectance(metals.mspct, w.band = VIS_bands())

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

