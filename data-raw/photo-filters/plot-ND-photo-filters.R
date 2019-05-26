library(photobiologyFilters)
library(photobiologyWavebands)
library(ggspectra)
library(ggrepel)
library(patchwork)
library(svglite)

set_annotations_default(c("=", "title:what", "boxes", "boundaries", "summaries"))
set_w.band_default(split_bands((2:10)*100))
theme_set(theme_bw(12) + theme(legend.position = "top"))

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

autoplot(filters.mspct$KnightX_ND16_resin) +
   stat_peaks(span = 101, colour = "red") +
   stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
   geom_hline(yintercept = A2T(1.2), linetype = "dashed", colour = "blue") +
   annotate(geom = "text", y = A2T(1.2), x  = 250,
            label = sprintf("OD %.1f = T %.2g", 1.2, A2T(1.2)),
            colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$KnightX_ND16_resin, plot.qty = "absorbance") +
  geom_hline(yintercept = 1.2, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 1.2, x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.2, A2T(1.2)),
           colour = "blue", size = 3, vjust = -0.3) +
  geom_hline(yintercept = 2, linetype = "dashed", colour = "red") +
  annotate(geom = "text", y = 2, x  = 250,
           label = sprintf("OD %.1f = T %.2g", 2, A2T(2)),
           colour = "red", size = 3, vjust = -0.3)

autoplot(filters.mspct$Hitech_ND_09_HL) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(0.9), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(0.9), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 0.9, A2T(0.9)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Hitech_ND_09_HL, plot.qty = "absorbance") +
  geom_hline(yintercept = 0.9, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 0.9, x  = 250,
           label = sprintf("OD %.1f = T %.2g", 0.9, A2T(0.9)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Hitech_ND_06_HL) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(0.6), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(0.6), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 0.6, A2T(0.6)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Hitech_ND_06_HL, plot.qty = "absorbance") +
  geom_hline(yintercept = 0.6, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 0.6, x  = 250,
           label = sprintf("OD %.1f = T %.2g", 0.6, A2T(0.6)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Rosco_ND_Ecolour_no209) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = 0.5, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 0.5, x  = 250,
           label = sprintf("OD %.1f = T %.2g", T2A(0.5), 0.5),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Rosco_e_colour_ND_209, plot.qty = "absorbance") +
  geom_hline(yintercept = T2A(0.5), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = T2A(0.5), x  = 250,
           label = sprintf("OD %.1f = T %.2g", T2A(0.5), 0.5),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Rosco_e_colour_ND_210) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = 0.25, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 0.25, x  = 250,
           label = sprintf("OD %.1f = T %.2g", T2A(0.25), 0.25),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Rosco_e_colour_ND_210, plot.qty = "absorbance") +
  geom_hline(yintercept = T2A(0.25), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = T2A(0.25), x  = 250,
           label = sprintf("OD %.1f = T %.2g", T2A(0.25), 0.25),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Rosco_e_colour_ND_211) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = 0.125, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 0.125, x  = 250,
           label = sprintf("OD %.1f = T %.2g", T2A(0.125), 0.125),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Rosco_e_colour_ND_211, plot.qty = "absorbance") +
  geom_hline(yintercept = T2A(0.125), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = T2A(0.125), x  = 250,
           label = sprintf("OD %.1f = T %.2g", T2A(0.125), 0.125),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Rosco_Grey_Cinegel_no97) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = 0.5, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 0.5, x  = 250,
           label = sprintf("OD %.1f = T %.2g", T2A(0.5), 0.5),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Rosco_Cinegel_grey_97, plot.qty = "absorbance") +
  geom_hline(yintercept = T2A(0.5), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = T2A(0.5), x  = 250,
           label = sprintf("OD %.1f = T %.2g", T2A(0.5), 0.5),
           colour = "blue", size = 3, vjust = -0.3)

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

autoplot(filters.mspct$Firecrest_ND12) +
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

autoplot(filters.mspct$Firecrest_ND12_sqr) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(1.2), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(1.2), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.2, A2T(1.2)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Firecrest_ND12_sqr, plot.qty = "absorbance") +
  geom_hline(yintercept = 1.2, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 1.2, x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.2, A2T(1.2)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Firecrest_IRND_15_MC) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(1.5), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(1.5), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.5, A2T(1.5)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Firecrest_IRND_15_MC, plot.qty = "absorbance") +
  geom_hline(yintercept = 1.5, linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = 1.5, x  = 250,
           label = sprintf("OD %.1f = T %.2g", 1.5, A2T(1.5)),
           colour = "blue", size = 3, vjust = -0.3)

schott.ggp <-
autoplot(filters.mspct$Schott_NG3, range = c(190, 1050)) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(0.9), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(0.9), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 0.9, A2T(0.9)),
           colour = "blue", size = 3, vjust = -0.3)

schott_uvir.ggp <-
  autoplot(filters.mspct$Schott_NG3 * filters.mspct$Firecrest_UVIR_Cut,
           range = c(190, 1050)) +
  stat_peaks(span = 101, colour = "red") +
  stat_peaks(geom = "text", angle = 90, hjust = -0.3, span = 101, size = 3.5) +
  geom_hline(yintercept = A2T(0.9), linetype = "dashed", colour = "blue") +
  annotate(geom = "text", y = A2T(0.9), x  = 250,
           label = sprintf("OD %.1f = T %.2g", 0.9, A2T(0.9)),
           colour = "blue", size = 3, vjust = -0.3)

autoplot(filters.mspct$Schott_NG3, plot.qty = "absorbance", range = c(190, 1050)) +
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


