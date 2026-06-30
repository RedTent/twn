# Verhoog het taxonomische niveau

Voor sommige toepassingen kan het nuttig zijn om taxonomische gegevens
op een hoger niveau dan het oorspronkelijke niveau te analyseren. Deze
functie probeert de taxa op te schalen naar het gewenste taxonomische
niveau.

## Gebruik

``` r
increase_taxonlevel(
  taxa,
  taxonlevel = c("Species", "Genus", "Familia", "Ordo", "Classis", "Phylum", "Regnum",
    "Imperium"),
  only_twn = FALSE
)
```

## Argumenten

- taxa:

  Een vector met taxonnamen.

- taxonlevel:

  Het gewenste taxonomische niveau. De namen van de taxonomische
  niveau's zijn zoals deze in de TWN-lijst worden gebruikt (Species,
  Genus, enz.).

- only_twn:

  Logical. Indien FALSE worden taxa die niet in de TWN-lijst voorkomen
  genegeerd. Indien TRUE dan worden alleen taxa uit de TWN-lijst
  geretoureerd.

## Waarde

Een vector met taxonnamen.

## Details

De functie probeert de taxonnamen op te schalen naar het gespecificeerde
taxonomische niveau. Dit is echter om diverse redenen niet altijd
mogelijk. Als dat niet mogelijk is dan zijn er meerdere resultaten
mogelijk.

- Het taxonomisch niveau van het taxon is al hoger dan het gevraagde
  niveau -het originele taxon wordt geretourneerd.

- Het taxon komt niet voor in de TWN-lijst

  - het originele taxon wordt geretourneerd (tenzij `only_twn = TRUE`)

- Het taxon heeft in de TWN-lijst geen parent op het gevraagde niveau

  - het taxon wat het dichtst onder het gevraagde niveau zit wordt
    geretourneerd.

- De taxonnaam heeft de waarde `NA`

  - De waarde `NA` wordt geretourneerd.

## Voorbeelden

``` r
taxa <- c("Bufo calamita", "Bufo", "Buf", NA)

increase_taxonlevel(taxa, "Familia")
#> [1] "Bufonidae" "Bufonidae" "Buf"       NA         
increase_taxonlevel(taxa, "Familia", only_twn = TRUE)
#> [1] "Bufonidae" "Bufonidae" NA          NA         
```
