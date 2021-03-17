#' Test of een taxon een bepaald taxonlevel heeft
#' 
#' Deze functie kijkt of een taxon een bepaald taxonlevel heeft en retourneert een logische vector.
#'
#' @param taxa Een vector met taxonnamen
#' @param taxonlevel Het taxonlevel dat getest moet worden. Als het niet wordt opgegeven dan
#' wordt het taxonlevel op "Species gezet". Zie `twn::taxonlevels` voor alle mogelijke taxonlevels.
#' Het taxonlevel is niet hoofdlettergevoelig
#'
#' @return Een logische vector. Als een taxon ontbreekt of niet in de TWN-lijst voorkomt wordt `NA`
#' geretourneerd.
#' 
#' @export
#'
#' @examples
#' is_taxonlevel(c("Bufo bufo", "Bufo", "Bufonidae", "Buf", NA), "Species")
#' 
is_taxonlevel <- function(taxa, taxonlevel = NULL) {
  
  if (is.null(taxonlevel)) {
    message('Geen taxonlevel geselecteerd. Het taxonlevel "Species" wordt gebruikt.
Zie `twn::taxonlevels` voor alle mogelijke taxonlevels.')
    taxonlevel <- "Species"
  } 
  
  taxonlevel <- stringr::str_to_sentence(taxonlevel)

  taxonlevel_sel <- rlang::arg_match(taxonlevel, as.character(twn::twn_taxonlevels)) 
  
  twn_taxonlevel(taxa) == taxonlevel_sel
}


#' Test of een taxon een bepaald taxontype heeft
#' 
#' Deze functie kijkt of een taxon een bepaald taxontype heeft en retourneert een logische vector.
#'
#' @param taxa Een vector met taxonnamen
#' @param taxontype Het taxontype dat getest moet worden. Zie `unique(twn_lijst$taxontype)` 
#' voor alle mogelijke taxontypes. Het taxontype is niet hoofdlettergevoelig
#'
#' @return Een logische vector. Als een taxon ontbreekt of niet in de TWN-lijst voorkomt wordt `NA`
#' geretourneerd.
#' 
#' @export
#'
#' @examples
#' is_taxontype(c("Bufo bufo", "Abies", "Bufonidae", "Buf", NA), "Amphibia")
#' 
is_taxontype <- function(taxa, taxontype) {
  # ondersteuning voor afkortingen als MACEV?
  
  taxontypes <- c("Amphibia", "Birds", "Butterflies", "Diatoms", "Fish", "Macroalgae", "Macroinvertebrates", "Macrophytes", "Mammals", "Nematodes", "Phytoplankton", "Reptiles", "Zooplankton")
  
  taxontype <- stringr::str_to_sentence(taxontype)
  taxontype <- rlang::arg_match(taxontype, taxontypes)
  
  stringr::str_detect(twn_taxontype(taxa), taxontype)
}


