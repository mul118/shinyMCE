context("shinyMCE")

test_that('all package functions are present',{
  expect_true(is.function(tinyMCE))
  expect_true(is.function(updateTinyMCE))
  expect_that(sin(pi / 4), equals(1))
})