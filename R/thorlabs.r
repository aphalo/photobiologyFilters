#' Indexing of Thorlabs filters
#'
#' Vectors of names of member objects containing spectral data for Thorlab
#' Hard-Coated UV/VIS Bandpass Filters. This is only selected sample from
#' the on-line catalogue and covers only band-pass interference filters of
#' the highest quality. Absorbing ionic glass filters from Thorlabs are mostly
#' Schott glass, avaialable under \code{\link{schott_filters}}.
#'
#' @note Data downloaded from \url{https://www.thorlabs.de/} on 2025-10-25.
#'   Thorlabs GmbH, Bergkirchen, Germany. Thorlabs Inc. Newton, New Jersey,
#'   United States of America.
#'
#' @section DISCLAIMER from Thorlabs: The data presented here are typical.
#'   Slight variations in performance data will occur from lot to lot. Please
#'   contact Technical Support with any questions regarding the use or
#'   reliability of this data.
#'
#' @section On REUSE from Thorlabs: This data may be used in publications.
#' However, please cite Thorlabs as the source.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @seealso \code{\link{filters.mspct}}
#'
#' @examples
#' thorlabs_filters
#' summary(filters.mspct[thorlabs_filters])
#' summary(filters.mspct[thorlabs_filters[grep("-40$", thorlabs_filters)]])
#'
"thorlabs_filters"
