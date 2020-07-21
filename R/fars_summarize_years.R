#' @title fars_summarize_years
#' Accepts one or more years as a list and count the numver if observations
#' grouping them by minth and year
#' Uses fars_read_years(years)
#'
#' @param one or more years as a list
#'
#' @return a dataframe of counts by months and years
#'
#' @importFrom dplyr bind_rows group_by summarize
#' @importFrom magrittr %>%
#' @importFrom tidyr spread
#'
#' @export
#'
#' @examples
#' \dontrun{data_summary <- fars_summarize_years(2015)}
#'
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
