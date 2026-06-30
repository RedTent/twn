# Opzoeken van de TWN informatie

De `twn_*` - functies zoeken informatie uit de TWN-lijst op.

## Gebruik

``` r
twn_voorkeurnaam(taxa)

twn_refername(taxa)

twn_parent(taxa)

twn_ouder(taxa)

twn_status(taxa, code = TRUE)

twn_localname(taxa)

twn_nednaam(taxa)

twn_taxonlevel(taxa)

twn_taxonniveau(taxa)

twn_taxontype(taxa)

twn_datum(taxa)

twn_date(taxa)
```

## Argumenten

- taxa:

  Een vector met taxonnamen.

- code:

  Logisch. Geeft aan of de code of de omschrijving wordt geretourneerd.

## Waarde

Een vector met TWN-informatie. Taxonnamen die niet in de TWN worden
gevonden krijgen `NA`.

## Details

Deze functies accepteren een vector met taxonnamen en retourneren de
betreffende informatie uit de TWN-lijst. Als de taxonnaam niet in de
TWN-lijst voorkomt retourneert de functie `NA`.

- `twn_voorkeurnaam()`: Geeft de voorkeurnaam van het taxon. Als het al
  de voorkeurnaam is wordt de originele naam teruggegeven.

- `twn_refername()`: Alias voor `twn_voorkeurnaam()`.

- `twn_parent()`: Geeft de parent van het taxon.

- `twn_ouder()`: Alias voor `twn_parent()`.

- `twn_status()`: Geeft de status(code) van het taxon.

- `twn_localname()`: Geeft de Nederlandse naam van het taxon.

- `twn_nednaam()`: Alias voor `twn_localname()`.

- `twn_taxonlevel()`: Geeft het taxonomische niveau van het taxon.

- `twn_taxonniveau()`: Alias voor `twn_taxonlevel()`

- `twn_taxontype()`: Geeft het taxontype van het taxon.

- `twn_datum()`: Geeft de datum meest recente wijziging van het taxon.

- `twn_date()`: Alias voor `twn_datum()`.

## Aantekening

De TWN-lijst is niet altijd volledig consistent. Diverse taxa staan
meerdere malen in de lijst. In dat geval wordt het eerste resultaat met
de laagste statuscode geretourneerd.

NB sommige taxa hebben meer dan 1 taxontype. In dat geval zijn de
taxontypen gecombineerd in een string in alfabetische volgorde
gescheiden door een spaties.

Als een taxon niet de voorkeurnaam is dan ontbreekt er vaak informatie
zoals de parent van het taxon. De functie `twn_parent` zoekt in dat
geval de parent van de voorkeurnaam.

## Zie ook

Deze functies werken op basis van de tabel
[twn_lijst](https://redtent.github.io/twn/reference/twn_lijst.md)

## Voorbeelden

``` r
taxa <- c("Bufo calamita", "Bufo")

twn_voorkeurnaam(taxa)
#> [1] "Epidalea calamita" "Bufo"             
twn_parent(taxa)
#> [1] "Epidalea"  "Bufonidae"
twn_status(taxa)
#> [1] "20" "10"
twn_localname(taxa)
#> [1] "Rugstreeppad" NA            
twn_taxonlevel(taxa)
#> [1] Species Genus  
#> 36 Levels: Subforma < Forma < Varietas < Subspecies < Cultivar < ... < Superimperium
twn_taxontype(taxa)
#> [1] "Amphibia" "Amphibia"
twn_datum(taxa)
#> [1] "2019-01-22" "2008-11-25"
```
