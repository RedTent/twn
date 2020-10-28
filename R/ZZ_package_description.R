#' Een package voor de TWN-lijst
#'
#' @description 
#' De bedoeling van 'twn' is om de TWN-lijst beschikbaar te maken in R en om er makkelijk mee te kunnen werken.
#' De package biedt diverse functies die het eenvoudig maken om informatie van een taxon op te vragen. 
#' 
#' Zie ook:
#' - [twn_lijst] en [twn_statuscodes]
#' - [twn_info] 
#' - [match_parent()]
#' 
#' 
#' Voor meer informatie zie de package website: [https://redtent.github.io/twn/](https://redtent.github.io/twn/)
#'
#' @docType package
#' @name twn
NULL




## quiets concerns of R CMD check re: the .'s that appear in pipelines
if (getRversion() >= "2.15.1")  utils::globalVariables(c("matching",
                                                         ".",
                                                         "twn_lijst",
                                                         "nieuwe_naam",
                                                         "level",
                                                         "parent"
                                                         # "status",
                                                         # "refername",
                                                         # "taxonname",
                                                         # "parentname",
                                                         # "localname",
                                                         # "voorkeurnaam",
                                                         # "omschrijving",
                                                         # "taxonlevel"
                                                         ))
