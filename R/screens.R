#' Indexing of Climate Screens by Supplier
#'
#' Vectors of names of member objects containing spectral transmittance data for
#' climate, shade and protection screens used in agriculture grouped by
#' supplier. These can be used to extract subsets of spectra from the collection
#' stored in the \code{filter_mspct} object named \code{screens.mspct}.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @references
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
#' @examples
#' arrigoni_screens
#'
#' # select screens supplied by Arrigoni
#' screens.mspct[arrigoni_screens[1:5]]
#'
#' @seealso \code{\link{screens.mspct}}
#'
#' @rdname screen_suppliers
#'
"arrigoni_screens"

#' @rdname screen_suppliers
#'
"criadolopez_screens"

#' @rdname screen_suppliers
#'
"howitec_screens"

#' @rdname screen_suppliers
#'
"huachangyarns_screens"

#' @rdname screen_suppliers
#'
"mallastextiles_screens"

#' @rdname screen_suppliers
#'
"oerlemansplastics_screens"

#' @rdname screen_suppliers
#'
"svensson_screens"
