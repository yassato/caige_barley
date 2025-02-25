# CAIGE barley
statistical analyses for the open dataset of CAIGE (http://www.caigeproject.org.au/). All data retrieved on May 2021.

## Folders

- geno  
genotype data files

- pheno  
phenotype data files

- script  
scripts to prepare input files and perform statistical analyses

- output  
any intermediate files and the full list of GWAS association scores (NAME_OF_PHENOTYPE_GWAS.rds).

## Data

### Phenotype 

From http://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/disease-screening-2016/
- 2015_caigebarleydisease_14shipment_dedjtr_pm_sfnb_nfnb.xlsx
- 2016_caigebarleydisease_15shipment_dedjtr_sfnb_nfnb.xlsx:
- 2017_caigebarleydisease_16shipment_dedjtr_sfnb_nfnb.xlsx
- Disease-27.11-2020-CAIGE-Summary-AgVic.xlsx

### Genotype 

From: http://52.64.175.84:8080/gigwa/?module=caigebarley&project=Barley_genotypic_data

Imputation
```
bcftools norm -d both --threads=4 caigebarley__53355variants__807individuals.vcf -O z  -o caigebarley__53355variants__807individuals_mkdup.vcf

beagle gt=caigebarley__53355variants__807individuals.vcf out=caigebarley__53355variants__807individuals_imp
```
