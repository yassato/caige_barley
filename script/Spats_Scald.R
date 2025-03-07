library(SpATS)
barleyscald <-read.csv("./output/Scald_merged.csv")
barleyscald$R <- as.factor(barleyscald$Row)
barleyscald$C <- as.factor(barleyscald$Range)
barleyscald$Bay = as.numeric(factor(barleyscald$Bay))
table(barleyscald$Bay, barleyscald$Experiment_Number)
barleyscald$Bay_Exp <- interaction(barleyscald$Bay, barleyscald$Experiment_Number)
fixed = ~ Bay_Exp ## data redundancy
barleyscald_results <-SpATS(response = "Damage_Level",
                            spatial = ~ SAP(Range, Row),
                            genotype.as.random = TRUE,
                            genotype = "Name",
                            fixed = ~ Bay_Exp,
                            random = ~ R + C, data = barleyscald)
summary(barleyscald_results)
summary(barleyscald_results, which = "variances")
summary(barleyscald_results, which = "all")
plot(barleyscald_results)
var.barleyscald_results <- variogram(barleyscald_results)
plot(var.barleyscald_results)
getHeritability(barleyscald_results)##0.65
