#' Indexing of Petri dishes
#'
#' Vectors of names of member objects with spectral data for the covers of Petri
#' dishes. Data are to be used as "reference values only" as values may change
#' in time and with production batch.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @note Data measured with an Agilent 8453 spectrophotometer (based on diode
#'   array). Supplier of the plastic Petri dishes: Thermo Fisher Scientific.
#'
#' @note Individual measurement of a single sample, not a specification.
#'
#' @seealso \code{\link{filters.mspct}}
#'
#' @examples
#' petri_dishes
#'
#' filters.mspct[petri_dishes]
#'
"petri_dishes"
