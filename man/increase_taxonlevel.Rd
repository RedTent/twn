% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/increase_taxonlevel.R
\name{increase_taxonlevel}
\alias{increase_taxonlevel}
\title{Verhoog het taxonomische niveau}
\usage{
increase_taxonlevel(
  taxa,
  taxonlevel = c("Species", "Genus", "Familia", "Ordo", "Classis", "Phylum", "Regnum",
    "Imperium")
)
}
\arguments{
\item{taxa}{Een vector met taxonnamen.}

\item{taxonlevel}{Het gewenste taxonomische niveau. De namen van de taxonomische niveau's zijn
zoals deze in de TWN-lijst worden gebruikt (Species, Genus, enz.).}
}
\value{
Een vector met taxonnamen.
}
\description{
Voor sommige toepassingen kan het nuttig zijn om taxonomische gegevens op een hoger niveau
dan het oorspronkelijke niveau te analyseren. Deze functie probeert de taxa op te schalen naar
het gewenste taxonomische niveau.
}
\details{
De functie probeert de taxonnamen op te schalen naar het gespecificeerde taxonomische niveau.
Dit is echter om diverse redenen niet altijd mogelijk. Als dat niet mogelijk is dan zijn er meerdere
resultaten mogelijk.
\itemize{
\item Het taxonomisch niveau van het taxon is al hoger dan het gevraagde niveau
-het originele taxon wordt geretourneerd.
\item Het taxon komt niet voor in de TWN-lijst
\itemize{
\item het originele taxon wordt geretourneerd.
}
\item Het taxon heeft in de TWN-lijst geen parent op het gevraagde niveau
\itemize{
\item het taxon wat het dichtst onder het gevraagde niveau zit wordt geretourneerd.
}
\item De taxonnaam heeft de waarde \code{NA}
\itemize{
\item De waarde \code{NA} wordt geretourneerd.
}
}
}
\examples{

taxa <- c("Bufo calamita", "Bufo", "Buf", NA)

increase_taxonlevel(taxa, "Familia")

}
