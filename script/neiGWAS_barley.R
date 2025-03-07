library(rNeighborGWAS)
library(tidyverse)

# load phenotype data
trait = "NFNB" # select the trait name: NFNB, SNFB, or Scald
pheno = read.csv(paste0("./output/",trait,"_merged.csv"))
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
res = calc_PVEnei(geno=geno,pheno=pheno$Damage_Level,smap=smap,scale_seq=distances,addcovar=covar,grouping=pheno$Experiment_Number,response="quantitative")
total = res$PVEself+res$PVEnei
res = data.frame(res,total)

delta_PVE(res)
write.csv(res,file=paste0("./output/PVE_",trait,"NFNB_MAF1.csv")) 

#set scale for neiGWAS
gwas = c()
for(i in distances) {
  scale <- i
  g_nei <- nei_coval(geno=geno, smap=smap, scale=scale, grouping=pheno$Experiment_Number)
  
  gwas_out <- nei_lmm(geno=geno, g_nei=g_nei, pheno=pheno$Damage_Level,addcovar=covar)
  out <- cbind(gmap,gwas_out)
  gwas = c(gwas,list(out))
}

# save results
saveRDS(gwas,file=paste0("./output/",trait,"_GWAS.rds"))

