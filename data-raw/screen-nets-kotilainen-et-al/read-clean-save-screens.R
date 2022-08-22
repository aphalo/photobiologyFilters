library(readxl)
library(photobiology)
library(dplyr)
library(stringr)

rm(list = ls(pattern = "*"))
gc()
# read file
screens.df <- read_excel("data-raw/screen-nets-kotilainen-et-al/ScreensNets_irrad_trans.xlsx", na = "NA", sheet = 2)

# sanity check
names_screens <- screens.df$FilterName
names_screens <- make.names(names_screens)
screens.df$screen.name <- names_screens
rm(names_screens)

names_companies <- screens.df$Company
names_companies <- tolower(names_companies)
names_companies <- gsub("_|-| ", "", names_companies)
screens.df$supplier <- names_companies
screen_suppliers <- unique(names_companies)
rm(names_companies)

colnames(screens.df)

# convert to a collection of spectr
screens.df %>%
  transmute(w.length = Wavelength,
            Tfr = FilterFactor,
            Type = factor(paste(supplier, screen.name, sep = "_"))) %>%
  subset2mspct(member.class = "filter_spct", idx.var = "Type") -> screens.mspct

screens.mspct %>%
   trim_wl(c(310, 885)) %>%
   msmsply(.fun = smooth_spct, method = "supsmu", strength = 2) %>%
   interpolate_mspct(w.length.out = seq(from = 310, to = 885, by = 2)) -> screens.mspct

screens.mspct <- clean(screens.mspct)

screens.mspct <- thin_wl(screens.mspct)

suppliers.map <- c(arrigoni = "Arrigoni",
                   svensson = "Svensson, Sweden",
                   criadolopez = "Criado Lopez",
                   howitec = "Howitec",
                   jiangsuhuachangyarns = "Jiang Suhua Chang Yarns",
                   mallastextiles = "Mallas Textiles, Mexico",
                   huachangyarns = "Hua Chang Yarns",
                   oerlemansplastics = "Oerleman Plastics")

for (s in names(screens.mspct)) {
  s_splt <- str_split(s, pattern = "_", n = 2)[[1]]
  what_measured(screens.mspct[[s]]) <- sprintf("Climate screen type '%s' supplied by '%s'.",
                                              gsub("\\.", " ", s_splt[2]), suppliers.map[s_splt[1]])
  how_measured(screens.mspct[[s]]) <- "Measured with an Ocean Optics Maya 2000Pro spectrometer in sunlight."
  comment(screens.mspct[[s]]) <-
    paste("Source: Zenodo doi:10.5281/zenodo.1561317, file 'ScreensNets_irrad_trans.xlsx', worksheet 'database'.",
          comment(screens.mspct[[s]]), sep = "\n")
  filter_properties(screens.mspct[[s]]) <- list(Rfr.constant = NA_real_,
                                                thickness = NA_real_,
                                                attenuation.mode = "mixed")
}

for (supplier in screen_suppliers) {
  assign(paste(supplier, "screens", sep = "_"),
         grep(paste("^", supplier, sep=""), names(screens.mspct), ignore.case = TRUE, value = TRUE))
}

all_screen_selectors <- ls(pattern = "_screens$")

save(list = c("screens.mspct", "all_screen_selectors", ls(pattern = "_screens$")),
    file = "data/screens-mspct.rda")

tools::resaveRdaFiles("data", compress="auto")
print(tools::checkRdaFiles("data"))

# library(ggspectra)
# autoplot(screens.mspct[191:197], annotations = c("-", "peaks*"))

