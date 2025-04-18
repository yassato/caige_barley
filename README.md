# CAIGE barley
Analysis of neighbor genotypic effects on barley diseases using the open dataset of CAIGE project (http://www.caigeproject.org.au/).

## geno  
_Imputed genotype data used for statistical analyses_

- caigebarley__53355variants__807individuals_imp.vcf.gz  
Genotype data in a VCF format imputed using the BEAGLE software.

- caigebarley__53355variants__807individuals_imp.log  
A running log of the BEAGLE imputation.

- geno.csv.gz  
The imputed genotype data used for R in a CSV format

- positions.csv.gz  
The position information of SNP markers used for R

_Note that the raw genotype data can be downloaded as follows._
1. Access to the CAIGE site https://www.caigeproject.org.au/germplasm-evaluation-barley-genotypic-data/
1. Access to Gigwa in the line of SNP Markers dataset (807 CAIGE Barley Lines) "Download Gigwa Link"
1. Push "search" and check "Enable browse and export"
1. Press a download button and download in a VCF file 

## pheno  
_Original phenotype files downloaded from http://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/disease-screening-2016/_

- 2015_NFNB_Results_with_controls.csv
- 2015_PM_Results_with_controls.csv
- 2015_SFNB_Results_with_controls.csv
- 2015_Scald_Results_with_controls.csv    
Worksheets from "2015_caigebarleydisease_14shipment_dedjtr_pm_sfnb_nfnb.xlsx"  

- 2016_BLR_field.csv
- 2016_NFNB_Field.csv
- 2016_SFNB_Field.csv
- 2016_Scald_field.csv  
Worksheets from "2016_caigebarleydisease_15shipment_dedjtr_sfnb_nfnb.xlsx"  

- 2017_Blr_without_controls.csv
- 2017_NFNB_with_controls.csv
- 2017_SFNB_with_controls.csv
- 2017_Scald_with_controls.csv  
Worksheets from "2017_caigebarleydisease_16shipment_dedjtr_sfnb_nfnb.xlsx"  

- geno2pheno.csv
A reference file linking genotype names and IDs. The original comes from "Data_summary" sheet of "CAIGE-Barley-Disease-compilation-data_LZ.xlsx".  


## script  
_R and bash scripts to prepare inputs, perform statistical analysis and make figures_

- CAIGE_barley_geno.R  
R script to curate genotype data whose outputs went to ```./geno``` above

- CAIGE_barley_pheno.R  
R script to combine multi-year phenotype data whose outputs go to ```./output``` below

- Spats_NFNB.R
- Spats_SFNB.R
- Spats_Scald.R  
R scripts for the SpATS analysis of the net form net blotch (NFNB), spot form net blotch (SFNB), and Scald.

- coord.R  
A utility R function to depict GWAS Manhattan plots

- neiGWAS_barley.R  
R script to conduct the PVE analysis and GWAS of neighbor genotypic effects. GWAS outputs are available in ```./output``` below.

- output_barley.R  


- runBEAGLE.sh  
Shell script to run BEAGLE for the genotype imputation, generating "caigebarley__53355variants__807individuals_imp.vcf.gz" in ```./geno``` above.


## output  
_A subdirectory to save intermediate and output files_

- NFNB_merged.csv

- SFNB_merged.csv

- Scald_merged.csv

Merged phenotype files for multiple years, including the following information in their columns.  
Trial:  Trial IDs from the original files  
Bay: Bays (sub-blocks) in the field  
Block: Block IDs from the original files  
Row: Row positions within field plots  
Range: Range positions within field plots  
Expt: Experimental codes from the original files  
Name: Name of genotypes (variety)  
Damage_Level: End-point damage score ranged from 1 to 9  
Experiment_Number: Subfile IDs that represent the difference of study years  


- NFNB_GWAS.rds

- SFNB_GWAS.rds

- Scald_GWAS.rds

The full list of GWAS association scores (NAME_OF_PHENOTYPE_GWAS.rds). These files include the full list of -log10(p) association scores of each SNP for the three phenotypes, net form net blotch (NFNB), spot form net blotch (SFNB), and scald. Use ```readRDS()``` to load them into R. They are provided as a "list" object, in which the first to the 11th objects correspond to Euclidean distance from 1 to 4.2 shown in Figure 2 of the manuscript. See the vignette (https://cran.r-project.org/web/packages/rNeighborGWAS/vignettes/rNeighborGWAS.html) and ```help(nei_lmm)``` for the interpretation of columns.

