#' All Precipitation Function
#'
#' @param file_name
#'
#' @return RasterBrick of all precipitation values in a single file
#' @export allprecip
#'
#' @examples
#'
#'
#' \dontrun{
#'
#' allprecip("./avancedr/spatial/data/raw/CZ_pr_EUR-11_CNRM-CERFACS-CNRM-CM5_historical_r1i1p1_CNRM-ALADIN63_v2_1hr_195101010030-195112312330.nc")
#'
#' }
#'
#'
allprecip <- function(file_name){

  nc <- nc_open(file_name)


  err <- try(
    expr = {

      precip <- ncvar_get(nc = nc,
                          varid = "pr")

    }
    , silent = TRUE
  )

  if (inherits(err,
               what = "try-error")) {

    err <- try(
      expr = {

        precip <- ncvar_get(nc = nc,
                            varid = "precipitation_flux")

      }
      , silent = TRUE
    )
  }


  pr <- brick(precip)


}
