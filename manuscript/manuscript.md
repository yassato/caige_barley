---
title: Spatial heterogeneity of disease infection attributable to neighbor genotypic identity in barley
output:
  word_document: default
  pdf_document: default
  html_document: default
bibliography: zotero.bib
csl: g3.csl
---

**Iqra Akram**^1^, **[Kentaro K. Shimizu?]**^2^, **Rie Shimizu-Inatsugi**^2^, \& **Yasuhiro Sato**^2,3†\*^    

^1^Graduate School of Environmental Science, Hokkaido University, Kita-ku N10W5, Sapporo 060-0810, Hokkaido, Japan  
^2^Department of Evolutionary Biology and Environmental Studies, University of Zurich
Winterthurerstrasse 190, 8057 Zurich, Switzerland  
^3^Faculty of Environmental Earth Science, Hokkaido University, Kita-ku N10W5, Sapporo 060-0810, Hokkaido, Japan  
^\*^Corresponding author: yassato@ees.hokudai.ac.jp  
ORCID: 0000-0002-6466-723X (Y.S.)
  

# Abstract
Pest damage exhibits considerable spatial heterogeneity among individual plants in field environments. 
However, little is known about biotic factors and loci responsible for such spatial heterogeneity. 
Using barley data, here we investigated whether neighboring genotypes explained spatial heterogeneity of disease symptoms.
To quantify spatial variation and perform genome-wide association study (GWAS) of disease phenotypes, we applied two methods, SpATS and Neighbor GWAS, for the disease trial data curated from the CAIGE project. 
The SpATS analysis showed that xx-yy% and XX-YY% of phenotypic variation in net blotch and scald symptoms was explained respectively by plant's own and neighbor genotypes, thereby leading us to apply Neighbor GWAS for further variance component analysis and association mapping. 
The variance component analysis showed that xx-yy% variation was explained by neighbor genotypic identity for the net form net blotch, spot form net blotch and scald symptoms. 
Furthermore, our GWAS detected a significant SNP that was located on the barley 7H chromosome of barley and associated with neighbor genotypic effects on the net form net blotch.
Overall, these results suggest that neighbor genotypes are an overlooked but significant source of the spatial heterogeneity in pest damage to field crops.  



# Introduction

Natural and field-grown plants exhibit considerable spatial variation in their phenotypes, which is shaped by abiotic and biotic factors. Pest damage, such as pathogen infection [@rieux_long-distance_2014] and insect herbivory [@the_herbivory_variability_network__plant_2023], is especially heterogeneous among individual plants in space.
While spatial heterogeneity has been considered a nuisance in plant breeding and quantitative genetics [@rodriguez-alvarez_correcting_2018], it could be explained by biotic interactions.
For example, neighbor genotypes are one of biotic factors that can shape spatial heterogeneity of pest damage. Plant-plant interactions in basic biology. Interplot interference in agricultural practice. 

Disease infection represents a trait that exhibits considerable spatial variation in important field crops. For instance, barley is infected by many fungal diseases such as xxx, yyy, zzz. These fungal diseases develop in xxx days and spread out spores across a field (xx and yy). When resistant and susceptible cultivars are grown in a proximity, patterns of spore spreading and resultant infection could be spatially heterogeneous due to neighboring genotypes as well as stochastic dispersal. While spatial patterns are well studied [@rieux_long-distance_2014; @rodriguez-alvarez_correcting_2018], much less is known about the relevance of neighboring genotypes to spatial variation in crop disease infection.

To analyze the effects of neighboring genotypes on individual traits, we have recently developed a new method of GWAS, called "Neighbor GWAS"" [@sato_neighbor_2021]. Neighbor GWAS employs xxx. However, there are other factors xxx.

In this study, we investigated spatial heterogeneity of disease infection, such as net blotch and scaled, in barley. Specifically, we aimed to address the following questions: (i) Was the significant fraction of disease infection explained by any spatial process? (ii) To what extent was the spatial variation explained by neighboring genotypic identity? (iii) Were there any significant QTL responsible for the neighbor genotypic effects on disease infection? To address these questions, we applied two methods of quantitative genetics, SpATS and Neighbor GWAS, for publicly available data deposited by the CAIGE project in Australia.

