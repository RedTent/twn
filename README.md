
<!-- README.md is generated from README.Rmd. Please edit that file -->

# twn

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/RedTent/twn.svg?branch=master)](https://travis-ci.org/RedTent/twn)
[![Codecov test
coverage](https://codecov.io/gh/RedTent/twn/branch/master/graph/badge.svg)](https://codecov.io/gh/RedTent/twn?branch=master)
<!-- badges: end -->

Het doel van *twn* is tweeledig.

## Installatie

De development version is te installeren van
[GitHub](https://github.com/) met:

``` r
# install.packages("devtools")
devtools::install_github("RedTent/twn")
```

## TWN lijst

`twn` bevat de complete TWN-lijst (`twn_lijst`). De datum van de
TWN-lijst wordt getoond bij het laden van de package. De datum is ook
een attribuut `twn_lijst`.

``` r
library(twn)
#> twn gebruikt de TWN-lijst van 2020-03-11

dplyr::glimpse(twn_lijst)
#> Observations: 26,627
#> Variables: 11
#> $ taxontype  <chr> "Macrophytes", "Macrophytes", "Macrophytes", "Macro...
#> $ taxonname  <chr> "Abies", "Abies alba", "Abies concolor", "Abies nor...
#> $ author     <chr> "P. Miller 1754", "C. Linnaeus 1753", "(G. Gordon e...
#> $ taxongroup <chr> "Gymnospermae", "Gymnospermae", "Angiospermae", "Gy...
#> $ taxonlevel <ord> Genus, Species, Species, Species, Species, Species,...
#> $ parentname <chr> "Pinaceae", "Abies", "Abies", "Abies", "Abies", "Ab...
#> $ refername  <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ literature <chr> "M0001", "M0001", NA, "M0001", NA, "M0001", "M0001"...
#> $ localname  <chr> NA, "Gewone zilverspar", NA, "Kaukasische zilverspa...
#> $ date       <date> 2009-09-11, 2009-12-17, 2009-12-04, 2009-12-17, 20...
#> $ status     <chr> "10", "10", "10", "10", "10", "10", "91", "10", "10...

attr(twn_lijst, "datum_twn_lijst")
#> [1] "2020-03-11"
```

## TWN controle

De functies `is_twn` en `is_valid_twn` kunnen gebruikt worden om te
controleren of taxa voorkomen in de TWN-lijst. Ook kan worden gecheckt
of ze een geldige statuscode hebben.

``` r
taxa <- c("Bufo calamita", "Bufo", "Ezel", NA)

is_twn(taxa)
#> [1]  TRUE  TRUE FALSE FALSE

# Een taxon uit de TWN met status 91 (TWN error do not use)
invalid <- "Abies veitchii 1861"

is_twn(invalid)
#> [1] TRUE
is_valid_twn(invalid)
#> [1] FALSE
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
#> 36 Levels: Subforma < Forma < Varietas < Subspecies < ... < Superimperium

# taxonlevels zijn een geordende factor. Zo is het makkelijk om 
# alles boven of onder een bepaald taxonomisch niveau te filteren.
```
