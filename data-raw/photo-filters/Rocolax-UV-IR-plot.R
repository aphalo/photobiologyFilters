library(photobiologyFilters)
library(ggspectra)
autoplot(filters.mspct[c("Rocolax_UV_IR_Cut_PRO_HD_W", "Rocolax_UVIR_small")],
         annotations = c("=", "colour.guide")) +
  stat_find_wls() + stat_find_wls(geom = "text", hjust = -0.3, size = 3) +
theme(legend.position = "none") + facet_wrap(~spct.idx, ncol = 1)
