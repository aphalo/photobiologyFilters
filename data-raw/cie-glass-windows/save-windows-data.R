library(readxl)

setwd("data-raw/cie-glass-windows")

glass.head <- read_excel("206.xls", sheet = "AllGlasses", n_max = 8)
manufacturers <- unlist(glass.head[4, -1], use.names = FALSE)
glass.name <- names(glass.head)[-1]
glass.tb <- read_excel("206.xls", sheet = "AllGlasses", skip = 8)

names(glass.tb)[1] <- "w.length"

split2filter_mspct(glass.tb, Tfr.type = "total")
