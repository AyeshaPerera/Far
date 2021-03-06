#' @title fars_read
#' This function accepts the location of the CSV file and reads it
#' If such a file does not exit then it will produce an error with the file
#' does not exit error.
#'
#' @param a csv file that may or not exit in the given location.
#'
#' @return returns a dataframe if the csv file exits if not returns a file doesnot exit
#' error
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @seealso \code{\link{make_filename}}
#'
#' @examples
#' \dontrun{accident <- fars_read('accident_2015.csv.bz2')}
#'
#' @export
#'
utils::globalVariables(c("STATE","MONTH","year","n"))
fars_read <- function(filename) {
  filedir <- system.file("extdata", filename, package = "Far")

  if(!file.exists(filedir))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filedir, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
