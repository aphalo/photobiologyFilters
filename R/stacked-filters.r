#' @title Spectral transmittance for filter stacks
#'
#' @description Indexing vector for selecting transmittance spectra for stacks
#'   of two or more filters.
#'
#' @details A character vector of names of spectra in object \code{filter.mspct}
#'   measured by P. J. Aphalo from stacks of filters. Unless differently
#'   indicated in the spectrum metadata, the filters in the stack were separated
#'   by an air gap. Because of multiple reflections at the air-glass interfaces
#'   the measured spectra differ slightly from the result of a simple
#'   convolution between the spectra corresponding to the individual filters.
#'
#' @docType data
#' @keywords datasets
#'
#' @format A vector of character strings.
#'
#' @seealso \code{\link{filters.mspct}}
#'
#' @examples
#' stacked_filters
#'
#' filters.mspct[stacked_filters]
#'
"stacked_filters"
