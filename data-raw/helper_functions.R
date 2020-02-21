update_twn <- function() {
  require(tidyverse)
  
  url <- "http://sofus.ecosys.nl/Taxus/Downloads/Taxalists/TWNList.XLS"
  destfile <- "data-raw/twn_lijst.xls"
  curl::curl_download(url, destfile)
  shell.exec("D:/Johan/R/autecodata/data-raw/twn_lijst.xls")
  twn_lijst <- readxl::read_excel(destfile) # werkt uitsluitend als het gedownloade bestand een keer geopend is geweest
  taxonlevel_volgorde <- readr::read_csv2("data-raw/volgorde_taxonlevels.csv") %>% .$taxonlevel
  
  twn_lijst <- twn_lijst %>% mutate(taxonlevel = factor(taxonlevel, levels = taxonlevel_volgorde, ordered = TRUE))
  
  if (nrow(twn_lijst) > 10000) {
  use_data(twn_lijst, overwrite = TRUE)
  message(lubridate::today())
  message("Vergeet niet de datum in de TWN-documentatie te updaten")}
}

#' TWN voorkeurnamen
#' 
#' Deze functie maakt van een vector met taxonnamen een nieuwe vector met TWN voorkeurnamen
#'
#' @param namen_orig Een vector met taxonnamen
#'
#' @return Een vector met TWN voorkeurnamen. Taxonnamen die niet voorkomen in de TWN-lijst krijgen de waarde `NA`
#' @export
#'
twn_voorkeur_namen <- function(namen_orig) {
  if (length(namen_orig) == 1 & any(is.na(namen_orig))) {warning("Invoer is ongeldig")}
  
  twn_voorkeur <- twn_lijst %>% 
    dplyr::select(taxonname, refername) %>% 
    dplyr::mutate(refername = if_else(is.na(refername), taxonname, refername)) %>% 
    tibble::deframe() 
  
  namen_voorkeur <- unname(twn_voorkeur[namen_orig])
  
  if (!identical(namen_orig, namen_voorkeur)) {
    twn_voorkeur_namen(namen_voorkeur)
  }
  
  namen_voorkeur  
  
}




