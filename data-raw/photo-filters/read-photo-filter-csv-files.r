# read all available filter data
# assumes that all files with ".CSV" are filter-data files
# STEPS
# 1) clear the workspace
# 2) read .csv files
# 3) collect all the filter_spct objects into a filter_mspct object
# 4) save the filter_mscpt object into a single Rda file in the data-raw/rda folder
library(photobiology)
library(dplyr)

rm(list = ls())
setwd("data-raw/photo-filters/")

file.list <- list.files(pattern = '*.CSV$', ignore.case = TRUE)
all_names <- sub(pattern = ".CSV|.csv", replacement = "", x = file.list)
thickness <-
  c(2.2, 0.78, 1.1, 1.2,
    1.2, NA, NA,
    0.54, 1.6, NA,
    2.2, 2.3,
    2.2, 1.75, 1.75,
    2.3, 2.3, 2.4,
    1.1, 1.1,
    1.1, 4.8,
    3.1, 3.1,
    2.6, 2.1,
    rep(2.04, 8)
    )
names_thickness <-
  c("Firecrest_CPL", "Firecrest_IRND_15_MC", "Firecrest_ND12", "Firecrest_ND18",
    "Firecrest_UV400", "Firecrest_UVIR_Cut", "Firecrest_ND12_sqr",
    "Fotga_UVIR_CUT", "Haida_Clear_Night_NanoPro", "Heliopan_BG38",
    "Heliopan_Orange_22_SH_PMC", "Heliopan_Yellow_5_SH_PMC",
    "Heliopan_UVIR_CUT_Digital", "Hitech_ND_06_HL", "Hitech_ND_09_HL",
    "Hoya_25A_HMC", "Hoya_Y_K2_HMC", "Hoya_R72",
    "Rocolax_UVIR_Cut_445nm_650nm", "Rocolax_UVIR_Cut_PRO_HD_W_52mm",
    "Rocolax_UVIR_Cut_PRO_HD_W_30_5mm", "StraightEdgeU_Mk_I",
    "Tangsinuo_ZBW1_3mm", "Tangsinuo_ZBW2_3mm",
    "Tiffen_Haze_2A_52mm", "Tiffen_Haze_2A_62mm",
    "Zomei_IR_680_30_5mm", "Zomei_IR_680_52mm", "Zomei_IR_720_30_5mm",
    "Zomei_IR_720_72mm", "Zomei_IR_760_30_5mm", "Zomei_IR_760_52mm",
    "Zomei_IR_850_52mm", "Zomei_IR_950_52mm")
names(thickness) <- names_thickness

attenuation.modes <-
  c(rep("absorption_layered", 9),
    rep("mixed", 2),
    rep("reflection", 8))

names_modes <-
  c("Tiffen_Haze_2A_52mm", "Tiffen_Haze_2A_62mm", "Firecrest_CPL",
    "Firecrest_IRND_15_MC", "Firecrest_ND12", "Firecrest_ND18",
    "Firecrest_UV400", "Firecrest_UVIR_Cut", "Firecrest_ND12_sqr",
    "Baader_U_filter", "StraightEdgeU_Mk_I",
    "Heliopan_UVIR_CUT_Digital", "Firecrest_UVIR_Cut",
    "Rocolax_UVIR_Cut_445nm_650nm", "Rocolax_UVIR_Cut_PRO_HD_W_52mm",
    "Rocolax_UVIR_Cut_PRO_HD_W_30_5mm",
    "Hoya_UV0_HMC_Super", "Hoya_UV0_HMC", "Zeiss_UV_Tstar")

names(attenuation.modes) <- names_modes

photo_filters.lst <- list()
for (file.name in file.list) {
  cat(file.name, ", ")
  name <- sub(pattern = ".CSV|.csv", replacement = "", x = file.name)
  tmp.df <- read.csv(file.name, skip = 1, header = FALSE,
                     sep = ";",
                     col.names = c("w.length", "Tpc", "sd_Tpc"),
                     colClasses = c("integer", "double", "NULL"))
  tmp.df[["Tfr"]] <- tmp.df[["Tpc"]] / 100
  tmp.df[["Tpc"]] <- NULL
  setFilterSpct(tmp.df, Tfr.type = "total")
  tmp.df <-
    clean(tmp.df,
          range.s.data = c(0, 1)) %>%
    setFilterProperties(Rfr.constant = ifelse(grepl("UV|Protector|Skylight|IR-[6-8]|R72|Haze|RG|Night|Clear", name),
                                              max(1 - max(tmp.df[["Tfr"]]), 0),
                                              NA_real_),
                        thickness = ifelse(name %in% names_thickness,
                                           thickness[name], NA_real_),
                        attenuation.mode = ifelse(name %in% names_modes,
                                                  attenuation.modes[name],
                                                  "absorption")) %>%
    #    clip_wl(c(240, NA)) %>%
    smooth_spct(method = "supsmu", strength = 0.5)
  if (grepl("Baader", name)) {
    filter_label <- "Astrophotography filter:"
  } else {
    filter_label <- "Photography filter:"
  }
  setWhatMeasured(tmp.df,
                  paste(filter_label, gsub("_", "-", gsub("-", " ", name))))
  setHowMeasured(tmp.df, "Individual filters measured with an array spectrophotometer without an integrating sphere.")
  comment(tmp.df) <- "Measured with an Agilent 8453 array spectrophotometer by P. J. Aphalo."
  photo_filters.lst[[gsub("_$", "", gsub("[.][.]|[.]", "_", make.names(name)))]] <- tmp.df
}
photography_filters.mspct <- filter_mspct(photo_filters.lst)
photography_filters.mspct <- trim_wl(photography_filters.mspct, range = c(NA, 1020))

save(photography_filters.mspct, file = "../rda/photography-filters.mspct.rda")

setwd("../..")


