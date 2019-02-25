setwd("D:/R/PressRelease/EntireData(2002onwards)/DataCleaningForGithub")
load("all_MFH_20022017.RData")
load("file_with2018_MFH.RData")


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

MFH20022018 <- rbind(all_MFH_20022017[,features_MFH20022017] , file_with2018_MFH[,features_MFH2018])
#now remove duplicates
remove_duplicates_by <- c(
  "gebaeude_baujahr",
  "energietraeger",              
  "abrechnungsjahr",
  "gebaeude_nutzflaeche",
  "verbrauch_gesamt_kwh",
  "verbrauch_gesamt_kwh_spez",   
  "Landkreis_von_GS"  
)
is_remove_duplicates_by <- which(names(MFH20022018) %in% remove_duplicates_by)
MFH20022018 <- MFH20022018[!duplicated(MFH20022018[ , is_remove_duplicates_by]) , ]
save(MFH20022018,file="MFH20022018_v2.RData")