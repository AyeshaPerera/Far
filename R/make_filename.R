#' @title make_filename
#' This function accepts a the year as a string value and returns file name
#' concatenating it as accident_year.csv.bz2
#'
#' @param the year as a string value
#'
#' @return returns the concatenated name with the year in the format
#' accident_year.csv.bz2
#'
#' @export
#'
#' @examples
#' \dontrun{filename <- make_filename('2015')}
#'
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
