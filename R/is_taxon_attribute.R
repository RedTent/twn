#' Test of een taxon een bepaald attribuut heeft.
#'
#' Deze functies kijken of taxa een bepaald taxonlevel, taxontype of status hebben en 
#' retourneert een logische vector.
#'
#' @param taxa Een vector met taxonnamen
#' @param taxonlevel Het taxonlevel dat getest moet worden. Als het niet wordt opgegeven dan
#' wordt het taxonlevel op "Species gezet". Zie `twn::taxonlevels` voor alle mogelijke taxonlevels.
#' Het taxonlevel is niet hoofdlettergevoelig
#' @param taxontype Het taxontype dat getest moet worden. Zie `unique(twn_lijst$taxontype)` 
#' voor alle mogelijke taxontypes. Het taxontype is niet hoofdlettergevoelig
#' @param status De status die getest moet worden. Zie twn_statuscodes voor alle 
#' mogelijke statussen. 
#'
#' @return Een logische vector. Als een taxon ontbreekt of niet in de TWN-lijst voorkomt wordt `NA`
#' geretourneerd.
#' 
#' @name is_taxon_attribute
#' 
#' @examples
#' 
#' is_taxonlevel(c("Bufo bufo", "Bufo", "Bufonidae", "Buf", NA), "Species")
#' 
#' is_taxontype(c("Bufo bufo", "Abies", "Bufonidae", "Buf", NA), "Amphibia")
#' 
#' is_status(c("Bufo", "Bufo calamita"), 10)
#' 
NULL


#' @rdname is_taxon_attribute
#' @export
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



#' @rdname is_taxon_attribute
#' @export
is_taxontype <- function(taxa, taxontype) {
  # ondersteuning voor afkortingen als MACEV?
  
  taxontypes <- c("Amphibia", "Birds", "Butterflies", "Diatoms", "Fish", "Macroalgae", "Macroinvertebrates", "Macrophytes", "Mammals", "Nematodes", "Phytoplankton", "Reptiles", "Zooplankton")
  
  taxontype <- stringr::str_to_sentence(taxontype)
  taxontype <- rlang::arg_match(taxontype, taxontypes)
  
  stringr::str_detect(twn_taxontype(taxa), taxontype)
}


#' @rdname is_taxon_attribute
#' @export
is_status <- function(taxa, status) {
  
  status <- as.character(status)
  status <- rlang::arg_match(status, c("10", "20", "30", "80", "91", "92"))
  twn_status(taxa) == status
}



