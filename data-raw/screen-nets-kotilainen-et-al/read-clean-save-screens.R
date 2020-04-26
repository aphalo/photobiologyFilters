library(readxl)
library(photobiology)
library(dplyr)

# read file
screens.df <- read_excel("data-raw/screen-nets-kotilainen-et-al/ScreensNets_irrad_trans.xlsx", na = "NA", sheet = 2)

# sanity check
names_screens <- unique(screens.df$FilterName)
length(names_screens)
names_companies <- unique(screens.df$Company)
length(names_companies)
colnames(screens.df)

# convert to a collection of spectr
screens.df %>%
  transmute(w.length = Wavelength,
            Tfr = FilterFactor,
            Type = factor(paste(Company, make.names(FilterName), sep = "_"))) %>%
  subset2mspct(member.class = "filter_spct", idx.var = "Type") -> screens.mspct

screens.mspct %>%
   trim_wl(c(310, 885)) %>%
   msmsply(.fun = smooth_spct, method = "supsmu") %>%
  interpolate_mspct(w.length.out = seq(from = 310, to = 900, by = 2))-> screens.mspct

save(screens.mspct, file = "data/screens-mspct.rda")

tools::resaveRdaFiles("data", compress="auto")
print(tools::checkRdaFiles("data"))

# library(ggspectra)
# autoplot(screens.mspct[191:197], annotations = c("-", "peaks*"))

