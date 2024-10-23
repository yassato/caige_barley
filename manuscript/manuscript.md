---
title: Spatial heterogeneity of disease infection attributable to neighbor genotypic identify in barley
output:
  word_document: default
  pdf_document: default
  html_document: default
bibliography: zotero.bib
csl: g3.csl
---

**IA^1**, **LR**^2, **RSI**^2, \& **Yasuhiro Sato**^2,3†\*^    

^1^Graduate School of Environmental Science, Hokkaido University, Kita-ku N10W5, Sapporo 060-0810, Hokkaido, Japan  
^2^Department of Evolutionary Biology and Environmental Studies, University of Zurich
Winterthurerstrasse 190, 8057 Zurich, Switzerland  
^3^Faculty of Environmental Earth Science, Hokkaido University, Kita-ku N10W5, Sapporo 060-0810, Hokkaido, Japan  
^\*^Corresponding author: yassato@ees.hokudai.ac.jp  
ORCID: 0000-0002-6466-723X (Y.S.)
  

# Abstract
Pest damage exhibits considerable spatial heterogeneity among individual plants in field environments. However, little is known about biotic factors and quantitative trait loci (QTLs) responsible for such spatial heterogeneity. Here we examined the genetics underlying spatial heterogeneity of disease susceptibility in xno.x barley cultivars. To quantify spatial variation and perform genome-wide association study (GWAS), we applied two methods, SpATS and Neighbor GWAS, for the disease trial data curated from the CAIGE project. The spatial analysis using SpARTS showed that xx-yy% of phenotypic variation in net blotch and scald symptoms was explained by plant's own genotypes, while XX-YY% was by spatial process. The existence of significant spatial variation then led us to quantify variance components and perform association mapping using Neighbor GWAS. The variance component analysis showed that xx-yy% variation in net blotch symptom was attributable to neighbor genotypic similarity, while scald infection was not significantly influenced by neighboring genotypes. Furthermore, our GWAS detected a relatively rare but significant SNP, which was located on the xx chromosome of barley and associated with neighbor genotypic effects on the net form net blotch. These results highlight neighbor genotypes as an overlooked source of the spatial heterogeneity in pest damage to field crops.  



# Introduction

Natural and field-grown plants exhibit considerable spatial variation in their phenotypes, which is shaped by abiotic and biotic factors. Pest damage, such as pathogens (plos) and herbivory [@the_herbivory_variability_network__plant_2023], is especially heterogeneous among individual plants in space.

Neighbor genotypes are one of biotic factors that shape spatial heterogeneity of xxx. Plant-plant interactions in basic biology. Interplot interference in agricultural practice. 

Disease infection represents a trait that exhibits considerable spatial variation in important field crops. For instance, barley is infected by many fungal diseases such as xxx, yyy, zzz. These fungal diseases develop in xxx days and spread out spores across a field (xx and yy). When resistant and susceptible cultivars are grown in a proximity, patterns of spore spreading and resultant infection could be spatially heterogeneous due to neighboring genotypes as well as stochastic dispersal. While such spatial heterogeneity is considered a nuisance in plant breeding and quantitative genetics [@rodriguez-alvarez_correcting_2018], much less is known about the relevance of neighboring genotypes to spatial variation in crop disease infection.

To analyze the effects of neighboring genotypes on individual traits, we have recently developed a new method of GWAS, called "Neighbor GWAS"" [@sato_neighbor_2021]. Neighbor GWAS employs xxx. However, there are other factors xxx.

In this study, we investigated spatial heterogeneity of disease infection, such as net blotch and scaled, in barley. Specifically, we aimed to address the following questions: (i) Was the significant fraction of disease infection explained by any spatial process? (ii) To what extent was the spatial variation explained by neighboring genotypic similarity? (iii) Were there any significant QTL responsible for the neighbor genotypic effects on disease infection? To address these questions, we applied two methods of quantitative genetics, SpATS and Neighbor GWAS, for publicly available data deposited by the CAIGE project in Australia.

# Materials & Methods

