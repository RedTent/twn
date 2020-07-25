# Dit bestand dient compleet uitgevoerd/gesourced te worden.
# Met dit bestand wordt de tabel `twn_lijst` en de van de TWN-lijst
# afgeleide objecten gemaakt.

library(tidyverse)
library(readxl)
library(lubridate)

twn_bestanden <- 
  tibble(twn_bestanden = list.files("data-raw/", pattern = "^TwnList")) %>% 
  mutate(datum = ymd(str_extract(twn_bestanden, "\\d{4}-\\d{2}-\\d{2}")))

twn_bestand_recent <- twn_bestanden %>% 
  filter(datum == max(datum, na.rm = TRUE)) %>% 
  pull(twn_bestanden)

datum_twn_bestand_recent <- twn_bestanden %>% 
  filter(datum == max(datum, na.rm = TRUE)) %>% 
  pull(datum)

twn_lit_bestanden <- 
  tibble(twn_bestanden = list.files("data-raw/", pattern = "^TWN literature")) %>% 
  mutate(datum = ymd(str_extract(twn_bestanden, "\\d{4}-\\d{2}-\\d{2}")))

twn_lit_recent <- twn_lit_bestanden %>% 
  filter(datum == max(datum, na.rm = TRUE)) %>% 
  pull(twn_bestanden)

datum_twn_lit_recent <- twn_lit_bestanden %>% 
  filter(datum == max(datum, na.rm = TRUE)) %>% 
  pull(datum)

# TWN-lijst ---------------------------------------------------------------

twn_orig <- readxl::read_excel(paste0("data-raw/", twn_bestand_recent)) %>% mutate(date = as.Date(date))

taxonlevel_volgorde <- readr::read_csv2("data-raw/volgorde_taxonlevels.csv") %>% .$taxonlevel

twn_lijst <- twn_orig %>% mutate(taxonlevel = factor(taxonlevel, levels = taxonlevel_volgorde, ordered = TRUE))
attr(twn_lijst, "datum_twn_lijst") <- datum_twn_bestand_recent

usethis::use_data(twn_lijst, overwrite = TRUE)


# TWN literatuur ----------------------------------------------------------

twn_literatuur <- readxl::read_excel(paste0("data-raw/", twn_lit_recent)) %>% 
  dplyr::rename(literature = `Taxabase code`, 
                short_reference = `Short reference`, 
                full_reference = `Reference literature`)
attr(twn_literatuur, "datum_twn_literatuur") <- datum_twn_lit_recent

usethis::use_data(twn_literatuur, overwrite = TRUE)

# Statuscodes -------------------------------------------------------------------

twn_statuscodes <- 
  tibble::tribble(
      ~status,                           ~omschrijving,
           "10",                        "Preferred name",
           "20",                               "Synonym",
           "30",                 "Dubious taxon concept",
           "80",           "Non-taxonomic species group",
           "91",                "TWN error (do not use)",
           "92", "Change of interpretation (do not use)"
  )

usethis::use_data(twn_statuscodes, overwrite = TRUE)

# internals -----------------------------------------------

taxonlevels <- factor(taxonlevel_volgorde, levels = taxonlevel_volgorde, ordered = TRUE)

# save in sysdata ---------------------------------------------------------
print("x")
# Het gebruik van sysdata.R borgt dat er geen interne bestanden verloren gaan.
source("data-raw/sysdata.R")
