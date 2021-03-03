#' Test of een taxon een bepaald taxonlevel heeft
#'
#' @param taxa Een vector met taxonnamen
#' @param taxonlevel Het taxonlevel dat getest moet worden. Als het niet wordt opgegeven dan
#' wordt het taxonlevel op "Species gezet". Zie `twn::taxonlevels` voor alle mogelijke taxonlevels.
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

