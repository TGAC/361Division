# Load the R packages: gdsfmt and SNPRelate
library(gdsfmt)
library(SNPRelate)

#The SNPRelate package provides a function snpgdsVCF2GDS() to reformat a VCF file.
# Load the example VCF that came with the package, and save it as the variable example
example <- system.file("extdata", "sequence.vcf", package="SNPRelate")
#Transform the VCF to the SNPrelate format GDS, check the function first
?snpgdsVCF2GDS 
#""Reformat Variant Call Format (VCF) file(s)""
snpgdsVCF2GDS(example, "test.gds", method="biallelic.only")
# Open the GDS file and store it in a variable named "mydata"
mydata <- snpgdsOpen(filename = "test.gds")
mydata

#Lest try something a more complex dataset complex:
genofile <- snpgdsOpen(snpgdsExampleFileName())
#LD-based SNP pruning: filter SNPs in close LD to avoid the strong influence of SNP clusters
?snpgdsLDpruning
snpset <- snpgdsLDpruning(genofile, ld.threshold=0.3)
#Copy the name of the remaining SNPs to a new variable
snpset.onlyids<- unlist(snpset)
#Calculate a PCA
mypca <- snpgdsPCA(genofile, snp.id=snpset.onlyids)
#Plot it
plot(mypca)
#IMPORTANT: mypca is a variable that contains several tables with information, eg.
#Check the samples inside the object mypca
mypca$sample.id
#Check the SNPs into mypca
mypca$snp.id


#Install library using the INSTALL button or the command
install.packages("pca3d")
library("pca3d") #Load it!

#IMPORTANT: 
#the data-structure "mypca" contains several elements
#the samples (=dots) coordinates are into, in the table "eigenvect"

#Plot a PCA 3D
pca3d(mypca$eigenvect)
#Animate it!
pca3d(mypca$eigenvect); makeMoviePCA();






          
          
