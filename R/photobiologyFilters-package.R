#' Spectral Transmittance Data for Filters
#' 
#' A data set of spectral transmittance for frequently used filters and similar
#' materials. Plastic sheets and films; optical glass and ordinary glass and
#' some labware. The package is designed to complement package
#' \code{photobiology}.
#' 
#' @docType package
#' @keywords misc
#' @name photobiologyFilters-package
#' @author Pedro J. Apahalo
#' @details
#' \tabular{ll}{
#' Package: \tab photobiologyFilters\cr
#' Type: \tab Package\cr
#' Version: \tab 0.4.0\cr
#' Date: \tab 2015-11-30\cr
#' License: \tab GPL (>= 3.0)\cr
#' }
#' @references
#' Aphalo, P. J., Albert, A., Björn, L. O., McLeod, A. R., Robson, T. M., 
#' Rosenqvist, E. (Eds.). (2012). Beyond the Visible: A handbook of best 
#' practice in plant UV photobiology (1st ed., p. xxx + 174). 
#' Helsinki: University of Helsinki, Department of Biosciences, 
#' Division of Plant Biology. ISBN 978-952-10-8363-1 (PDF), 
#' 978-952-10-8362-4 (paperback). Open access PDF download available at 
#' http://hdl.handle.net/10138/37558
#' 
#' @import photobiology
#' 
NULL

.onAttach <- function(libname, pkgname) {
  packageStartupMessage("photobiologyFilters: As of version >= 4.0 spectral data are stored in collections of spectra, and individual spectra are accessed through indexing. Indexing should be done with character strings to ensure long-term repeatability. This new scheme is not backwards compatible with earlier versions.")
}

