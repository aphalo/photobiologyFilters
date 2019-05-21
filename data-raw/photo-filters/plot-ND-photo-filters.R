
library(photobiologyFilters)
library(photobiologyWavebands)
library(ggspectra)
library(ggrepel)
library(patchwork)
library(svglite)

set_annotations_default(c("=", "title:what", "boxes", "boundaries", "summaries"))
set_w.band_default(split_bands((2:10)*100))
theme_set(theme_bw(12))

zomei.ggp <-
autoplot(filters.mspct$Zomei_ND_09) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(0.9), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(0.9), x  = 250,
           label = sprintf("OD %.1f = T %.2f", 0.9, A2T(0.9)),
           colour = "blue", size = 3, vjust = -0.3)

zomei_uvir.ggp <-
  autoplot(filters.mspct$Zomei_ND_09 * filters.mspct$Firecrest_UVIR_Cut) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(0.9), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(0.9), x  = 250,
           label = sprintf("OD %.1f = T %.2f", 0.9, A2T(0.9)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Zomei_ND_09, plot.qty = "absorbance") +
  geom_hline(yintercept = 0.9, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 0.9, x  = 250,
           label = sprintf("OD %.1f = T %.2f", 0.9, A2T(0.9)),
           colour = "blue", size = 3, vjust = -0.3)

# autoplot(filters.mspct$Knight_ND12) +
#   stat_peaks(span = 101, colour = "red") +
#   stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
#   geom_hline(yintercept = A2T(1.2), linetype = "dashed", colour = "blue") +
#   annotate(geom = "text", y = A2T(1.2), x  = 250,
#            label = sprintf("OD %.1f = T %.2g", 1.2, A2T(1.2)),
#            colour = "blue", size = 3, vjust = -0.3)

firecrest.ggp <-
autoplot(filters.mspct$Firecrest_ND12) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(1.2), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(1.2), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.2, A2T(1.2)),
           colour = "blue", size = 3, vjust = -0.3)

firecrest_uvir.ggp <-
  autoplot(filters.mspct$Firecrest_ND12 * filters.mspct$Firecrest_UVIR_Cut) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(1.2), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(1.2), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.2, A2T(1.2)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Firecrest_ND12, plot.qty = "absorbance") +
  geom_hline(yintercept = 1.2, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 1.2, x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.2, A2T(1.2)),
           colour = "blue", size = 3, vjust = -0.3)

schott.ggp <-
autoplot(filters.mspct$NG3, range = c(190, 1050)) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(0.9), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(0.9), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 0.9, A2T(0.9)),
           colour = "blue", size = 3, vjust = -0.3)

schott_uvir.ggp <-
  autoplot(filters.mspct$NG3 * filters.mspct$Firecrest_UVIR_Cut,
           range = c(190, 1050)) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(0.9), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(0.9), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 0.9, A2T(0.9)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$NG3, plot.qty = "absorbance", range = c(190, 1050)) +
  geom_hline(yintercept = 0.9, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 0.9, x  = 250,
           label = sprintf("OD %.1f = T %.2g", 0.9, A2T(0.9)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Firecrest_ND12_sqr) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(1.2), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(1.2), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.2, A2T(1.2)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Firecrest_ND18) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(1.8), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(1.8), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.8, A2T(1.8)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Firecrest_ND18, plot.qty = "absorbance") +
  geom_hline(yintercept = 1.8, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 1.8, x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.8, A2T(1.8)),
           colour = "blue", size = 3, vjust = -0.3)

uvir_cut.gpp <-
autoplot(filters.mspct$Firecrest_UVIR_Cut) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = 1.1, size = 3.5, label.fmt = "%.3g nm") +
  stat_find_wls(target = 0.05, colour = "orange") +
  stat_find_wls(target = 0.05, geom = "text", hjust = 1.1, size = 3.5, label.fmt = "%.3g nm")

rosco.ggp <-
  autoplot(filters.mspct$Neutral_Density_1_2_EColour299, range = c(190, 1050)) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(1.2), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(1.2), x  = 475,
           label = sprintf("OD %.1f = T %.2g", 1.2, A2T(1.2)),
           colour = "blue", size = 3, vjust = -0.3)

svg("ND-filters.svg", width = 8, height = 12)
firecrest.ggp / schott.ggp / zomei.ggp
dev.off()

svg("ND-UVIR-filters.svg", width = 8, height = 12)
firecrest_uvir.ggp / schott_uvir.ggp / zomei_uvir.ggp
dev.off()

svg("UVIR-cut-filter.svg", width = 8, height = 4)
uvir_cut.gpp
dev.off()

set_annotations_default()
set_w.band_default()
