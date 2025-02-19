setwd("pheno")
getwd()
install.packages("SpATS")
library(SpATS)
read.csv("Scald_merged.csv")
barleyscald <-read.csv("Scald_merged.csv")
barleyscald$R <- as.factor(barleyscald$Row)
barleyscald$C <- as.factor(barleyscald$Range)
barleyscald$Bay = as.numeric(factor(barleyscald$Bay))
SpATS(response = "Damage_Level",
      spatial = ~ SAP(Range, Row, degree = 3, pord = 2, ANOVA = TRUE),
      genotype.as.random = TRUE,
      genotype = "Name",
      fixed = ~ Bay + Experiment_Number,
      random = ~ R + C, data = barleyscald, 
      control =  list(tolerance = 1e-03))
table(barleyscald$Bay, barleyscald$Experiment_Number)
barleyscald$Bay_Exp <- interaction(barleyscald$Bay, barleyscald$Experiment_Number)
fixed = ~ Bay_Exp ## data redundancy
SpATS(response = "Damage_Level",
      spatial = ~ SAP(Range, Row, degree = 3, pord = 2, ANOVA = TRUE),
      genotype.as.random = TRUE,
      genotype = "Name",
      fixed = ~ Bay_Exp,
      random = ~ R + C, data = barleyscald, 
      control =  list(tolerance = 1e-03))
barleyscald_results <-SpATS(response = "Damage_Level",
                            spatial = ~ SAP(Range, Row, degree = 3, pord = 2, ANOVA = TRUE),
                            genotype.as.random = TRUE,
                            genotype = "Name",
                            fixed = ~ Bay_Exp,
                            random = ~ R + C, data = barleyscald, 
                            control =  list(tolerance = 1e-03))
summary(barleyscald_results)
summary(barleyscald_results, which = "variances")
summary(barleyscald_results, which = "all")
plot(barleyscald_results)
plot(barleyscald_results, all.in.one = FALSE)
var.barleyscald_results <- variogram(barleyscald_results)
plot(var.barleyscald_results)
getHeritability(barleyscald_results)##0.65
