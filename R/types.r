#' Indexing of filters of different curve types
#'
#' Vectors of names of member objects grouped according to their type or optical
#' properties. Band-pass filters transmit a range of wavelengths, but block
#' shorter and longer ones. Long-pass filters absorb wavelengths shorter than
#' their cut-off and short-pass filters absorb wavelengths longer than their
#' cut-off. Multi-band and single-band pass filters are listed together.
#'
#' @note These vectors include only optical-glass filters with well defined
#' characteristics.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @aliases 'filter types'
#'
#' @examples
#' band_pass_filters
#'
#' # select band-pass filters
#' filters.mspct[band_pass_filters]
#'
#' @seealso \code{\link{filters.mspct}}
#'
"band_pass_filters"

#' @rdname band_pass_filters
#'
"long_pass_filters"

#' @rdname band_pass_filters
#'
"short_pass_filters"
