setwd("pheno")
install.packages("SpATS")
library(SpATS)
read.csv("SFNB_merged.csv")
barleysfnb <-read.csv("SFNB_merged.csv")
barleysfnb$R <- as.factor(barleysfnb$Row)
barleysfnb$C <- as.factor(barleysfnb$Range)
barleysfnb$Bay = as.numeric(factor(barleysfnb$Bay))
SpATS(response = "Damage_Level",
      spatial = ~ SAP(Range, Row, degree = 3, pord = 2, ANOVA = TRUE),
      genotype.as.random = TRUE,
      genotype = "Name",
      fixed = ~ Bay + Experiment_Number,
      random = ~ R + C, data = barleysfnb, 
      control =  list(tolerance = 1e-03))
barleysfnb_results <-SpATS(response = "Damage_Level",
                           spatial = ~ SAP(Range, Row, degree = 3, pord = 2, ANOVA = TRUE),
                           genotype.as.random = TRUE,
                           genotype = "Name",
                           fixed = ~ Bay + Experiment_Number,
                           random = ~ R + C, data = barleysfnb, 
                           control =  list(tolerance = 1e-03))
summary(barleysfnb_results)
summary(barleysfnb_results, which = "variances")
summary(barleysfnb_results, which = "all")
plot(barleysfnb_results)
plot(barleysfnb_results, all.in.one = FALSE)
var.barleysfnb_results <- variogram(barleysfnb_results)
plot(var.barleysfnb_results)
getHeritability(barleysfnb_results) ##Name 0.68
