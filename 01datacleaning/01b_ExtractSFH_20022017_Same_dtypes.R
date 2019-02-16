

old20022004$abrechnungsjahr  <- as.character(old20022004$abrechnungsjahr) #INTEGER
old20052006$abrechnungsjahr  <- as.character(old20052006$abrechnungsjahr) #INTEGER
old20072009$abrechnungsjahr  <- as.character(old20072009$abrechnungsjahr)#INTEGER
old20102017$abrechnungsjahr  <- as.character(old20102017$abrechnungsjahr)# CHARACTER
new20022005$abrechnungsjahr  <- as.character(new20022005$abrechnungsjahr)#INTEGER
new20062009$abrechnungsjahr  <- as.character(new20062009$abrechnungsjahr)#INTEGER
new20102017$abrechnungsjahr  <- as.character(new20102017$abrechnungsjahr)#INTEGER


#> unique(old20102017$abrechnungsjahr)
#[1] "2010"  "2011"  "2012"  "2013"  "2014"  "2015"  "2016"  "2.016" "2.015" "2.014" "2.017" "2.013" "2.010" "2.012"
#[15] "2.011" ""

#fix the above issue:
old20102017$abrechnungsjahr[old20102017$abrechnungsjahr=="2.010"] <- "2010"
old20102017$abrechnungsjahr[old20102017$abrechnungsjahr=="2.011"] <- "2011"
old20102017$abrechnungsjahr[old20102017$abrechnungsjahr=="2.012"] <- "2012"
old20102017$abrechnungsjahr[old20102017$abrechnungsjahr=="2.013"] <- "2013"
old20102017$abrechnungsjahr[old20102017$abrechnungsjahr=="2.014"] <- "2014"
old20102017$abrechnungsjahr[old20102017$abrechnungsjahr=="2.015"] <- "2015"
old20102017$abrechnungsjahr[old20102017$abrechnungsjahr=="2.016"] <- "2016"
old20102017$abrechnungsjahr[old20102017$abrechnungsjahr=="2.017"] <- "2017"
#change it to integer:
old20102017$abrechnungsjahr <- as.integer(old20102017$abrechnungsjahr)

#gebaeude_baujahr is a character variable for the old data 
#and is a integer variable in the new data for 2002-2004:
sapply(
  list(
    new20022005$gebaeude_baujahr,
    new20062009$gebaeude_baujahr,
    new20102017$gebaeude_baujahr
  ), class
)
#integer, integer , integer

sapply(list(
old20022004$gebaeude_baujahr,
old20052006$gebaeude_baujahr,
old20072009$gebaeude_baujahr,
old20102017$gebaeude_baujahr),class)
# character , character , character , character

#hence convert new gebaeudebaujahr to character:
new20022005$gebaeude_baujahr <- as.character(new20022005$gebaeude_baujahr)
new20062009$gebaeude_baujahr <- as.character(new20062009$gebaeude_baujahr)
new20102017$gebaeude_baujahr <- as.character(new20102017$gebaeude_baujahr)

#check sto_plz and gemeindeschluessel:--------------------------------
#sto_plz------------------------------------
sapply(
  list(
    new20022005$sto_plz,
    new20062009$sto_plz,
    new20102017$sto_plz
  ), class
)
# int int int

sapply(list(
  old20022004$sto_plz,
  old20052006$sto_plz,
  old20072009$sto_plz,
  old20102017$sto_plz),class)
# int int int char


# gemeindeschluessel:-----------------
sapply(
  list(
    new20022005$gemeindeschluessel,
    new20062009$gemeindeschluessel,
    new20102017$gemeindeschluessel
  ), class
)
# char char char

sapply(list(
  old20022004$gemeindeschluessel,
  old20052006$gemeindeschluessel,
  old20072009$gemeindeschluessel,
  old20102017$gemeindeschluessel),class)
#int char char char

#convert all sto_plz and gemeindeschluessel to char:
old20022004$sto_plz <- as.character(old20022004$sto_plz)
old20052006$sto_plz <- as.character(old20052006$sto_plz)
old20072009$sto_plz <- as.character(old20072009$sto_plz)
old20102017$sto_plz <- as.character(old20102017$sto_plz)
new20022005$sto_plz <- as.character(new20022005$sto_plz)
new20062009$sto_plz <- as.character(new20062009$sto_plz)
new20102017$sto_plz <- as.character(new20102017$sto_plz)
old20022004$gemeindeschluessel <- as.character(old20022004$gemeindeschluessel)
old20052006$gemeindeschluessel <- as.character(old20052006$gemeindeschluessel)
old20072009$gemeindeschluessel <- as.character(old20072009$gemeindeschluessel)
old20102017$gemeindeschluessel <- as.character(old20102017$gemeindeschluessel)
new20022005$gemeindeschluessel <- as.character(new20022005$gemeindeschluessel)
new20062009$gemeindeschluessel <- as.character(new20062009$gemeindeschluessel)
new20102017$gemeindeschluessel <- as.character(new20102017$gemeindeschluessel)
