context("twn_info functies zonder library(twn)")

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
  expect_equal(twn_taxontype(c("Bufo", "Plantae")), c("Amphibia", "Macroalgae Macrophytes Phytoplankton"))
  # NB Test fails als er een wijziging in de datum is
  expect_equal(twn_datum(namen), as.Date(c("2019-01-22", "2008-11-25", "2008-11-25", NA, NA )))
  
  
  # testen aliassen
  expect_equal(twn_refername(namen), c("Epidalea calamita", "Bufo", "Bufo bufo", NA, NA))
  expect_equal(twn_ouder(namen), c("Epidalea", "Bufonidae", "Bufo", NA, NA))
  expect_equal(twn_nednaam(namen), c("Rugstreeppad", NA, "Gewone pad", NA, NA))
  expect_equal(twn_date(namen), as.Date(c("2019-01-22", "2008-11-25", "2008-11-25", NA, NA )))
  expect_equal(as.character(twn_taxonniveau(namen)), c("Species", "Genus", "Species", NA, NA))
  
  expect_is(twn_taxonlevel(namen), "factor")
})



