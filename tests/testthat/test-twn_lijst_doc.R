context("controle twn_lijst")

test_that("TWN lijst is compleet", {
  expect_true(nrow(twn_lijst) > 26200)
  
  expect_true(all(c("taxontype", "taxonname", "author", "taxongroup", "taxonlevel", 
                    "parentname", "refername", "literature", "localname", "date", "status") %in% names(twn_lijst)))
  
  expect_is(twn_lijst$taxonlevel, c("ordered", "factor"))
  expect_is(twn_lijst$date, "Date")
  expect_type(twn_lijst$taxontype, "character")
  expect_type(twn_lijst$taxonname, "character")
  expect_type(twn_lijst$author, "character")
  expect_type(twn_lijst$taxongroup, "character")
  expect_type(twn_lijst$parentname, "character")
  expect_type(twn_lijst$refername, "character")
  expect_type(twn_lijst$literature, "character")
  expect_type(twn_lijst$localname, "character")
  expect_type(twn_lijst$status, "character")
  
  
})
