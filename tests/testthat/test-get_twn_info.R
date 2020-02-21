context("get_twn_* functies")

test_that("get_twn_info werkt", {
  namen <- c("Bufo calamita", "Bufo", "Bufo bufo", "Buf", NA)
  
  expect_equal(get_twn_voorkeurnaam(namen), c("Epidalea calamita", "Bufo", "Bufo bufo", NA, NA))
  expect_equal(get_twn_parent(namen), c("Epidalea", "Bufonidae", "Bufo", NA, NA))
  expect_equal(get_twn_localname(namen), c("Rugstreeppad", NA, "Gewone pad", NA, NA))
  expect_equal(get_twn_status(namen), c("20", "10", "10", NA, NA))
  expect_equal(as.character(get_twn_taxonlevel(namen)), c("Species", "Genus", "Species", NA, NA))
  
  expect_is(get_twn_taxonlevel(namen), "factor")
})
