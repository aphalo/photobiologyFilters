
# photobiologyFilters

[![CRAN
version](https://www.r-pkg.org/badges/version-last-release/photobiologyFilters)](https://cran.r-project.org/package=photobiologyFilters)
[![cran
checks](https://cranchecks.info/badges/worst/photobiologyFilters)](https://cran.r-project.org/web/checks/check_results_photobiologyFilters.html)

Package **photobiologyFilters** is a collection of spectral
transmittance data for more than 300 filters measured in our lab, by
collaborators or for which data have been made available by the
suppliers for inclussion in this package.

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

``` r
length(filters.mspct)
#> [1] 339
```

What are the names of available spectra. We use `head()` to limit the
output.

``` r
# list names of the first 10 filters
head(names(filters.mspct), 10)
#>  [1] "Baader_U_filter"             "BPI_Luminance"              
#>  [3] "BPI_Solatrol"                "BW_007_Clear_MRC_nano"      
#>  [5] "Courttaulds_CA_115um"        "Courttaulds_CA_115um_age000"
#>  [7] "Courttaulds_CA_115um_age020" "Courttaulds_CA_115um_age030"
#>  [9] "Courttaulds_CA_115um_age060" "Courttaulds_CA_115um_age100"
```

To subset based on different criteria we can use predefined character
vectors of filter names. For example, vector `polyester` lists the names
of the spectra for filters made of polyester (PET).

``` r
polyester_filters
#> [1] "Foiltek_Clear_PET_G"             "McDermit_PET_Autostat_CT5_125um"
```

We can use the vector to extract all these spectra as a collection.

``` r
filters.mspct[polyester_filters]
#> Object: filter_mspct [2 x 1]
#> --- Member: Foiltek_Clear_PET_G ---
#> Object: filter_spct [911 x 2]
#> Wavelength range 190 to 1100 nm, step 1 nm 
#> Label: ; clear sheet; new 
#> 
#> # A tibble: 911 x 2
#>    w.length      Tfr
#>       <dbl>    <dbl>
#>  1      190 0.000101
#>  2      191 0.000109
#>  3      192 0.000108
#>  4      193 0.000101
#>  5      194 0.000100
#>  6      195 0.000100
#>  7      196 0.000100
#>  8      197 0.000100
#>  9      198 0.000100
#> 10      199 0.000100
#> # ... with 901 more rows
#> --- Member: McDermit_PET_Autostat_CT5_125um ---
#> Object: filter_spct [611 x 2]
#> Wavelength range 190 to 800 nm, step 1 nm 
#> Label: Polyester, clear film, 0.000125 m thick, Autostat CT5 from McDermit Autotype; new 
#> 
#> # A tibble: 611 x 2
#>    w.length   Tfr
#>       <int> <dbl>
#>  1      190 0.011
#>  2      191 0.01 
#>  3      192 0.011
#>  4      193 0.015
#>  5      194 0.016
#>  6      195 0.012
#>  7      196 0.011
#>  8      197 0.011
#>  9      198 0.011
#> 10      199 0.011
#> # ... with 601 more rows
#> 
#> --- END ---
```

The package includes a character vector with the names of these vectors
of names that are available.

``` r
all_filter_accessors
#>  [1] "acetate_filters"            "acrylic_filters"           
#>  [3] "baader_filters"             "band_pass_filters"         
#>  [5] "blue_filters"               "blue_green_filters"        
#>  [7] "bpi_visqueen_filters"       "bw_filters"                
#>  [9] "clear_filters"              "courtaulds_filters"        
#> [11] "etola_filters"              "evonik_filters"            
#> [13] "fake_unbranded_filters"     "firecrest_filters"         
#> [15] "foiltek_filters"            "green_filters"             
#> [17] "haida_filters"              "Haida_filters"             
#> [19] "heat_filters"               "heliopan_filters"          
#> [21] "hoya_filters"               "kenko_filters"             
#> [23] "kolarivision_filters"       "lee_filters"               
#> [25] "long_pass_filters"          "mcdermit_filters"          
#> [27] "midopt_filters"             "neutral_filters"           
#> [29] "old_schott_filters"         "optical_glass_filters"     
#> [31] "orange_filters"             "photography_filters"       
#> [33] "plastic_film_filters"       "plastic_sheet_filters"     
#> [35] "plexiglas_filters"          "polycarbonate_filters"     
#> [37] "polyester_filters"          "polystyrene_filters"       
#> [39] "polyvynil_chloride_filters" "red_nir_filters"           
#> [41] "rocolax_filters"            "rosco_filters"             
#> [43] "schott_filters"             "short_pass_filters"        
#> [45] "tiffen_filters"             "uqg_filters"               
#> [47] "uv_filters"                 "uvir_cut_filters"          
#> [49] "uvroptics_filters"          "xl_horticulture_filters"   
#> [51] "yellow_filters"             "zeiss_filters"             
#> [53] "zomei_filters"
```

Please, see the *User Guide* or documentation for the names of other
vectors of names for materials, suppliers, and regions of the spectrum.

Summary calculations can be easily done with methods from package
‘photobiology’. Here we calculate mean transmittance for two regions
of the spectrum given by wavelengths in nanometres.

``` r
transmittance(filters.mspct[["Foiltek_Clear_PET_G"]], 
              list(waveband(c(250, 315)), waveband(c(500,600))))
#>  range.250.315  range.500.600 
#>   0.0001766804   0.8759366166 
#> attr(,"Tfr.type")
#> [1] "total"
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

Installation of the current unstable version from Bitbucket:

``` r
# install.packages("devtools")
devtools::install_bitbucket("aphalo/photobiologyfilters")
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
(<https://bitbucket.org/aphalo/photobiologyfilters>).

## Citation

If you use this package to produce scientific or commercial
publications, please cite according to:

``` r
citation("photobiologyFilters")
#> 
#> To cite package 'photobiologyFilters' in publications, please use:
#> 
#>   Aphalo, Pedro J. (2015) The r4photobiology suite. UV4Plants
#>   Bulletin, 2015:1, 21-29. DOI:10.19232/uv4pb.2015.1.14
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

© 2012-2019 Pedro J. Aphalo (<pedro.aphalo@helsinki.fi>). Released under
the GPL, version 2 or greater. This software carries no warranty of any
kind.
