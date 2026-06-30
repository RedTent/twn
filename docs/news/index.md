# Wijzigingslogboek

## twn 0.2.7

## twn 0.2.6

CRAN uitgave: 2025-09-26

- Nieuwe TWN-lijst en literatuurlijst (26-09-2025)
- [`twn_datum()`](https://redtent.github.io/twn/reference/twn_info.md)
  toegevoegd voor de meest recente TWN-wijzigingsdatum van het taxon.
  ([\#5](https://github.com/RedTent/twn/issues/5))
- aliassen toegevoegd voor bestaande twn_info functies:
  [`twn_refername()`](https://redtent.github.io/twn/reference/twn_info.md),
  [`twn_ouder()`](https://redtent.github.io/twn/reference/twn_info.md),
  [`twn_nednaam()`](https://redtent.github.io/twn/reference/twn_info.md),
  [`twn_date()`](https://redtent.github.io/twn/reference/twn_info.md),
  [`twn_taxonniveau()`](https://redtent.github.io/twn/reference/twn_info.md).

## twn 0.2.5

CRAN uitgave: 2024-11-11

- Nieuwe TWN-lijst en literatuurlijst (11-11-2024)

## twn 0.2.4

CRAN uitgave: 2023-06-20

- Nieuwe TWN-lijst en literatuurlijst (20-06-2023)

NB de vorige versie van de TWN-lijst had een grote hoeveelheid verkeerde
datums.

## twn 0.2.3

CRAN uitgave: 2022-11-16

- Nieuwe TWN-lijst en literatuurlijst (15-11-2022)

## twn 0.2.2

CRAN uitgave: 2022-04-27

## twn 0.2.1

CRAN uitgave: 2021-11-27

### Wijzigingen

- Nieuwe TWN-lijst en nieuwe literatuurlijst (27-11-2021)
- Vignette “twn als hulp bij KRW-beoordeling” toegevoegd.
- `increase_taxonlevel` heeft een extra argument `only_twn` gekregen.

### Bugfixes

- is_twn() werkt nu ook zonder twn te laden
  ([\#8](https://github.com/RedTent/twn/issues/8))

### TODO

- Checken wat er gebeurd bij afwijkende datatypen en evt tests schrijven
  (iig factor)

## twn 0.2.0

CRAN uitgave: 2021-03-21

### Nieuw

- [`twn_taxontype()`](https://redtent.github.io/twn/reference/twn_info.md)
  toegevoegd om het taxontype op te vragen. (NB sommige taxa hebben meer
  dan 1 taxontype)
- [`twn_children()`](https://redtent.github.io/twn/reference/twn_children.md)
  functie om alle child-taxa van een bepaalde parent te vinden.
- [`is_taxonlevel()`](https://redtent.github.io/twn/reference/is_taxon_attribute.md),
  [`is_taxontype()`](https://redtent.github.io/twn/reference/is_taxon_attribute.md)
  en `is_status` toegevoegd. Functies om te checken of taxa een
  bepaald(e) taxonlevel, taxontype of status hebben.

### Wijzigingen

- Nieuwe TWN-lijst (17-3-2021) 43 wijzigingen t.o.v. de vorige versie.

### TODO

- `twn_synonyms`
- `has_parent` `has_child`

## twn 0.1.1

CRAN uitgave: 2020-10-29

### Wijzigingen

- Nieuwe TWN-lijst en literatuurlijst (28-10-2020)
- Memoise wordt niet meer gebruikt achter de schermen.

### Bugfixes

- Issue opgelost waarbij functies niet werkten als het package niet
  geladen was.
  [Issue](https://github.com/RedTent/twn/issues/1#issue-682498150)
  [\#1](https://github.com/RedTent/twn/issues/1)
- Unicodetekst wordt ge-escaped (bijzondere tekens in auteursnamen)

## twn 0.1.0

CRAN uitgave: 2020-08-18

First release on CRAN

## twn 0.0.0.9000

- Nieuwe TWN-lijst (2020-07-25)
- De functies `get_twn_*()` om snel TWN-informatie over taxa op te
  vragen.
- De functie `find_matching_parent()` om taxa naar parent te vertalen
  uit een referentielijst. Dit is nuttig om taxa te koppelen aan andere
  informatiebronnen als in de andere bron bijv. alleen de soort
  voorkomt, maar niet de ondersoorten.
- functies `is_twn` en `is_valid_twn` om te controleren of soorten in de
  TWN voorkomen.
- functie `increase_taxonlevel` om te aggregeren naar hogere
  taxonomische niveau’s.
- TWN-literatuurlijst toegevoegd (2020-07-25).

**Wensen**

- Recursief gebruik van opzoeklijsten om alle hogere parents te vinden.
