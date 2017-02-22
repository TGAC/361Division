setwd("U:/Breeding methodologies/Teaching/rrBLUP")
library(rrBLUP)
RC.ecotype.geno <- read.table("s7_data2.txt", header = T, row.names = 1)
tRC.ecotype.geno <- t(RC.ecotype.geno)
tRC.ecotype.geno <- tRC.ecotype.geno-1
RC.ecotype.map <- read.table("RC_ecotype_map.txt", header = T)
RC.eco <- cbind(RC.ecotype.map,tRC.ecotype.geno)
attach(RC.eco)
M <- subset(RC.eco[,-(1:3)])
gid <- colnames(RC.eco)[-(1:3)]
colnames(M) <- gid
A <- A.mat(X=t(M),min.MAF = 0.05, max.missing = 0.1, tol = 0.02, return.imputed=F)
eig.result1 <- eigen(A)
lambda <- eig.result1$values
plot(lambda/sum(lambda),ylab="Fraction Explained")
geno <-cbind(RC.eco[,1:3],M)
colnames(geno) <- c("marker", "chrom", "pos", gid)
pheno <- read.table("RC_pheno2.txt",header=T)
attach(pheno)
pheno2 <- pheno[,c(1,2)]
colnames(pheno2) <- c("genotype","Flowering_date")
covariates <- read.table("covariates.txt", header = T)
pheno3 <- data.frame(pheno[, 1 : 2], Longitude = factor(covariates$Longitude))
K <- diag(630)
RC.eco.GWAS.FD.ans1 <- GWAS(pheno=pheno2,geno=geno,fixed=NULL, K=K, n.PC=0, min.MAF=0.05, P3D=TRUE, plot=TRUE)
RC.eco.GWAS.FD.ans2 <- GWAS(pheno=pheno2,geno=geno,fixed=NULL, K=A, n.PC=0, min.MAF=0.05, P3D=TRUE, plot=TRUE)
RC.eco.GWAS.FD.ans3 <- GWAS(pheno=pheno2,geno=geno,fixed=NULL, K=A, n.PC=3, min.MAF=0.05, P3D=TRUE, plot=TRUE)
RC.eco.GWAS.FD.ans4 <- GWAS(pheno=pheno3,geno=geno,fixed="Longitude", K=K, n.PC=0, min.MAF=0.05, P3D=TRUE, plot=TRUE)
RC.eco.GWAS.FD.ans5 <- GWAS(pheno=pheno3,geno=geno,fixed="Longitude", K=A, n.PC=0, min.MAF=0.05, P3D=TRUE, plot=TRUE)
RC.eco.GWAS.FD.ans6 <- GWAS(pheno=pheno3,geno=geno,fixed="Longitude", K=K, n.PC=3, min.MAF=0.05, P3D=TRUE, plot=TRUE)
FD.ans3.order <- RC.eco.GWAS.FD.ans3[order(RC.eco.GWAS.FD.ans3$Flowering_date),]
View(FD.ans3.order)