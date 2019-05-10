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
#' \url{http://www.leefilters.com/lighting/colour-details.html},
#' \url{http://www.rosco.com/filters/index.cfm}
#'
#' @note Instruments used: Shimadzu UV-2501 PC (Shimadzu Suzhou Instruments Manufacturing
#' Co. Ltd, China) equiped with an integrating sphere for Rosco filters and while
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
"lee"

#' @rdname theatrical_gels
#'
"lee_gels"

#' @rdname theatrical_gels
#'
"rosco"

#' @rdname theatrical_gels
#'
"rosco_gels"
