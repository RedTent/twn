test_that("increase_taxonlevel", {
  taxa <- c("Bufo calamita", "Bufo", "Buf", NA)
  
  expect_equal(increase_taxonlevel(taxa, "Familia"), c("Bufonidae", "Bufonidae", "Buf", NA))
  expect_equal(increase_taxonlevel(taxa, "Imperium"), c("Amphibia", "Amphibia", "Buf", NA))
  expect_equal(increase_taxonlevel(taxa, "Imperium", only_twn = TRUE), c("Amphibia", "Amphibia", NA, NA))
  
  expect_error(increase_taxonlevel(taxa, "Koninkrijk"))
})
