test_that("is_taxonlevel werkt", {
  
  
  # taxa <- twn_lijst$taxonname
  taxa <- c("Bufo bufo", "Bufo", "Bufonidae", "Buf", NA)
  expect_message(is_taxonlevel(taxa))
  expect_equal(is_taxonlevel(taxa, "Species"), c(TRUE, FALSE, FALSE, NA, NA))
  expect_equal(is_taxonlevel(taxa, "species"), c(TRUE, FALSE, FALSE, NA, NA))
  expect_equal(is_taxonlevel(taxa, "species Combi"), c(FALSE, FALSE, FALSE, NA, NA))
  expect_error(is_taxonlevel(taxa, "species Comb"))
  expect_equal(is_taxonlevel(taxa, "Familia"), c(FALSE, FALSE, TRUE, NA, NA))
})
