# Workshop: Connecting Nutrition and Health 
# Earlham Institute
# 27 January
# Practical Session

# Example: PCA for the expression of two genes
x <- c(2.5, 0.5, 2.2, 1.9, 3.1, 2.3, 2.0, 1.0, 1.5, 1.1)
y <- c(2.4, 0.7, 2.9, 2.2, 3.0, 2.7, 1.6, 1.1, 1.6, 0.9)
class <- c('control', 'control', 'control', 'control', 'control',
           'case', 'case', 'case', 'case', 'case')
ExpData <- data.frame(x = x, y = y, class = class)
plot(x,y)


############ Approach 1 #############
# center data (mean=0)
x.centered <- x - mean(x)
y.centered <- y - mean(y)
D.centered <- data.frame(x.centered = x.centered, y.centered = y.centered)
plot(D.centered)


# compute covariance
cov.xy <- matrix( +c(cov(x.centered,x.centered), 
                     cov(x.centered,y.centered), 
                     cov(y.centered,x.centered), 
                     cov(y.centered,y.centered)), 
                  nrow = 2, ncol = 2)

# compute the Eigenvalues of the covariance matrix
e.xy <- eigen(cov.xy)

# perform the data matrix in the new coordinates
D.centered <- as.matrix(D.centered)
D.pc <- D.centered %*% e.xy$vectors # %*% performs matrix multiplication
print(D.pc)
# Plot the coordinate transformation
plot(D.pc, xlim = c(-2.5, 2.5), ylim = c(-2.5, 2.5), 
     xlab = '1st Component', ylab = '2nd Component')


############ Approach 2 #############
## Computing the principal components using prcomp
genes.pca <- prcomp(D.centered)
summary(genes.pca) # shows importance of components, std, cumulative proportion
print(genes.pca)  # shows std and transform matrix
plot(genes.pca)  # plot the variance per component
biplot(genes.pca, var.axes = FALSE, xlim = c(-2.5, 2.5), ylim = c(-2.5, 2.5),
       xlab = '1st Component', ylab = '2nd Component',
       arrow.len = 0)
