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


test_that("is_taxontype werkt", {
  
  # taxa <- twn_lijst$taxonname
  taxa <- c("Bufo bufo", "Abies", "Bufonidae", "Buf", NA)
  
  expect_true(is_taxontype("Bufo", "Amphibia"))
  expect_equal(is_taxontype(taxa, "Amphibia"), c(TRUE, FALSE, TRUE, NA, NA))
  expect_equal(is_taxontype(taxa, "amphibia"), c(TRUE, FALSE, TRUE, NA, NA))
  expect_equal(is_taxontype(taxa, "Macrophytes"), c(FALSE, TRUE, FALSE, NA, NA))
  
  expect_error(is_taxontype(taxa, "Amphibi"))
  expect_error(is_taxontype(taxa))
  
})

test_that("is_status werkt", {

 expect_true(is_status("Bufo", "10"))
 expect_true(is_status("Bufo", 10))
 expect_equal(is_status(c("Bufo", "Bufo calamita", "Abies veitchii 1861", NA, "zebra"), "10"), c(TRUE, FALSE, FALSE, NA, NA))
 expect_equal(is_status(c("Bufo", "Bufo calamita", "Abies veitchii 1861", NA, "zebra"), "91"), c(FALSE, FALSE, TRUE, NA, NA))
 
 expect_error(is_status("Bufo", 11))
 expect_error(is_status("Bufo"))

})
