#' Indexing of photography filters
#'
#' Vectors of names of member objects with spectral data for filters intended to
#' be used for terrestrial- and/or astrophotography, grouped by supplier.
#' Suppliers: Angeleyes, B+W, Baader planetarium, Formatt-Hitech (Hitech,
#' Firecrest), Fotga, Haida, Heliopan, Hoya, Ken & Faith Concept, KinghtX,
#' KolariVision, Nisi, Purshee, Rocolax, SVBONY, Tangsinuo, Thingyfy, Tiffen,
#' UVRoptics, Zeiss, and Zomei.
#'
#' @section Warning!: Data are to be used as \emph{"reference values only"} as
#'   actual transmittance may change in time and with production batch or glass
#'   melt. In some cases spectra for multiple filters of the same brand and type
#'   are included and show such variation. In other words, these spectra are
#'   measured in individual filters, other filters of the same type and brand
#'   will almost surely differ to some extent in their spectra.
#'
#'   The dynamic range of the data depends on the instrument used for the
#'   measurements. Most of the photography filters have been measured with an
#'   Agilent 8453 array spectrophotometer. The noise floor is at approximately
#'   3.5 to 4.0 absorbance units within the range of wavelengths included in the
#'   data. Some small apparent "leaks" maybe only spectrometer noise. A blank
#'   and a dark measurement obtained using this instrument are also included in
#'   the data set for comparison.
#'
#' The variables are as follows:
#'
#' \itemize{ \item w.length (nm) \item Tfr (fraction) }
#'
#' @section Supplier's web sites, if known:
#'   \url{https://www.baader-planetarium.com/en/},
#'   \verb{https://formatt-hitech.com/} (out-of-business),
#'   \url{https://www.fotga.com/},
#'   \url{https://www.haidaphoto.com/en/},
#'   \url{http://www.heliopan.de/},
#'   \url{https://hoyafilter.com/},
#'   \url{https://kenkoglobal.com/},
#'   \url{https://www.kentfaith.com/},
#'   \url{https://knightx-photography.aliexpress.com/store/924165},
#'   \url{https://kolarivision.com/},
#'   \url{https://purshee.aliexpress.com/store/1996249},
#'   \url{https://schneiderkreuznach.com/en/photo-optics/b-w-filters/filtertypes},
#'   \url{https://www.svbony.com/}
#'   \url{https://tangsinuo.aliexpress.com/store/4314008},
#'   \url{https://thingyfy.com/}
#'   \url{https://tiffen.com/},
#'   \verb{https://www.uvroptics.com/} (out-of-business),
#'   \url{https://www.zomei.com/}.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @note Data measured with an Agilent 8453 spectrophotometer (based on diode
#'   array).
#'
#' @note These are independent measurement each of a single sample, not a
#'   specification or typical values.
#'
#' @examples
#' photography_filters
#'
"photography_filters"

#' @rdname photography_filters
#'
"angeleyes_filters"

#' @rdname photography_filters
#'
"baader_filters"

#' @rdname photography_filters
#'
"bw_filters"

#' @rdname photography_filters
#'
"fake_unbranded_filters"

#' @rdname photography_filters
#'
"firecrest_filters"

#' @rdname photography_filters
#'
"fotga_filters"

#' @rdname photography_filters
#'
"haida_filters"

#' @rdname photography_filters
#'
"heliopan_filters"

#' @rdname photography_filters
#'
"hoya_filters"

#' @rdname photography_filters
#'
"kenfaith_filters"

#' @rdname photography_filters
#'
"kenko_filters"

#' @rdname photography_filters
#'
"knightx_filters"

#' @rdname photography_filters
#'
"kolarivision_filters"

#' @rdname photography_filters
#'
"nisi_filters"

#' @rdname photography_filters
#'
"purshee_filters"

#' @rdname photography_filters
#'
"rocolax_filters"

#' @rdname photography_filters
#'
"svbony_filters"

#' @rdname photography_filters
#'
"tangsinuo_filters"

#' @rdname photography_filters
#'
"tiffen_filters"

#' @rdname photography_filters
#'
"uvroptics_filters"

#' @rdname photography_filters
#'
"zeiss_filters"

#' @rdname photography_filters
#'
"zomei_filters"
