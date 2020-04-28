#' Filter spectra data for theatrical filter
#'
#' Datasets containing the wavelengths at a 1 nm interval and
#' tabulated values spectral transmittance for different filters used on
#' light sources as spectral modifiers. Frequently called "theatrical gels".
#'
#' The variables are as follows:
#'
#' \itemize{
#'   \item w.length (nm)
#'   \item Tfr (fraction)
#' }
#'
#' @references
#' \url{https://www.leefilters.com/lighting/colour-details.html},
#' \url{https://emea.rosco.com/en/products/family/filters-and-diffusions}
#'
#' @note Instruments used: Shimadzu UV-2501 PC (Shimadzu Suzhou Instruments Manufacturing
#' Co. Ltd, China) equiped with an integrating sphere for Rosco filters except no. 299
#' which was measured with an Agilent 8453 array spectrophotometer and while
#' spectra for Lee gels have been digitized from the spectra in the Lee
#' filters catalogue.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @examples
#' theatrical_gels
#'
"theatrical_gels"

#' @rdname theatrical_gels
#'
"lee_filters"

#' @rdname theatrical_gels
#'
"lee_gels"

#' @rdname theatrical_gels
#'
"rosco_filters"

#' @rdname theatrical_gels
#'
"rosco_gels"
