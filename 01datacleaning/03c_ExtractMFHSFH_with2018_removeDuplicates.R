remove_duplicates_by <- c("gebaeude_typ", 
              "gebaeude_baujahr", 
              "energietraeger", 
              "abrechnungsjahr", 
              "gebaeude_nutzflaeche", 
              "HEV",
              "verbrauch", 
              "heizung",
              "warmwasser",
              "Landkreis_von_GS")


is_remove_duplicates_by <- which(names(both2018_v4) %in% remove_duplicates_by)

file2018 <- both2018_v4[!duplicated(both2018_v4[ , is_remove_duplicates_by]) , ]

#further cleaning

file2018 <- file2018[!is.na(file2018$verbrauch)   ,  ]
file2018 <- file2018[!is.na(file2018$HEV)   ,  ]
file2018$gebaeude_typ[file2018$gebaeude_typ == "1-2familienhaus"] <- "SFH"
file2018$gebaeude_typ[file2018$gebaeude_typ == "mehrfamilienhaus"] <- "MFH"

#> names(file2018)
#[1] "GS5"                  "abrechnung_id"        "quelle"               "sto_plz"              "gemeindeschluessel"   "Landkreis"           
#[7] "bundesland"           "gebaeude_typ"         "gebaeude_baujahr"     "energietraeger"       "abrechnungsjahr"      "gebaeude_nutzflaeche"
#[13] "HEV"                  "verbrauch"            "heizung"              "warmwasser"           "GS8"                  "Landkreis_von_GS"    


names(file2018)[names(file2018)=="HEV"]   <-   "verbrauch_gesamt_kwh"
names(file2018)[names(file2018)=="verbrauch"]   <-   "verbrauch_gesamt_kwh_spez"
names(file2018)[names(file2018)=="heizung"]   <-   "verbrauch_heizung_kwh_spez"
names(file2018)[names(file2018)=="warmwasser"]   <-   "verbrauch_warmwasser_kwh_spez"
#"HEV",              #verbrauch_gesamt_kwh
#"verbrauch"        "verbrauch_gesamt_kwh_spez"
#"heizung"         "verbrauch_heizung_kwh_spez"
#"warmwasser"       "verbrauch_warmwasser_kwh_spez"


#> names(file2018)
#[1] "GS5"                           "abrechnung_id"                 "quelle"                        "sto_plz"                      
#[5] "gemeindeschluessel"            "Landkreis"                     "bundesland"                    "gebaeude_typ"                 
#[9] "gebaeude_baujahr"              "energietraeger"                "abrechnungsjahr"               "gebaeude_nutzflaeche"         
#[13] "verbrauch_gesamt_kwh"          "verbrauch_gesamt_kwh_spez"     "verbrauch_heizung_kwh_spez"    "verbrauch_warmwasser_kwh_spez"
#[17] "GS8"                           "Landkreis_von_GS"        


#save images of:
file_with2018_MFH <- file2018[file2018$gebaeude_typ == "MFH" , ]
file_with2018_SFH <- file2018[file2018$gebaeude_typ == "SFH" , ]
file_with2018_MFH <- file_with2018_MFH[file_with2018_MFH$abrechnungsjahr %in% 2002:2018 , ]
file_with2018_SFH <- file_with2018_SFH[file_with2018_SFH$abrechnungsjahr %in% 2002:2018 , ]

save(file_with2018_MFH , file = "file_with2018_MFH.RData")
save(file_with2018_SFH , file = "file_with2018_SFH.RData")