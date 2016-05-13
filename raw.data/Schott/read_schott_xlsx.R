library(readxl)
library(dplyr)
library(photobiology)

setwd("raw.data/Schott")

sheet_names <- excel_sheets("SCHOTT data optical filter glass 2015-v01.xlsx")

filters.df <- read_excel("SCHOTT data optical filter glass 2015-v01.xlsx",
           sheet_names[2], na = "#N/A", skip = 2)
head(filters.df)

filters_Tfr.df <- filters.df[-(1:4), ]
filters_Tfr.df <- rename(filters_Tfr.df, w.length = `Glass type`)
filters_Tfr.df <- mutate(filters_Tfr.df, w.length = as.numeric(w.length))
schott.mspct <- split2filter_mspct(filters_Tfr.df, Tfr.type = "internal")

k_Rfr <- filters.df[1, -1]
thickness <- filters.df[2, -1] * 1e-3

comments <- paste("SCHOTT filer data, reference thickness (m):",  thickness, 
                  "and reflectance factor:", k_Rfr)

names(comments) <- names(schott.mspct)
for (s in names(schott.mspct)) {
  comment(schott.mspct[[s]]) <- as.character(comments[s])
}
setwd("../..")

save(schott.mspct, file = "data/schott.mspct.rda")
