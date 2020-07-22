testthat::context("file naming and import")

library(Far)


test_that("Far csv files are available", {
  expect_equal(list.files(system.file("extdata", package = "Far")),
               c("accident_2013.csv.bz2",
                 "accident_2014.csv.bz2",
                 "accident_2015.csv.bz2"))
}
)

test_that("make_filename function", {

  expect_that(make_filename(2015), equals("accident_2015.csv.bz2"))

})


test_that("fars_read function", {

  expect_that(fars_read("accident_2012.csv.bz2"), throws_error("file 'accident_2012.csv.bz2' does not exist"))

})
