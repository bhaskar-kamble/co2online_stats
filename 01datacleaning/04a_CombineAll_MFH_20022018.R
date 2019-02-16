setwd("D:/R/PressRelease/EntireData(2002onwards)/DataCleaningForGithub")
load("all_MFH_20022017.RData")
load("file2018_MFH.RData")


features_MFH20022017 <- c(
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



features_MFH2018 <- c(
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

MFH20022018 <- rbind(all_MFH_20022017[,features_MFH20022017] , file2018_MFH[,features_MFH2018])
save(MFH20022018,file="MFH20022018.RData")