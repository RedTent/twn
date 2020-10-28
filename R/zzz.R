.onAttach <- function(libname, pkgname) {
  packageStartupMessage(paste(("twn"), 
                              "gebruikt de", 
                              ("TWN-lijst"), 
                              "van", 
                              crayon::red(attr(twn_lijst, "datum_twn_lijst"))))
  
}

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.twn <- list(
    twn.memoise_timeout = 120
  )
  
  toset <- !(names(op.twn) %in% names(op))
  if(any(toset)) options(op.twn[toset])
  
  invisible()
}