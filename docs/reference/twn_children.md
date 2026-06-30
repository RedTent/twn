# Vind alle 'child-taxa'

Deze functie kan gebruikt worden om alle child-taxa van een bepaalde
parent te vinden.

## Gebruik

``` r
twn_children(
  parent,
  taxonlevel = c("All", "Subspecies", "Species", "Genus", "Familia", "Ordo", "Classis",
    "Phylum"),
  only_preferred = TRUE
)
```

## Argumenten

- parent:

  charactervector met naam (of namen) van het parenttaxon

- taxonlevel:

  Het gewenste taxonlevel van de children of `"All"` voor alle
  taxonlevels.

- only_preferred:

  logical. Alleen voorkeursnamen? Default is `TRUE`.

## Waarde

EEn vector met de namen van de child-taxa

## Voorbeelden

``` r
twn_children("Bufonidae")
#> [1] "Bufo"              "Bufo bufo"         "Epidalea"         
#> [4] "Epidalea calamita"
twn_children("Bufonidae", taxonlevel = "Species")
#> [1] "Bufo bufo"         "Epidalea calamita"
twn_children("Bufonidae", only_preferred = FALSE)
#> [1] "Bufo"              "Bufo bufo"         "Bufo calamita"    
#> [4] "Epidalea"          "Epidalea calamita"
```
