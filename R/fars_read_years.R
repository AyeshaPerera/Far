#' @title fars_read_years
#' Uses both make_filename(year) and fars_read(file)
#' Accepts one or more years as a list and produce the file name in the format of
#' accident_year.csv.bz2 and produce the relevent dataset
#'
#' @param one or more years as a list
#'
#' @return returns one or more datasets according to the number of years passed
#' returns null if the input year is invalid
#'
#' @importFrom dplyr mutate select
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' \dontrun{fars_read_years(2015)}
#' \dontrun{fars_read_years(1999:2015)}
#'
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
