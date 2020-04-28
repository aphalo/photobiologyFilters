#' Total transmittance for MidOpt filters
#'
#' Internal transmittance for MidOpt machine-vision optical glass, acrylic and
#' interference filters. Data extracted from MidOpt's pdf data files with
#' help of R package 'tabulizer'. MidOpt is a trade
#' name of Midwest Optical Systems, Palatine, IL 60067 USA
#'
#' The variables are as follows:
#'
#' \itemize{
#'   \item w.length (nm)
#'   \item Tfr (fraction)
#' }
#'
#' @note Data downloaded from \url{https://midopt.com/filters/} on 2017-12-26 and
#' 2019-05-10. Republished with permission.
#' Copyright (c) Midwest Optical Systems, Inc. (MidOpt)
#' \url{https://www.midopt.com/}
#'
#' @section DISCLAIMER from MidOpt: data are typical values and may vary by
#' plus/minus 10 nm. To interactively comparing filter spectra, please visit
#' \url{https://midopt.com/tools/curve-compare/}.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @examples
#' midopt_filters
#'
"midopt_filters"
