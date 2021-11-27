test_that("is_twn werkt", {
  namen <- c("Bufo calamita", "Bufo", "Bufo bufo", "Buf", NA, "Abies veitchii 1861")
  
  expect_equal(is_twn(namen), c(TRUE, TRUE, TRUE, FALSE, FALSE, TRUE))
  expect_equal(is_valid_twn(namen), c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE))
})


test_that("is_twn werkt zonder twn te laden", {
  on.exit(library(twn))
  unloadNamespace("twn")
  namen <- c("Bufo calamita", "Bufo", "Bufo bufo", "Buf", NA, "Abies veitchii 1861")
  
  expect_equal(is_twn(namen), c(TRUE, TRUE, TRUE, FALSE, FALSE, TRUE))
  expect_equal(is_valid_twn(namen), c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE))
})



