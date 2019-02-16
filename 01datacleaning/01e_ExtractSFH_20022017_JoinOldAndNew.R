#  old data:| 2002-2004 |              |           |           |   
#  old data:|           |   2005-2006  |           |           |
#  old data:|           |              | 2007-2009 |           |
#  old data:|           |              |           | 2010-2017 |
#  new data:| 2002-2004 |   2005       |           |           |
#  new data:|           |        2006  | 2007-2009 |           |
#  new data:|           |              |           |  2010-2017|


new20022004 <- new20022005[new20022005$abrechnungsjahr=="2002" | new20022005$abrechnungsjahr=="2003" | 
                             new20022005$abrechnungsjahr=="2004" , ]
new2005     <- new20022005[new20022005$abrechnungsjahr=="2005" , ]
new2006     <- new20062009[new20062009$abrechnungsjahr=="2006" , ]
new20072009 <- new20062009[new20062009$abrechnungsjahr=="2007" | new20062009$abrechnungsjahr=="2008" |
                             new20062009$abrechnungsjahr=="2009" , ]


both20022004 <- rbind(old20022004,new20022004)
both20052006 <- rbind(old20052006,new2005)
both20052006 <- rbind(both20052006,new2006)
both20072009 <- rbind(old20072009,new20072009)
both20102017 <- rbind(old20102017,new20102017)


norep20022017 <- both20022004
norep20022017 <- rbind(norep20022017 , both20052006)
norep20022017 <- rbind(norep20022017 , both20072009)
norep20022017 <- rbind(norep20022017 , both20102017)

###

#take complete cases
norep20022017 <- norep20022017[complete.cases(norep20022017) , ]

names(norep20022017)
#> names(norep20022017_compcases)
#[1] "GS5"                       "abrechnungs_id"            "quelle"                    "sto_plz"                   "gemeindeschluessel"       
#[6] "Landkreis"                 "bundesland"                "gebaeude_baujahr"          "energietraeger"            "abrechnungsjahr"          
#[11] "gebaeude_nutzflaeche"      "verbrauch_gesamt_kwh"      "verbrauch_gesamt_kwh_spez" "GS8"                       "Landkreis_von_GS"         
#> 


#remove repetitions from:
#[1] "sto_plz"                   "bundesland"                "gebaeude_baujahr"          "energietraeger"            "abrechnungsjahr"          
#[6] "gebaeude_nutzflaeche"      "verbrauch_gesamt_kwh"      "verbrauch_gesamt_kwh_spez" "Landkreis_von_GS"  

remove_duplicates_by <- c(
  "sto_plz",
  "bundesland" ,
  "gebaeude_baujahr"  ,
  "energietraeger"     ,       
  "abrechnungsjahr" ,         
  "gebaeude_nutzflaeche"  ,   
  "verbrauch_gesamt_kwh"   ,  
  "verbrauch_gesamt_kwh_spez" , 
  "Landkreis_von_GS"  
)

is_remove_duplicates_by <- which(names(norep20022017) %in% remove_duplicates_by)
#c(4,7,8,9,10,11,12,13,15)


#save image:
all_SFH_20022017 <- norep20022017[!duplicated(norep20022017[ , is_remove_duplicates_by ])  ,   ]

save(all_SFH_20022017 , file = "all_SFH_20022017.RData")

#> names(all_SFH_20022017)
#[1] "GS5"                       "abrechnungs_id"            "quelle"                    "sto_plz"                   "gemeindeschluessel"       
#[6] "Landkreis"                 "bundesland"                "gebaeude_baujahr"          "energietraeger"            "abrechnungsjahr"          
#[11] "gebaeude_nutzflaeche"      "verbrauch_gesamt_kwh"      "verbrauch_gesamt_kwh_spez" "GS8"                       "Landkreis_von_GS"   