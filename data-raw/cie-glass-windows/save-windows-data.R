library(tools)
library(readxl)
library(photobiology)

setwd("data-raw/cie-glass-windows")

glass.head <- read_excel("206.xls", sheet = "AllGlasses", n_max = 8)
manufacturers <- enc2native(unlist(glass.head[4, -1], use.names = FALSE))
manufacturers <- iconv(manufacturers, from = "UTF8", to = "ASCII", sub = " ")
print(manufacturers)
thickness <- try(as.numeric(unlist(glass.head[3, -1], use.names = FALSE)) * 1e-3)
material <- try(unlist(glass.head[7, -1], use.names = FALSE))
glass.name <- enc2native(names(glass.head)[-1])
glass.name <- iconv(glass.name, from = "UTF8", to = "ASCII", sub = " ")
print(glass.name)

attenuation.mode <- ifelse(is.na(thickness), "unknown", "absorption")
Rfr.constant <- ifelse(material == "Glass", 0.08, NA_real_)

glass.tb <- read_excel("206.xls", sheet = "AllGlasses", skip = 8)

names(glass.tb)[1] <- "w.length"
names(glass.tb) <- enc2native(gsub(" ", "_", names(glass.tb)))

properties.tb <- data.frame(Rfr.constant = Rfr.constant,
                            thickness = thickness,
                            attenuation.mode = attenuation.mode)


glass_windows.mspct <- split2filter_mspct(glass.tb, Tfr.type = "total") %>%
  clean()

for (i in 1:length(glass_windows.mspct)) {
  glass_windows.mspct[[i]] <-
    setWhatMeasured(glass_windows.mspct[[i]],
                    paste("'", glass.name[i],
                          "'; thickness ", signif(thickness[i], 3),
                          "; from ", manufacturers[i],
                          sep = ""))
  glass_windows.mspct[[i]] <-
    setHowMeasured(glass_windows.mspct[[i]], "Numerical data from CIE.")
  glass_windows.mspct[[i]] <-
    setFilterProperties(glass_windows.mspct[[i]],
                        filter.properties = as.list(properties.tb[i, ]))

  comment(glass_windows.mspct[[i]]) <- "Source: CIE, file '206.xls'"
}

setwd("../..")

save(glass_windows.mspct, file = "data-raw/rda/glass-windows.mspct.rda")
