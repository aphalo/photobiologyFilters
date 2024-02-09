#' Spectral transmittance of climate screens and shade nets
#'
#' A collection of transmittance spectra for climate screens and shade nets from
#' different suppliers. We include under "screens and nets", nets, cloths and
#' laminated and perforated films with spatially heterogeneous optical
#' properties. We exclude "filters" including all semi-transparent and
#' transparent sheets and films with spatially homogeneous optical properties.
#' Spectra for nearly 200 types of screens and nets from eight suppliers were
#' measured consistently as described by Kotilainen et al. (2018).
#'
#' The variables for each spectrum are as follows:
#' \itemize{ \item w.length (nm) \item Tfr (fraction) }
#'
#' @details Spectra were measured on new (never used) samples. Optical
#'   properties can be expected to change with ageing due to chemical changes
#'   induced by solar UV radiation and by soiling during the usual life
#'   expectancy of five or more years. Spectral data for twenty four
#'   climate-screen samples (ten Harmony-type, two Luxous-type, seven
#'   Solaro-type and six Tempa-type) and four insect-screen samples provided by
#'   Svensson (AB Ludvig Svensson, KINNA, Sweden,
#'   \url{https://www.ludvigsvensson.com/en/climate-screens}). Twenty-six
#'   shade-net samples (16 Sombra-type and ten Sombra raschel-type (patterned))
#'   and 12 thrip, aphid, and insect -net samples (two Anti-Trip-type, eight
#'   Anti-Afidos-type and two Anti-Insect types) were provided by Mallas
#'   Textiles (Mallas Textiles Fabricantes, Chimalhuacán, Mexico,
#'   \url{https://mallastextilesmx.com/}) were described by Kotilainen et al.
#'   (2018). Additional spectra obtained by the same authors are also included
#'   in this package. If you use these data in publications, please, cite both
#'   Kotilainen et al. (2018) and this package.
#'
#'   The variables in each member spectrum are as follows: \itemize{ \item
#'   \code{w.length} (nm) \item \code{Tfr} (transmittance expressed as a
#'   fraction of one) } These member objects contain metadata stored as R
#'   attributes. Accessors  to the metadata are available:
#'   \code{what_measured()}, \code{how_measured()}, \code{when_measured()},
#'   \code{filter_properties()} and \code{comment()}.
#'
#' @note Please see the help for the indexing vectors for specific details.
#'   The original data of Kotilainen et al. (2018) plus additional data are
#'   available at Zenodo (Robson and Kotilainen, 2018). The data read from file
#'   \code{ScreensNets_irrad_trans.xlsx}, worksheet \code{"database"}, have been
#'   reprocessed to remove noise. The wavelength values have been "thinned" in
#'   featureless regions using as criterion the lack of change in the local
#'   slope to significantly reduce the size of the data set. Lossless
#'   compression was applied to the R data file were data are stored.
#'
#' @docType data
#' @keywords datasets
#' @format A \code{filter_mspct} object named \code{screens_nets.mspct} containing a
#'   collection of \code{filter_spct} objects each with a variable number of
#'   rows and 2 variables.
#'
#' @references
#'  Kotilainen, Titta; Robson, T. Matthew; Hernández, Ricardo (2018) Light
#'  quality characterization under climate screens and shade nets for
#'  controlled-environment agriculture. PLOS ONE, Vol. 13, No. 6, p. e0199628.
#'  \doi{10.1371/journal.pone.0199628}.
#'
#'  Robson, T. Matthew; Kotilainen, Titta (2018) Spectral transmittance of solar
#'  radiation by screens and nets used in horticulture and agriculture. 1.1.1.
#'  Data set. Zenodo. \doi{10.5281/zenodo.1561317}
#'
#' Catálogo de productos. Mallastextiles, Chimalhuacán, Edo. de México. \url{https://mallastextilesmx.com/}
#'
#' "Samples folder". Howitec Netting.Bolsward, The Netherlands. \url{https://www.howitec.com/}
#'
#' "Samples". Arrigoni Spa. Uggiate Trevano, Italia. \url{https://www.arrigoni.it}
#'
#' "Samples". Criado & Lopez. El Ejido (Almería) España. \url{https://www.criadoylopez.com}
#'
#' "Samples". oerlemans plastics BV. Genderen, The Netherlands. \url{https://www.oerlemansplastics.nl}
#'
#' "samples". Jiangsu Huachang Yarns & Fabrics Co. Ltd. Jurong, Jiangsu, China. \url{https://www.hcpco.com}
#'
#' Samples folder. Kinna, Sweden. \url{https://www.ludvigsvensson.com/}
#'
#' @section Acknowledgements: These data were acquired as part of research
#'   funded by the Academy of Finland (Decision No. 304653 and 304519 to T. M.
#'   Robson) and USDA National Institute of Food and Agriculture (Decision No.
#'   107454 to R. Hernández).
#'
#' @examples
#' screens_nets.mspct$arrigoni_X2210WO.Iride.Black.Green
#'
#' what_measured(screens_nets.mspct$arrigoni_X2210WO.Iride.Black.Green)
#' how_measured(screens_nets.mspct$arrigoni_X2210WO.Iride.Black.Green)
#' filter_properties(screens_nets.mspct$arrigoni_X2210WO.Iride.Black.Green)
#' cat(comment(screens_nets.mspct$arrigoni_X2210WO.Iride.Black.Green))
#'
#' names(screens_nets.mspct)
#'
"screens_nets.mspct"
