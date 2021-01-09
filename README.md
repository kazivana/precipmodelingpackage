The Precip Modeling Package
================

## Package for Advanced R Programming class with precipitation data and functions

## Dependencies include data.table, rgdal, sp, raster, ncdf4 and ggplot2

``` r
library(data.table)
library(rgdal)
```

    ## Loading required package: sp

    ## rgdal: version: 1.5-18, (SVN revision 1082)
    ## Geospatial Data Abstraction Library extensions to R successfully loaded
    ## Loaded GDAL runtime: GDAL 3.0.4, released 2020/01/28
    ## Path to GDAL shared files: C:/Users/godzi/Documents/R/win-library/3.6/rgdal/gdal
    ## GDAL binary built with GEOS: TRUE 
    ## Loaded PROJ runtime: Rel. 6.3.1, February 10th, 2020, [PJ_VERSION: 631]
    ## Path to PROJ shared files: C:/Users/godzi/Documents/R/win-library/3.6/rgdal/proj
    ## Linking to sp version:1.4-4
    ## To mute warnings of possible GDAL/OSR exportToProj4() degradation,
    ## use options("rgdal_show_exportToProj4_warnings"="none") before loading rgdal.

``` r
library(sp)
library(raster)
```

    ## 
    ## Attaching package: 'raster'

    ## The following object is masked from 'package:data.table':
    ## 
    ##     shift

``` r
library(ncdf4)
library(ggplot2)
```

## Installation

``` r
devtools::install_github("https://github.com/kazivana/precipmodeling.git")
```

## Use cases for functions
