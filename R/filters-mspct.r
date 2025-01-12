#' Spectral transmittance of diverse optical filters
#'
#' A collection of transmittance spectra for optical filters and similar
#' materials from different suppliers. We include under "filters" all
#' semi-transparent and transparent sheets and films with homogeneous optical
#' properties. We exclude "screens" such as nets, cloths and perforated films
#' with heterogeneous optical properties.
#'
#' @details The \code{"filter_mspct"} object named \code{filters.mspct} contains a collection of
#'   \code{"filter_spct"} objects with spectral transmittance data for filters.
#'
#'   The variables in each member spectrum are as follows: \itemize{ \item
#'   \code{w.length} (nm) \item \code{Tfr} (transmittance expressed as a fraction of one) }
#'   These member objects contain metadata stored as R attributes. Accessors are
#'   available to the metadata: \code{what_measured()}, \code{how_measured()},
#'   \code{when_measured()}, \code{filter_properties()} and \code{comment()}.
#'
#' @note Please see the help for the indexing vectors for specific details.
#'
#' @docType data
#' @keywords datasets
#' @format A \code{"filter_mspct"} object containing several
#'   \code{"filter_spct"}.
#'
#' @examples
#' filters.mspct$Schott_UG11
#' filters.mspct[[1]]
#'
#' what_measured(filters.mspct$Schott_UG11)
#' how_measured(filters.mspct$Schott_UG11)
#' filter_properties(filters.mspct$Schott_UG11)
#' cat(comment(filters.mspct$Schott_UG11))
#'
#' names(filters.mspct)
#'
"filters.mspct"

#' Spectral fluorescence of diverse optical filters
#'
#' A collection of ultraviolet-induced visible and near infrared fluorescence
#' spectra for optical filters.
#'
#' @details The \code{"source_mspct"} object named \code{filters_UVIVIF.mspct} contains a collection of
#'   \code{"source_spct"} objects with spectral fluorescence emission data for filters illuminated with
#'   ultraviolet radiation.
#'
#'   The variables in each member spectrum are as follows: \itemize{ \item
#'   \code{w.length} (nm) \item \code{s.q.irrad} photon irradiance (mol m-2 s-1)}
#'   These member objects contain metadata stored as R attributes. Accessors are
#'   available to the metadata: \code{what_measured()}, \code{how_measured()},
#'   \code{when_measured()}, \code{filter_properties()} and \code{comment()}.
#'
#' @note Please see the help for the indexing vectors for specific details. The
#'   member spectra are named consistently with \code{filters.mspct}. Currently
#'   all members are photography filters.
#'
#' @docType data
#' @keywords datasets
#' @format A \code{"source_mspct"} object containing several
#'   \code{"source_spct"}.
#'
#' @examples
#' names(filters_UVIVIF.mspct)
#' filters_UVIVIF.mspct$Hoya_25A_HMC_2.3mm_52mm
#'
#' what_measured(filters_UVIVIF.mspct$Hoya_25A_HMC_2.3mm_52mm)
#' cat(how_measured(filters_UVIVIF.mspct$Hoya_25A_HMC_2.3mm_52mm))
#' cat(comment(filters_UVIVIF.mspct$Hoya_25A_HMC_2.3mm_52mm))
#'
"filters_UVIVIF.mspct"
