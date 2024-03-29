#' Indexing of Schott filters
#'
#' Vectors of names of member objects containing spectral dara for Schott optical glass filters.
#' Data from manufacturer-provided excel filter tool.
#'
#' @note Data supplied by the manufacturer for inclusion in this package.
#' Version	1 st June 2015. Reproduced with permission.
#' \url{https://www.schott.com/advanced_optics}
#'
#' @section DISCLAIMER from Schott:
#'   This data collection is protected by federal copyright law and
#'   international treaty. The copyright holder retains title to and ownership
#'   of the data collection.
#'
#'   Data contained in this calculation tool are owned by SCHOTT, any request
#'   for permission to use them for commercial purposes must be directed to
#'   SCHOTT.
#'
#'   SCHOTT makes no warranty of representation, either expressed or implied,
#'   with respect to this data including their quality,  merchantability, or
#'   fitness for a particular purpose.
#'
#'   In no event will SCHOTT be liable for direct, indirect, special,
#'   incidental, or consequential damages arising out of the use or inability to
#'   use the calculation tool even if SCHOTT has been advised of the possibility
#'   of such damages.
#'
#'   SCHOTT reserves the right to change the optical and non-optical data
#'   without prior notice. This calculation tool renders all previous filter
#'   glass catalogs obsolete
#'
#'   This data collection was composed with utmost care.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @seealso \code{\link{filters.mspct}}
#'
#' @examples
#' schott_filters
#' summary(filters.mspct[schott_filters])
#' summary(filters.mspct[schott_filters[grep("UG", schott_filters)]])
#'
"schott_filters"
