
# photobiologyFilters

[![](https://www.r-pkg.org/badges/version/photobiologyFilters)](https://cran.r-project.org/package=photobiologyFilters)

Package **photobiologyFilters** is a collection of spectral
transmittance data for more than 250 filters measured in our lab or for
which data have been made available by the suppliers for inclussion in
this package.

## Examples

The first example shows how to list all available filters. We use
`head()` to limit the output.

``` r
library(photobiologyFilters)
library(ggspectra)
theme_set(theme_bw())
```

``` r
length(names(filters.mspct))
#> [1] 234
```

``` r
# list names of the first 10 filters
head(names(filters.mspct), 10)
#>  [1] "UG1"  "UG5"  "UG11" "BG3"  "BG7"  "BG18" "BG25" "BG36" "BG38" "BG39"
```

The second example shows how to use a predefined vector of filter names
to extract those made of polyester (PET). Please, see the *User Guide*
or documentation for the names of other vectors of names for materials,
suppliers, and regions of the spectrum.

``` r
polyester
#> [1] "Clear_PET_G"            "PET_Autostat_CT5_125um"
filters.mspct[polyester]
#> Object: filter_mspct [2 x 1]
#> --- Member: Clear_PET_G ---
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
#> --- Member: PET_Autostat_CT5_125um ---
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

Summary calculations can be easily done with methods from package
‘photobiology’. Here we calculate mean transmittance for two regions
of the spectrum given by wavelengths in nanometres.

``` r
transmittance(filters.mspct["Clear_PET_G"], 
              list(waveband(c(250, 315)), waveband(c(500,600))))
#> # A tibble: 1 x 3
#>   spct.idx    transmittance_range.250.315 transmittance_range.500.600
#>   <fct>                             <dbl>                       <dbl>
#> 1 Clear_PET_G                    0.000177                       0.876
```

Methods in package ‘ggspectra’ can be used for plotting.

``` r
autoplot(filters.mspct["Clear_PET_G"]) +
  stat_find_wls(target = c(0.5, 0.05)) +
  stat_find_wls(target =c(0.5, 0.05), geom = "text", hjust = 1.2)
```

![](man/figures/README-example-07-1.png)<!-- -->

The classes of the objects used to store the spectral data are derived
from `"data.frame"` making direct use of the data easy with functions
and methods from base R and various packages.

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
