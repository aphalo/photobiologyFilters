#' @details
#' This package contains transmission spectra for different types of optical
#' filters. These spectral data are NOT normalized. In most cases they
#' have been obtained from sheets of the standard thickness supplied by
#' sellers. Beware that thickness has a strong effect on the wavelengths at
#' which Tfr = 0.5 is reached for a given material. Be also aware that some
#' of the data are for total transmittance and some for internal transmittance.
#' Depending on the type of filter, spectral transmittance depends more or less
#' strongly on the angle of incidence of radiation. All measurements included
#' have been done with a angle of incidence that debiates at most by a few
#' degrees from zero (light beam perpendicular to the surface of the filter).
#'
#' Transmittance data are included for:
#' \itemize{
#'   \item The whole catalogue of Schott optical filters (official data
#'   supplied by Schott for inclussion in this package).
#'   \item Several types of Plexiglas from Evonik measured at our lab.
#'   \item Other types of plastic sheets supplied by Foiltek Oy and Etola Oy,
#'   measured at our lab.
#'   \item Plastic films from McDermit and Courtaulds.
#'   \item Several types of theatrical 'gels' from Lee, Rosco, and Formmatt.
#'   Some measured at our lab and others data digitized from manufacturers'
#'   catalogues.
#'   \item Films used as greenhouse cladding from  BPI Agri/Visqueen,
#'   XL-horticulture and generic.
#' }
#'
#' @note This package is part of a suite of R packages for photobiological
#' calculations described at the
#' [r4photobiology](http://www.r4photobiology.info) web site.
#'
#' @section Warning!:
#' Except for those from Schott, none of the spectral data included in this
#' package are from suppliers. In all cases data are only for information. The
#' exact transmission spectrum depends measurement conditions, but more
#' importantly among individual prodcution batches. Spectral specifications are
#' usually given as reference values. Filters also age, their spectral
#' properties change as a result of exposure to radiation. Aging is in some
#' cases fast.  Some filter suppliers, for example, Rosco has changed the
#' spectral transmittance of some filters over the years without changing the
#' code or name under which they are sold. In other words, the data provided
#' here are not a substitute for actual measurements of transmission spectra of
#' the filters actually used in a given piece of scientific research. For less
#' demanding situations the data are in most cases useful but perfect agreement
#' with measurements on other batches of filters of the same exact type should
#' not be expected.
#'
#' @import photobiology
#'
#' @examples
#' schott
#' filters.mspct$OG530
#' filters.mspct[["OG530"]]
#'
"_PACKAGE"