# Materials & Methods

## Dataset
Barley phenotype and genotype data were obtained from the website of CIMMYT Australia ICARDA Germplasm Evaluation (CAIGE) project (<https://www.caigeproject.org.au/>; see Table S1 for exact URLs).
More specifically, DArT-derived SNP data for 807 lines were downloaded from the Gigwa database.
Genotype data were imputed using BEAGLE3 [@ayres_beagle_2019] after exclusion of duplicated markers.
The phenotype data were downloaded from the disease screening webpage.
Datasets were curated with the following three criteria: (1) spatial information (i.e., rows and ranges of field plots) are available; (2) phenotypes are recorded for multiple years; (3) more than 500 individuals are available for statistical analysis. 
As a result, we were able to retrieve three-year data on three phenotypes, i.e, spot form net blotch, net form net blotch, and scald symptoms recorded at Horsham, Australia.
Each phenotype includes approximately 25,000 SNP markers and 500 individuals with 480 genotypes.
Details on sample sizes are summarized as a supplementary table (Table 1).  


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
In short, Neighbor GWAS consists of a two-factor linear mixed model that incorporates locus-wise identity (or similarity vice versa) of neighboring individuals in addition to plants' own genotypes as follows:

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
The standard GWAS was performed using Neighbor GWAS, which internally uses the gaston package [@Rgaston].  


# Results

## Spatial heterogeneity of disease infection
We used SpATS to quantify spatial variation in the three disease phenotypes --- namely, net form net blotch, spot form net blotch, and scald --- in barley.

- describe results

These results showed that a substantial spatial heterogeneity of disease infection was unexplained by plants' own genotypes and thus left a room to be explained by neighboring genotypes.


## Phenotypic variation explained by neighbor genotypes
Subsequently, we asked to what extent the spatial heterogeneity could be explained by neighbor genotypic effects. 
To address this question, we calculated phenotypic variation explained by neighbor genotype identity using the Neighbor GWAS model (eq. x). 
All the three phenotypes of disease infection had a significant SNP heritability regarding plant's own genotypic effects (blue bars in Fig. 3A-C; likelihood ratio test, $\chi^2_1$ > xx, $p$ < 0.05 see Table S2 for exact test-statistics and $p$-values).
More remarkably, we found significant contributions of neighbor genotypes to all the three phenotypes (red bars in Fig. 3A-C; likelihood ratio test, $\chi^2_1$ > xx, $p$ < 0.05 see Table S2 for exact test-statistics and $p$-values).
Specifically, _describe the results of each phenotype one-by-one_.
The similar patterns were found even when the cut-off value of MAF was changed to 0.05 (Table SX).
These PVE analyses showed that a significant fraction of spatial heterogeneity of net blotch susceptibility was attributable to neighbor genotypic identity, which led us to further ask whether this significant variation could be explained by major-effect loci. 


## Genome-wide association study
Lastly, we used Neighbor GWAS to detect large-effect loci responsible for neighbor genotypic effects on the three phenotypes of disease infection.
We detected two significant SNPs associated with neighbor genotypic effects, one of which were for net form net blotch and another was for scald (Fig. 4B, C, D). 
The significant SNP of neighbor genotypic effects on the net form net blotch was located on the tip of 7H chromosome (Fig. 4B)
These findings suggest that xxx.  

To examine whether neighbor genotypic effects shared the same genetic architecture with plant's own genotypic effects, we also conducted standard GWAS and compared it with Neighbor GWAS.


- QTL position of NFNB in comparison with self-QTL  
- QTL position of SFNB in comparison with self-QTL   
- QTL position of Scald in comparison with self-QTL  

These results suggest that plant' own and neighbor genotypic effects on disease infection may have different genetic bases.  

# Discussion
Our quantitative genetic analyses revealed that significant fractions of spatial heterogeneity was attributable to neighbor genotypes in barley diseases.
Similarly, studies on indirect genetic effects reported the influence of neighboring genotypes on the other individuals' phenotypes in _Arabidopsis_ [@montazeaud_indirect_2023], _Eucalyptus_ [@costa_e_silva_genetic-based_2017], and xxx.
While these previous studies also quantified the phenotypic variation attributable to neighboring genotypes, genetic variants has yet to be identified.
In this context, our Neighbor GWAS analysis detected a significant SNP associated with neighbor genotypic effects on the net blotch damage.
This is the first example for Neighbor GWAS to detect a significant QTL and, to our knowledge, one of few reports of significant QTLs responsible for neighbor genotypic effects [@montazeaud_cultivar_2022].  

## Process of disease spread

The influence of neighboring genotypes on another plant's infection could occur through dispersal from one plot to another.
Although our quantitative genetic analysis was unable to elucidate molecular mechanisms, effective spatial scales and a significant variant deserve to be discussed.

- spatial scales by PVE

Furthermore, we detected a significant QTL that had negative effects of allelic mixture on damage, indicating the risk of allelic mixture to spread diseases between different genotypes.  

- Discussions on each fungal pathogen

## Applicability and limitation
To infer neighboring genotype-genotype interactions, our analysis showed the effective use of open data collected from a randomized block design of many plant genotypes.  

For meta-analytic approach, we should note also that open data may not be always complete.
For instance, x, y and z.
To address these issues, pattern-based analyses, such as P-splines in SpATS, can be used as a complementary tool to determine the upper limit of spatial heterogeneity in observed phenotypes.  

## Conclusion 
Harnessing open data, we found significant phenotypic variation and genetic variant associated with neighbor genotypic effects on disease infection in barley.
Neighbor genotypic effects are linked to genotype mixtures [@sato_reducing_2024], providing one of promissing ways for integrated pest management [@tooker_genotypically_2012].
Unlike a previous study on polygenic traits [@sato_reducing_2024], the identification of significant QTLs may enable us to optimize population-level pest damage with a few loci focused [@wuest_ecological_2021; @sato_genetics_2024].
Beyond genotype mixture, allelic mixture is particularly suitable for crop varieties because intraspecific varieties can be subjected to breeding by crossing each other [@montazeaud_cultivar_2022].
Further studies are needed to validate these effects by comparing allelic monoculture and mixture at the candidate locus.  




# Author contributions
IA: investigation, formal analysis, funding acquisition, writing; KKS: supervision, funding acquisition, writing; RSI: supervision, funding acquisition, writing; YS: conceptualization, investigation, formal analysis, supervision, funding acquisition, writing

# Acknowledgement
The authors appreciate all efforts made by the data collectors of the CAIGE project. Thanks are also given to Lukas Rohr for his preliminary analysis during the early stage of this study. This study was supported by SNSF Spark (xxxx to YS); JST FOREST (yyyy to YS); and Hokkaido University‘s EXEX Doctoral Fellowship to IA.


# Figures

- Figure 1. Workflow

- Figure 2. SpATS for visualization of spatial heterogeneity

![Figure 3. Proportion of phenotypic variation explained (PVE) by plant's own (self) and neighbor (neighbor) genotypic effects on on the three phenotypes of disease infections: (A) net form net blotch, (B) spot form net blotch, and (C) scald. PVE at the distance of zero corresponds to a coventional SNP heritability (blue). Additional fractions explained by neighbor genotypic identity (red) indicate a net contribution of neighbor genotypic effects  and are shown across the distances $\neq$ 0. Asterisks indicate \* $p<0.05$; \** $p<0.01$ with likelihood ratio test (see Table S2 for exact $p$-values).](../figures/PVE_fig.pdf) 


![Figure 4. GWAS Manhattan plots for plant's own or neighbor genotypic effects on the three phenotypes of disease infections in barley cultivars. Left (A, C, and E) and right (B, D, and F) panels display plant's own (self) or neighbor (neighbor) genotypic effects, respectively. Target phenotypes are the net form net blotch (A-B), spot form net blotch (C-D), and scald (E-F). Solid and dashed holizontal lines indicate genome-wide Bonferroni threshold at $p<0.05$ with MAF cut-off values at 0.01 and 0.05, respectively.](../figures/barleyMan.pdf)


# Tables

Table 1. Summary of data availability 

| **Phenotype** | **#Plants$^\dagger$** | **#Genotypes$^\dagger$** | **\%Missing** | **#SNPs (MAF=1%)** | **#SNPs (MAF=5%)** |
| ---- | ---- | ---- | ---- | ---- | ---- |
| Net form net blotch | 508 | 481 | 32 | 20578 | 14568 |
| Spot form net blotch | 507 | 485 | 25 | 20583 | 14570 | 
| Scald | 509 | 482 | 25 | 20527 | 14580 |  

$\dagger$Shown are the number after individuals whose genotype are unavailable (i.e., \%Missing) are excluded.

# Supplementary Materials

- Figure S1. Spatial arrangements of plant genotypes   

![Figure S2. Quantile-Quantile (QQ) plots of plant's own or neighbor genotypic effects on the three phenotypes of disease infections in barley cultivars. Upper (A, B, and C) and lower (D, E, and F) panels display plant's own (self) or neighbor (neighbor) genotypic effects, respectively. Target phenotypes are the net form net blotch (A-D), spot form net blotch (C-E), and scald (C-F). Observed -log~10~($p$) association scores are plotted against those of expected values. Dashed lines indicate random expectation as $y = x$.](../figures/barleyQQ.pdf)

- Table S1. Exact links to the study data within the CAIGE website

| Data | URL | File name | Last access date |
| ---- | ---- | ---- | ---- |
| genotype-phenotype link (2013-2019) | <https://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/> | CAIGE-Barley-Disease-compilation-data_LZ.xlsx | 24-Oct-2024 |
| genotype | <http://52.64.175.84:8080/gigwa/?module=caigebarley&project=Barley_genotypic_data> | caigebarley__project1__2021-05-28__53355variants__VCF.zip | 23-Oct-2024 |
| phenotype (2015) | <https://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/disease-screening-2015/> | 2015_caigebarleydisease_14shipment_dedjtr_pm_sfnb_nfnb.xlsx | 31-May-2021 |
| phenotype (2016) | <https://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/disease-screening-2016/> | 2016_caigebarleydisease_15shipment_dedjtr_sfnb_nfnb.xlsx | 31-May-2021 |
| phenotype (2017) | <https://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/disease-screening-2017/> | 2017_caigebarleydisease_16shipment_dedjtr_sfnb_nfnb.xlsx | 31-May-2021 | 
  

  
Table S2. The proportion of phenotypic variation explained (PVE) by plant's own (PVEself) or neighbor (PVEneighbor) genotypes at MAF = 0.01. For distance $\neq$ 0, likelihood ratio tests based on $\chi^2_1$-statistic were used to determine $p$-values of Neighbor GWAS models over a standard GWAS model. For distance = 0, likelihood ratio tests were performed over a null model, which made PVEself equivalent to a SNP heritability (see also Methods "Phenotypic variation explained by neighbor genotypes").  

(A) Net form net blotch

| **Distance** | **PVEself** | **PVEneighbor** | **$\chi^2_1$** | **$p$-value** |
|--------------|-------------|-----------------|-------------|-------------|
| 0.00         | 0.324       | 0.000           | 4.721       | 0.02980     |
| 1.00         | 0.324       | 0.157           | 6.964       | 0.00831     |
| 1.42         | 0.324       | 0.183           | 6.238       | 0.01251     |
| 2.00         | 0.324       | 0.233           | 6.436       | 0.01119     |
| 2.84         | 0.324       | 0.241           | 6.475       | 0.01094     |
| 3.00         | 0.324       | 0.236           | 5.624       | 0.01772     |
| 4.00         | 0.324       | 0.242           | 5.361       | 0.02059     |
| 4.25         | 0.324       | 0.188           | 2.127       | 0.14469     |


(B) Spot form net blotch

| **Distance** | **PVEself** | **PVEneighbor** | **$\chi^2_1$** | **$p$-value** |
|--------------|-------------|-----------------|-------------|-------------|
| 0.00         | 0.336       | 0.000           | 6.53        | 0.01059     |
| 1.00         | 0.336       | 0.108           | 2.79        | 0.09471     |
| 1.42         | 0.336       | 0.179           | 6.08        | 0.01369     |
| 2.00         | 0.336       | 0.263           | 9.96        | 0.00160     |
| 2.84         | 0.336       | 0.187           | 4.12        | 0.04236     |
| 3.00         | 0.336       | 0.227           | 4.75        | 0.02930     |
| 4.00         | 0.336       | 0.167           | 2.59        | 0.10720     |
| 4.25         | 0.336       | 0.160           | 2.12        | 0.14492     |
  
(C) Scald

| **Distance** | **PVEself** | **PVEneighbor** | **$\chi^2_1$** | **$p$-value** |
|--------------|-------------|-----------------|-------------|-------------|
| 0.00         | 0.588       | 0.000           | 15.21       | 9.595E-05   |
| 1.00         | 0.588       | 0.195           | 30.29       | 3.723E-08   |
| 1.42         | 0.588       | 0.095           | 15.18       | 9.771E-05   |
| 2.00         | 0.588       | 0.167           | 17.63       | 2.682E-05   |
| 2.84         | 0.588       | 0.092           | 7.33        | 6.789E-03   |
| 3.00         | 0.588       | 0.117           | 9.22        | 2.398E-03   |
| 4.00         | 0.588       | 0.148           | 10.25       | 1.364E-03   |
| 4.25         | 0.588       | 0.149           | 8.91        | 2.828E-03   |

  
Table S3. The proportion of phenotypic variation explained (PVE) by plant's own (PVEself) or neighbor (PVEneighbor) genotypes at MAF = 0.05. For distance $\neq$ 0, likelihood ratio tests based on $\chi^2_1$-statistic were used to determine $p$-values of Neighbor GWAS models over a standard GWAS model. For distance = 0, likelihood ratio tests were performed over a null model, which made PVEself equivalent to a SNP heritability (see also Methods "Phenotypic variation explained by neighbor genotypes").  

(A) Net form net blotch

| **Distance** | **PVEself** | **PVEneighbor** | **$\chi^2_1$** | **$p$-value** |
|--------------|-------------|-----------------|-------------|-------------|
| 0.00         | 0.324       | 0.000           | 4.72        | 0.0298      |
| 1.00         | 0.324       | 0.157           | 6.96        | 0.0083      |
| 1.42         | 0.324       | 0.183           | 6.24        | 0.0125      |
| 2.00         | 0.324       | 0.233           | 6.44        | 0.0112      |
| 2.84         | 0.324       | 0.241           | 6.47        | 0.0109      |
| 3.00         | 0.324       | 0.236           | 5.62        | 0.0177      |
| 4.00         | 0.324       | 0.242           | 5.36        | 0.0206      |
| 4.25         | 0.324       | 0.188           | 2.13        | 0.1447      |  
  

(B) Spot form net blotch

| **Distance** | **PVEself** | **PVEneighbor** | **$\chi^2_1$** | **$p$-value** |
|--------------|-------------|-----------------|-------------|-------------|
| 0.00         | 0.265       | 0.000           | 6.29        | 0.0122      |
| 1.00         | 0.265       | 0.110           | 2.56        | 0.1093      |
| 1.42         | 0.265       | 0.192           | 5.93        | 0.0149      |
| 2.00         | 0.265       | 0.282           | 9.06        | 0.0026      |
| 2.84         | 0.265       | 0.212           | 4.10        | 0.0430      |
| 3.00         | 0.265       | 0.248           | 4.50        | 0.0339      |
| 4.00         | 0.265       | 0.180           | 2.37        | 0.1240      |
| 4.25         | 0.265       | 0.175           | 1.99        | 0.1587      |  
  
(C) Scald

| **Distance** | **PVEself** | **PVEneighbor** | **$\chi^2_1$** | **$p$-value** |
|--------------|-------------|-----------------|-------------|-------------|
| 0.00         | 0.510       | 0.000           | 14.92       | 0.0001      |
| 1.00         | 0.510       | 0.226           | 29.56       | 5.42E-08    |
| 1.42         | 0.510       | 0.114           | 14.73       | 0.0001      |
| 2.00         | 0.510       | 0.187           | 16.14       | 5.89E-05    |
| 2.84         | 0.510       | 0.112           | 7.22        | 0.0072      |
| 3.00         | 0.510       | 0.142           | 9.00        | 0.0027      |
| 4.00         | 0.510       | 0.177           | 9.80        | 0.0017      |
| 4.25         | 0.510       | 0.177           | 8.50        | 0.0036      |  
  

- Table S4. List of top-hit SNPs at each spatial scale


# References
