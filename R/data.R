#' Maximum depth of precipitation per climate model
#'
#' Additionally separated according to GCM and RCM
#'
#' @format data.table with
#' \describe{
#'   \item{Duration}{Division into hourly intervals, 1h, 2h, 3h, 6h, 12h, 24h}
#'   \item{depth}{maximum precipitation in mm/s}
#'   \item{freq}{Frequency of 2, 5, 10, 20}
#'   \item{hour}{hours, 1h, 2h, 3h, 6h, 12h, 24h}
#'   \item{RCP}{Which RCP of model, rcp 2.6, rcp 4.5, rcp 8.5}
#'   \item{GCM}{Global Climate Model}
#'   \item{RCM}{Regional Climate Model}
#'   ...
#' }
"depth_maxima"

#' Difference in historical baseline and rcp precipitation in climate models
#'
#' Delta signifies the variable of the change
#'
#' @format data.table with
#' \describe{
#'   \item{GCM}{Global Climate Model}
#'   \item{RCM}{Regional Climate Model}
#'   \item{RCP}{Which RCP of model, rcp 2.6, rcp 4.5, rcp 8.5}
#'   \item{Duration}{Division into hourly intervals, 1h, 2h, 3h, 6h, 12h, 24h}
#'   \item{freq}{Frequency of 2, 5, 10, 20}
#'   \item{hour}{hours, 1h, 2h, 3h, 6h, 12h, 24h}
#'   \item{delta}{historical depth divided by depth in mm/s}
#'   ...
#' }
"delta"

#' Historical precipitation data sample
#'
#' Precipitation data in hourly intervals deparated into climate models
#'
#' @format data.table with
#' \describe{
#'   \item{Date}{Date Y-M-D}
#'   \item{Time}{Hourly data in 1h intervals}
#'   \item{Precipitation}{Precipitation in mm/s}
#'   \item{Longtitute}{Longtitude spatial data}
#'   \item{Latitude}{Latitude spatial data}
#'   \item{Climate Model}{Full name of climate model including GCM and RCM}
#'   ...
#' }
"precip"


#' Spatial Polygon Data Frame representing Prague
"prague_wgs"
