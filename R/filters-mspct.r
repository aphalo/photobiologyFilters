#' @title Spectral irradiance for diverse optical filters
#'
#' @description A collection of transmittance spectra for optical filters
#'   from different suppliers.
#'
#' @details The \code{"filter_mspct"} object contains \code{"filter_spct"}
#'   objects with spectral transmittance data.
#'
#'   The variables in each member spectrum are as follows: \itemize{ \item
#'   w.length (nm) \item Tfr (transmittance expressed as a fraction of one) }
#'
#' @note Please see the help corresponding to each supplier for details.
#'
#' @docType data
#' @keywords datasets
#' @format A \code{"filter_mspct"} object containing several
#'   \code{"filter_spct"}.
#'
#' @examples
#' names(filters.mspct)
#' filters.mspct$UG11
#'
"filters.mspct"
