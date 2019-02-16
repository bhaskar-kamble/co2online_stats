#problem: a huge variation in the landkreis names - same place often have different variations in the name

# give some examples:
unique(grep( "utern" , old20072009$Landkreis , value=TRUE))
unique(grep( "utern" , old20052006$Landkreis , value=TRUE))
unique(grep( "armstadt" , old20022004$Landkreis , value=TRUE))
unique(grep( "ensburg" , old20022004$Landkreis , value=TRUE))

# hence we need a consistency , for which we use the list of gemeindeschluessels:


#retain Gemeindeschlusessl with more than 7 digits only
old20022004 <- old20022004[nchar(old20022004$gemeindeschluessel)>=7 , ]
old20052006 <- old20052006[nchar(old20052006$gemeindeschluessel)>=7 , ]
old20072009 <- old20072009[nchar(old20072009$gemeindeschluessel)>=7 , ]
old20102017 <- old20102017[nchar(old20102017$gemeindeschluessel)>=7 , ]
new20022005 <- new20022005[nchar(new20022005$gemeindeschluessel)>=7 , ]
new20062009 <- new20062009[nchar(new20062009$gemeindeschluessel)>=7 , ]
new20102017 <- new20102017[nchar(new20102017$gemeindeschluessel)>=7 , ]

###########
#add 0 to those schluessel which have 7 digits
old20022004$GS8 <- old20022004$gemeindeschluessel
is7 <- nchar(old20022004$gemeindeschluessel)==7
old20022004$GS8[is7] <- paste("0",old20022004$gemeindeschluessel[is7],sep="")
old20052006$GS8 <- old20052006$gemeindeschluessel
is7 <- nchar(old20052006$gemeindeschluessel)==7
old20052006$GS8[is7] <- paste("0",old20052006$gemeindeschluessel[is7],sep="")
old20072009$GS8 <- old20072009$gemeindeschluessel
is7 <- nchar(old20072009$gemeindeschluessel)==7
old20072009$GS8[is7] <- paste("0",old20072009$gemeindeschluessel[is7],sep="")
old20102017$GS8 <- old20102017$gemeindeschluessel
is7 <- nchar(old20102017$gemeindeschluessel)==7
old20102017$GS8[is7] <- paste("0",old20102017$gemeindeschluessel[is7],sep="")
new20022005$GS8 <- new20022005$gemeindeschluessel
is7 <- nchar(new20022005$gemeindeschluessel)==7
new20022005$GS8[is7] <- paste("0",new20022005$gemeindeschluessel[is7],sep="")
new20062009$GS8 <- new20062009$gemeindeschluessel
is7 <- nchar(new20062009$gemeindeschluessel)==7
new20062009$GS8[is7] <- paste("0",new20062009$gemeindeschluessel[is7],sep="")
new20102017$GS8 <- new20102017$gemeindeschluessel
is7 <- nchar(new20102017$gemeindeschluessel)==7
new20102017$GS8[is7] <- paste("0",new20102017$gemeindeschluessel[is7],sep="")


#retain 1st 5:
old20022004$GS5 <- substr(old20022004$GS8,1,5)
old20052006$GS5 <- substr(old20052006$GS8,1,5)
old20072009$GS5 <- substr(old20072009$GS8,1,5)
old20102017$GS5 <- substr(old20102017$GS8,1,5)
new20022005$GS5 <- substr(new20022005$GS8,1,5)
new20062009$GS5 <- substr(new20062009$GS8,1,5)
new20102017$GS5 <- substr(new20102017$GS8,1,5)

##########
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

"LKvonGS" %in% names(old20022004)
old20022004LKvonGS <- merge(old20022004 , gslk , by.x="GS5" , by.y="G5")
old20052006LKvonGS <- merge(old20052006 , gslk , by.x="GS5" , by.y="G5")
old20072009LKvonGS <- merge(old20072009 , gslk , by.x="GS5" , by.y="G5")
old20102017LKvonGS <- merge(old20102017 , gslk , by.x="GS5" , by.y="G5")
new20022005LKvonGS <- merge(new20022005 , gslk , by.x="GS5" , by.y="G5")
new20062009LKvonGS <- merge(new20062009 , gslk , by.x="GS5" , by.y="G5")
new20102017LKvonGS <- merge(new20102017 , gslk , by.x="GS5" , by.y="G5")

rm(old20022004)
rm(old20052006)
rm(old20072009)
rm(old20102017)
rm(new20022005)
rm(new20062009)
rm(new20102017)

old20022004 <- old20022004LKvonGS
old20052006 <- old20052006LKvonGS
old20072009 <- old20072009LKvonGS
old20102017 <- old20102017LKvonGS
new20022005 <- new20022005LKvonGS
new20062009 <- new20062009LKvonGS
new20102017 <- new20102017LKvonGS

rm(old20022004LKvonGS)
rm(old20052006LKvonGS)
rm(old20072009LKvonGS)
rm(old20102017LKvonGS)
rm(new20022005LKvonGS)
rm(new20062009LKvonGS)
rm(new20102017LKvonGS)



#next step: extract relevant features


