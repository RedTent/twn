# TWN literatuurlijst

In de TWN-lijst worden de referenties naar de literatuur gegeven in
codes. In deze lijst zijn alle TWN-literatuurreferenties opgenomen.

## Gebruik

``` r
twn_literatuur
```

## Formaat

Dataframe met 3 kolommen

- `literature` - Literatuurcode conform de `twn_lijst`

- `short_reference` - Korte literatuurreferentie

- `full_reference` - Volledige literatuurreferentie

## Bron

<https://taxainfo.nl/>

## Aantekening

De centrale TWN-literatuurlijst wordt regelmatig van updates voorzien.
Deze TWN-literatuurlijst kan daarom enigszins verouderd zijn. De datum
van de gebruikte TWN-literatuurlijst is opgeslagen in het attribuut
`datum_twn_literatuur` en kan worden opgevraagd met de code
`attr(twn_literatuur, "datum_twn_literatuur")`.

## Voorbeelden

``` r
head(twn_literatuur)
#> # A tibble: 6 × 3
#>   literature short_reference                           full_reference           
#>   <chr>      <chr>                                     <chr>                    
#> 1 B0001      Sangster, G. et al. (1998)                "Sangster, G., Hazevoet,…
#> 2 D0002      Round, F.E. et al. (1990)                 "Round, F.E., Crawford, …
#> 3 D0003      Krammer, K. & Lange-Bertalot, H. (1991a)  "Krammer, K. & Lange-Ber…
#> 4 D0004      Krammer, K. & Lange-Bertalot, H. (2004b)  "Krammer, K. & Lange-Ber…
#> 5 D0005      Lange-Bertalot, H. & Krammer, K. (1989)   "Lange-Bertalot, H. & Kr…
#> 6 D0006      Lange-Bertalot, H. & Metzeltin, D. (1996) "Lange-Bertalot, H. & Me…

# de datum van de gebruikte TWN-literatuurlijst.
attr(twn_literatuur, "datum_twn_literatuur")
#> [1] "2026-06-30"

```
