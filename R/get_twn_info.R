#' Opzoeken van de TWN informatie
#'
#' De `get_twn_*`-functies zoeken informatie uit de TWN-lijst op.
#'
#' @details Deze functies accepteren een vector met taxonnamen en retourneren de
#'   betreffende informatie uit de TWN-lijst. Als de taxonnaam niet in de
#'   TWN-lijst voorkomt retourneert de functie `NA`
#'
#'   - `get_twn_voorkeurnaam`: Geeft de voorkeurnaam van het taxon. Als het al de
#'   voorkeurnaam is wordt de originele naam teruggegeven.
#'   - `get_twn_parent`: Geeft de parent van het taxon. 
#'   - `get_twn_status`: Geeft de status van het taxon. 
#'   - `get_twn_localname`: Geeft de Nederlandse naam van het taxon. 
#'   - `get_twn_taxonlevel`: Geeft het taxonlevel van het taxon.
#'
#' @param namen Een vector met taxonnamen.
#'
#' @return Een vector met TWN-informatie. Namen die niet in de TWN worden
#'   gevonden krijgen `NA`.
#'   
#' @note De TWN-lijst is niet altijd volledig consistent. Diverse taxa staan
#'   meerdere malen in de lijst. In dat geval wordt het eerste resultaat
#'   geretourneerd.
#'   
#'   Als een taxon niet de voorkeurnaam is dan ontbreekt er vaak informatie 
#'   zoals de parent van het taxon. De functie `get_twn_parent` zoekt in dat
#'   geval de parent van de voorkeurnaam.
#'
#' @examples
#' get_twn_voorkeurnaam(c("Bufo calamita", "Bufo"))
#' get_twn_parent(c("Bufo calamita", "Bufo"))
#' get_twn_status(c("Bufo calamita", "Bufo"))
#' get_twn_localname(c("Bufo calamita", "Bufo"))
#' get_twn_taxonlevel(c("Bufo calamita", "Bufo"))
#'
#' @name twn_info
#' @seealso Deze functies werken op basis van de tabel [twn_lijst]
#'   
NULL


#' @rdname twn_info
#' @export
get_twn_voorkeurnaam <- function(namen){
  unname(opzoektabel_twn_voorkeur[as.character(namen)])
}

#' @rdname twn_info
#' @export
get_twn_parent <- function(namen){
  unname(opzoektabel_twn_parent[as.character(namen)])
}

#' @rdname twn_info
#' @export
get_twn_status <- function(namen){
  unname(opzoektabel_twn_status[as.character(namen)])
}

#' @rdname twn_info
#' @export
get_twn_localname <- function(namen){
  unname(opzoektabel_twn_localname[as.character(namen)])
}

#' @rdname twn_info
#' @export
get_twn_taxonlevel <- function(namen){
  unname(opzoektabel_twn_taxonlevel[as.character(namen)])
}