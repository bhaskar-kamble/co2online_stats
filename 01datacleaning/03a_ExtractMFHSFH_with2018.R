setwd("D:/R/PressRelease/EntireData(2002onwards)/DataCleaningForGithub")
file1_initial <- read.csv("Johannes Export ab 01.08.2018_20181221_140003.csv",sep=";",stringsAsFactors = FALSE)
file2_initial <- read.csv("Johannes Export ab 01.08.2018_20190102_093003.csv",sep=";",stringsAsFactors = FALSE)


names1 <- names(file1_initial)
names2 <- names(file2_initial)


if (!identical(names1,names2)) {
  stop("warning: files have different column names")
}

bothfiles <- rbind(file1_initial,file2_initial)

#DONT extract 2018, retain all instead, since here are more data for not2018 which was not present earlier
both2018 <- bothfiles#[bothfiles$gdb_abrechnung.abrech_jahr == 2018 , ]

features <- c("abrechnung_id",
              "gdb_abrechnung.quelle", 
              "gdb_abrechnung.sto_plz", 
              "gdb_adresse.gemeindeschluessel_komplett", 
              "Landkreis",
              "gdb_adresse.bundesland", 
              "gdb_abrechnung.gebaeude_typ",
              "gdb_abrechnung.gebaeude_baujahr", 
              "gdb_abrechnung.energietraeger", 
              "gdb_abrechnung.abrech_jahr",  #abrechnungsjahr
              "gdb_berechnung.gebaeude_nutzflaeche", 
              "gdb_berechnung.verbrauch_gesamt_kwh",
              "gdb_berechnung.verbrauch_gesamt_kwh_spez",
              "gdb_berechnung.verbrauch_heizung_kwh_spez",
              "gdb_berechnung.verbrauch_warmwasser_kwh_spez")


both2018_v2 <- both2018[ , features]

newnames <- c("abrechnung_id",
              "quelle", 
              "sto_plz", 
              "gemeindeschluessel", 
              "Landkreis",
              "bundesland", 
              "gebaeude_typ",
              "gebaeude_baujahr", 
              "energietraeger", 
              "abrechnungsjahr",  #abrechnungsjahr
              "gebaeude_nutzflaeche", 
              "HEV",              #verbrauch_gesamt_kwh
              "verbrauch",        #verbrauch_gesamt_kwh_spez
              "heizung",          #verbrauch_heizung_kwh_spez
              "warmwasser")       #verbrauch_warmwasser_kwh_spez

names(both2018_v2) <- newnames

