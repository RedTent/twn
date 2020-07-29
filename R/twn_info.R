#' Opzoeken van de TWN informatie
#'
#' De `twn_*` - functies zoeken informatie uit de TWN-lijst op.
#'
#' @details Deze functies accepteren een vector met taxonnamen en retourneren de
#'   betreffende informatie uit de TWN-lijst. Als de taxonnaam niet in de
#'   TWN-lijst voorkomt retourneert de functie `NA`
#'
#'   - `twn_voorkeurnaam`: Geeft de voorkeurnaam van het taxon. Als het al de
#'   voorkeurnaam is wordt de originele naam teruggegeven.
#'   - `twn_parent`: Geeft de parent van het taxon. 
#'   - `twn_status`: Geeft de status(code) van het taxon. 
#'   - `twn_localname`: Geeft de Nederlandse naam van het taxon. 
#'   - `twn_taxonlevel`: Geeft het taxonomische niveau van het taxon.
#'
#' @param taxa Een vector met taxonnamen.
#' @param code Logisch. Geeft aan of de code of de omschrijving wordt geretourneerd.
#'
#' @return Een vector met TWN-informatie. Taxonnamen die niet in de TWN worden
#'   gevonden krijgen `NA`.
#'   
#' @note De TWN-lijst is niet altijd volledig consistent. Diverse taxa staan
#'   meerdere malen in de lijst. In dat geval wordt het eerste resultaat met 
#'   de laagste statuscode geretourneerd.
#'   
#'   Als een taxon niet de voorkeurnaam is dan ontbreekt er vaak informatie 
#'   zoals de parent van het taxon. De functie `twn_parent` zoekt in dat
#'   geval de parent van de voorkeurnaam.
#'
#' @examples
#' taxa <- c("Bufo calamita", "Bufo")
#' 
#' twn_voorkeurnaam(taxa)
#' twn_parent(taxa)
#' twn_status(taxa)
#' twn_localname(taxa)
#' twn_taxonlevel(taxa)
#'
#' @name twn_info
#' @seealso Deze functies werken op basis van de tabel [twn_lijst]
#'   
NULL


#' @rdname twn_info
#' @export
twn_voorkeurnaam <- function(taxa){
  unname(fun_twn_voorkeur()[as.character(taxa)])
}

#' @rdname twn_info
#' @export
twn_parent <- function(taxa){
  unname(fun_twn_parent()[as.character(taxa)])
}

#' @rdname twn_info
#' @export
twn_status <- function(taxa, code = TRUE){
  if (code) unname(fun_twn_status()[as.character(taxa)])
  else unname(fun_twn_status_tekst()[as.character(taxa)])
}

#' @rdname twn_info
#' @export
twn_localname <- function(taxa){
  unname(fun_twn_localname()[as.character(taxa)])
}

#' @rdname twn_info
#' @export
twn_taxonlevel <- function(taxa){
  unname(fun_twn_taxonlevel()[as.character(taxa)])
}