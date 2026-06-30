# Controleer of taxonnamen in de TWN voorkomen

Deze functies kunnen gebruikt worden om te checken of taxa in de
TWN-lijst voorkomen en of het taxa zijn met een valide status (10, 20 of
80).

## Gebruik

``` r
is_twn(taxa)

is_valid_twn(taxa)
```

## Argumenten

- taxa:

  Een vector met taxonnamen.

## Waarde

Logical

## Details

Deze functies checken of taxa voorkomen in de TWN-lijst en of de status
valide is

- `is_twn`: Geeft aan of een taxonnaam in de TWN-lijst voorkomt.

- `is_valid_twn`: Geeft aan of een taxonnaam in de TWN-lijst voorkomt
  met status 10, 20 of 80.

## Voorbeelden

``` r
taxa <- c("Bufo calamita", "Bufo", "Buf", NA)
invalid <- "Abies veitchii 1861"
is_twn(taxa)
#> [1]  TRUE  TRUE FALSE FALSE
is_valid_twn(taxa)
#> [1]  TRUE  TRUE FALSE FALSE

is_twn(invalid)
#> [1] TRUE
is_valid_twn(invalid)
#> [1] FALSE
```
