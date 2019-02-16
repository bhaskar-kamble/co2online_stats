# This portion should include some more details on what wach of the variables means


#[1] "GS5"                       "abrechnungs_id"            "quelle"                    "sto_plz"                   "gemeindeschluessel"       
#[6] "Landkreis"                 "bundesland"                "gebaeude_baujahr"          "energietraeger"            "abrechnungsjahr"          
#[11] "gebaeude_nutzflaeche"      "verbrauch_gesamt_kwh"      "verbrauch_gesamt_kwh_spez" "GS8"                       "Landkreis_von_GS"         




features <- c(
  "GS5",
  "abrechnungs_id",
  "quelle",
  "sto_plz",
  "gemeindeschluessel",
  "Landkreis",
  "bundesland",
  "gebaeude_baujahr",
  "energietraeger",
  "abrechnungsjahr",
  "gebaeude_nutzflaeche",
  "verbrauch_gesamt_kwh",
  "verbrauch_gesamt_kwh_spez",
  "GS8",
  "Landkreis_von_GS")

old20022004 <- old20022004[,features]
old20052006 <- old20052006[,features]
old20072009 <- old20072009[,features]
old20102017 <- old20102017[,features]
new20022005 <- new20022005[,features]
new20062009 <- new20062009[,features]
new20102017 <- new20102017[,features]
