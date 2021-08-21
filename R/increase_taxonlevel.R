#' Verhoog het taxonomische niveau
#'
#' Voor sommige toepassingen kan het nuttig zijn om taxonomische gegevens op een hoger niveau
#' dan het oorspronkelijke niveau te analyseren. Deze functie probeert de taxa op te schalen naar
#' het gewenste taxonomische niveau.
#'
#' @param taxa Een vector met taxonnamen.
#' @param taxonlevel Het gewenste taxonomische niveau. De namen van de taxonomische niveau's zijn 
#' zoals deze in de TWN-lijst worden gebruikt (Species, Genus, enz.).
#' @param only_twn Logical. Indien FALSE worden taxa die niet in de TWN-lijst voorkomen genegeerd. 
#' Indien TRUE dan worden alleen taxa uit de TWN-lijst geretoureerd.
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
#'     - het originele taxon wordt geretourneerd (tenzij `only_twn = TRUE`)
#' - Het taxon heeft in de TWN-lijst geen parent op het gevraagde niveau
#'     - het taxon wat het dichtst onder het gevraagde niveau zit wordt geretourneerd.
#' - De taxonnaam heeft de waarde `NA`
#'     - De waarde `NA` wordt geretourneerd.
#'
#' @examples
#' 
#' taxa <- c("Bufo calamita", "Bufo", "Buf", NA)
#' 
#' increase_taxonlevel(taxa, "Familia")
#' increase_taxonlevel(taxa, "Familia", only_twn = TRUE)
#' 
increase_taxonlevel <- function(taxa, taxonlevel = c("Species", "Genus", "Familia", "Ordo", "Classis", "Phylum", "Regnum", "Imperium"), only_twn = FALSE) {
  
  taxonlevel <- rlang::arg_match(taxonlevel, as.character(taxonlevels))
  
  df <- tibble::tibble(nieuwe_naam = taxa)
  
  for (i in c(1:18)) {
    
    df <- df %>% 
      dplyr::mutate(level = twn_taxonlevel(nieuwe_naam),
                    parent = twn_parent(nieuwe_naam),
                    nieuwe_naam = ifelse(!is.na(level) & !is.na(parent) & level < taxonlevel, 
                                         parent,
                                         nieuwe_naam))
  }
  
  if(only_twn) df <- dplyr::mutate(df, nieuwe_naam = ifelse(is_twn(nieuwe_naam), nieuwe_naam, NA_character_))
  
  df$nieuwe_naam
}
