#' Indexing of filters made from different materials
#'
#' Vectors of names of member objects containing fractional spectral
#' transmittance data for films (very flexible) and sheets (rigid or nearly
#' rigid) grouped by the material they are made of.
#'
#' @details The vectors can be used to extract subsets of spectra from the
#'  collection in \code{filter.mspct}. Some spectra are included in more
#'  than one vector.
#'
#' @docType data
#' @keywords datasets
#' @format A vector of character strings.
#'
#' @examples
#' acrylic_filters
#'
#' # extract spectral data for filters made from acrylic
#' filters.mspct[acrylic_filters]
#'
#' @seealso \code{\link{filters.mspct}}
#'
#' @rdname filter_materials
#'
"acetate_filters"

#' @rdname filter_materials
#'
"acrylic_filters"

#' @rdname filter_materials
#'
"polycarbonate_filters"

#' @rdname filter_materials
#'
"plexiglas_filters"

#' @rdname filter_materials
#'
"polystyrene_filters"

#' @rdname filter_materials
#'
"polyester_filters"

#' @rdname filter_materials
#'
"polyvynil_chloride_filters"

#' @rdname filter_materials
#'
"optical_glass_filters"

#' @rdname filter_materials
#'
"plastic_film_filters"

#' @rdname filter_materials
#'
"plastic_films"

#' @rdname filter_materials
#'
"plastic_sheet_filters"

#' @rdname filter_materials
#'
"plastic_sheets"
