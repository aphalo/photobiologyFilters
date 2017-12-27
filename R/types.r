#' Spectral data for filters of different 'types'
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
#' @aliases types
#'
#' @examples
#' band_pass
#'
#' # select band-pass filters
#' filters.mspct[band_pass]
#'
#' @seealso \code{\link{filters.mspct}}
#'
"band_pass"

#' @rdname band_pass
#'
"long_pass"

#' @rdname band_pass
#'
"short_pass"
