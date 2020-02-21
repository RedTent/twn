# Dit bestand dient compleet uitgevoerd/gesourced te worden.
# Met dit bestand wordt de tabel `twn_lijst` en de van de TWN-lijst
# afgeleide objecten gemaakt.

library(tidyverse)
library(readxl)

# TWN-lijst ---------------------------------------------------------------

twn_orig <- readxl::read_excel("data-raw/twn/twn_lijst.xlsx") %>% mutate(date = as.Date(date))

taxonlevel_volgorde <- readr::read_csv2("data-raw/twn/volgorde_taxonlevels.csv") %>% .$taxonlevel

twn_lijst <- twn_orig %>% mutate(taxonlevel = factor(taxonlevel, levels = taxonlevel_volgorde, ordered = TRUE))

use_data(twn_lijst, overwrite = TRUE)

# opzoektabellen - internal -----------------------------------------------

### Voorkeurnaam

opzoektabel_twn_voorkeur <- 
  twn_lijst %>% 
  dplyr::arrange(status) %>% 
  dplyr::mutate(refername = ifelse(is.na(refername), taxonname, refername)) %>% 
  dplyr::select(taxonname, refername) %>% 
  dplyr::filter(!is.na(refername)) %>% 
  dplyr::distinct() %>% 
  tibble::deframe()

### Parent

#twn_parent_1 is een opzoeklijst om soorten die niet de voorkeurnaam hebben toch een parent te geven.
twn_parent_1 <- 
  twn_lijst %>% 
  dplyr::arrange(status) %>% 
  dplyr::select(taxonname, parentname) %>% 
  dplyr::distinct() %>% 
  tibble::deframe()

opzoektabel_twn_parent <- 
  twn_lijst %>% 
  dplyr::arrange(status) %>% 
  mutate(voorkeurnaam = unname(opzoektabel_twn_voorkeur[taxonname]),
         parentname = ifelse(is.na(parentname), unname(twn_parent_1[voorkeurnaam]), parentname)) %>% 
  dplyr::select(taxonname, parentname) %>% 
  dplyr::filter(!is.na(parentname)) %>% 
  dplyr::distinct() %>% 
  tibble::deframe()

### Status

opzoektabel_twn_status <- 
  twn_lijst %>% 
  dplyr::arrange(status) %>% 
  dplyr::select(taxonname, status) %>% 
  dplyr::filter(!is.na(status)) %>% 
  dplyr::distinct() %>% 
  tibble::deframe()

### Nederlandse naam

opzoektabel_twn_localname <- 
  twn_lijst %>% 
  dplyr::arrange(status) %>% 
  dplyr::select(taxonname, localname) %>% 
  dplyr::filter(!is.na(localname)) %>% 
  dplyr::distinct() %>% 
  tibble::deframe()

### Taxonlevel

opzoektabel_twn_taxonlevel <- 
  twn_lijst %>% 
  dplyr::arrange(status) %>% 
  dplyr::select(taxonname, taxonlevel) %>% 
  dplyr::filter(!is.na(taxonlevel)) %>% 
  dplyr::distinct() %>% 
  tibble::deframe()


# save in sysdata ---------------------------------------------------------
print("x")
source("data-raw/sysdata.R")

# 901.4 kb
# 765.1 kb