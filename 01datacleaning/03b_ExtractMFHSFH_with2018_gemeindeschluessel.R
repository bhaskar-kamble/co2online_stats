#remove NA from gemeindeschluessel:
both2018_v3 <- both2018_v2[!is.na(both2018_v2$gemeindeschluessel)    , ]

both2018_v3$gemeindeschluessel <- as.character(both2018_v3$gemeindeschluessel)
unique(nchar(both2018_v3$gemeindeschluessel))

both2018_v3$GS8 <- both2018_v3$gemeindeschluessel
is7 <- nchar(both2018_v3$gemeindeschluessel)==7
both2018_v3$GS8[is7] <- paste("0",both2018_v3$gemeindeschluessel[is7],sep="")


both2018_v3$GS5 <- substr(both2018_v3$GS8,1,5)

#now read from the GS_LK file...
gslk <- read.csv("GS_LK_IMP.csv",header=TRUE , sep=";" , dec="," , stringsAsFactors=FALSE)
gslk$Gemeindeschluessel <- as.character(gslk$Gemeindeschluessel)
gslk$G8 <- gslk$Gemeindeschluessel
is7 <- nchar(gslk$Gemeindeschluessel)==7
gslk$G8[is7] <- paste("0",gslk$Gemeindeschluessel[is7],sep="")
#leave off the last 3 digits of gemneindeschlussel
gslk$G5 <- substr(gslk$G8,1,5)
gslk <- gslk[,c("Landkreis","G5")]
names(gslk) <- c("Landkreis_von_GS" , "G5")

#merge the 2 files to find LK from GS
both2018_v4 <- merge(both2018_v3 , gslk , by.x="GS5" , by.y="G5")

