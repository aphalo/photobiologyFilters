#' Indexing of filters of different colors
#'
#' Names of datasets containing the wavelengths and tabulated values for
#' fractional spectral transmittance for filters of given colours.
#'
#' @details The vectors can be used to extract subsets of spectra from the
#'  collection in \code{filter.mspct}. Some spectra are included in more
#'  than one vector.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @aliases colors
#'
#' @examples
#' clear_filters
#'
#' # select filters of amber and yellow color ("blue absorbing")
#' filters.mspct[yellow_filters]
#'
#' @seealso \code{\link{filters.mspct}}
#'
"clear_filters"

#' @rdname clear_filters
#'
"neutral_filters"

#' @rdname clear_filters
#'
"uv_filters"

#' @rdname clear_filters
#'
"blue_filters"

#' @rdname clear_filters
#'
"blue_green_filters"

#' @rdname clear_filters
#'
"green_filters"

#' @rdname clear_filters
#'
"yellow_filters"

#' @rdname clear_filters
#'
"orange_filters"

#' @rdname clear_filters
#'
"red_nir_filters"

#' @rdname clear_filters
#'
"heat_filters"

#' @rdname clear_filters
#'
"uvir_cut_filters"

