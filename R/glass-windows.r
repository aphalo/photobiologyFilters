#' @title Spectral transmittance for glass windows
#'
#' @description Datasets containing the wavelengths at a 1 nm interval and
#' tabulated values spectral transmittance for glass windows as used by CIE.
#'
#' @details For each of the 26 spectra in the collection the variables are as follows:
#'
#' \itemize{
#'   \item w.length (nm)
#'   \item Tfr (fraction)
#' }
#'
#' @note Data from file \url{http://files.cie.co.at/206.xls}, downloaded 2017-06-25.
#' Abbreviated names from original .xls file used as member names. Full glass
#' names, thickness and manufacturers names, retained and stored as metadata
#' in attribute "what.measured".
#'
#' @docType data
#' @keywords datasets
#'
#' @format A vector of character strings.
#'
#' @examples
#' glass_windows
#'
"glass_windows"