## Dataset
Barley phenotype and genotype data were obtained from the website of CIMMYT Australia ICARDA Germplasm Evaluation (CAIGE) project (<https://www.caigeproject.org.au/>).
More specifically, DArT-derived SNP data for 807 lines were downloaded from Gigwa database at (<http://52.64.175.84:8080/gigwa/?module=caigebarley&project=Barley_genotypic_data>).
The phenotype data were downloaded from the disease screening webpage at (<https://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/>).
Data were curated with the following three criteria: (1) spatial information (i.e., rows and ranges of field plots) are available; (2) phenotypes are recorded for multiple years; (3) more than 500 individuals are available for statistical analysis. 
As a result, we were able to retrieve three-year data on three phenotypes, spot form net blotch, net form net blotch, and scald symptoms.
Each phenotype includes approximately xxx SNP markers and 500 individuals with 480 genotypes.
Details on sample sizes are summarized as a supplementary table (Table S1).  


## Spatial Analysis of Field Trials with Splines (SpATS)

To determine the upper limit of phenotypic variation attributable to spatial process, we used the Spatial Analysis of Field Trials with Splines (SpATS).
Using P-spline, this method quantifies a fraction of phenotypic variation attributable to any spatial process. 
SpATS also quantified broad-sense heritability explained by plant's own genotypic effects.

Describe:

- response variable  
- genotypes  
- covariates  
- 

For this line of analyses, we used the SpATS package [@rodriguez-alvarez_correcting_2018] implemented in R version x.x.x (R Core Team 2024).  

## Neighbor GWAS

### Model description

We used the Neighbor GWAS method [@sato_neighbor_2021] to quantify (i) the proportion of phenotypic variation explained (PVE) by neighbor genotypic effects and (ii) perform GWAS of neighbor genotypic effects on disease symptoms.
In short, Neighbor GWAS consists of a two-factor linear mixed model that incorporates locus-wise similarity of neighboring individuals in addition to plants' own genotypes as follows:

$$y_i = \beta_0 + \beta_1x_i + \frac{\beta_2}{J}\sum_{j=1}^J{(x_ix_j)} + u_i + e_i$$

where $y_i$ is a phenotype of $i$-th individual; $\beta_0$ is an intercept; $\beta_1$ is a fixed effect from plant's own genotype at a focal locus $x_i$; $\beta_2$ is a fixed effect from genotypes of neighboring individuals $x_j$ at the same locus ($j$ up to the number of neighboring individuals $J$); $u_i$ is a random effect; and $e_i$ is a residual.

- ...to be filled out.

Variation partitioning can be performed by estimating two variance components (see "Phenotypic variation explained by neighbor genotypes" below) while GWAS can be performed by testing the fixed effect $\beta_2$ (see "Genome-wide association study" below). 
Details are described in @sato_neighbor_2021. 


### Phenotypic variation explained by neighbor genotypes

To examine how largely spatial variation can be explained by neighboring genotypes, we used the Neighbor GWAS package to quantify variance components in Eq. X. 
We examined two cut-off thresholds of minor allele frequency (MAF) at 5% or 1%. 
The former is a standard criterion in plant GWAS (e.g., ) while the latter includes relatively rare variants, leaving xx and yy SNPs, respectively (Table 1).

- response variable  
- genotypes  
- covariates  

Regarding the spatial range to be referred, we analyzed up to xxx nearest neighbors in a field.  
This is because, when spatial range is too broad, xx and yy have a severe co-linearity [@sato_neighbor_2021; @sato_reducing_2024].  
Likelihood ratio tests were performed for x and y from simpler to complex models following @sato_reducing_2024.


### Genome-wide association study (GWAS)

To identify QTLs responsible for neighbor genotypic effects on disease infection, we performed GWAS of the neighbor effect coefficient $\beta_2$ and depicted Manhattan plots.   

To test whether QTLs overlapped between plant's own and neighbor genotypic effects, we also performed standard GWAS, which was a subset of the Neighbor GWAS model (Eq. x).
The standard GWAS was performed using Neighbor GWAS, which internally uses the gaston package version x.x.x.  


# Results

## Variation partitioning
SpATS. These results showed that there was a substantial spatial heterogeneity of disease susceptibility in the barley genotypes, which was unexplained by plants’ own genotypes.

Subsequently, we asked to what extent the spatial heterogeneity could be explained by neighbor genotypic effects. To address this question, we quantified phenotypic variation explained by neighbor genotype similarity using the Neighbor GWAS model (eq. x). These results showed that a significant fraction of spatial heterogeneity of net blotch susceptibility was attributable to neighbor genotypic identity.


## Genome-wide association study
Using Neighbor GWAS, we detected x significant SNPs associated with neighbor genotypic effects, two of which were for net blotch and one was for yy. 
The positions of these SNPs were then compared with those of the plant's own genotypic effects.

To examine whether QTLs responsible for neighbor effects coincided with those for own genetic effects, we compared the results of standard GWAS and neighbor GWAS. A standard GWAS was performed using a subset of Eq.1 without xx terms.  
QTL position of NFNB in comparison with self-QTL  
QTL position of SFNB in comparison with self-QTL   
QTL position of Scald in comparison with self-QTL
These results suggest that plant' own and neighbor genotypic effects on disease infection differ in their potential mechanisms.  

# Discussion
- Major findings
- Significance: GWAS possible
- Other studies: Indirect genetic effects
- Perspective: 

# Author contributions
IA: investigation, formal analysis, funding acquisition, writing; KKS: supervision, funding acquisition, writing; RSI: supervision, funding acquisition, writing; YS: conceptualization, investigation, formal analysis, supervision, funding acquisition, writing

# Acknowledgement
The authors appreciate all efforts made by the data collectors of the CAIGE project. Thanks are also given to LR for his data curation and analysis during the earlier stage of this study. This study was supported by SNSF Spark (xxxx to YS); JST FOREST (yyyy to YS); and Hokkaido University‘s EXEX Doctoral Fellowship to IA.


# Tables

Table 1. Summary of data availability 

| **Phenotype** | **#Plants$^\dagger$** | **#Genotypes$^\dagger$** | **\%Missing** | **#SNPs (MAF=1%)** | **#SNPs (MAF=5%)** |
| ---- | ---- | ---- | ---- | ---- | ---- |
| Net form net blotch | 508 | 481 | 32 | 20578 | 14568 |
| Spot form net blotch | 507 | 485 | 25 | 20583 | 14570 | 
| Scald | 509 | 482 | 25 | 20527 | 14580 |  

$\dagger$Shown are the number after individuals whose genotype are unavailable (i.e., \%Missing) are excluded.

# References
