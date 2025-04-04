---
editor_options:
  markdown:
    wrap: 72
---

# photobiologyFilters 0.6.1

-   Add UV-A-radiation-induced fluorescence spectra for seven glass photography 
    filters. 
-   Add missing metadata to spectra of Rosco gels.
-   Add spectra for four Cooling (C), four Warming (W) and two "fluorescent" 
    (FL) colour correction photography filters from Hoya Tokina.
-   Rebuild data objects with 'photobiology' (0.12.0).

# photobiologyFilters 0.6.0

-   Add function `water_n()` returning the refractive index of seawater and
    freshwater as a function of wavelength and temperature.
-   Add data for 197 climate screens, shade nets and other covers used in 
    horticulture (contributed by T. K. Kotilainen, T. M. Robson and R. 
    Hernández).
-   Add spectra for additional photography filters including several
    copies of filters of the same type.
-   Add spectra for UV-pass filter stacks.
-   Replace some spectra digitized from suppliers' spectral plot bitmaps
    by actual measurements.
-   Fill-in missing and correct wrong metadata for some photography
    filters. This includes the thickness measured for individual
    filters.
-   Rename photography filters to include thickness and size when
    available. *Code breaking!*.
-   Trim the wavelength range of photography filters to 200 nm to 1020 nm, 
    because outside this range data were heavily affected by instrument noise.
    The noise was very noticeable when the data are re-expressed as absorbance
    or optical density (O.D.). *Code breaking!*.
-   Update refractive index data with freshly downloaded spectra from
    the refractive index database. Some materials added and a couple
    were removed. The data may be slightly different. Some names
    changed, e.g., acrylic is now PMMA.
-   Rebuild data objects with 'photobiology' (0.11.1).
-   Compact the spectral data using `photobiology::thin_wl()`. *Can
    slightly change the result of computations and plot details*.
-   **Move Git repository from *Bitbucket* to *GitHub*.**

# photobiologyFilters 0.5.2

-   Correct wrong thickness metadata in PC and PET_G sheet spectra.
-   Add thickness metadata for several photography filters.
-   Add reflectance data for various materials (previously contained in
    package 'photobiologyReflectors', which was never released through
    CRAN).

# photobiologyFilters 0.5.1

-   Add data for Heliopan UVIR-cut "Digital" filter.
-   Add data for Fotga UV IR CUT filter.
-   Correct wrong spelling of Tangsinuo Technologies in two filters'
    names.
-   Add filter.properties metadata when available.
-   Add refractive_index.mspct with data for 15 materials.
-   Revise the User Guide.

# photobiologyFilters 0.5.0

-   (Code breaking!) Rename many of the member spectra contained in
    filters.mspct so that all names start with the brand of the filter.
-   Rename vectors of names used as accessors to end in `"_filters"` to
    avoid possible conflicts with other packages.
-   Add data for various filters used in photography.
-   Add data for some filters supplied by *UQG Optics*.
-   Add data for 49 new filters supplied by *MIDOPT*.
-   Add data for 5 old types of UV-pass filters from *Schott*.
-   Rebuild all spectral data objects with current version of package
    'photobiology' (= 0.9.28), setting "how.measured" attribute when
    known.
-   Remove a non-ASCII character from the data.
-   Require R 3.5.0 due to the new file format used to store the data.

# photobiologyFilters 0.4.4

-   Rebuild data objects, setting attribute `"what.measured"`.
-   Add data for *MIDOPT* filters, from *Midwest Optical Systems, Inc.*
-   Add data for different types of window glasses, as used by CIE.
-   Rename some filters, for clarity and consistency (NOT FULLY
    BACKWARDS COMPATIBLE).
-   Add lists of names by type, colour and by material.
-   Update documentation, expanding the "User Guide" and removing the
    "Data Catalogue".
-   Build documentation web site with 'pkgdown'.

# photobiologyFilters 0.4.3

-   Rebuild data objects.
-   Update documentation.
-   Build documentation web site with 'staticdocs'.

# photobiologyFilters 0.4.2

-   Rebuild data objects. Only change is in dependencies and fixed a bug
    in the build.

# photobiologyFilters 0.4.1

-   Update for 'ggplot2' 2.0.0, 'ggspectra' 0.1.0, and 'photobiology'
    0.9.1.
