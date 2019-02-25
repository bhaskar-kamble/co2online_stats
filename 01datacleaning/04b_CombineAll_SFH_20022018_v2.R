setwd("D:/R/PressRelease/EntireData(2002onwards)/DataCleaningForGithub")
load("all_SFH_20022017.RData")
load("file_with2018_SFH.RData")

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

SFH20022018 <- rbind(all_SFH_20022017[,features_SFH20022017] , file_with2018_SFH[,features_SFH2018])
#remove duplicates
remove_duplicates_by <- c(
  "gebaeude_baujahr",
  "energietraeger",              
  "abrechnungsjahr",
  "gebaeude_nutzflaeche",
  "verbrauch_gesamt_kwh",
  "verbrauch_gesamt_kwh_spez",   
  "Landkreis_von_GS"  
)
is_remove_duplicates_by <- which(names(SFH20022018) %in% remove_duplicates_by)
SFH20022018 <- SFH20022018[!duplicated(SFH20022018[ , is_remove_duplicates_by]) , ]
save(SFH20022018,file="SFH20022018_v2.RData")
