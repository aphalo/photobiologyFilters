#' Indexing of Climate Screens and shade nets by Supplier
#'
#' Vectors of names of member objects containing spectral transmittance data for
#' climate, shade and protection screens used in agriculture grouped by
#' supplier. These can be used to extract subsets of spectra from the collection
#' stored in the object named \code{screens_nets.mspct}, belonging to class
#' \code{filter_mspct}.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
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
#' "Samples folder". Howitec Netting.Bolsward, The Netherlands. \url{https://www.howitec.nl/}
#'
#' "Samples". Arrigoni Spa. Uggiate Trevano, Italia. \url{https://www.arrigoni.it}
#'
#' "Samples". Criado & Lopez. El Ejido (Almería) España. \url{https://www.criadoylopez.com}
#'
#' "Samples". oerlemans plastics BV. Genderen, The Netherlands. \url{https://www.oerlemansplastics.nl}
#'
#' "samples". Jiangsu Huachang Yarns & Fabrics Co. Ltd. Jurong, Jiangsu, China. \url{http://www.hcpco.com}
#'
#' Samples folder. Kinna, Sweden. \url{https://www.ludvigsvensson.com/}
#'
#' @section Acknowledgements: These data were acquired as part of research
#'   funded by the Academy of Finland (Decision No. 304653 and 304519 to T. M.
#'   Robson) and USDA National Institute of Food and Agriculture (Decision No.
#'   107454 to R. Hernández).
#'
#' @seealso \code{\link{screens_nets.mspct}}
#'
#' @examples
#' arrigoni_screens_nets
#'
#' # select screens supplied by Arrigoni
#' screens_nets.mspct[arrigoni_screens_nets[1:5]]
#'
#' @seealso \code{\link{screens_nets.mspct}}
#'
#' @rdname screens_nets_suppliers
#' @aliases screens_nets_suppliers
#'
"arrigoni_screens_nets"

#' @rdname screens_nets_suppliers
#'
"criadolopez_screens_nets"

#' @rdname screens_nets_suppliers
#'
"howitec_screens_nets"

#' @rdname screens_nets_suppliers
#'
"huachangyarns_screens_nets"

#' @rdname screens_nets_suppliers
#'
"mallastextiles_screens_nets"

#' @rdname screens_nets_suppliers
#'
"oerlemansplastics_screens_nets"

#' @rdname screens_nets_suppliers
#'
"svensson_screens_nets"
