
# photobiologyFilters <img src="man/figures/logo.png" align="right" width="120"/>

[![CRAN
version](https://www.r-pkg.org/badges/version-last-release/photobiologyFilters)](https://cran.r-project.org/package=photobiologyFilters)
[![cran
checks](https://cranchecks.info/badges/worst/photobiologyFilters)](https://cran.r-project.org/web/checks/check_results_photobiologyFilters.html)
[![R build
status](https://github.com/aphalo/photobiologyfilters/workflows/R-CMD-check/badge.svg)](https://github.com/aphalo/photobiologyfilters/actions)

Package **photobiologyFilters** is a collection of spectral
transmittance data for more than 500 transparent and partially
transparent materials measured in our lab, by collaborators and
contributors including data have made available by the suppliers for
inclusion in this package. The package also contains spectral
reflectance data and spectral refraction index data for some materials
and spectral reflectance data for some man-made and natural land
surfaces.

## Code breaking renaming of data objects

In the update to version 0.5.0 several members of the collection of
filter spectra were renamed to ensure consistency and clarity. As of
version 0.5.0 all member names start with the name of the manufacturer
or supplier. In addition, several of the vectors of names of member
spectra were renamed to include the word “filters” to avoid possible
name clashes with other packages and also to improve naming consistency.

## Examples

``` r
library(photobiologyFilters)
```

How many spectra are included in the current version of
‘photobiologyFilters’?

More than 300 spectra for optical glass and plastic sheets and films.
This collection includes filters used for photography, the whole set of
Schott glass filters, most of MIDOPT filters, various types of glass,
acrylic, polycarbonate and other panes, and theatrical “gels” and some
greenhouse cladding films. Most of these materials do not scatter light
and all of them are homogeneous.

``` r
length(filters.mspct)
#> [1] 355
```

Nearly 200 spectra for different climate screens used in horticulture
and agriculture. All these materials scatter light and have a
heterogeneous surface, as they are nets, yarns or composites in which
part of the surface has different transmittance than the matrix: either
an opaque yarn with holes or a partly clear matrix with embedded opaque
or partly opaque elements.

``` r
length(screens.mspct)
#> [1] 197
```

Reflectance spectra for a few metals are included.

``` r
length(metals.mspct)
#> [1] 12
```

Reflectance spectra for different surfaces, such as bare ground, asphalt
and different types of vegetation.

``` r
length(materials.mspct)
#> [1] 14
```

The refractive index can be used to derive other optical properties,
such as reflectance at different angles of incidence. For some materials
the refractive index varies strongly with wavelength while for other
materials varies weakly. This is a small set, serving as example.

``` r
length(refractive_index.mspct)
#> [1] 15
```

What are the names of available spectra? We use `head()` to limit the
output.

``` r
# list names of the first 10 filters
head(names(filters.mspct), 10)
#>  [1] "Baader_U_filter_1mm_48mm"         "BPI_Luminance"                   
#>  [3] "BPI_Solatrol"                     "BW_007_Clear_MRC_nano_1.2mm_46mm"
#>  [5] "Courtaulds_CA_115um"              "Courtaulds_CA_115um_age000"      
#>  [7] "Courtaulds_CA_115um_age020"       "Courtaulds_CA_115um_age030"      
#>  [9] "Courtaulds_CA_115um_age060"       "Courtaulds_CA_115um_age100"
```

To subset based on different criteria we can use predefined character
vectors of filter or climate-screen names. For example, vector
`polyester` lists the names of the spectra for filters made of polyester
(PET).

``` r
polyester_filters
#> [1] "Foiltek_Clear_PET_G"             "McDermit_PET_Autostat_CT5_125um"
```

We can use the vector to extract all these spectra as a collection.

``` r
filters.mspct[polyester_filters]
#> Object: filter_mspct [2]
#> --- Member: Foiltek_Clear_PET_G ---
#> Object: filter_spct [318 x 2]
#> Wavelength range 190-1100 nm, step 1-4 nm 
#> Label: Polyethylene terephthalate (PET), 'polyester'; clear sheet; new 
#> Transmittance of type 'total'
#> Rfr (/1): 0.097, thickness (mm): 3.00, attenuation mode: absorption.
#> 
#> # A tibble: 318 × 2
#>    w.length      Tfr
#>       <dbl>    <dbl>
#>  1      190 0.000105
#>  2      194 0.000102
#>  3      198 0.000100
#>  4      201 0.000100
#>  5      202 0.000100
#>  6      206 0.000100
#>  7      209 0.000100
#>  8      210 0.000100
#>  9      214 0.000102
#> 10      215 0.000102
#> # … with 308 more rows
#> # ℹ Use `print(n = ...)` to see more rows
#> --- Member: McDermit_PET_Autostat_CT5_125um ---
#> Object: filter_spct [283 x 2]
#> Wavelength range 240-800 nm, step 1-4 nm 
#> Label: Polyester, clear film, 0.000125 m thick, Autostat CT5 from McDermit Autotype; new 
#> Transmittance of type 'total'
#> Rfr (/1): 0.074, thickness (mm): 0.125, attenuation mode: absorption.
#> 
#> # A tibble: 283 × 2
#>    w.length     Tfr
#>       <int>   <dbl>
#>  1      240 0.00482
#>  2      244 0.00414
#>  3      248 0.004  
#>  4      252 0.00386
#>  5      256 0.00329
#>  6      258 0.003  
#>  7      259 0.003  
#>  8      260 0.003  
#>  9      264 0.00357
#> 10      267 0.004  
#> # … with 273 more rows
#> # ℹ Use `print(n = ...)` to see more rows
#> 
#> --- END ---
```

The package includes two character vectors with the names of the vectors
of names that are available for filters and screens.

``` r
all_filter_selectors
#>  [1] "acetate_filters"            "acrylic_filters"           
#>  [3] "baader_filters"             "band_pass_filters"         
#>  [5] "blue_filters"               "blue_green_filters"        
#>  [7] "bpi_visqueen_filters"       "bw_filters"                
#>  [9] "clear_filters"              "courtaulds_filters"        
#> [11] "etola_filters"              "evonik_filters"            
#> [13] "fake_unbranded_filters"     "firecrest_filters"         
#> [15] "foiltek_filters"            "fotga_filters"             
#> [17] "green_filters"              "haida_filters"             
#> [19] "heat_filters"               "heliopan_filters"          
#> [21] "hoya_filters"               "kenko_filters"             
#> [23] "knightx_filters"            "kolarivision_filters"      
#> [25] "lee_filters"                "long_pass_filters"         
#> [27] "mcdermit_filters"           "midopt_filters"            
#> [29] "neutral_filters"            "old_schott_filters"        
#> [31] "optical_glass_filters"      "orange_filters"            
#> [33] "photography_filters"        "plastic_film_filters"      
#> [35] "plastic_sheet_filters"      "plexiglas_filters"         
#> [37] "polycarbonate_filters"      "polyester_filters"         
#> [39] "polystyrene_filters"        "polyvynil_chloride_filters"
#> [41] "purshee_filters"            "red_nir_filters"           
#> [43] "rocolax_filters"            "rosco_filters"             
#> [45] "schott_filters"             "short_pass_filters"        
#> [47] "tangsinuo_filters"          "tiffen_filters"            
#> [49] "uqg_filters"                "uv_filters"                
#> [51] "uvir_cut_filters"           "uvroptics_filters"         
#> [53] "xl_horticulture_filters"    "yellow_filters"            
#> [55] "zeiss_filters"              "zomei_filters"
```

``` r
all_screen_selectors
#> [1] "arrigoni_screens"             "criadolopez_screens"         
#> [3] "howitec_screens"              "huachangyarns_screens"       
#> [5] "jiangsuhuachangyarns_screens" "mallastextiles_screens"      
#> [7] "oerlemansplastics_screens"    "svensson_screens"
```

Please, see the *User Guide* or help pages for the names of other
vectors of names for materials, suppliers, and regions of the spectrum.

Summary calculations can be easily done with methods from package
‘photobiology’. Here we calculate mean transmittance for two regions of
the spectrum given by wavelengths in nanometres.

``` r
transmittance(filters.mspct[["Foiltek_Clear_PET_G"]], 
              list(waveband(c(250, 315)), waveband(c(500,600))))
#> Tfr(wl)_range.250.315 Tfr(wl)_range.500.600 
#>          0.0001886533          0.8759401279 
#> attr(,"Tfr.type")
#> [1] "unknown"
#> attr(,"radiation.unit")
#> [1] "transmittance average"
```

The `autoplot()` methods from package ‘ggspectra’ can be used for
plotting one or more spectra at a time. The classes of the objects used
to store the spectral data are derived from `"data.frame"` making direct
use of the data easy with functions and methods from base R and various
packages.

## Installation

Installation of the most recent stable version from CRAN:

``` r
install.packages("photobiologyFilters")
```

Installation of the current unstable version from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("aphalo/photobiologyfilters")
```

## Documentation

HTML documentation is available at
(<https://docs.r4photobiology.info/photobiologyFilters/>), including a
*User Guide*.

News on updates to the different packages of the ‘r4photobiology’ suite
are regularly posted at (<https://www.r4photobiology.info/>).

Two articles introduce the basic ideas behind the design of the suite
and its use: Aphalo P. J. (2015)
(<https://doi.org/10.19232/uv4pb.2015.1.14>) and Aphalo P. J. (2016)
(<https://doi.org/10.19232/uv4pb.2016.1.15>).

A book is under preparation, and the draft is currently available at
(<https://leanpub.com/r4photobiology/>).

A handbook written before the suite was developed contains useful
information on the quantification and manipulation of ultraviolet and
visible radiation: Aphalo, P. J., Albert, A., Björn, L. O., McLeod, A.
R., Robson, T. M., & Rosenqvist, E. (Eds.) (2012) Beyond the Visible: A
handbook of best practice in plant UV photobiology (1st ed., p. xxx +
174). Helsinki: University of Helsinki, Department of Biosciences,
Division of Plant Biology. ISBN 978-952-10-8363-1 (PDF),
978-952-10-8362-4 (paperback). PDF file available from
(<https://hdl.handle.net/10138/37558>).

## Contributing

Pull requests, bug reports, and feature requests are welcome at
(<https://github.com/aphalo/photobiologyfilters>).

## Citation

If you use this package to produce scientific or commercial
publications, please cite it according to the recommended citation
below. For individual spectra please read the corresponding help page
and if available, also cite the original source of the data. Be aware
that most data have been re-processed before inclussion in the package.

``` r
citation("photobiologyFilters")
#> 
#> To cite package 'photobiologyFilters' in publications, please use:
#> 
#>   Aphalo, Pedro J. (2015) The r4photobiology suite. UV4Plants Bulletin,
#>   2015:1, 21-29. DOI:10.19232/uv4pb.2015.1.14
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Article{,
#>     author = {Pedro J. Aphalo},
#>     title = {The r4photobiology suite},
#>     journal = {UV4Plants Bulletin},
#>     volume = {2015},
#>     number = {1},
#>     pages = {21-29},
#>     year = {2015},
#>     doi = {10.19232/uv4pb.2015.1.14},
#>   }
```

## License

© 2012-2022 Pedro J. Aphalo (<pedro.aphalo@helsinki.fi>). Released under
the GPL, version 2 or greater. This software carries no warranty of any
kind.
