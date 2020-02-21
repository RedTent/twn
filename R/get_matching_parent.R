#' Vind een matching parent in een referentielijst
#'
#' Met deze functie is met mogelijk om van een taxon een parent in de TWN-lijst te vinden die in een referentielijst voorkomt. 
#' Dit kan bijv. nuttig zijn als het taxon een ondersoort is van een soort die in een beoordelingssysteem voorkomt. 
#' De functie kan dan worden gebruikt om de soortenlijst geschikt te maken voor een beoordelingssysteem.
#'
#' @param soorten Een vector met soorten
#' @param ref_soorten Een vector met referentie-soorten
#' @param n_parents Het aantal parentniveau's dat gecheckt wordt. Default is 5.
#' @param verbose Als `TRUE` geeft the functie een message met de `soorten` waar geen match voor is.
#'
#' @return Een vector met soorten die in de referentiesoortenlijst voorkomen. 
#' - Als de soort in de referentiesoorten wordt gevonden, dan wordt deze geretourneerd. 
#' - Als de soort niet maar wel een parent is gevonden in de referentiesoortenlijst wordt deze geretourneerd. 
#' - Als de soort of parent niet is gevonden in de referentiesoortenlijst wordt `NA`  gertourneerd.
#' 
#' @export
#'
#' @examples
#' 
#' ref <- c("Bufonidae", "kameel")
#' namen <- c("Bufo calamita", "Bufo", "Bufonidae", "Bufo bufo", "Buf", NA, "zebra")
#' 
#' find_matching_parent(namen, ref)
#' 
find_matching_parent <- function(soorten, ref_soorten, n_parents = 5, verbose = FALSE){
  
  df <- tibble::tibble(orig = soorten, matching = soorten)
  
  for(i in seq(1, n_parents)) {
  df <- dplyr::mutate(df, matching = ifelse(matching %in% ref_soorten, 
                matching,
                get_twn_parent(matching)))
  }
  
  df <- df %>% dplyr::mutate(matching = ifelse(matching %in% ref_soorten, matching, NA_character_))
  
  if(verbose){
    not_matched <- dplyr::filter(df, is.na(matching)) %>% .$orig %>% unique()
    if (length(not_matched > 0)) message(paste("Voor de volgende soorten is geen matching parent gevonden:", 
                                               paste(not_matched, collapse = " ")))
  }
  
  df$matching
}
