#' Functies die opzoeklijsten maken
#' 
#' Deze functies maken gebruik van de TWN-lijst en memoise om opzoeklijsten te maken t.b.v de 
#' twn_info-functies. Uitsluitend voor intern gebruik
#' 
#' @name opzoeklijsten
#' 
#' 
NULL



#' @rdname opzoeklijsten
fun_twn_voorkeur <- memoise::memoise(
  function() {
    twn_lijst %>% 
      dplyr::arrange(status) %>% 
      dplyr::mutate(refername = ifelse(is.na(refername), taxonname, refername)) %>% 
      dplyr::select(taxonname, refername) %>% 
      dplyr::filter(!is.na(refername)) %>% 
      dplyr::distinct() %>% 
      tibble::deframe()
  })

#' @rdname opzoeklijsten
fun_twn_parent <- memoise::memoise(
  function() {
    #twn_parent_1 is een opzoeklijst om soorten die niet de voorkeurnaam hebben toch een parent te geven.
    twn_parent_1 <- 
      twn_lijst %>% 
      dplyr::arrange(status) %>% 
      dplyr::select(taxonname, parentname) %>% 
      dplyr::distinct() %>% 
      tibble::deframe()
    
    opzoektabel_twn_voorkeur <- fun_twn_voorkeur()
    
    twn_lijst %>% 
      dplyr::arrange(status) %>% 
      dplyr::mutate(voorkeurnaam = unname(opzoektabel_twn_voorkeur[taxonname]),
             parentname = ifelse(is.na(parentname), unname(twn_parent_1[voorkeurnaam]), parentname)) %>% 
      dplyr::select(taxonname, parentname) %>% 
      dplyr::filter(!is.na(parentname)) %>% 
      dplyr::distinct() %>% 
      tibble::deframe()
  })


### Status 

#' @rdname opzoeklijsten
fun_twn_status <- memoise::memoise(
  function() {
    twn_lijst %>%
      dplyr::arrange(status) %>%
      dplyr::select(taxonname, status) %>%
      dplyr::filter(!is.na(status)) %>%
      dplyr::distinct() %>%
      tibble::deframe()
  })

#' @rdname opzoeklijsten
fun_twn_status_tekst <- memoise::memoise(
  function() {
    twn_lijst %>%
      dplyr::arrange(status) %>%
      dplyr::left_join(twn_statuscodes, by = "status") %>% 
      dplyr::select(taxonname, omschrijving) %>%
      dplyr::filter(!is.na(omschrijving)) %>%
      dplyr::distinct() %>%
      tibble::deframe()
  })

### Nederlandse naam

#' @rdname opzoeklijsten
fun_twn_localname <- memoise::memoise(
  function() {
    twn_lijst %>%
      dplyr::arrange(status) %>%
      dplyr::select(taxonname, localname) %>%
      dplyr::filter(!is.na(localname)) %>%
      dplyr::distinct() %>%
      tibble::deframe()
  })

### Taxonlevel

#' @rdname opzoeklijsten
fun_twn_taxonlevel <- memoise::memoise(
  function() {
    twn_lijst %>%
      dplyr::arrange(status) %>%
      dplyr::select(taxonname, taxonlevel) %>%
      dplyr::filter(!is.na(taxonlevel)) %>%
      dplyr::distinct() %>%
      tibble::deframe()
  })




