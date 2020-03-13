#' Verhoog het taxonomische niveau
#'
#' Voor sommige toepassingen kan het nuttig zijn om taxonomische gegevens op een hoger niveau
#' dan het oorspronkelijke niveau te analyseren. Deze functie probeert de namen op te schalen naar
#' het gewenste taxonomische niveau.
#'
#' @param namen Een vector met taxonnamen.
#' @param taxonlevel Het gewenste taxonomische niveau. De namen van de taxonomische niveau's zijn 
#' zoals deze in de TWN-lijst worden gebruikt.
#'
#' @return Een vector met taxonnamen.
#' @export
#'
#' @details De functie probeert de taxonnamen op te schalen naar het gespecificeerde taxonomische niveau. 
#' Dit is echter om diverse redenen niet altijd mogelijk. Als dat niet mogelijk is dan zijn er meerdere 
#' resultaten mogelijk.
#' 
#' - Het taxonomisch niveau van het taxon is al hoger dan het gevraagde niveau 
#'     -het originele taxon wordt geretourneerd.
#' - Het taxon komt niet voor in de TWN-lijst 
#'     - het originele taxon wordt geretourneerd.
#' - Het taxon heeft in de TWN-lijst geen parent op het gevraagde niveau
#'     - het taxon wat het dichtst onder het gevraagde niveau zit wordt geretoruneerd.
#' - De taxonnaam heeft de waarde `NA`
#'     - De waarde `NA` wordt geretourneerd.
#'
#' @examples
#' 
#' taxa <- c("Bufo calamita", "Bufo", "Buf", NA)
#' 
#' increase_taxonlevel(taxa, "Familia")
#' 
increase_taxonlevel <- function(namen, taxonlevel = c("Species", "Genus", "Familia", "Ordo", "Classis", "Phylum", "Regnum", "Imperium")) {
  
  taxonlevel <- rlang::arg_match(taxonlevel, as.character(taxonlevels))
  
  df <- tibble::tibble(nieuwe_naam = namen)
  
  for (i in c(1:18)) {
    
    df <- df %>% 
      dplyr::mutate(level = twn_taxonlevel(nieuwe_naam),
                    parent = twn_parent(nieuwe_naam),
                    nieuwe_naam = ifelse(!is.na(level) & !is.na(parent) & level < taxonlevel, 
                                         parent,
                                         nieuwe_naam))
  }
  df$nieuwe_naam
}
