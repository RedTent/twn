# Taxa Waterbeheer Nederland (TWN)

De TWN-lijst bevat de standaardlijst met namen van taxa zoals deze
worden gebruikt binnen het Nederlandse waterbeheer. Deze dataset bevat
de complete TWN-lijst zoals deze aangeboden wordt op
<https://taxainfo.nl/>.

## Gebruik

``` r
twn_lijst
```

## Formaat

Dataframe met 12 kolommen

- `taxontype` - Het type taxon bijv Macrophytes

- `taxonname` - Naam van het taxon

- `author` - Auteur die het taxon beschreven heeft

- `taxongroup` - Taxonomische groep binnen het taxon

- `taxonlevel` - Het taxonomische niveau van het taxon - geordende
  factor.

- `parentname` - Naam van het ouder taxon

- `refername` - Voorkeursnaam - alleen voor taxa met status 20

- `literature` - Literatuurverwijzing naar de beschrijving van het taxon

- `localname` - Nederlandse naam indien beschikbaar

- `date` - Datum van toevoegen aan of wijzigen in TWN

- `status` - Statuscode van het taxon.

  - `10` - Voorkeursnaam

  - `20` - Synoniem

  - `30` - Dubieus taxonconcept

  - `80` - Niet-taxonomische soortgroep

  - `91` - TWN-fout - Niet gebruiken

  - `92` - Verandering van interpretatie - Niet gebruiken

## Bron

<https://taxainfo.nl/>

## Aantekening

De centrale TWN-lijst wordt regelmatig van updates voorzien. Deze
TWN-lijst kan daarom enigszins verouderd zijn. De datum van de gebruikte
TWN-lijst is opgeslagen in het attribuut `datum_twn_lijst` en kan worden
opgevraagd met de code `attr(twn_lijst, "datum_twn_lijst")`.

De auteursnamen bevatten veel non-ASCII-tekens. Deze zijn geconverteerd
naar het format uxxxx. De originele tekens kunnen verkregen worden met
de functie
[`stringi::stri_unescape_unicode()`](https://rdrr.io/pkg/stringi/man/stri_unescape_unicode.html)

De volgorde van de taxonlevels is op detailniveau (met name lager dan
genus) soms enigszins arbitrair. Is een Cultivar bijv. een hoger niveau
dan een Subspecies? Toch is er voor gekozen om de taxonlevels op te
nemen als een geordende factor omdat dit nuttig kan zijn o.a. bij het
filteren van de lijst.

## Voorbeelden

``` r
head(twn_lijst)
#> # A tibble: 6 × 11
#>   taxontype   taxonname        author taxongroup taxonlevel parentname refername
#>   <chr>       <chr>            <chr>  <chr>      <ord>      <chr>      <chr>    
#> 1 Macrophytes Abies            "P. M… Gymnosper… Genus      Abieteae   NA       
#> 2 Macrophytes Abies alba       "P. M… Gymnosper… Species    Abies      NA       
#> 3 Macrophytes Abies concolor   "(G. … Gymnosper… Species    NA         NA       
#> 4 Macrophytes Abies grandis    "(D. … Gymnosper… Species    Abies      NA       
#> 5 Macrophytes Abies nobilis    "(D. … Gymnosper… Species    NA         Abies pr…
#> 6 Macrophytes Abies nordmanni… "(C. … Gymnosper… Species    Abies      NA       
#> # ℹ 4 more variables: literature <chr>, localname <chr>, date <date>,
#> #   status <chr>

# de datum van de gebruikte TWN-lijst.
attr(twn_lijst, "datum_twn_lijst")
#> [1] "2026-06-30"
```
