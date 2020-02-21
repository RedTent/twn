#' Taxa Waterbeheer Nederland (TWN)
#' 
#' De TWN-lijst bevat de standaardlijst met namen van taxa zoals deze worden gebruikt binnen het 
#' Nederlandse waterbeheer. Deze dataset bevat de complete TWN-lijst zoals deze aangeboden wordt 
#' op [https://twnlist.aquadesk.nl/](https://twnlist.aquadesk.nl/)
#' 
#' @format 
#' 
#' Dataframe met 12 kolommen
#' 
#'- `taxontype`  - Het type taxon bijv Macrophytes
#'- `taxonname`  - Naam van het taxon
#'- `author`     - Auteur die het taxon beschreven heeft
#'- `taxongroup` - Taxonomische groep binnen het taxon
#'- `taxonlevel` - Het taxonomische niveau van het taxon - geordende factor.
#'- `parentname` - Naam van het ouder taxon
#'- `refername`  - Voorkeursnaam - alleen voor taxa met status 20
#'- `literature` - Literatuurverwijzing naar de beschrijving van het taxon
#'- `localname`  - Nederlandse naam indien beschikbaar
#'- `date`       - Datum van toevoegen aan of wijzigen in TWN
#'- `status`     - Statuscode van het taxon. 
#'    - `10` - Voorkeursnaam
#'    - `20` - Synoniem
#'    - `30` - Dubieus taxonconcept
#'    - `80` - Niet-taxonomische soortgroep
#'    - `91` - TWN-fout - Niet gebruiken
#'    - `92` - Verandering van interpretatie - Niet gebruiken
#' 
#' @note De TWN-lijst wordt regelmatig van updates voorzien. Deze TWN-lijst kan daarom enigszins verouderd zijn. 
#' De datum van de gebruikte TWN-lijst kan worden opgevraagd met de code `attr(twn_lijst, "datum_twn_lijst")`.
#' 
#' De volgorde van de taxonlevels is op detailniveau (met name lager dan genus) soms enigszins arbitrair. 
#' Is een Cultivar bijv. een hoger niveau dan een Subspecies? Toch is er voor gekozen om de taxonlevels 
#' op te nemen als een geordende factor omdat dit nuttig kan zijn o.a. bij het filteren van de lijst.
#' 
#' 
#' 
#' @source 
#' [https://twnlist.aquadesk.nl/](https://twnlist.aquadesk.nl/)
#' 
#'
#' @examples 
#' 
#' head(twn_lijst)
#' 
#' # de datum van de gebruikte TWN-lijst.
#' attr(twn_lijst, "datum_twn_lijst")
"twn_lijst"









