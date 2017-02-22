rf <- c(0.07, 0.11, 0.16)
Haldane <- function(rf) {-50*log(1-2*rf)}
X1 <- c(1,0,1)
X2 <- c(0,1,1)
PD <- Haldane(rf)
PD
model1 <- lm(PD ~ X1 + X2 -1) # -1 means no intercept to be fitted
summary(model1)
anova(model1)
LOD.AB <- 93*log10(0.93) + 7*log10(0.07) + 100*log10(2)
LOD.BC <- 89*log10(0.93) + 11*log10(0.11) + 100*log10(2)
LOD.AC <- 84*log10(0.93) + 16*log10(0.16) + 100*log10(2)
LOD <- c(LOD.AB,LOD.BC,LOD.AC)
LOD2 <- LOD^2
model2 <- lm(PD ~ X1 + X2 -1, weights = LOD2)
summary(model2)