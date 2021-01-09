#' Function for turning the file into a data.table showing precip depth in hourly intervals wit specific frequencies
#'
#' @param dt data.table including the fields date (datum) and p (precipitation in kg/s)
#' @param frequency frequency with which to split the data
#'
#' @return data.table of precipitation depth split into durations on basis of hour (D1, D2, D3, D6, D12, D24) and specified frequencies
#' @export ddff
#'
#' @examples
#'
#' \dontrun{
#'
#' ddff(dta, frequency = c(2,5,10,20))
#'
#' }
#'
ddff <- function(dt, frequency){
  dt[, p := p * 3600]
  dt <- dt[, .(D1 = p, D2 = frollsum(p,2), D3 = frollsum(p,3), D6 = frollsum(p,6), D12 = frollsum(p,12), D24 = frollsum(p,24)), by = year(date)]
  mdt <- melt(dt, id.vars = 'year')
  dt <- mdt[, .(depth = max(value, na.rm = TRUE)), by = .(year, variable)]
  dt <- dt[, .(depth = quantile(depth, p = 1 - 1/frequency), freq = frequency), by = .(Duration = variable)]
  dt[, hour := as.numeric(gsub('D', '', Duration))]

  print(dt)

}
