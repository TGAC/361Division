# Workshop: Connecting Nutrition and Health 
# Earlham Institute
# 27 January
# Practical Session

# Example: PCA using example data

## Loading data from files
data <- read.delim('Gene-Expression-Data/gene-expression-table.txt', header = TRUE, sep = '\t', stringsAsFactors = FALSE)
ExpData <- read.delim('Gene-Expression-Data/gene-expression-numeric.txt', header = FALSE, sep = '\t', stringsAsFactors = FALSE)
Annotation <- read.delim('Gene-Expression-Data/gene-annotation.txt', header = TRUE, sep = '\t', stringsAsFactors = FALSE)
samples <- read.delim('Gene-Expression-Data/samples.txt', header = TRUE, sep = '\t', stringsAsFactors = FALSE)
genes.class <- read.delim('Gene-Expression-Data/groups.txt', header = TRUE, sep = '\t', stringsAsFactors = FALSE)

## Computing the principal components using prcomp
genes.pca <- prcomp(ExpData)
# Summary
summary(genes.pca)
plot(genes.pca, type = "l")


# Plot the components using ggbiplot
# install.packages("devtools")
# library("devtools")
# install_github("vqv/ggbiplot")
library(ggbiplot)

g <- ggbiplot(genes.pca, obs.scale = 1, var.scale = 1,
              groups = genes.class$groups, ellipse = TRUE,
              circle = FALSE, var.axes = FALSE) +
  scale_color_discrete(name = '') +
  theme(legend.direction = 'horizontal', legend.position = 'top')

print(g)