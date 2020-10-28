.onAttach <- function(libname, pkgname) {
  packageStartupMessage(paste(("twn"), 
                              "gebruikt de", 
                              ("TWN-lijst"), 
                              "van", 
                              crayon::red(attr(twn_lijst, "datum_twn_lijst"))))
  
}