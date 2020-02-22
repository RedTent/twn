#' twn : Een package voor de TWN-lijst
#'
#' Package voor de TWN-lijst en bijbehorende functies. Zie verder: [https://redtent.github.io/twn/](https://redtent.github.io/twn/)
#' 
#'
#' @docType package
#' @name twn
NULL




## quiets concerns of R CMD check re: the .'s that appear in pipelines
if (getRversion() >= "2.15.1")  utils::globalVariables(c("matching",
                                                         ".",
                                                         "twn_lijst"
                                                         ))
