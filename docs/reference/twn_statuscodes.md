# TWN statuscodes

De TWN-lijst heeft aan ieder taxon een statuscode toegekend. De
betekenis van deze codes is opgenomen in de tabel `twn_statuscodes`

## Gebruik

``` r
twn_statuscodes
```

## Formaat

Dataframe met 2 kolommen

- `status` - TWN-statuscode

- `omschrijving`- Omschrijving van de betekenis van de statuscode

## Voorbeelden

``` r
twn_statuscodes
#> # A tibble: 6 × 2
#>   status omschrijving                         
#>   <chr>  <chr>                                
#> 1 10     Preferred name                       
#> 2 20     Synonym                              
#> 3 30     Dubious taxon concept                
#> 4 80     Non-taxonomic species group          
#> 5 91     TWN error (do not use)               
#> 6 92     Change of interpretation (do not use)
```
