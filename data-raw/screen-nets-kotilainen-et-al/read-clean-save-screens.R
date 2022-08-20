library(readxl)
library(photobiology)
library(dplyr)

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

for (supplier in screen_suppliers) {
  assign(paste(supplier, "screens", sep = "_"),
         grep(supplier, names(screens.mspct), ignore.case = TRUE, value = TRUE))
}

all_screen_selectors <- ls(pattern = "_screens$")

save(list = c("screens.mspct", "all_screen_selectors", ls(pattern = "_screens$")),
    file = "data/screens-mspct.rda")

tools::resaveRdaFiles("data", compress="auto")
print(tools::checkRdaFiles("data"))

# library(ggspectra)
# autoplot(screens.mspct[191:197], annotations = c("-", "peaks*"))

