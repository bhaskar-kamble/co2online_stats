setwd("D:/R/PressRelease/EntireData(2002onwards)/DataCleaningForGithub")
load("all_SFH_20022017.RData")
load("file2018_SFH.RData")

all_SFH_20022017$gebaeude_baujahr <- as.integer(all_SFH_20022017$gebaeude_baujahr)

features_SFH20022017 <- c(
  "sto_plz",
  "bundesland",
  "gebaeude_baujahr",
  "energietraeger",              
  "abrechnungsjahr",
  "gebaeude_nutzflaeche",
  "verbrauch_gesamt_kwh",
  "verbrauch_gesamt_kwh_spez",   
  "Landkreis_von_GS"  
)



features_SFH2018 <- c(
  "sto_plz",
  "bundesland",
  "gebaeude_baujahr",
  "energietraeger",              
  "abrechnungsjahr",
  "gebaeude_nutzflaeche",
  "verbrauch_gesamt_kwh",
  "verbrauch_gesamt_kwh_spez",   
  "Landkreis_von_GS"  
)

SFH20022018 <- rbind(all_SFH_20022017[,features_SFH20022017] , file2018_SFH[,features_SFH2018])
save(SFH20022018,file="SFH20022018.RData")
