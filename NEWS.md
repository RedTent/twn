# twn 0.2.2

# twn 0.2.1




## Wijzigingen

- Nieuwe TWN-lijst en nieuwe literatuurlijst (27-11-2021)
- Vignette "twn als hulp bij KRW-beoordeling" toegevoegd.
- `increase_taxonlevel` heeft een extra argument `only_twn` gekregen.

## Bugfixes

- is_twn() werkt nu ook zonder twn te laden (#8)

## TODO

- Checken wat er gebeurd bij afwijkende datatypen en evt tests schrijven (iig factor)

# twn 0.2.0

## Nieuw

- `twn_taxontype()` toegevoegd om het taxontype op te vragen. (NB sommige taxa hebben meer dan 1 taxontype)
- `twn_children()` functie om alle child-taxa van een bepaalde parent te vinden.
- `is_taxonlevel()`, `is_taxontype()` en `is_status` toegevoegd. Functies om te checken of taxa een bepaald(e) taxonlevel, taxontype of status hebben.

## Wijzigingen

- Nieuwe TWN-lijst (17-3-2021) 43 wijzigingen t.o.v. de vorige versie.

## TODO

- `twn_synonyms`
- `has_parent` `has_child`

# twn 0.1.1


## Wijzigingen

- Nieuwe TWN-lijst en literatuurlijst (28-10-2020)
- Memoise wordt niet meer gebruikt achter de schermen.

## Bugfixes

- Issue opgelost waarbij functies niet werkten als het package niet geladen was. [Issue #1](https://github.com/RedTent/twn/issues/1#issue-682498150)
- Unicodetekst wordt ge-escaped (bijzondere tekens in auteursnamen)

# twn 0.1.0

First release on CRAN

# twn 0.0.0.9000

- Nieuwe TWN-lijst (2020-07-25)
- De functies `get_twn_*()` om snel TWN-informatie over taxa op te vragen.
- De functie `find_matching_parent()` om taxa naar parent te vertalen uit een referentielijst. Dit is nuttig om taxa te koppelen aan andere informatiebronnen als in de andere bron bijv. alleen de soort voorkomt, maar niet de ondersoorten.
- functies `is_twn` en `is_valid_twn` om te controleren of soorten in de TWN voorkomen.
- functie `increase_taxonlevel` om te aggregeren naar hogere taxonomische niveau's.
- TWN-literatuurlijst toegevoegd (2020-07-25).

**Wensen**

- Recursief gebruik van opzoeklijsten om alle hogere parents te vinden.



