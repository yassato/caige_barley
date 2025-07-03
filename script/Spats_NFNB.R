library(SpATS)
barley <- read.csv("./output/NFNB_merged.csv")
barley$R <- as.factor(barley$Row)
barley$C <- as.factor(barley$Range)
barley$Bay = as.numeric(factor(barley$Bay))
barley_results <-SpATS(response = "Damage_Level", 
                       spatial = ~ SAP(Range, Row),
                       genotype.as.random = TRUE,
                       genotype = "Name", 
                       fixed = ~ Bay + Experiment_Number, 
                       random = ~ R + C, data = barley)
summary(barley_results)
summary(barley_results, which = "variances")
summary(barley_results, which = "all")
plot(barley_results)
var.barley_results <- variogram(barley_results)
plot(var.barley_results)
qqnorm(barley_results$residuals,las=1,main="(A) Net form net blotch")
qqline(barley_results$residuals)
getHeritability(barley_results) ## Name 0.78

















