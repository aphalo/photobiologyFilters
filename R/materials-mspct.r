#' Total reflectance of materials
#'
#' Total reflectance of materials. Data are to be used as "reference values
#' only" as actual values will vary.
#'
#' The variables for each spectrum are as follows:
#'
#' \itemize{ \item w.length (nm) \item Rfr (fraction) }
#'
#' @docType data
#' @keywords datasets
#' @format A reflector_mspct object containing a collection of reflector_spct
#'   each with 491 rows and 2 variables.
#'
#' @note This is a small selection from the ASTER database. See:
#'   https://speclib.jpl.nasa.gov/. Reproduced from the ECOSTRESS Spectral
#'   Library through the courtesy of the Jet Propulsion Laboratory, California
#'   Institute of Technology, Pasadena, California. Copyright (c) 2017, California
#'   Institute of Technology. ALL RIGHTS RESERVED.
#'
#' @references Meerdink, S. K., Hook, S. J., Roberts, D. A., & Abbott, E. A.
#'   (2019). The ECOSTRESS spectral library version 1.0. Remote Sensing of
#'   Environment, 230(111196), 1–8. ASTER spectral library.
#'
#'   Baldridge, A. M., S.J. Hook, C.I. Grove and G. Rivera, 2009.. The ASTER
#'   Spectral Library Version 2.0. Remote Sensing of Environment, vol 113, pp.
#'   711-715.
#'
#' @examples
#' library(ggspectra)
#'
#' names(materials.mspct)
#' cat(comment(materials.mspct$black.loam))
#' autoplot(materials.mspct$black.loam, annotations = c("+", "title:what"),
#'          range = c(NA, 800))
#'
"materials.mspct"
