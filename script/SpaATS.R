library(SpATS)

# load phenotype data
pheno = read.csv("./pheno/NFNB_merged.csv")
pheno$Experiment_Number = as.factor(pheno$Experiment_Number)
print(nrow(pheno))

pheno$Bay = as.numeric(factor(pheno$Bay))
pheno$row = as.factor(pheno$Row)
pheno$range = as.factor(pheno$Range)
res = SpATS(response="Damage_Level", spatial=~SAP(Range,Row,ANOVA=TRUE), genotype.as.random=TRUE,
      genotype="Name", fixed =~Bay+Experiment_Number,random=~range+row, data=pheno,
      control =  list(tolerance = 1e-03))
summary(res)
summary(res, which = "variances")
summary(res, which = "all")
plot(res$var.comp)

plot(res)
plot(res, all.in.one = FALSE)
plot(variogram(res))


library(SpATS)
data(wheatdata)
summary(wheatdata)

# Create factor variable for row and columns
wheatdata$R <- as.factor(wheatdata$row)
wheatdata$C <- as.factor(wheatdata$col)

m0 <- SpATS(response = "yield", spatial = ~ SAP(col, row, nseg = c(10,20), degree = 3, pord = 2), 
            genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, data = wheatdata, 
            control =  list(tolerance = 1e-03))
# Brief summary
m0
# More information: dimensions
summary(m0) # summary(fit.m2, which = "dimensions") 
# More information: variances
summary(m0, which = "variances") 
# More information: all
summary(m0, which = "all") 

# Plot results
plot(m0)
plot(m0, all.in.one = FALSE)

# Variogram
var.m0 <- variogram(m0)
plot(var.m0)
