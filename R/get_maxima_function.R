#' Get annual maxima from data.table
#'
#' @param dta data.table including the fields date (datum) and p (precipitation in kg/s)
#' @param a number of intervals to aggregate over in hours
#'
#' @return ata.table with year, aggregation and maxima
#' @export getMX
#'
#' @examples
#'
#' \dontrun{
#'
#' getMX(dta, a = c(1,3,6))
#'
#' }
#'
#'
getMX = function(dta, a = 1){

  res = list()
  for(i in a){
    res[[length(res)+1]] = dta[, .(agg = a, mx = max(frollsum(p*60*60, i), na.rm = TRUE)), by = .(year(date))]
  }

  rbindlist(res)
}
