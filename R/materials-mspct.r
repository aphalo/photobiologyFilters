#' Spectral reflectance of land surfaces
#'
#' Total reflectance of built, cultivated and natural land surfaces. Data are to
#' be used as "reference values only" as actual values will vary.
#'
#' @docType data
#' @keywords datasets
#' @format A \code{reflector_mspct} object named \code{materials.mspct}
#'   containing a collection of \code{reflector_spct} objects each with 491 rows
#'   and 2 variables.
#'
#'   The variables for each spectrum are as follows:#'
#'   \itemize{ \item \code{w.length} (nm) \item \code{Rfr} (fraction) }
#'
#'   These member objects contain metadata stored as R attributes. Accessors to
#'   the metadata are available: \code{what_measured()}, \code{how_measured()},
#'   \code{when_measured()}, and \code{comment()}.
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
#' materials.mspct$dry.grass
#' summary(materials.mspct$dry.grass)
#'
#' what_measured(materials.mspct$dry.grass)
#' how_measured(materials.mspct$dry.grass)
#' cat(comment(materials.mspct$dry.grass))
#'
#' names(materials.mspct)
#' summary(materials.mspct)
#'
"materials.mspct"