-   Only change is in dependencies.

# photobiologyFilters 0.4.0

***Code breaking update!***

-   Change how data are stored. Data are now in `filter_mspct` objects,
    in most cases each object contains data for filters from a single
    supplier.
-   Replace *SCHOTT* filter data with those supplied by *SCHOTT*. Now
    data for 67 filters are included and data on thickness and
    reflection multiplier are included for each filter type.
-   Add data for greenhouse films from *XL Horticulture Ltd.*
-   Simplify and improve all data building scripts.
-   Revise vignettes to use data in new format and to include new data
    added.

# photobiologyFilters 0.3.2

-   Add spectra for some *Lee* filters (data digitized from data
    sheets).
-   Remove all references to data.table from data object build scripts.
-   Rebuild all data objects with 'photobiology' (0.8.11).

# photobiologyFilters 0.3.1

-   Rebuid data and package with photobiology 0.8.0 and remove
    dependency on package data.table.

# photobiologyFilters 0.3.0

-   Rebuid data and package with photobiology 0.6.0.

# photobiologyFilters 0.2.4

-   Added data for Petri dishes.

# photobiologyFilters 0.2.3

Revise script used for creating filter data objects. To avoid problems
with conversions to absorbance and taking into account that what can be
really measured is that transmittance is below the detection limit of
the instrument used, the minimum value of fractional transmittance has
been forced to be 1 E-5, with the meaning of \< 1 E-5, consistently with
the earlier encoding used for *Schott* optical glass filters.

# photobiologyFilters 0.2.2

-   Add data for *Plexiglas* 2458 GT (*SUNTAN*).

# photobiologyFilters 0.2.1

-   Rebuild with 'photobiology' 0.5.7, which is now required.
-   The *User Guide* was updated to use simpler code as allowed by
    'photobiologygg' 0.2.5.

# photobiologyFilters 0.2.0

-   Rebuild with 'photobiology' 0.5.1, now required, which needed minor
    edits to the *User Guide*.

# photobiologyFilters 0.1.13

-   Rebuild all filter.spct objects with 'photobiology' 0.4.6
-   Vignettes updated.

# photobiologyFilters 0.1.12

-   Added to the 'catalogue of filters' vignette plots for filters that
    were missing.

# photobiologyFilters 0.1.11

Cleaned up the scripts I use for building the data objects. Decided so
save storage space and to only include spectral transmittances expressed
as fractions of one, now that the design of the code in the
'photobiology' package is getting stable. Revised the "catalogue of
filters"" vignette to solve some plotting problems, and to simplify the
code used.

# photobiologyFilters 0.1.10

-   Rename all filter spectra objects from `.dt` to `.spct`.

# photobiologyFilters 0.1.9

-   Add data for several plastic sheet types including several types of
    *Plexiglas.*

# photobiologyFilters 0.1.8

-   Add data for many *Schott* optical filters.
-   Now data are in data.table format (compatible with data.frame),
    added class attributes preparing for future improvements.
-   Data are now in S3 objects of class `"filter.spc"` but no class
    methods are yet defined.
-   The names of the variables in the `"filter.spc"` objects has changed
    and now they contain the data both as percentages and fractions.
    This makes use easier, but wastes some storage space. Now
    'photobiology' 0.3.0 or later is required.

# photobiologyFilters 0.1.7

-   Function `calc_filter_multipliers()` was moved to package
    'photobiology'. However, this should be mostly invisible because the
    whole photobiology package is imported.

# photobiologyFilters 0.1.6

-   Add data for some optical glass filters from Schott.

# photobiologyFilters 0.1.5

-   Fix a BAD bug in the rescaling code in `calc_filter_multipliers()`
    that affected the returned values (percents vs. fractions).

# photobiologyFilters 0.1.4

-   Added missing import directive.

# photobiologyFilters 0.1.3

-   Small edits to vignettes.

# photobiologyFilters 0.1.2

-   Fix documentation.

# photobiologyFilters 0.1.1

-   Add warning to documentation as the spectral transmittance for
    *Rosco #00* is not that of the filters currently being sold.

# photobiologyFilters 0.1.0

-   First version. Includes transmittance spectra for many of the
    filters we have measured during the last 20 years.
