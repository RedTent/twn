require(tidyverse)
devtools::load_all()

voorkeurnaam_opzoeker <- 
  twn_lijst %>% 
  mutate(refername = ifelse(is.na(refername), taxonname, refername)) %>% 
  HHSKwkl::maak_opzoeker(key = taxonname, value = refername)

voorkeurnaam <- function(key){
  #recursive omdat soms de eerste voorkeurnaam ook een synoniem is
  values <- voorkeurnaam_opzoeker(key)
  if (!identical(values, key)) {
    voorkeurnaam(values)
  }
  values
}

add_taxonnaam_voorkeur <- function(df, namen_orig){
  namen_orig <- enquo(namen_orig)
  require(tidyverse)

  # aandacht voor volgorde - hoe onlogischer de stap des te verder naar onderen plaatsen
  df_new <- 
    df %>% 
    mutate(taxonnaam_voorkeur = voorkeurnaam(!!namen_orig)) %>% 
    mutate(taxonnaam_voorkeur = if_else(is.na(taxonnaam_voorkeur),
                                        voorkeurnaam(paste0(!!namen_orig, " [1]")),
                                        taxonnaam_voorkeur)) %>% 
    mutate(taxonnaam_voorkeur = if_else(is.na(taxonnaam_voorkeur),
                                        voorkeurnaam(str_remove(!!namen_orig, "ssp\\. ")),
                                        taxonnaam_voorkeur)) %>% 
    mutate(taxonnaam_voorkeur = if_else(is.na(taxonnaam_voorkeur),
                                      voorkeurnaam(str_remove(!!namen_orig, "\\(.*\\) ")),
                                      taxonnaam_voorkeur)) %>% 
    mutate(taxonnaam_voorkeur = if_else(is.na(taxonnaam_voorkeur),
                                        voorkeurnaam(str_replace(str_remove(!!namen_orig, "#"), "morphotype", "f.")),
                                        taxonnaam_voorkeur)) %>% 
    mutate(taxonnaam_voorkeur = if_else(is.na(taxonnaam_voorkeur),
                                        voorkeurnaam(str_replace(str_remove(!!namen_orig, "#"), "morphotype", "var.")),
                                        taxonnaam_voorkeur)) %>% 
    mutate(taxonnaam_voorkeur = if_else(is.na(taxonnaam_voorkeur),
                                        voorkeurnaam(str_replace(str_remove(!!namen_orig, "#"), "group", "var.")),
                                        taxonnaam_voorkeur))
  
  df_new %>% select(!!namen_orig, taxonnaam_voorkeur, everything())
  
}


test <- wew_mafa_zeldzaamheid %>% select(-taxonnaam_voorkeur)
add_taxonnaam_voorkeur(test, taxonnaam_orig)
add_taxonnaam_voorkeur(test, taxonnaam_orig) %>% filter(is.na(taxonnaam_voorkeur)) %>% View()
#add_taxonnaam_voorkeur(test, taxonnaam_orig) %>% filter(str_detect(taxonnaam_voorkeur, "\\[1\\]"))

# Voorstellen voor correctie?
# Arrenurus zachariae = zachariasi
# Limnodrilus claparedeianus = claparedianus
# Tubificoides benedeni = Tubificoides benedii

vandam <- readxl::read_excel("DEV/VanDamIndex/1994 - vDam e.a. - Neth J Aquat Ecol - Checklist diatoms tables.xls",
sheet = "Table 2")
test2 <- vandam %>% rename(taxonnaam_orig = `Taxon name`) %>% select(taxonnaam_orig)
add_taxonnaam_voorkeur(test2, taxonnaam_orig)
add_taxonnaam_voorkeur(test2, taxonnaam_orig) %>% filter(is.na(taxonnaam_voorkeur)) %>% View()
#add_taxonnaam_voorkeur(test2, taxonnaam_orig) %>% filter(str_detect(taxonnaam_voorkeur, "\\[1\\]"))

# Achnanthes peragallii = Achnanthes peragalloi