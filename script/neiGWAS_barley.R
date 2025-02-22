library(rNeighborGWAS)
library(tidyverse)

# load phenotype data
pheno = read.csv("./pheno/NFNB_merged.csv")
pheno$Experiment_Number = as.factor(pheno$Experiment_Number)
print(nrow(pheno))

# load an annotation file linking genotypes and phenotypes
gf = read.csv("./pheno/geno2pheno.csv")
gf = gf[is.na(gf$GID)==FALSE,]

# pheno$Name %in% gf$EntryCD: check genotype availability from the list
pheno = pheno[(pheno$Name %in% gf$EntryCD),]

gf = gf[match(pheno$Name,gf$EntryCD),]
gf$GID =  paste0("X",gf$GID)

geno = read.csv("./geno/geno.csv.gz")

pheno = pheno[(gf$GID %in% colnames(geno)),]
andIDs = gf$GID[(gf$GID %in% colnames(geno))]
geno = geno[,andIDs]
print(nrow(pheno))
print(length(table(pheno$Name)))


#prepare geno, filter minor alleles
#maf_filter is set in settings at top of script
maf_filter = 0.01
af = rowSums(geno)/(2*ncol(geno)) #assuming geno is completed; raw data ~ 0,1,2, so 2* for ncol()
rare_allele = ifelse(af<maf_filter|1-af<maf_filter,TRUE,FALSE)
geno = filter(geno,!rare_allele)

# calc and filter MAF
MAF = af
MAF[MAF>0.5] = 1 - MAF[MAF>0.5]
MAF = MAF[!rare_allele]

# convert 0,1 into -1,+1 for Neighbor GWAS
geno = t(geno)
geno = geno - 1

#smap: spatial map
smap = cbind(pheno$Range,pheno$Row)

#gmap: genetic map
gmap = read.csv("./geno/positions.csv.gz")
gmap = filter(gmap,!rare_allele)
gmap = data.frame(gmap,MAF)


# choose effect distance
distances = c(1,sqrt(2)+0.01,2,sqrt(8)+0.01,3,4,sqrt(18)+0.01) 
covar = model.matrix(~Experiment_Number+poly(Row,4)+poly(Range,4),data=pheno)[,-1]
# covar = as.data.frame(covar)
# covar$Row2 = covar$Row^2
# covar$Row3 = covar$Row^3
# covar$Row4 = covar$Row^4
# covar$Range2 = covar$Range^2
# covar$Range3 = covar$Range^3
# covar$Range4 = covar$Range^4
# covar = as.matrix(covar)
res = calc_PVEnei(geno=geno,pheno=pheno$Damage_Level,smap=smap,scale_seq=distances,addcovar=covar,grouping=pheno$Experiment_Number,response="quantitative")
total = res$PVEself+res$PVEnei
res = data.frame(res,total)

delta_PVE(res)
write.csv(res,"./output/PVE_NFNB_MAF1.csv")

#pooled experiment GWAS:
#NFNB (1,6,10): distance best at 2, delta_PVE chose 1
#sig SNP in chr5 at 2, also high at 2.3
#PM (2): no pooling
#Blr (5,9): distance best at 4, delta_PVE chose 1, plateau at 5.2, use 2
#best SNP found at 2
#Scald (3,7,11): distancce best at 1, peaks at 5, peak at 2, may try 3
#almost sig SNPs 2.3 and 3, also quite at 1, 2, 2.9, 4, 4.2, 4.5 and 5
#SFNB (4,8,12):

#set scale for neiGWAS
gwas = c()
for(i in distances) {
  scale <- i
  g_nei <- nei_coval(geno=geno, smap=smap, scale=scale, grouping=pheno$Experiment_Number)
  
  #neiGWAS
  # covar <- model.matrix(~Experiment_Number,data=pheno)[,-1]
  gwas_out <- nei_lmm(geno=geno, g_nei=g_nei, pheno=pheno$Damage_Level,addcovar=covar)
  out <- cbind(gmap,gwas_out)
  gwas = c(gwas,list(out))
}

# save results
saveRDS(gwas,"./output/NFNB_GWAS.rds")

# incl. cov by sommer
library(sommer)
scale = 4
g_nei <- nei_coval(geno=geno, smap=smap, scale=scale, grouping=pheno$Experiment_Number)
q <- ncol(geno)
K_self <- tcrossprod(geno)
K_self <- ((q - 1)/2 + K_self/2)/(q - 1)
K_nei <- tcrossprod(g_nei)/(q - 1)
K_self <- as.matrix(Matrix::nearPD(K_self, maxit = 10^6)$mat)
K_nei <- as.matrix(Matrix::nearPD(K_nei, maxit = 10^6)$mat)

# near positive-definite for combined K
# K2 = rbind(cbind(K_self,K_self*K_nei),cbind(K_self*K_nei,K_nei))
# K2 = as.matrix(Matrix::nearPD(K2, maxit = 10^6)$mat)
# K_self = K2[1:nrow(K_self),1:ncol(K_self)]
# K_nei = K2[(nrow(K_self)+1):(nrow(K_self)+nrow(K_nei)),(ncol(K_self)+1):(ncol(K_self)+ncol(K_nei))]

modIGE1 <- mmec(Damage_Level ~ factor(Experiment_Number)+poly(Row,4)+poly(Range,4), dateWarning = FALSE,
                random = ~ K_self + K_nei, verbose = TRUE,
                rcov = ~ units, nIters = 50, data = pheno)

modIGE2 <- mmec(Damage_Level ~ factor(Experiment_Number)+poly(Row,4)+poly(Range,4), dateWarning = FALSE,
                random = ~ covc(vsc(isc(K_self)), vsc(isc(K_nei))),
                rcov = ~ units, nIters = 50, verbose = TRUE, data = pheno)

summary(modIGE1)
summary(modIGE2)
