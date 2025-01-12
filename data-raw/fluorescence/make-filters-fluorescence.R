library(photobiology)
library(ggspectra)

rm(list = ls())
oldwd <- setwd("data-raw/fluorescence/")

{
  photon_as_default()

  load("JB450_001.spct.Rda")
  load("Hoya_Yellow_K2_001.spct.Rda")
  Hoya_yellow_K2_001.spct <- Hoya_Yellow_K2_001.spct
  Hoya_Yellow_K2_001.spct <- NULL
  load("Helipan_yellow_5_001.spct.Rda")
  Heliopan_yellow_5_001.spct <- Helipan_yellow_5_001.spct
  Helipan_yellow_5_001.spct <- NULL
  load("Heliopan_orange_22_001.spct.Rda")
  load("Hoya_red_25A_001.spct.Rda")
  load("HN650_red_002.spct.Rda")
  HB650_red_002.spct <- HN650_red_002.spct
  HN650_red_002.spct <- NULL
  load("Zomei_IR680_001.spct.Rda")

  setwd(oldwd)
}

filters_UVIVIF.mspct <-
  source_mspct(
    list(Tangsinuo_JB450_2.0mm_52mm = JB450_001.spct,
         Heliopan_Yellow_5_SH_PMC_2.3mm_52mm = Heliopan_yellow_5_001.spct,
         "Hoya_Y_(K2)_HMC_2.3mm_52mm" = Hoya_yellow_K2_001.spct,
         Heliopan_Orange_22_SH_PMC_2.2mm_52mm = Heliopan_orange_22_001.spct,
         Hoya_25A_HMC_2.3mm_52mm = Hoya_red_25A_001.spct,
         Tangsinuo_HB650_2.1mm_52mm = HB650_red_002.spct,
         Zomei_IR680_2.1mm_52mm = Zomei_IR680_001.spct)
    ) |>
  smooth_spct(na.rm = TRUE, method = "supsmu", strength = 4)

for (i in names(filters_UVIVIF.mspct)) {
  temp <- filters_UVIVIF.mspct[[i]]
  old.what.measured <- what_measured(temp)
  old.comment <- gsub("Smoothed using 'supsmu', span = 0.08 \n\n \n",
                      "", comment(temp))
  how_measured(temp) <-
    paste("Measured by transmission with excitation of 900 umol m-2 s-1 of UV-A1 radiation.\n",
          "Excitation:", old.what.measured, "UVA-1 365 nm.\n",
          how_measured(temp), sep = "")
  if (i == "Tangsinuo_JB450_2.0mm_52mm") {
    old.comment <- "Tangsinuo JB450 52mm approx 450nm"
  }
  what_measured(temp) <- paste("Photography filter:", old.comment, "cut-in.")
  comment(temp) <- "Smoothed using 'supsmu', span = 0.08"
  filters_UVIVIF.mspct[[i]] <- temp
}

filters_UVIVIF.mspct <-
  trim_mspct(filters_UVIVIF.mspct, range = c(400, NA)) |>
  thin_wl()

summary(filters_UVIVIF.mspct)
what_measured(filters_UVIVIF.mspct)

autoplot(
  filters_UVIVIF.mspct, w.band = NULL, span = 51, facets = 4)

save(filters_UVIVIF.mspct, file = "./data/filters-UVIVIF-mspct.rda")

# names(filters_UVIVIF.mspct) <- gsub("_", " ", names(filters_UVIVIF.mspct))
