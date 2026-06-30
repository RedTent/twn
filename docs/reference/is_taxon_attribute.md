# Test of een taxon een bepaald attribuut heeft.

Deze functies kijken of taxa een bepaald taxonlevel, taxontype of status
hebben en retourneert een logische vector.

## Gebruik

``` r
is_taxonlevel(taxa, taxonlevel = NULL)

is_taxontype(taxa, taxontype)

is_status(taxa, status)
```

## Argumenten

- taxa:

  Een vector met taxonnamen

- taxonlevel:

  Het taxonlevel dat getest moet worden. Als het niet wordt opgegeven
  dan wordt het taxonlevel op "Species gezet". Zie `twn::taxonlevels`
  voor alle mogelijke taxonlevels. Het taxonlevel is niet
  hoofdlettergevoelig

- taxontype:

  Het taxontype dat getest moet worden. Zie
  `unique(twn_lijst$taxontype)` voor alle mogelijke taxontypes. Het
  taxontype is niet hoofdlettergevoelig

- status:

  De status die getest moet worden. Zie twn_statuscodes voor alle
  mogelijke statussen.

## Waarde

Een logische vector. Als een taxon ontbreekt of niet in de TWN-lijst
voorkomt wordt `NA` geretourneerd.

## Voorbeelden

``` r
is_taxonlevel(c("Bufo bufo", "Bufo", "Bufonidae", "Buf", NA), "Species")
#> [1]  TRUE FALSE FALSE    NA    NA

is_taxontype(c("Bufo bufo", "Abies", "Bufonidae", "Buf", NA), "Amphibia")
#> [1]  TRUE FALSE  TRUE    NA    NA

is_status(c("Bufo", "Bufo calamita"), 10)
#> [1]  TRUE FALSE
```
