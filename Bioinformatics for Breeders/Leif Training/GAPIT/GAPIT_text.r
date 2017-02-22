


setwd("U:/red clover/diversity")
source("http://www.bioconductor.org/biocLite.R")
biocLite("multtest")
install.packages("gplots")
install.packages("LDheatmap")
install.packages("genetics")
install.packages("EMMREML")
install.packages("scatterplot3d")
library("multtest")
library("gplots")
library("LDheatmap")
library("genetics")
library("EMMREML")
library("compiler")
library("scatterplot3d")
source("http://zzlab.net/GAPIT/gapit_functions.txt")
source("http://zzlab.net/GAPIT/emma.txt")
ls()

#read in data for genotypes and genotype position map
s7_data <- read.table("s7_data2.txt", header=T)
length(names(s7_data))
s7_data [,2:8118] <- s7_data[,2:8118]*2
geno.map <- read.table ("s7_data2_map.txt", header=T)
View(geno.map)

#create kinship matrix using van.Raden many files will be created, these should be moved to a new folder as further data will be over written in to the files. open GAPIT.Kin.VanRaden.csv and save as GAPIT.Kin.VanRaden.txt
GAPIT(GD=s7_data, GM=geno.map)
kin2.matrix <- read.table("GAPIT.Kin.VanRaden.txt", header=F) #file is as a .csv file
dim(kin2.matrix)
View(kin2.matrix)

#create PCA
GAPIT(GD=s7_data, GM=geno.map, PCA.total=5)

#read in traits file, use also transformed data
pheno <- read.table("pheno_data5.txt", header=T)

# read in files for covariates: structure, q matrix, 
structure <- read.table("structure.txt", header=T) #qplot
covariates<- read.table("covariates.txt", header=T) #environmental data

#run compression step
test <- GAPIT(Y=pheno[,c(1,3)],KI=kin2.matrix, CV=structure, GD=s7_data, GM=geno.map, group.from=1, group.to=630)
test <- GAPIT(Y=pheno[,c(1,3)],KI=kin2.matrix, CV=structure, GD=s7_data, GM=geno.map, group.from=630, group.to=630)

#run a series of GWAS using kinship, covariates, Q plot
#just kinship
test <- GAPIT(Y=pheno[,c(1,3)], GD=s7_data, GM=geno.map, KI=kin2.matrix, group.from=630,group.to=630)
#
kinship+Q matrix
structure <- read.table("structure.txt", header=T)
test <- GAPIT(Y=pheno[,c(1,3)], CV=structure[,1:9], KI=kin2.matrix,GD=s7_data, GM=geno.map, group.from=630, group.to=630)

#various covariates
covariates <- read.table("covariates.txt", header=T)
test <- GAPIT(Y=pheno[,c(1,3)], CV=covariates[,c(1,31)],KI=kin2.matrix, GD=s7_data, GM=geno.map, group.from=630, group.to=630)

#with kinship and PCs
PCs <- read.table("GAPIT.PCA.txt", header=T)
test <- GAPIT(Y=pheno[,c(1,3)],KI=kin2.matrix, CV=PCs[,c(1, 2:6)], GD=s7_data, GM=geno.map, group.from=630, group.to=630)

#perform an ANOVA on the data
anova(lm(pheno$ALL~ covariates$Latitude))
anova(lm(pheno$FD~ covariates$Latitude))
anova(lm(pheno$FD~ covariates$Longitude))
anova(lm(pheno$FD~ covariates$Altitude))
anova(lm(pheno$FD~ covariates$Region))
anova(lm(pheno$FD~ covariates$Country))
anova(lm(pheno$PH~ covariates$Latitude))
anova(lm(pheno$PH~ covariates$Longitude))
anova(lm(pheno$PH~ covariates$Altitude))
anova(lm(pheno$PH~ covariates$Country))
anova(lm(pheno$PH~ covariates$Region))
anova(lm(pheno$PW~ covariates$Latitude))
anova(lm(pheno$PW~ covariates$Longitude))
anova(lm(pheno$PW~ covariates$Altitude))
anova(lm(pheno$PW~ covariates$Country))
anova(lm(pheno$PW~ covariates$Region))
anova(lm(pheno$SN~ covariates$Latitude))
anova(lm(pheno$SN~ covariates$Longitude))
anova(lm(pheno$SN~ covariates$Altitude))
anova(lm(pheno$SN~ covariates$Country))
anova(lm(pheno$SN~ covariates$Region))
anova(lm(pheno$FW~ covariates$Latitude))
anova(lm(pheno$FW~ covariates$Longitude))
anova(lm(pheno$FW~ covariates$Altitude))
anova(lm(pheno$FW~ covariates$Country))
anova(lm(pheno$FW~ covariates$Region))




savehistory("U:/red clover/diversity/GAPIT_text.Rhistory")
