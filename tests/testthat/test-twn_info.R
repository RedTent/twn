context("twn_info functies ex zonder library(twn)")

test_that("twn_info functies werken", {
  on.exit(library(twn))
  unloadNamespace("twn")
  namen <- c("Bufo calamita", "Bufo", "Bufo bufo", "Buf", NA)

  expect_equal(twn::twn_voorkeurnaam(namen), c("Epidalea calamita", "Bufo", "Bufo bufo", NA, NA))
  expect_equal(twn::twn_parent(namen), c("Epidalea", "Bufonidae", "Bufo", NA, NA))
  expect_equal(twn::twn_localname(namen), c("Rugstreeppad", NA, "Gewone pad", NA, NA))
  expect_equal(twn::twn_status(namen), c("20", "10", "10", NA, NA))
  expect_equal(twn::twn_status(namen, code = FALSE), c("Synonym", "Preferred name", "Preferred name", NA, NA))
  expect_equal(as.character(twn::twn_taxonlevel(namen)), c("Species", "Genus", "Species", NA, NA))

  expect_is(twn::twn_taxonlevel(namen), "factor")
})


context("twn_info functies")

test_that("twn_info functies werken", {
  namen <- c("Bufo calamita", "Bufo", "Bufo bufo", "Buf", NA)
  
  expect_equal(twn_voorkeurnaam(namen), c("Epidalea calamita", "Bufo", "Bufo bufo", NA, NA))
  expect_equal(twn_parent(namen), c("Epidalea", "Bufonidae", "Bufo", NA, NA))
  expect_equal(twn_localname(namen), c("Rugstreeppad", NA, "Gewone pad", NA, NA))
  expect_equal(twn_status(namen), c("20", "10", "10", NA, NA))
  expect_equal(twn_status(namen, code = FALSE), c("Synonym", "Preferred name", "Preferred name", NA, NA))
  expect_equal(as.character(twn_taxonlevel(namen)), c("Species", "Genus", "Species", NA, NA))
  
  expect_is(twn_taxonlevel(namen), "factor")
})



