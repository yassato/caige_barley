library(vcfR)

# after running mark duplicate with gatk
g = read.vcfR("./geno/caigebarley__53355variants__807individuals_mkdup.vcf")

dup_id = which(table(paste(g@fix[,1],g@fix[,2]))!=1)
table(paste0(g@fix[,1],g@fix[,2]))[which(table(paste0(g@fix[,1],g@fix[,2]))!=1)]
names(table(paste0(g@fix[,1],g@fix[,2]))[dup_id])

paste(g@fix[,1],g@fix[,2]) %in% names(table(paste(g@fix[,1],g@fix[,2]))[dup_id])
g = g[paste(g@fix[,1],g@fix[,2]) %in% names(table(paste(g@fix[,1],g@fix[,2]))[dup_id])==FALSE,]

write.vcf(g,file="./geno/caigebarley__53355variants__807individuals_mkdup2.vcf.gz")
# run beagle to impute then

g = read.vcfR("./geno/caigebarley__53355variants__807individuals_imp.vcf.gz")

geno = g@gt[,-1]
geno[geno=="0|0"] = 0
geno[geno=="1|1"] = 2
geno[geno=="1|0"] = 1
geno[geno=="0|1"] = 1
geno = as.data.frame(geno)
write.csv(geno,"geno.csv",row.names=FALSE)

fix = g@fix
fix = as.data.frame(fix[,1:2])
write.csv(fix,"positions.csv",row.names=FALSE)
