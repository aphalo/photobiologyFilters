library(readxl)
library(photobiology)

setwd("data-raw/cie-glass-windows")

glass.head <- read_excel("206.xls", sheet = "AllGlasses", n_max = 8)
manufacturers <- enc2native(unlist(glass.head[4, -1], use.names = FALSE))
thickness <- try(as.numeric(unlist(glass.head[3, -1], use.names = FALSE)) * 1e-3)
glass.name <- enc2native(names(glass.head)[-1])

glass.tb <- read_excel("206.xls", sheet = "AllGlasses", skip = 8)

names(glass.tb)[1] <- "w.length"
names(glass.tb) <- enc2native(gsub(" ", "_", names(glass.tb)))

glass_windows.mspct <- split2filter_mspct(glass.tb, Tfr.type = "total")

for (i in 1:length(glass_windows.mspct)) {
  glass_windows.mspct[[i]] <-
    setWhatMeasured(glass_windows.mspct[[i]],
                    paste("'", glass.name[i],
                          "'; thickness ", signif(thickness[i], 3),
                          "; from ", manufacturers[i],
                          sep = ""))
  comment(glass_windows.mspct[[i]]) <- "Source: CIE, file '206.xls'"
}

setwd("../..")

save(glass_windows.mspct, file = "data-raw/rda/glass-windows.mspct.rda")
