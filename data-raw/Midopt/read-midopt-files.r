library(tabulizer)
library(tibble)
library(dplyr)
library(photobiology)
library(ggspectra)
library(stringr)
rm(list = ls())
setwd("data-raw/Midopt")

file.list <- list.files(pattern = "*.pdf")
midopt.lst <- list()
failed <- character()
for (file.name in file.list) {
  name <- sub(pattern = "_Transmission_MidOpt.pdf", replacement = "", x = file.name)
  name <- gsub("-", "_", name)
  name <- enc2native(name)
  type <- str_match(name, "BP|Bi|BN|PE|AB|AC|LP|NF|SP|TB|DB|Ni|ND")
  type.name <- switch(type,
                      BP = "band-pass",
                      Bi = "band-pass",
                      BN = "band-pass",
                      AB = "band-pass",
                      DB = "double band-pass",
                      TB = "triple band-pass",
                      AC = "long-pass",
                      LP = "long-pass",
                      SP = "short-pass",
                      PE = "band-pass",
                      NF = "short-pass",
                      Ni = "neutral-density",
                      ND = "neutral-density")

  if (grepl("i", type)) {
    material <- "interference"
  } else if (grepl("^A", type)) {
    material <- "acrylic"
  } else {
    material <- "optical glass"
  }

  tmp.mt <- extract_tables(file.name, encoding = "ASCII")[[1]]
  num_slices <- ncol(tmp.mt) %/% 2L
  if (ncol(tmp.mt) %% 2L != 0L | is.na(try(as.numeric(tmp.mt[2, 1])))) {
    failed <- c(failed, name)
    next()
  }
  tmp.spct <- tmp.mt[-1, 1:2]

  if (num_slices > 1) {
    for (i in 2:num_slices) {
            ii <- 2L * i
      tmp.spct <-
        rbind(tmp.spct,
              tmp.mt[-1, (ii-1):ii])
    }
  }

  NonASCII <- tools::showNonASCII(tmp.spct)
  if (length(NonASCII) > 0L) {
    cat("\nNon ASCII characters in ", file.name, ": ", NonASCII, "\n")
  } else {
    cat(".")
  }

  tmp.spct %>%
    as.tibble() %>%
    select("w.length" = .data$V1, "Tpc" = .data$V2) %>%
    filter(w.length != "") %>%
    mutate(w.length = as.numeric(w.length), Tpc = as.numeric(Tpc)) %>%
    arrange(w.length) %>%
    as.filter_spct(Tfr.type = "total") -> tmp.spct
  tmp.spct <- setFilterProperties(tmp.spct)
  tmp.spct <- setWhatMeasured(tmp.spct,
                              paste("Machine vision ", type.name, " filter '",
                                    name,
                                    "'; ", material,
                                    "; from MidOpt, USA",
                                    " (from specs.)",
                                    sep = ""))
  tmp.spct <- setHowMeasured(tmp.spct, "Numerical data from supplier.")
  comment(tmp.spct) <- paste("MIDOPT Machine vision ", type.name, " filter '",
                             name,
                             "', ", material,
                    "\n(c) Midwest Optical Systems, Inc. (MidOpt), reproduced with permission.",
                    sep = "")

  midopt.lst[[name]] <- tmp.spct

}

midopt.mspct <- filter_mspct(midopt.lst)
names(midopt.mspct) <- paste("MIDOPT", names(midopt.mspct), sep = "_")

setwd("../..")

save(midopt.mspct, file = "data-raw/rda/midopt.mspct.rda")


# plot(BP365.spct)
