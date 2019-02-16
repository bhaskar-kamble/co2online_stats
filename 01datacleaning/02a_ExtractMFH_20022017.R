setwd(your_path_name)

MFH0217 <- read.csv("1.2.0.0.0. MFH 2002 - 2017 NEU.csv",header=TRUE , sep=";" , dec="," , stringsAsFactors=FALSE)

features <- c("abrechnungs_id", "sto_plz", "gemeindeschluessel", 
              "Landkreis...kreisfreie.Stadt",
              "bundesland", "gebaeude_baujahr", "energietraeger", 
              "abrechnungsjahr", "gebaeude_nutzflaeche", 
              "verbrauch_gesamt_kwh",
              "verbrauch_gesamt_kwh_spez",
              "SV..AN.")

MFH0217 <- MFH0217[, features ]


#Landkreis according to Gemeindeschluessel
MFH0217 <- MFH0217[ nchar(MFH0217$gemeindeschluessel)>=7 , ]
MFH0217$GS8 <- MFH0217$gemeindeschluessel
is7 <- nchar(MFH0217$gemeindeschluessel)==7
MFH0217$GS8[is7] <- paste("0",MFH0217$gemeindeschluessel[is7],sep="")
MFH0217$GS5 <- substr(MFH0217$GS8,1,5)

gslk <- read.csv("GS_LK_IMP.csv",header=TRUE , sep=";" , dec="," , stringsAsFactors=FALSE)
gslk$Gemeindeschluessel <- as.character(gslk$Gemeindeschluessel)
gslk$G8 <- gslk$Gemeindeschluessel
is7 <- nchar(gslk$Gemeindeschluessel)==7
gslk$G8[is7] <- paste("0",gslk$Gemeindeschluessel[is7],sep="")
gslk$G5 <- substr(gslk$G8,1,5)
gslk <- gslk[,c("Landkreis","G5")]
names(gslk) <- c("Landkreis_von_GS" , "G5")

MFH0217LKvonGS <- merge(MFH0217 , gslk , by.x="GS5" , by.y="G5")
MFH0217 <- MFH0217LKvonGS
rm(MFH0217LKvonGS)

remove_duplicates_by <- c("sto_plz" ,
                          "bundesland",
                          "gebaeude_baujahr"  ,
                          "energietraeger"  ,
                          "abrechnungsjahr",
                          "gebaeude_nutzflaeche",
                          "verbrauch_gesamt_kwh" ,
                          "verbrauch_gesamt_kwh_spez",
                          "SV..AN."     ,
                          "Landkreis_von_GS")  
is_remove_duplicates_by <- which(names(MFH0217) %in% remove_duplicates_by)

#save image of:
all_MFH_20022017 <- MFH0217[!duplicated(MFH0217[ , is_remove_duplicates_by ])  ,   ]

save(all_MFH_20022017 , file = "all_MFH_20022017.RData")

#> names(all_MFH_20022017)
#[1] "GS5"                          "abrechnungs_id"               "sto_plz"                      "gemeindeschluessel"          
#[5] "Landkreis...kreisfreie.Stadt" "bundesland"                   "gebaeude_baujahr"             "energietraeger"              
#[9] "abrechnungsjahr"              "gebaeude_nutzflaeche"         "verbrauch_gesamt_kwh"         "verbrauch_gesamt_kwh_spez"   
#[13] "SV..AN."                      "GS8"                          "Landkreis_von_GS"            
 