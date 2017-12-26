#' Spectral data for filters of different 'colors'
#'
#' Names of datasets containing the wavelengths and tabulated values for
#' fractional spectral trabsmittance according to their type. Band-pass
#' filters transmit a range of wavelengths, but block shorter and longer
#' ones. Long-pass filters absorb wavelengths shorter than their cut-off and
#' short-pass filters absorb wavelengths longer than their cut-off.
#'
#' @note These vectors include only optical-glass filters with well defined
#' characteristics.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @aliases long_pass short_pass
#'
#' @examples
#' short_pass
#'
#' # select short-pass filters
#' filters.mspct[short_pass]
#'
#' @seealso \code{\link{band_pass}}
#'
"band_pass"
