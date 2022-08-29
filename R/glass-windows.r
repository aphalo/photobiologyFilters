#' @title Spectral transmittance for glass windows
#'
#' @description Indexing vector for extracting transmittance spectra for
#'   window glass panes from object \code{filters.mspct}.
#'
#' @details A character vector of names of members of the collection of spectra.
#'
#' @note The spectral data for these glasses is taken from file
#'   \url{http://files.cie.co.at/206.xls}, downloaded 2017-06-25. Abbreviated
#'   names from the original .xls file used as member names. Full glass names,
#'   thickness and manufacturers names, retained and stored as metadata in
#'   attribute "what.measured".
#'
#' @docType data
#' @keywords datasets
#'
#' @format A vector of character strings.
#'
#' @examples
#' glass_windows
#'
#' head(filters.mspct[glass_windows], 2)
#'
"glass_windows"
