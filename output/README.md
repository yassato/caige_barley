# GWAS outputs for CAIGE barley analyses

- NFNB_GWAS.rds

- SFNB_GWAS.rds

- Scald_GWAS.rds

These files include the full list of -log10(p) association scores of each SNP for the three phenotypes, net form net blotch (NFNB), spot form net blotch (SFNB), and scald. Use ```readRDS()``` to load them into R. They are provided as a "list" object, in which the first to the seventh objects correspond to Euclidean distance from 1 to 4.2 shown in Figure 2 of the manuscript. See the vignette (https://cran.r-project.org/web/packages/rNeighborGWAS/vignettes/rNeighborGWAS.html) and ```help(nei_lmm)``` for the interpretation of columns.
