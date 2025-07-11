library(SpATS)
barleysfnb <-read.csv("./output/SFNB_merged.csv")
barleysfnb$R <- as.factor(barleysfnb$Row)
barleysfnb$C <- as.factor(barleysfnb$Range)
barleysfnb$Bay = as.numeric(factor(barleysfnb$Bay))
barleysfnb_results <-SpATS(response = "Damage_Level",
                           spatial = ~ SAP(Range, Row),
                           genotype.as.random = TRUE,
                           genotype = "Name",
                           fixed = ~ Bay + Experiment_Number,
                           random = ~ R + C, data = barleysfnb)
summary(barleysfnb_results)
summary(barleysfnb_results, which = "variances")
summary(barleysfnb_results, which = "all")
plot(barleysfnb_results)
var.barleysfnb_results <- variogram(barleysfnb_results)
plot(var.barleysfnb_results)
qqnorm(barleysfnb_results$residuals,las=1,main="(B) Spot form net blotch")
qqline(barleysfnb_results$residuals)
getHeritability(barleysfnb_results) ## Name 0.68
