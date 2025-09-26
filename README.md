
<!-- README.md is generated from README.Rmd. Please edit that file -->

<img src="https://github.com/RedTent/twn/raw/master/inst/extdata/twn_hex.png" style="float:right; height:200px;padding:10px;">

# twn - TWN-lijst voor R

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/twn)](https://CRAN.R-project.org/package=twn)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
![Total downloads](https://cranlogs.r-pkg.org/badges/grand-total/twn)
<!-- werkt niet naar behoren  [![Codecov test coverage](https://codecov.io/gh/RedTent/twn/branch/master/graph/badge.svg)](https://codecov.io/gh/RedTent/twn?branch=master) -->
[![R-CMD-check](https://github.com/RedTent/twn/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/RedTent/twn/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Het doel van *twn* is tweeledig. Ten eerste maakt *twn* het eenvoudig om
de TWN-lijst in R te kunnen raadplegen en gebruiken. Ten tweede heeft
*twn* diverse functies die het gemakkelijk maken om de TWN-lijst te
gebruiken bij de analyse van ecologische data.

De website voor *twn* is te vinden op <https://redtent.github.io/twn/>

## Installatie

‘twn’ is te installeren vanaf CRAN.

``` r
install.packages("twn")
```

De ontwikkelversie is te installeren van
[GitHub](https://github.com/Redtent/twn) met:

``` r
# install.packages("devtools")
devtools::install_github("RedTent/twn")
```

## TWN lijst

*twn* bevat de complete TWN-lijst (`twn_lijst`). De datum van de
TWN-lijst wordt getoond bij het laden van de package.

``` r
library(twn)
#> twn gebruikt de TWN-lijst van 2025-09-26

dplyr::glimpse(twn_lijst)
#> Rows: 29,412
#> Columns: 11
#> $ taxontype  <chr> "Macrophytes", "Macrophytes", "Macrophytes", "Macrophytes",…
#> $ taxonname  <chr> "Abies", "Abies alba", "Abies concolor", "Abies grandis", "…
#> $ author     <chr> "P. Miller 1754", "P. Miller 1754", "(G. Gordon et R. Glend…
#> $ taxongroup <chr> "Gymnospermae", "Gymnospermae", "Gymnospermae", "Gymnosperm…
#> $ taxonlevel <ord> Genus, Species, Species, Species, Species, Species, Species…
#> $ parentname <chr> "Abieteae", "Abies", NA, "Abies", NA, "Abies", "Abies", "Ab…
#> $ refername  <chr> NA, NA, NA, NA, "Abies procera", NA, NA, NA, NA, NA, NA, NA…
#> $ literature <chr> "M0022", "M0022", NA, "M0022", NA, "M0022", "M0022", "M0022…
#> $ localname  <chr> "Zilverspar", "Gewone zilverspar", NA, "Reuzenzilverspar", …
#> $ date       <date> 2024-03-04, 2024-03-04, 2024-03-05, 2024-03-04, 2024-03-05…
#> $ status     <chr> "10", "10", "10", "10", "20", "10", "10", "10", "91", "10",…

attr(twn_lijst, "datum_twn_lijst")
#> [1] "2025-09-26"
```

## TWN informatie opzoeken

De `twn_lijst` bevat de complete TWN-lijst. De twn_info-functies
(`twn_*`) maken het makkelijk om informatie uit de TWN-lijst op te
zoeken op basis van de taxonnaam.

``` r
twn_status(c("Bufo calamita", "Bufo bufo"))
#> [1] "20" "10"

twn_voorkeurnaam(c("Bufo calamita", "Bufo bufo"))
#> [1] "Epidalea calamita" "Bufo bufo"

twn_parent(c("Bufo calamita", "Bufo bufo"))
#> [1] "Epidalea" "Bufo"

twn_localname(c("Bufo calamita", "Bufo bufo"))
#> [1] "Rugstreeppad" "Gewone pad"

twn_taxonlevel(c("Bufo calamita", "Bufo bufo"))
#> [1] Species Species
#> 36 Levels: Subforma < Forma < Varietas < Subspecies < Cultivar < ... < Superimperium

twn_taxontype(c("Bufo calamita", "Bufo bufo"))
#> [1] "Amphibia" "Amphibia"

# taxonlevels zijn een geordende factor. Zo is het makkelijk om 
# alles boven of onder een bepaald taxonomisch niveau te filteren.
```

## TWN controle

De functies `is_twn` en `is_valid_twn` kunnen gebruikt worden om te
controleren of taxa voorkomen in de TWN-lijst. Ook kan worden gecheckt
of ze een geldige statuscode hebben.

``` r
taxa <- c("Bufo calamita", "Bufo bufo", "Bufo", "Ezel", NA)

is_twn(taxa)
#> [1]  TRUE  TRUE  TRUE FALSE FALSE

# Een taxon uit de TWN met status 91 (TWN error do not use)
invalid <- "Abies veitchii 1861"

is_twn(invalid)
#> [1] TRUE
is_valid_twn(invalid)
#> [1] FALSE
```

Naast de controle is het mogelijk om te controleren op verschillende
eigenschappen van elk taxon zoals het taxontype, het taxonlevel en de
status.

``` r
is_taxontype(c("Bufo bufo", "Abies"), "Amphibia")
#> [1]  TRUE FALSE
is_taxonlevel(c("Bufo bufo", "Bufo"), "Species")
#> [1]  TRUE FALSE
is_status(c("Bufo bufo", "Bufo calamita"), "10")
#> [1]  TRUE FALSE
```

## Hogere taxonlevels

In sommige gevallen is het handig om soorten te aggregeren naar hogere
taxonlevels. *twn* heeft twee functies die hierbij kunnen helpen:
`increase_taxonlevel` aggregeert naar een gespecificeerd niveau,
`match_parent` aggreggeert o.b.v. een referentielijst. Deze laatste
functie is nuttig om soortenlijsten te kunnen matchen. Dit is handig bij
het gebruik van ecologische maatlatten en autecologische data.

``` r
taxa <- c("Bufo calamita", "Bufo bufo", "Bufo", "Ezel", NA)
referentie_taxa <- c("Bufonidae", "Epidalea")

increase_taxonlevel(taxa, "Familia")
#> [1] "Bufonidae" "Bufonidae" "Bufonidae" "Ezel"      NA

match_parent(taxa = taxa, ref_taxa = referentie_taxa)
#> [1] "Epidalea"  "Bufonidae" "Bufonidae" NA          NA
```

## Onderliggende taxa

Soms kan het handig zijn om eeen overzicht te maken van de taxa die
onder een bepaald ’parent’taxon aanwezig zijn. Dit kan worden gedaan met
de functie `twn_children`.

``` r
# Welke taxa vallen er onder de familie van de kranswieren (Characeae)?
twn_children("Characeae")
#>  [1] "Chara"                              "Chara aculeolata"                  
#>  [3] "Chara aspera"                       "Chara aspera var. aspera"          
#>  [5] "Chara baltica"                      "Chara canescens"                   
#>  [7] "Chara connivens"                    "Chara contraria"                   
#>  [9] "Chara contraria var. contraria"     "Chara contraria var. hispidula"    
#> [11] "Chara globularis"                   "Chara globularis var. globularis"  
#> [13] "Chara gymnophylla"                  "Chara hispida"                     
#> [15] "Chara hispida var. hispida"         "Chara intermedia"                  
#> [17] "Chara pedunculata"                  "Chara virgata"                     
#> [19] "Chara vulgaris"                     "Chara vulgaris var. longibracteata"
#> [21] "Chara vulgaris var. papillata"      "Chara vulgaris var. vulgaris"      
#> [23] "Nitella"                            "Nitella capillaris"                
#> [25] "Nitella flexilis"                   "Nitella flexilis var. flexilis"    
#> [27] "Nitella gracilis"                   "Nitella hyalina"                   
#> [29] "Nitella mucronata"                  "Nitella mucronata var. gracillima" 
#> [31] "Nitella mucronata var. mucronata"   "Nitella opaca"                     
#> [33] "Nitella syncarpa"                   "Nitella tenuissima"                
#> [35] "Nitella translucens"                "Nitellopsis"                       
#> [37] "Nitellopsis obtusa"                 "Tolypella"                         
#> [39] "Tolypella glomerata"                "Tolypella intricata"               
#> [41] "Tolypella prolifera"
```

## Lees meer

In de vignette *twn als hulp bij KRW-beoordeling* kun je meer lezen over
hoe je *twn* in de praktijk kunt gebruiken. Gebruik hiervoor
`vignette("krw_beoordeling")`.
