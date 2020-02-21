library(magrittr)

test_that("get_matching_parent works", {
  ref <- c("Bufonidae", "kameel")
  namen <- c("Bufo calamita", "Bufo", "Bufonidae", "Bufo bufo", "Buf", NA, "Bufonidae", "zebra")
  result <- c("Bufonidae","Bufonidae","Bufonidae","Bufonidae",NA,NA,"Bufonidae", NA)
  
  expect_equal(find_matching_parent(namen, ref), result)
  expect_message(find_matching_parent(namen, ref, verbose = TRUE))
  expect_equal({tibble::tibble(namen) %>% 
                dplyr::mutate(matchparent = find_matching_parent(namen, ref)) %>% 
                .$matchparent}, 
               result)
  
  
})
