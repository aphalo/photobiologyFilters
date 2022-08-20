#' Total transmittance for photography filters
#'
#' Total transmittance for filters intended for use on camera lenses from
#' various brands and suppliers: B+W, Formatt-Hitech (Hitech, Firecrest), Fotga,
#' Haida, Heliopan, Hoya, KinghtX, KolariVision, Purshee, Rocolax, Tangsinuo,
#' Tiffen, UVRoptics, Zeiss, and Zomei. Data are to be used as \emph{"reference
#' values only"} as values may change in time and production batch or glass
#' melt. The fine structure of the spectra depends on the wavelength resolution
#' of the spectrometer used and post-processing applied to the data. In some
#' cases spectra for multiple filters of the same brand are type are included
#' and show such variation.
#'
#' The variables are as follows:
#'
#' \itemize{ \item w.length (nm) \item Tfr (fraction) }
#'
#' @section Supplier's web sites, if known:
#'   \url{https://www.baader-planetarium.com/en/},
#'   \url{https://www.formatt-hitech.com/}, \url{https://www.fotga.com/},
#'   \url{https://www.haidaphoto.com/en/}, \url{https://www.heliopan.de/},
#'   \url{https://hoyafilter.com/}, \url{https://kenkoglobal.com/},
#'   \url{https://knightx-photography.aliexpress.com/store/924165},
#'   \url{https://kolarivision.com/},
#'   \url{https://purshee.aliexpress.com/store/1996249},
#'   \url{https://schneiderkreuznach.com/en/photo-optics},
#'   \url{https://tangsinuo.aliexpress.com/store/4314008},
#'   \url{https://tiffen.com/}, \url{https://www.uvroptics.com/},
#'   \url{https://www.zomei.com/}.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @note Data measured with an Agilent 8453 spectrophotometer (based on diode
#'   array).
#'
#' @note Idependent measurement of a single sample, not a specification.
#'
#' @examples
#' photography_filters
#'
"photography_filters"

#' @rdname photography_filters
#'
"hoya_filters"

#' @rdname photography_filters
#'
"firecrest_filters"

#' @rdname photography_filters
#'
"haida_filters"

#' @rdname photography_filters
#'
"zomei_filters"

#' @rdname photography_filters
#'
"fake_unbranded_filters"

#' @rdname photography_filters
#'
"baader_filters"

#' @rdname photography_filters
#'
"uvroptics_filters"

#' @rdname photography_filters
#'
"tiffen_filters"

#' @rdname photography_filters
#'
"bw_filters"

#' @rdname photography_filters
#'
"heliopan_filters"

#' @rdname photography_filters
#'
"zeiss_filters"

#' @rdname photography_filters
#'
"kenko_filters"

#' @rdname photography_filters
#'
"rocolax_filters"

#' @rdname photography_filters
#'
"kolarivision_filters"

#' @rdname photography_filters
#'
"fotga_filters"

#' @rdname photography_filters
#'
"tangsinuo_filters"

#' @rdname photography_filters
#'
"purshee_filters"

#' @rdname photography_filters
#'
"knightx_filters"
