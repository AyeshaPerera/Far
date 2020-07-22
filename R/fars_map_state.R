#' @title fars_map_state
#' Accepts a state number and year from the user/calling program
#' Makes the appropriate filename using the year and the make_filename function
#' gets a data frame from fars_read()
#'
#' Error checks to make sure the state number exists
#' If so, uses maps and graphics to create plots based on latitude and longitude from the data file
#' Uses make_filename(year) and fars_read(filename)
#'
#' @param state.num Number of a state
#' @param year The year in question
#'
#' @return A plot or set of plots based on latitude and longitude from the data file
#'
#' @export

#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @examples
#' \dontrun{
#' fars_map_state(1, 2013)
#' }
#'
#'


fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
