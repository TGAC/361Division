# This tutorial uses the 'sommer' package
# Detailed examples of this package are in the package's vignette and the paper:
# http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0156744
library(sommer)

# Simulate Data----
# Constructs a simulated data set of outbred individuals
nInd = 500
nQtl = 5000 #QTLs also serve as markers in this simulation

#Simulate QTL and their effects, individuals are inbred
qtl = matrix(sample(c(-1,1),nInd*nQtl,replace=T),nc=nQtl)
dimnames(qtl) = list(paste0("Ind",1:nInd),paste0("M",1:nQtl))
qtl[1:5,1:5]
a = rnorm(nQtl,sd=sqrt(2/nQtl)) #Additive effect

#Measure population statistics
gv = c(qtl%*%a) #Genetic value of individuals
meanGv = mean(gv)
varG = var(gv) #Total genetic variance
varA = varG/2 #Due to using inbred lines

#Simulate a phenotype
H2 = 0.5 #Desired broad-sense heritability
#H2 = varG/(varG+varE)
varE = varG/H2-varG
pheno = gv+rnorm(nInd,sd=sqrt(varE))
varP = var(pheno)
plot(gv,pheno)
cor(gv,pheno)

# RR-BLUP----

#Fit a model using all phenotypes
Z = qtl #The random effect incidence matrix
K = diag(nQtl) #Markers are assumed to be independent
K[1:10,1:10]
ETA = list(list(Z=Z,K=K))     
ans = mmer(pheno,Z=ETA,method="EMMA") #Intercept is implicitly included

#Estimated variance components
ans$var.comp
#Estimate of genetic variance
#See Endelman, 2011, rrBLUP paper
p = colMeans(qtl+1)/2
w = sum(1-(p-(1-p))^2)
w
ans$var.comp[1]*w

varA
varG
varE

#Intercept
coef(ans)
meanGv

#Estimated QTL/marker effects
ebvQtl = c(ans$u.hat[[1]])
plot(a,ebvQtl,xlab="True Effect",
     ylab="Estimated Effect")
cor(a,ebvQtl)

#Estimated individual breeding values
ebv = c(qtl%*%ebvQtl)
plot(gv,ebv,xlab="True Value",
     ylab="Estimated Value")
cor(gv,ebv)
cor(pheno,ebv)

#Fit a model with 400 phenotypes for training and
#predict the remaining 100 individuals
Z = qtl[1:400,]
K = diag(nQtl)
ETA = list(list(Z=Z,K=K))
ans = mmer(pheno[1:400],Z=ETA,method="EMMA")

#Estimated QTL/marker effects
ebvQtl = c(ans$u.hat[[1]])

#Estimated breeding values for individuals
ebv = c(qtl%*%ebvQtl)
plot(gv[1:400],ebv[1:400],main="Phenotyped Individuals",
     xlab="True Value",
     ylab="Estimated Value")
cor(gv[1:400],ebv[1:400])
plot(gv[401:500],ebv[401:500],main="Unphenotyped Individuals",
     xlab="True Value",
     ylab="Estimated Value")
cor(gv[401:500],ebv[401:500])


# GBLUP----
#Fit a model using all phenotypes
Z = diag(nInd) #Incidence matrix for individuals
K = A.mat(qtl) #Genomic relationship matrix
round(K[1:5,1:5],2)
ETA = list(list(Z=Z,K=K))        
ans = mmer(pheno,Z=ETA,method="EMMA") #Intercept is included implicitly

#Estimated variance components
ans$var.comp
varA
varG

#Estimated breeding values
ebv = c(ans$u.hat[[1]])
plot(gv,ebv,xlab="True Value",
     ylab="Estimated Value")
cor(gv,ebv)
cor(pheno,ebv)

