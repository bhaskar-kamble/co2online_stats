setwd("D:/R/PressRelease/EntireData(2002onwards)/DataCleaningForGithub")

load("MFH20022018.RData")
load("SFH20022018.RData")

setwd("D:/R/PressRelease/EntireData(2002onwards)/DataCleaningForGithub/Hamburg/")


str(MFH20022018)
str(SFH20022018)

hamburgSFH <- SFH20022018[SFH20022018$Landkreis_von_GS=="Hamburg, Stadt" , ]
hamburgMFH <- MFH20022018[MFH20022018$Landkreis_von_GS=="Hamburg, Stadt" , ]
hamburgSFH$gebaeude_type <- "SFH"
hamburgMFH$gebaeude_type <- "MFH"
hamburgALL <- rbind(hamburgSFH,hamburgMFH)


require(dplyr)
by_AbJahr <- group_by(hamburgSFH,abrechnungsjahr)
by_AbJahr_spz_verbrauch <- as.data.frame(summarize(by_AbJahr,mean(verbrauch_gesamt_kwh_spez)))
names(by_AbJahr_spz_verbrauch) <- c("abrechnungsjahr" , "mean_verbrauch_gesamt_kwh_spez")
#by_AbJahr_nutzflache <- as.data.frame(summarize(by_AbJahr,mean(gebaeude_nutzflaeche)))

require(ggplot2)
ggplot() + geom_point(data=by_AbJahr_spz_verbrauch , aes(x=abrechnungsjahr , y=mean_verbrauch_gesamt_kwh_spez) , color = "blue")+labs(x="Abrechnungsjahr",y="Specific Energy Consumption (kWh/sq.m) [AN]")+ylim(0,225)

