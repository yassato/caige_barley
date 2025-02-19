install.packages("SpATS")
library(SpATS)
read.csv("NFNB_merged.csv")
barley <-read.csv("NFNB_merged.csv")
barley$R <- as.factor(barley$Row)
barley$C <- as.factor(barley$Range)
barley$Bay = as.numeric(factor(barley$Bay))
SpATS(response = "Damage_Level", spatial = ~ SAP(Range, Row, degree = 3, pord = 2), 
      genotype = "Name", fixed = ~ Bay + Experiment_Number, random = ~ R + C, data = barley, 
      control =  list(tolerance = 1e-03))
barley_results <-SpATS(response = "Damage_Level", spatial = ~ SAP(Range, Row, degree = 3, pord = 2, ANOVA = TRUE),genotype.as.random = TRUE,
                       genotype = "Name", fixed = ~ Bay + Experiment_Number, random = ~ R + C, data = barley, 
                       control =  list(tolerance = 1e-03))
summary(barley_results)
summary(barley_results, which = "variances")
summary(barley_results, which = "all")
plot(barley_results)
plot(barley_results, all.in.one = FALSE)
var.barley_results <- variogram(barley_results)
plot(var.barley_results)
getHeritability(barley_results) ##Name 0.78


















