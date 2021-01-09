#' Single Precipitation Plot Function
#'
#' @param file_name exact file from which to extract values
#' @param layer_numeric number representing which layer to plot
#'
#' @return plot of precipitation values with CZ spatial polygon inside
#' @export singleprecip
#'
#'
#' @examples
#'
#'  \dontrun{
#'
#' singleprecip("CZ_pr_EUR-11_CNRM-CERFACS-CNRM-CM5_historical_r1i1p1_CNRM-ALADIN63_v2_1hr_195101010030-195112312330.nc", 2)
#'
#' }
#'
#'

singleprecip <- function(file_name, layer_numeric){

  nc <- nc_open(file_name)


  err <- try(
    expr = {

      pr <- ncvar_get(nc = nc,
                      varid = "pr")

    }
    , silent = TRUE
  )

  if (inherits(err,
               what = "try-error")) {

    err <- try(
      expr = {

        pr <- ncvar_get(nc = nc,
                        varid = "precipitation_flux")

      }
      , silent = TRUE
    )
  }

  err <- try(
    expr = {

      lat <- ncvar_get(nc = nc,
                       varid = "lat")

    }
    , silent = TRUE
  )

  if (inherits(err,
               what = "try-error")) {

    err <- try(
      expr = {

        lat <- ncvar_get(nc = nc,
                         varid = "latitude")

      }
      , silent = TRUE
    )
  }


  err <- try(
    expr = {

      lon <- ncvar_get(nc = nc,
                       varid = "lon")

    }
    , silent = TRUE
  )

  if (inherits(err,
               what = "try-error")) {

    err <- try(
      expr = {

        lon <- ncvar_get(nc = nc,
                         varid = "longtitude")

      }
      , silent = TRUE
    )
  }

  precip <- brick(pr)

  extent(precip) <- c(range(lon),
                      range(lat))

  pha_wgs <- precipmodeling::prague_wgs

  rast <- precip[[layer_numeric]]

  plot(rast)

  plot(pha_wgs,
       add = TRUE)

}

