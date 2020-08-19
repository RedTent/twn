
<!-- README.md is generated from README.Rmd. Please edit that file -->

# twn - TWN-lijst voor R

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/RedTent/twn.svg?branch=master)](https://travis-ci.org/RedTent/twn)
[![Codecov test
coverage](https://codecov.io/gh/RedTent/twn/branch/master/graph/badge.svg)](https://codecov.io/gh/RedTent/twn?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/twn)](https://CRAN.R-project.org/package=twn)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
![Total downloads](https://cranlogs.r-pkg.org/badges/grand-total/twn)
<!-- badges: end -->

Het doel van *twn* is tweeledig. Ten eerste maakt *twn* het eenvoudig om
de TWN-lijst in R te kunnen raadplegen en gebruiken. Ten tweede heeft
*twn* diverse functies die het gemakkelijk maken om de TWN-lijst te
gebruiken bij de analyse van ecologische data.

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
#> twn gebruikt de TWN-lijst van 2020-08-11

dplyr::glimpse(twn_lijst)
#> Rows: 26,701
#> Columns: 11
#> $ taxontype  <chr> "Macrophytes", "Macrophytes", "Macrophytes", "Macrophyte...
#> $ taxonname  <chr> "Abies", "Abies alba", "Abies concolor", "Abies nordmann...
#> $ author     <chr> "P. Miller 1754", "C. Linnaeus 1753", "(G. Gordon et R. ...
#> $ taxongroup <chr> "Gymnospermae", "Gymnospermae", "Angiospermae", "Gymnosp...
#> $ taxonlevel <ord> Genus, Species, Species, Species, Species, Species, Spec...
#> $ parentname <chr> "Pinaceae", "Abies", "Abies", "Abies", "Abies", "Abies",...
#> $ refername  <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
#> $ literature <chr> "M0001", "M0001", NA, "M0001", NA, "M0001", "M0001", "I0...
#> $ localname  <chr> NA, "Gewone zilverspar", NA, "Kaukasische zilverspar", N...
#> $ date       <date> 2009-09-11, 2009-12-17, 2009-12-04, 2009-12-17, 2009-12...
#> $ status     <chr> "10", "10", "10", "10", "10", "10", "91", "10", "10", "1...

attr(twn_lijst, "datum_twn_lijst")
#> [1] "2020-08-11"
```

## TWN informatie opzoeken

De `twn_lijst` bevat de complete TWN-lijst. De twn\_info-functies
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
