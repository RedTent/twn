# Recursieve functie voor het opzoeken children

Recursieve functie voor het opzoeken children

## Gebruik

``` r
twn_children_rec(parent, child_tabel)
```

## Argumenten

- parent:

  De parentname: charactervector

- child_tabel:

  named vector opzoektabel voor children

## Waarde

Vector met children

## Voorbeelden

``` r
if (FALSE) { # \dontrun{

twn_children_rec("Bufonidae", 
setNames(names(opzoektabel_twn_parent), opzoektabel_twn_parent))

} # }
```
