# twn (development version)

## Bugfixes

- Issue opgelost waarbij functies niet werkten als het package niet geladen was. [Issue #1](https://github.com/RedTent/twn/issues/1#issue-682498150)

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



