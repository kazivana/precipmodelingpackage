#' Get Precipitation Data Frame/ Data Table
#'
#' @param list_of_files list of files including precipitation and spatial data
#'
#' @return data.table with date, id, precipitation, lon, lat and climate model columns
#' @export getPrecipDF
#'
#' @examples
#'
#' \dontrun{
#'
#' getPrecipDF(list.files(path = "./avancedr/spatial/data/raw",
#'                        pattern = ".nc",
#'                        full.names = TRUE))
#'
#' }
#'


getPrecipDF <- function(list_of_files){

  i = 1

  l = list()

  pha_wgs = precipmodeling::prague_wgs

  for (i in seq_along(along.with = list_of_files)){

    nc <- nc_open(list_of_files[i])

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


    rast <- brick(precip)

    extent(rast) <- c(range(x = lon),
                      range(x = lat))


    ext <- extent(pha_wgs) * 1.75

    aux <- as.data.table(t(extract(rast,ext)))

    names(x = aux) <- as.character(x = cellsFromExtent(object = rast[[1]],
                                                       extent = ext))

    n <- nchar(fls[i])

    dates <- strsplit(x = substr(x = fls[i],
                                 start = n - 27,
                                 stop = n - 3),
                      split = "-")


    dt <- data.table(date = seq(from = as.POSIXct(x = dates[[1]][1],
                                                  format = "%Y%m%d%H%M"),
                                to = as.POSIXct(x = dates[[1]][2],
                                                format = "%Y%m%d%H%M"),
                                by = "hour"),
                     aux)

    dt_m <- melt(data = dt,
                 id.vars = "date",
                 variable.name = "id",
                 variable.factor = FALSE)


    dt_m[, c("lon", "lat") := as.data.frame(x = xyFromCell(object = rast[[1]],
                                                           cell = as.numeric(x = id)))]

    l[[i]] <- dt_m[, forcing := strsplit(x = substr(x  = fls[i],
                                                    start = n - 79,
                                                    stop = n - 29),
                                         split = " ")]

    saveRDS(object = dt_m,
            file = "C:/Users/godzi/Documents/avancedr/spatial/spatial_list.rds")


  }

  out <- rbindlist(l)

  setnames(out, "value", "precipitation")

  setnames(out, "forcing", "model")


}
