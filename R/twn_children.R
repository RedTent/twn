#' Vind alle 'child-taxa'
#' 
#' Deze functie kan gebruikt worden om alle child-taxa van een bepaalde parent te vinden.
#'
#' @param parent charactervector met naam (of namen) van het parenttaxon
#' @param taxonlevel Het gewenste taxonlevel van de children of `"All"` voor alle taxonlevels.
#' @param only_preferred logical. Alleen voorkeursnamen? Default is `TRUE`.
#'
#' @return EEn vector met de namen van de child-taxa
#' @export
#'
#' @examples
#' 
#' twn_children("Bufonidae")
#' twn_children("Bufonidae", taxonlevel = "Species")
#' twn_children("Bufonidae", only_preferred = FALSE)
#' 
twn_children <- function(parent,
                         taxonlevel = c("All", "Subspecies", "Species", "Genus", "Familia", "Ordo", "Classis", "Phylum"),
                         only_preferred = TRUE) {
  
  taxonlevel <- taxonlevel[[1]]
  taxonlevel_sel <- rlang::arg_match(taxonlevel, c("All", as.character(taxonlevels)))
  
  if (any(!is_twn(parent))) {
    warning(paste(crayon::red(parent[!is_twn(parent)]), "komt niet voor in de TWN-lijst", collapse = "\n  "))
    parent <- parent[is_twn(parent)]
  }
  
  if (any(taxonlevel != "All" & twn_taxonlevel(parent) < taxonlevel_sel)) {
    warning(paste(crayon::red(parent[twn_taxonlevel(parent) < taxonlevel_sel]), ": Het taxonlevel van de parent moet hoger zijn dan van de children", collapse = "\n  "))
  }
  
  child_tabel <- stats::setNames(names(opzoektabel_twn_parent), opzoektabel_twn_parent)
  
  children <- twn_children_rec(parent, child_tabel) %>% 
    unique() %>% 
    sort()
  
  if (only_preferred) children <- children[twn_status(children) == "10"]
  
  if (taxonlevel != "All") children <- children[twn_taxonlevel(children) == taxonlevel]
  
  if (length(children) == 0) return(NULL)
  
  return(children)
}


#' Recursieve functie voor het opzoeken children
#'
#' @param parent De parentname: charactervector
#' @param child_tabel named vector opzoektabel voor children
#'
#' @return Vector met children
#'
#' @examples
#' 
#' \dontrun{
#' 
#' twn_children_rec("Bufonidae", 
#' setNames(names(opzoektabel_twn_parent), opzoektabel_twn_parent))
#' 
#' }
twn_children_rec <- function(parent, child_tabel) {
  
  temp_res <- unname(child_tabel[names(child_tabel) %in% parent])
  
  if(length(temp_res) == 0) {
    return(NULL)
  } else {
    res <- c(temp_res, twn_children_rec(temp_res, child_tabel))
    return(res)
  }
}





