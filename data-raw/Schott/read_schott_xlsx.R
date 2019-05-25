library(readxl)
library(dplyr)
library(photobiology)

setwd("data-raw/Schott")

sheet_names <- excel_sheets("SCHOTT data optical filter glass 2015-v01.xlsx")

filters.df <- read_excel("SCHOTT data optical filter glass 2015-v01.xlsx",
           sheet_names[2], na = "#N/A", skip = 2)
head(filters.df)
NonASCII <- tools::showNonASCII(filters.df[[1]])
if (length(NonASCII) > 0L) {
  cat("\nNon ASCII characters in SCHOTT 'Glass type': ", NonASCII, "\n")
}

filters_Tfr.df <- filters.df[-(1:4), ]
names(filters_Tfr.df)[1] <- "w.length"
names(filters_Tfr.df) <- gsub("-", "_", names(filters_Tfr.df))
NonASCII <- tools::showNonASCII(names(filters_Tfr.df))
if (length(NonASCII) > 0L) {
  cat("\nNon ASCII characters in SCHOTT names: ", NonASCII, "\n")
}


filters_Tfr.df <- mutate(filters_Tfr.df, w.length = as.numeric(w.length))
schott.mspct <- split2filter_mspct(filters_Tfr.df, Tfr.type = "internal")

k_Rfr <- filters.df[1, -1]
thickness <- filters.df[2, -1] * 1e-3

what <- paste("SCHOTT ", names(filters.df)[-1], ", thickness (m): ",  thickness, sep = "")

comments <- paste("SCHOTT filter '", names(filters.df)[-1], "' data, reference thickness (m): ",  thickness,
                  " and reflectance factor: ", signif(k_Rfr, 3), "\n (c) copyright SCHOTT, reproduced with permission.", sep = "")

names(comments) <- names(schott.mspct)
names(what) <- names(schott.mspct)
for (s in names(schott.mspct)) {
  schott.mspct[[s]] <- setWhatMeasured(schott.mspct[[s]], as.character(what[s]))
  comment(schott.mspct[[s]]) <- as.character(comments[s])
}
names(schott.mspct) <- paste("Schott", names(schott.mspct), sep = "_")
setwd("../..")

save(schott.mspct, file = "data-raw/rda/schott.mspct.rda")
