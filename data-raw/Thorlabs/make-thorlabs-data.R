library(photobiology)
library(readxl)
library(ggspectra)

path2files <- "./data-raw/Thorlabs/"
file.names <- list.files(path = path2files, pattern = "\\.xlsx$")
filter_types <- gsub("\\.xlsx$", "", file.names)
thorlabs_filters <- gsub("-", "_", filter_types)
thorlabs_filters <- paste("Thorlabs", thorlabs_filters, sep = "_")

file.paths <- paste(path2files, file.names, sep = "")
thorlabs.mspct <- filter_mspct()
for (i in seq_along(file.names)) {
  temp.spct <- read_xlsx(file.paths[i],
                         sheet = filter_types[i], range = "C2:E1002",
                         col_names = c("w.length", "A", "Tpc"))
  temp.spct <-
    setFilterSpct(temp.spct[ , c(1, 3)],
                  Tfr.type = "total",
                  attenuation.mode = "reflection")
  what_measured(temp.spct) <-
    paste("Hard-Coated UV/VIS band-pass filter type '", filter_types[i],
          "'; dielectric coatings on UV fused silica; ",
          "Thorlabs, USA and Germany (typical spectrum specs.)",
          sep = "")
  how_measured(temp.spct) <- paste("Numerical data from supplier. File: '",
                                   file.names[i])
  comment(temp.spct) <-
    "Data from Thorlabs website.\n Original notice: This data may be used in publications. However, please cite Thorlabs as the source."

  thorlabs.mspct[[thorlabs_filters[i]]] <- temp.spct
  cat(thorlabs_filters[i], "\n")
}

save(thorlabs.mspct, thorlabs_filters, file = "data-raw/rda/thorlabs.mspct.rda")
