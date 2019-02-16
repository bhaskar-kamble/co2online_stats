# for all the csv files that you have, do the basic cleaning first


setwd(your_path_name)

#The data was obtained from multiple csv files provided by the data engineers at co2online

## 1. First of all read in the data from the old and new files:

old20022004 <- read.csv("Alt_1-2FH 2002 - 2004.csv",header=TRUE , sep=";" , dec="," , stringsAsFactors=FALSE)
old20052006 <- read.csv("Alt_1-2FH 2005 - 2006.csv",header=TRUE , sep=";" , dec="," , stringsAsFactors=FALSE)
old20072009 <- read.csv("Alt_1-2FH 2007 - 2009.csv",header=TRUE , sep=";" , dec="," , stringsAsFactors=FALSE)
old20102017 <- read.csv("Alt_1-2FH 2010 - 2017.csv",header=TRUE , sep=";" , dec="," , stringsAsFactors=FALSE)
new20022005 <- read.csv("Neu_2002_2005_ALLE_ET 1-2 FH.csv",header=TRUE , sep=";" , dec="," , stringsAsFactors=FALSE)
new20062009 <- read.csv("Neu_2006_2009_ALLE_ET 1-2 FH.csv",header=TRUE , sep=";" , dec="," , stringsAsFactors=FALSE)
new20102017 <- read.csv("Neu_2010_2017_ALLE_ET 1-2 FH.csv",header=TRUE , sep=";" , dec="," , stringsAsFactors=FALSE)

#make sure all have the same names

## 1. Give common names to all the datasets

#For the old:


nold1 <- names(old20022004)
nold2 <- names(old20052006)
nold3 <- names(old20072009)
nold4 <- names(old20102017)
nold_all <- cbind(nold1,nold2,nold3,nold4)
for (ii in 1:length(nold1)) {
  if (length(unique(as.character(nold_all[ii,]))) != 1) {
    print(ii)
    print(nold_all[ii,])
    print(length(unique(as.character(nold_all[ii,]))))
  }
}

#the above shows that old20022004 column for Landkreis has a different name compared to the other four datasets
#let us change the name of this dataset:

names(old20022004) <- nold2 #all "old" now have same names

#do the same for the new:


nnew1 <- names(new20022005)
nnew2 <- names(new20062009)
nnew3 <- names(new20102017)
nnew_all <- cbind(nnew1,nnew2,nnew3)

for (ii in 1:length(nnew1)) {
  if (length(unique(as.character(nnew_all[ii,]))) != 1) {
    print(ii)
    print(nnew_all[ii,])
    print(length(unique(as.character(nnew_all[ii,]))))
  }
}

names(new20022005)[6] <- "Landkreis"
names(new20062009)[6] <- "Landkreis"
names(new20102017)[6] <- "Landkreis"

#there are still inconsistencies with the old datasets: replace abrech_jahr by abrechnungsjahr, 
#and geneindeschlussel_komplett by geneindeschlussel:
names(new20022005)[24] <- "abrechnungsjahr"
names(new20062009)[24] <- "abrechnungsjahr"
names(new20102017)[24] <- "abrechnungsjahr"
names(new20022005)[5] <- "gemeindeschluessel"
names(new20062009)[5] <- "gemeindeschluessel"
names(new20102017)[5] <- "gemeindeschluessel"

