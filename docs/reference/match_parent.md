# Vind een matchende parent in een referentielijst

Met deze functie is met mogelijk om van een taxon een parent in de
TWN-lijst te vinden die in een lijst met referentie-taxa voorkomt. Dit
kan bijv. nuttig zijn als het taxon een ondersoort is van een soort die
in een beoordelingssysteem voorkomt. De functie kan dan worden gebruikt
om de soortenlijst geschikt te maken voor een beoordelingssysteem.

## Gebruik

``` r
match_parent(taxa, ref_taxa, n_parents = 5, verbose = FALSE)
```

## Argumenten

- taxa:

  Een vector met taxa

- ref_taxa:

  Een vector met referentie-taxa

- n_parents:

  Het aantal parentniveau's dat gecheckt wordt. Default is 5.

- verbose:

  Als `TRUE` geeft the functie een message met de `taxa` waar geen match
  voor is.

## Waarde

Een vector met taxa die in de lijst met referentie-taxa voorkomen.

- Als de soort in de referentie-taxa wordt gevonden, dan wordt deze
  geretourneerd.

- Als de soort niet, maar wel een parent is gevonden in de lijst met
  referentie-taxa wordt deze geretourneerd.

- Als de soort of parent niet is gevonden in de lijst met
  referentie-taxa wordt `NA` geretourneerd.

## Voorbeelden

``` r
ref <- c("Bufonidae", "kameel")
namen <- c("Bufo calamita", "Bufo", "Bufonidae", "Bufo bufo", "Buf", NA, "zebra")

match_parent(namen, ref)
#> [1] "Bufonidae" "Bufonidae" "Bufonidae" "Bufonidae" NA          NA         
#> [7] NA         
```
