#' Refractive index of water
#'
#' The refractive index, usually abbreviated as \eqn{n} varies with temperature
#' and wavelength.
#'
#' @details Function `n.water()` implements the function proposed by Parrish for
#' approximation of \eqn{n} for freshwater and seawater. The function is valid
#' for wavelengths from 400 nm to 700 nm, and for temperatures from 0 C to 30 C.
#' The function is vectorized.
#'
#' @param w.length numeric Wavelength in nanometres (nm)
#' @param temperature numeric Water temperature in degrees Celcius (C)
#' @param type character One of "freshwater" or "seawater".
#'
#' @references
#' Chris Parrish (2020) Index of Refraction of Seawater and Freshwater as a
#' Function of Wavelength and Temperature.
#'  \url{https://research.engr.oregonstate.edu/parrish/index-refraction-seawater-and-freshwater-function-wavelength-and-temperature}
#'
#' @examples
#'
#' water_n(w.length = (40:70)*10)
#' water_n(temperature = seq(0, 30, by = 5))
#'
#' @export
#'
#' @seealso For other materials see \code{\link{refractive_index.mspct}} and to
#' compute reflectance from \eqn{n} see \code{\link[photobiology]{Rfr_from_n}}.
#'
#'
water_n <- function(temperature = 20, w.length = 540, type = "freshwater") {
  w.length <-
    ifelse(w.length < 400 | w.length > 700,
           NA_real_, w.length)

  temperature <-
    ifelse(temperature < 0 | temperature > 30,
           NA_real_, temperature)

  if (length(w.length) > 1L && length(temperature) > 1L &&
      length(w.length) != length(temperature)) {
    warning("Length mismatch between 'w.length' and 'temperature'")
  }

  coefs <- list(seawater = c(a = -1.50156e-6, b = 1.07085e-7, c = -4.27594e-5, d = -1.60476e-4, e = 1.39807),
                freshwater = c(a = -1.97812e-6, b = 1.03223e-7, c = -8.58125e-6, d = -1.54834e-4, e = 1.38919))[[type]]

  coefs["a"] * temperature^2 + coefs["b"] * w.length^2 + coefs["c"] * temperature + coefs["d"] * w.length + coefs["e"]
}
