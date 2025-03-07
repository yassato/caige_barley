fn = system("ls ./pheno/*.csv", intern=TRUE)

# pool settings:
poolName = "Scald_pooled"
pool = c(4,8,12)
#individual datasets: check fn
#pools:
#NFNB: 1,6,10
#PM_2015: 2
#Blr: 5,9
#SFNB: 3,7,11
#Scald: 4,8,12

################################# loading and preparing data
#before running check manually in folders if all required files are present

#loading all experiments in a loop, appending each to pheno
#note: Experiment_Number in pheno equals position in fn
pheno_all = data.frame(NULL)
for(i in 1:12){
  pheno_i = read.csv(fn[i])
  pheno_i[,ncol(pheno_i)] = as.numeric(pheno_i[,ncol(pheno_i)])
  pheno_i = pheno_i[is.na(pheno_i[,ncol(pheno_i)])==FALSE,]
  pheno_i = rename(pheno_i, Damage_Level = ncol(pheno_i))
  pheno_i = rename(pheno_i, Expt = 6)
  if(ncol(pheno_i)>8){
    pheno_i = select(pheno_i, c(1,2,3,4,5,6,7,ncol(pheno_i)))
  }
  pheno_i = mutate(pheno_i, Experiment_Number = i)
  if(i==1){
    pheno_all = pheno_i
  }
  else{
    pheno_all = rows_append(pheno_all, pheno_i)
  }
}

#select phenotype pool
pheno = filter(pheno_all, Experiment_Number %in% pool)
write.csv(pheno,"./output/Scald_merged.csv")

