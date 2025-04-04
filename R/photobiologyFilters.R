#' @details This package contains transmission spectra for different types of
#'   optical filters and filter-like objects. These spectral data are NOT
#'   normalized. In most cases they have been obtained from sheets of the
#'   standard thickness supplied by sellers. Metadata is stored together with
#'   the spectral data, when available, it includes thickness, an approximate
#'   estimate of \code{Rfr} (contribution of reflectance) and whether
#'   attenuation by the filter is based on reflection, absorption or both.
#'   Beware that when attenuation is by absorption in the body of the filter,
#'   thickness has a strong effect on the wavelengths at which Tfr = 0.5 is
#'   reached for a given material. Be also aware that some of the data are for
#'   total transmittance and some for internal transmittance. Depending on the
#'   type of filter, spectral transmittance depends more or less strongly on the
#'   angle of incidence of radiation. All measurements included have been done
#'   with a angle of incidence that deviates at most by a 10 degrees from zero
#'   (light beam perpendicular to the surface of the filter). Additional data is
#'   provided in the documentation for different objects, and metadata is also
#'   stored as attributes in the individual spectral objects. When metadata are
#'   available, estimates of spectral transmittance for different thicknesses
#'   can be approximately computed for filters based on ionic or absorptive
#'   glass or plastic. The same is true for the conversion between total and
#'   internal transmittance if \code{Rfr} is available. There are also filters
#'   based on surface reflection or absorptive layers on the surface or encased.
#'   Some filters even use a combination of these approaches.
#'
#'   Total spectral transmittance for climate screens used in agriculture and
#'   horticulture is also included.
#'
#'   In addition to transmittance for semitransparent materials, the package
#'   also contains data on the refractive index as a function of wavelength, for
#'   several different materials. These data allow the estimation of spectral
#'   reflectance for these materials.
#'
#'   Spectral reflectance data is included for several common metals and for
#'   natural and man-made surfaces (relevant to remote sensing).
#'
#' Transmittance data are included for:
#' \itemize{
#'   \item The whole catalogue of Schott optical filters (official data
#'   supplied by Schott for inclussion in this package).
#'   \item Most of the catalogue of MIDOPT filters (official data
#'   extracted from dowloaded files from supplier, reproduced with permission).
#'   \item Clear glass as used in windows (as used by CIE, from data file
#'   downloaded from CIE's server.)
#'   \item Several types of Plexiglas from Evonik measured at our lab.
#'   \item Other types of plastic sheets supplied by Foiltek Oy and Etola Oy,
#'   measured at our lab.
#'   \item Plastic films from McDermit and Courtaulds,
#'   measured at our lab.
#'   \item Several types of theatrical 'gels' from Lee, Rosco, and Formmatt.
#'   Some measured at our lab and others data digitized from manufacturers'
#'   catalogues.
#'   \item Films used as greenhouse cladding from  BPI Agri/Visqueen,
#'   XL-horticulture and generic, measured at our lab.
#'   \item Various filters used in UV, VIS and IR imaging and photography.
#' }
#'
#' @note This package is part of a suite of R packages for photobiological
#'   calculations described at the
#'   [r4photobiology](https://www.r4photobiology.info) web site.
#'
#' @references
#' Aphalo, Pedro J. (2015) The r4photobiology suite. UV4Plants Bulletin, 2015:1,
#' 21-29. \doi{10.19232/uv4pb.2015.1.14}.
#'
#' @section Warning!: Except for those from Schott and MIDOPT, none of the
#'   spectral data included in this package are "official" specifications. In
#'   all cases data are only for information, as even suppliers refer to the
#'   data provided as typical. Spectral transmittance depends on the measurement
#'   conditions, and, even more importantly, among individual production batches
#'   of filter materials. Spectral specifications are usually given as reference
#'   values. Both glass and plastic filters also age: their spectral properties
#'   change as a result of exposure to radiation or the gases in the atmosphere.
#'   Aging is in some cases fast. Another point to keep in mind is that some
#'   filter suppliers, for example Rosco, have changed the spectral
#'   transmittance of some filters over the years without changing the code or
#'   name under which they are sold. In other words, the data provided here are
#'   not a substitute for actual measurements of transmission spectra of the
#'   filters actually used in a given piece of scientific research. For less
#'   demanding situations the data are in most cases useful, but good
#'   agreement with measurements on other batches of filters of the same exact
#'   type should not be expected, specially for materials not intended to be
#'   used as optical filters.
#'
#' @import photobiology
#'
#' @examples
#' library(ggspectra)
#' library(photobiologyWavebands)
#'
#' # Total number of spectra in the package
#' length(filters.mspct)
#'
#' # SCHOTT filters example
#' schott_filters
#' filters.mspct$Schott_OG530
#' filters.mspct[["Schott_OG530"]]
#' getWhatMeasured(filters.mspct$Schott_OG530)
#' filter_properties(filters.mspct$Schott_OG530)
#' cat(comment(filters.mspct$Schott_OG530))
#'
#' # combining name (index) vectors
#' # blue glass filters
#' intersect(optical_glass_filters, blue_filters)
#' # green plastic films
#' intersect(plastic_films, green_filters)
#'
#' # A Plexiglas sheet
#' getWhatMeasured(filters.mspct$Evonik_Sky_Blue_5C01_GT)
#' autoplot(filters.mspct$Evonik_Sky_Blue_5C01_GT)
#' transmittance(filters.mspct$Evonik_Sky_Blue_5C01_GT, Orange())
#' transmittance(filters.mspct$Evonik_Sky_Blue_5C01_GT, NIR())
#'
#' # Asphalt
#' autoplot(materials.mspct$construction.asphalt, range = NIR(), w.band = NULL)
#'
"_PACKAGE"

