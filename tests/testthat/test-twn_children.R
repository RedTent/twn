test_that("twn_children", {
  
  test_namen <- c("Bufo", "Bufo bufo", "Epidalea", "Epidalea calamita", "Triturus carnifex", "Triturus cristatus")
  
  expect_setequal(twn_children("Bufonidae"), test_namen[1:4])
  expect_setequal(twn_children(c("Bufonidae", "Triturus")), test_namen)
  expect_setequal(twn_children("Bufonidae", "Species"), test_namen[c(2,4)])
  expect_setequal(twn_children("Bufonidae", "Species", only_preferred = FALSE), 
                  c("Bufo bufo", "Bufo calamita", "Epidalea calamita"))
  
  expect_null(twn_children("Bufonidae", "Subspecies"))
  expect_warning(twn_children("Bufonidae", "Ordo"), "Het taxonlevel van de parent moet hoger zijn dan van de children")
  expect_warning(twn_children("Zebra") , "komt niet voor in de TWN-lijst")
  
  
})
