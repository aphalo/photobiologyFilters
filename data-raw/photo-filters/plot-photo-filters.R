
library(photobiologyFilters)
library(photobiologyWavebands)
library(ggspectra)
library(ggrepel)

set_annotations_default(c("=", "title:what:objt", "colour.guide", "boxes", "boundaries", "summaries"))
set_w.band_default(split_bands((2:10)*100))

autoplot(filters.mspct$BW_007_Clear) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Hoya_Protector_xxx) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Hoya_Protector_HD) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Hoya_UV0) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Hoya_UVO_HMC_Super) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Zeiss_UV_Tstar) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Firecrest_UV400) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Kenko_UV_fake) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Tiffen_Haze_2A) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Rocolax_UV_IR_Cut_PRO_HD_W) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5) +
  stat_peaks(span = 71, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 71, size = 3.5) +
  stat_valleys(span = 51, colour = "blue") + stat_valleys(geom = "text", angle = 90, hjust = 1.3, span = 51, size = 3.5)

autoplot(filters.mspct$Rocolax_UV_IR_Cut_445nm_650nm) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5) +
  stat_peaks(span = 21, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 21, size = 3.5) +
  stat_valleys(span = 21, colour = "blue") + stat_valleys(geom = "text", angle = 90, hjust = 1.3, span = 21, size = 3.5)

autoplot(filters.mspct$Hoya_CIRPL) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5) +
  stat_peaks(span = NULL, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = NULL, size = 3.5)

autoplot(filters.mspct$Firecrest_CPL) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5) +
  stat_peaks(span = NULL, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = NULL, size = 3.5)

autoplot(filters.mspct$Haida_Clear_Night_NanoPro) +
  geom_vline(xintercept = 589, colour = colour_of(589)) +
  geom_vline(xintercept = 436, colour = colour_of(436)) +
  stat_find_wls() + stat_find_wls(geom = "text_repel", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5) +
  stat_peaks(span = 71, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 71, size = 3.5) +
  stat_valleys(span = 51, colour = "blue") + stat_valleys(geom = "text", angle = 90, hjust = 1.3, span = 51, size = 3.5)

autoplot(filters.mspct$Hoya_82A_HMC) +
  stat_find_wls() + stat_find_wls(geom = "text_repel", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5) +
  stat_peaks(span = 71, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 71, size = 3.5) +
  stat_valleys(span = 51, colour = "blue") + stat_valleys(geom = "text", angle = 90, hjust = 1.3, span = 51, size = 3.5)

autoplot(filters.mspct$Hoya_25A_HMC) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Heliopan_RG695) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Zomei_IR_680) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Zomei_IR_720) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Hoya_R72) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Zomei_IR_760) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Heliopan_RG780) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Zomei_IR_850) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Zomei_IR_950) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

autoplot(filters.mspct$Heliopan_BG38) +
  stat_find_wls() + stat_find_wls(geom = "text_repel", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5) +
  stat_peaks(span = 71, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 71, size = 3.5) +
  stat_valleys(span = 51, colour = "blue") + stat_valleys(geom = "text", angle = 90, hjust = 1.3, span = 51, size = 3.5)

autoplot(filters.mspct$Zomei_ND_09) +
  stat_peaks(span = 101, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(0.9), linetype = "dashed")

autoplot(filters.mspct$Knight_ND12) +
  stat_peaks(span = 101, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(0.9), linetype = "dashed")

autoplot(filters.mspct$Firecrest_ND12) +
  stat_peaks(span = 101, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(1.2), linetype = "dashed")

autoplot(filters.mspct$Firecrest_ND12_sqr) +
  stat_peaks(span = 101, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(1.2), linetype = "dashed")

autoplot(filters.mspct$Firecrest_ND18) +
  stat_peaks(span = 101, colour = "red") + stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(1.8), linetype = "dashed")

autoplot(filters.mspct$Firecrest_UVIR_Cut * filters.mspct$Hoya_82A_HMC) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.2, size = 3.5) +
  stat_find_wls(target = 0.05, colour = "orange") + stat_find_wls(target = 0.05, geom = "text_repel", hjust = 1.2, size = 3.5)

set_annotations_default()
set_w.band_default()
