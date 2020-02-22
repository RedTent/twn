.onAttach <- function(libname, pkgname) {
  packageStartupMessage(paste(crayon::green("twn"), 
                              "gebruikt de", 
                              crayon::green("TWN-lijst"), 
                              "van", 
                              crayon::white(attr(twn_lijst, "datum_twn_lijst"))))
}