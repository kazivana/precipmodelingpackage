The Precip Modeling Package
================

# Package for Advanced R Programming class with precipitation data and functions 

## Installation of package from github

```{r,eval=FALSE, message = FALSE}

devtools::install_github("https://github.com/kazivana/precipmodeling.git")

```


```{r, message = FALSE, include = FALSE}

library(precipmodeling)
library(data.table)
library(ncdf4)
library(sp)
library(rgdal)
library(raster)
library(ggplot2)


```



## Sample of local single data set used for testing function 
Includes dates, precipitation and model name (forcing) columns

```{r}

dta <- readRDS('C:/Users/godzi/Documents/avancedr/precip/CZ_pr_EUR-11_CNRM-CERFACS-CNRM-CM5_historical_r1i1p1_CNRM-ALADIN63_v2_1hr.rds')


```



## Sample: Get Maxima function
Get Maxima values for Precipitation from dta dataset 

```{r}

head(getMX(dta, a = c(1,2,3,6,12,24)))

```



## Sample: DDF (depth-duration-frequency) function
Using function to split the dataset for hourly duration and frequency for DDF curves

```{r}

ddff(dta, frequency = c(2,5,10,20))

```



## Using package data

Plotting aggregated maximum depths of multiple models 

```{r}

ggplot(depth_maxima) + 
  geom_line(aes(x = hour, y = depth, col = RCM, lty = GCM)) + 
  facet_grid(factor(freq) ~ RCP)


```



## Sample of local list of files


```{r}
fls <- list.files(path = "C:/Users/godzi/Documents/avancedr/spatial/data/raw_short",
                  pattern = ".nc",
                  full.names = TRUE)


```


## Sample: All Precipitation function
Plotting hourly precipitation data 

```{r}

a = allprecip(fls[1])
plot(a)

```

## Sample: Single Precipitation to plot function
Plotting precipitation data with Prague geospatial data visualization

```{r}

singleprecip(fls[1], 1)

```


## Showcasing delta dataset 
The change in historical and future projected precipitation based on "IPSL-IPSL-CM5A-MR" GLobal Climate Model

```{r}


ggplot(delta[GCM == "IPSL-IPSL-CM5A-MR", .(hour, delta, freq, RCP, RCM)]) +
  geom_line(aes(x = hour, y = delta, col = factor(freq), lty = RCM)) +
  facet_grid(.~RCP)

```

## Sample: Get Precipitation DataFrame function
Returns a dataframe with date, precipitation, latitute, longitute and model name, aggregated from multiple datasets

```{r}

r = getPrecipDF(fls)
r

```


## Saved dataframe of the precipitation data used in class, derived from getPrecipDF function

```{r}
precip

```

