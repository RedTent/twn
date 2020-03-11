#' Controleer of namen in de TWN voorkomen
#' 
#' Deze functies kunnen gebruikt worden om te checken of taxa in de TWN-lijst voorkomen
#' en of het taxa zijn met een valide status (10, 20 of 80).
#'
#' @param namen Een vector met taxonnamen.
#'
#' @details Deze functies checken of taxa voorkomen in de TWN-lijst en of de status 
#' valide is
#'
#'   - `is_twn`: Geeft aan of een taxonnaam in de TWN-lijst voorkomt.
#'   - `is_valid_twn`: Geeft aan of een taxonnaam in de TWN-lijst voorkomt met status
#'   10, 20 of 80.
#'
#' @return Logical 
#' @export
#' @name is_twn
#'
#' @examples
#' 
#' taxa <- c("Bufo calamita", "Bufo", "Buf", NA)
#' invalid <- "Abies veitchii 1861"
#' is_twn(taxa)
#' is_valid_twn(taxa)
#' 
#' is_twn(invalid)
#' is_valid_twn(invalid)
#' 
NULL

#' @rdname is_twn
#' @export
is_twn <- function(namen){
  namen %in% twn_lijst$taxonname
  
}

#' @rdname is_twn
#' @export
is_valid_twn <- function(namen){
  namen %in% twn_lijst$taxonname & get_twn_status(namen) %in% c("10", "20", "80")
}