#' Total reflectance of metals at 294 K
#'
#' Total reflectance of metals at 294 K, measured using an integrating sphere.
#' Data are to be used as "reference values only" as actual values will depend
#' on the state of the metal surface and its polish.
#'
#' The variables for each spectrum are as follows:
#'
#' \itemize{
#'   \item w.length (nm)
#'   \item Rfr (fraction)
#' }
#'
#' @docType data
#' @keywords datasets
#' @format A reflector_mspct object containing a collection of reflector_spct
#' each with 47 rows and 2 variables.
#'
#' @note Data extracted from a published report by OCR.
#'
#' @references
#' Ernie W. Spisz, Albert J. Weigund, Robert L. Bowmun, and John R. Juck (1969)
#' SOLAR ABSORPTANCES AND SPECTRAL REFLECTANCES OF 12 METALS FOR TEMPERATURES RANGING FROM 300 TO 500 K
#' NASA TN D-5353, Technical Note, Washington DC, 22 pp. (Data from Table II (a))
#'
#' @examples
#'
#' library(ggspectra)
#'
#' names(metals.mspct)
#' cat(comment(metals.mspct$gold))
#' autoplot(metals.mspct$gold, annotations = c("+", "title:what"))
#'
"metals.mspct"