#Fit a model with 400 phenotypes for training and
#predict the remaining 100 individuals
Z = cbind(diag(400),matrix(0,nrow=400,ncol=100)) #Incidence matrix for individuals
K = A.mat(qtl) #Genomic relationship matrix
ETA = list(list(Z=Z,K=K))
ans = mmer(pheno[1:400],Z=ETA,method="EMMA") #Intercept is included implicitly
ebv = c(ans$u.hat[[1]])
plot(gv[1:400],ebv[1:400],main="Phenotyped Individuals",
     xlab="True Value",
     ylab="Estimated Value")
cor(gv[1:400],ebv[1:400])
plot(gv[401:500],ebv[401:500],main="Unphenotyped Individuals",
     xlab="True Value",
     ylab="Estimated Value")
cor(gv[401:500],ebv[401:500])

#GBLUP using an alternative G matrix
Z = diag(nInd)
K1 = A.mat(qtl)
#Simple matching relationship matrix
#Note this example only works for bi-allelic loci codes as 1,0,-1
K2 = tcrossprod(qtl)/ncol(qtl)+1 
round(K2[1:5,1:5],2)
ETA1 = list(list(Z=Z,K=K1))
ETA2 = list(list(Z=Z,K=K2))
ans1 = mmer(pheno,Z=ETA1,method="EMMA")
ans2 = mmer(pheno,Z=ETA2,method="EMMA")
ans1$var.comp
ans2$var.comp
varA
varG
cor(c(ans1$u.hat[[1]]),c(ans2$u.hat[[1]]))

# RKHS----
# Reproducing kernel Hilbert space regression using a Gaussian kernel
# This implementation is based on the implementation in the rrBLUP package

#Useful functions
fastDist = function(X){ #Returns a columnwise Euclidean distance matrix
  #Utilizes a binomial theorem trick for faster computation than R's 'dist' function
  #X is any numeric matrix
  #Note: may return NaNs due to numerical instability
  D = -2*tcrossprod(X)
  Xn = rowSums(X^2)
  D = sweep(D,1,Xn,"+")
  D = sweep(D,2,Xn,"+")
  D = sqrt(D)
  diag(D) = 0 #Contols for potential NaN
  return(D)
}

calcGK = function(D, theta){ #Gaussian function
  #D is a matrix of Euclidean distances
  #theta is the tuning parameter
  K = exp(-1*(D/theta)^2)
  return(K)
}

#Compute distance matrix
D = fastDist(qtl)
round(calcGK(D,0.0001)[1:5,1:5],2) #theta~0
round(calcGK(D,max(D))[1:5,1:5],2) #theta=max(D)
round(calcGK(D,1000*max(D))[1:5,1:5],2) #theta=max(D)*1000


#Fit a model with all phenotypes
Z = diag(nInd)
#Optimize for theta
objective = function(theta){
  #Assign results to global environment
  ans <<- mmer(pheno,Z=list(list(Z=Z,K=calcGK(D,theta))),method="EMMA")
  ans$LL
}
theta = optimize(objective,lower=0.0001,upper=max(D),
                 maximum=TRUE)$maximum
theta/max(D) #Scaled theta

#Variance components
ans$var.comp
varG
varA

#Predicted breeding values*
ebv = c(ans$u.hat[[1]])
cor(gv,ebv)
cor(pheno,ebv)

#Fit a model with 400 phenotypes and predict the remaining 100
Z = cbind(diag(400),matrix(0,nrow=400,ncol=100))
#Optimize for theta
objective = function(theta){
  ans <<- mmer(pheno[1:400],Z=list(list(Z=Z,K=calcGK(D,theta))),method="EMMA")
  ans$LL
}
theta = optimize(objective,lower=0.0001,upper=max(D),
                 maximum=TRUE)$maximum
theta/max(D) #Scaled theta

#Predicted breeding values
ebv = c(ans$u.hat[[1]])
plot(gv[1:400],ebv[1:400],main="Phenotyped Individuals",
     xlab="True Value",
     ylab="Estimated Value")
cor(gv[1:400],ebv[1:400])
plot(gv[401:500],ebv[401:500],main="Unphenotyped Individuals",
     xlab="True Value",
     ylab="Estimated Value")
cor(gv[401:500],ebv[401:500])


