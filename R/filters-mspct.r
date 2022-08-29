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
