library(tidyverse)

bio <- read_csv2("DEV/Biologische_meetgegevens_HHSK.csv", col_types = cols(datum = col_date("%d-%m-%Y %H:%M:%S")))

bio %>% 
  HHSKwkl::add_jaar() %>% 
  filter(meetpunt == "S_0614", methodecode %in% c("VEG%", "DIAT", "MAFA"), jaar == 2014) %>% 
  group_by(meetpunt, datum, taxatype, methodecode, naam, eenheid) %>% 
  summarise(waarde = sum(waarde_stadiummeting, na.rm = TRUE)) %>% 
  rename(mp = meetpunt) %>% 
  write_csv2("inst/extdata/test_monsters.csv")

  
  


                                                