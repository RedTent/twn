#' Vind een matchende parent in een referentielijst
#'
#' Met deze functie is met mogelijk om van een taxon een parent in de TWN-lijst te vinden die in een lijst met 
#' referentie-taxa voorkomt. Dit kan bijv. nuttig zijn als het taxon een ondersoort is van een soort die in 
#' een beoordelingssysteem voorkomt. De functie kan dan worden gebruikt om de soortenlijst geschikt te maken 
#' voor een beoordelingssysteem.
#'
#' @param taxa Een vector met taxa
#' @param ref_taxa Een vector met referentie-taxa
#' @param n_parents Het aantal parentniveau's dat gecheckt wordt. Default is 5.
#' @param verbose Als `TRUE` geeft the functie een message met de `taxa` waar geen match voor is.
#'
#' @return Een vector met taxa die in de lijst met referentie-taxa voorkomen. 
#' - Als de soort in de referentie-taxa wordt gevonden, dan wordt deze geretourneerd. 
#' - Als de soort niet, maar wel een parent is gevonden in de lijst met referentie-taxa wordt deze geretourneerd. 
#' - Als de soort of parent niet is gevonden in de lijst met referentie-taxa wordt `NA`  geretourneerd.
#' 
#' @export
#'
#' @examples
#' 
#' ref <- c("Bufonidae", "kameel")
#' namen <- c("Bufo calamita", "Bufo", "Bufonidae", "Bufo bufo", "Buf", NA, "zebra")
#' 
#' match_parent(namen, ref)
#' 
match_parent <- function(taxa, ref_taxa, n_parents = 5, verbose = FALSE){
  
  df <- tibble::tibble(orig = taxa, matching = taxa)
  
  for(i in seq(1, n_parents)) {
  df <- dplyr::mutate(df, matching = ifelse(matching %in% ref_taxa, 
                                            matching,
                                            twn_parent(matching)))
  }
  
  df <- df %>% dplyr::mutate(matching = ifelse(matching %in% ref_taxa, matching, NA_character_))
  
  if(verbose){
    not_matched <- dplyr::filter(df, is.na(matching)) %>% .$orig %>% unique()
    if (length(not_matched > 0)) message(paste("Voor de volgende taxa is geen `matching parent` gevonden:", 
                                               paste(crayon::cyan(not_matched), collapse = " - ")))
  }
  
  df$matching
}
