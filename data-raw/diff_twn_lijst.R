library(tidyverse)
library(readxl)
library(lubridate)


twn_bestanden <- 
  tibble(twn_bestanden = list.files("data-raw/", pattern = "^TwnList")) %>% 
  mutate(datum = ymd(str_extract(twn_bestanden, "\\d{4}-\\d{2}-\\d{2}")))

twn_bestand_recent <- 
  twn_bestanden %>% 
  mutate(volgorde = rank(-as.numeric(datum))) %>% 
  filter(volgorde == 1) %>% 
  pull(twn_bestanden)

twn_bestand_vorig <- 
  twn_bestanden %>% 
  mutate(volgorde = rank(-as.numeric(datum))) %>% 
  filter(volgorde == 2) %>% 
  pull(twn_bestanden)
  

twn_nieuw <- readxl::read_excel(paste0("data-raw/", twn_bestand_recent)) %>% mutate(date = as.Date(date))

twn_vorig <- readxl::read_excel(paste0("data-raw/", twn_bestand_vorig)) %>% mutate(date = as.Date(date))

twn_nieuw %>% anti_join(twn_vorig) %>% count(taxontype)
twn_nieuw %>% anti_join(twn_vorig) %>% count(taxonlevel)
twn_nieuw %>% anti_join(twn_vorig) %>% View("diff")

