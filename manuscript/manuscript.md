---
title: Spatial heterogeneity of disease infection attributable to neighbor genotypic identity in barley cultivars
output:
  word_document: default
  pdf_document: default
  html_document: default
bibliography: zotero.bib
csl: g3.csl
---

**Iqra Akram**^1^, **Rie Shimizu-Inatsugi**^2^, \& **Yasuhiro Sato**^1,3\*^    

^1^Graduate School of Environmental Science, Hokkaido University, N10W5 Kita-ku, Sapporo 060-0810, Hokkaido, Japan  
^2^Department of Evolutionary Biology and Environmental Studies, University of Zurich
Winterthurerstrasse 190, 8057 Zurich, Switzerland  
^3^Faculty of Environmental Earth Science, Hokkaido University, N10W5 Kita-ku, Sapporo 060-0810, Hokkaido, Japan  
^\*^Corresponding author: yassato@ees.hokudai.ac.jp  
ORCID: 0000-0002-6466-723X (Y.S.)
  

# Abstract
Pest damage exhibits considerable spatial heterogeneity among individual plants in field environments. 
While such spatial heterogeneity was often treated as an environmental nuisance in quantitative genetics, underlying biotic factors and loci gain remain unexplored.
To quantify disease spatial variation and associate it with neighbor genotypes, we applied applied two methods, Spatial Analysis of Field Trials with Splines (SpATS) and Neighbor Genome-Wide Association Study (Neighbor GWAS), to barley cultivars.
Having compiled the CIMMYT Australia ICARDA Germplasm Evaluation (CAIGE) data, we first applied SpATS to damages by three diseases such as the net form net blotch, spot form net blotch, and scald.
This SpATS analysis showed extraneous phenotypic variation unexplained by spatial autocorrelation, thereby leading us to conduct further variance component analysis and GWAS. 
We then applied the Neighbor GWAS model to further variance component analysis and found that 10-30% variation of the three disease phenotypes was significantly explained by neighbor genotypic identity. 
The Neighbor GWAS method also detected a relatively rare but significant variant that was located on the barley 7H chromosome and associated with neighbor genotypic influence on the net form net blotch.
This significant variant was estimated to have a positive effect of the allelic similarity on the disease damage, indicating an adversarial influence of its allelic mixture on the spread of net form net blotch.
These findings suggest that neighbor genotype identity is a key to account for spatial heterogeneity and reduce pest damage by variety mixture in field crops.  

# Introduction

Natural and field-grown plants exhibit considerable spatial variation in their phenotypes, which is shaped by abiotic and biotic factors. Pest damage, such as pathogen infection [@rieux_long-distance_2014] and insect herbivory [@the_herbivory_variability_network__plant_2023], is especially heterogeneous among conspecific individual plants in the field. While spatial heterogeneity has been considered a nuisance in crop breeding trials [@rodriguez-alvarez_correcting_2018], extraneous spatial variation is sometimes shaped by biotic interactions. For example, neighboring genotypes are one of biotic factors that can shape spatial heterogeneity of pest damage [@dahlin_pest_2018; @tamura_intraspecific_2020; @costa_e_silva_genetic-based_2017; @pelissier_genetic_2023]. In a close proximity, plant-plant interactions are driven by volatile communications among genotypes, allowing variety mixture to be resistant to pests [@dahlin_pest_2018]. Even when direct plant-plant communications are absent, resistant genotypes protect susceptible neighbors [@tamura_intraspecific_2020] or susceptible genotypes spread pests to resistant genotypes _vice versa_ [@utsumi_plant_2011-1]. Because of this line of biological relevance, the genetics of conspecific neighbor effects offer a way of pest control by variety mixtures [@mundt_use_2002; @dahlin_pest_2018; @montazeaud_cultivar_2022; @sato_genetics_2024].  

Barley (_Hordeum vulgare_) is an important cereal crop and infected by various fungal pathogens worldwide. For example, _Pyrenophora teres_ is a causal agent of net blotch symptom in barley [@liu_pyrenophora_2011], in which _P. teres_ f. _teres_ and _P. teres_ f. _maculata_ induce different symptoms, net form and spot form net blotch, respectively. In addition to _P. teres_, _Rhynchosporium secalis_ is known as a causal agent of barley scald also known as 'leaf blotch' [@abang_differential_2006; @zhan_resistance_2008]. These fungi immediately develop spores on primary host plants under moderate climate, splash conidia by wind, and can trigger secondary infection to another plant during the growing season of barley [@liu_pyrenophora_2011; @zhan_resistance_2008]. To date, quantitative trait locus (QTL) mapping and genome-wide association studies (GWAS) have identified multiple loci associated with barley resistance to net blotch and scald [@novakazi_genetic_2019; @richards_association_2017; @tamang_association_2015]. Little is known, however, about the influence of neighboring genotypes and their associated variants.

To analyze the influence of neighboring genotypes on individual traits, we have recently developed a new method of GWAS, called "Neighbor GWAS" [@sato_neighbor_2021]. Inspired by the Ising model of magnetics, the Neighbor GWAS method expands a standard mixed model to incorporate locus-wise interactions among neighboring genotypes. Owing to its locus-wise modelling, the Neighbor GWAS method can be applied to any randomized cultivation of multiple varieties. As such a randomized spatial arrangement has often been adopted in GWAS experiments [e.g., @@sato_reducing_2024; @mcfarland_maize_2020; @jung_genetic_2022; @flutre_genome-wide_2022], the Neighbor GWAS method possesses wide applicability to any plant GWASs. For instance, our previous study demonstrated the power of Neighbor GWAS to predict key genotype pairs that mitigated insect herbivory in *Arabidopsis thaliana*. Although this workflow may also be applied to agricultural data, the Neighbor GWAS method has not been applied to crop data.  

In this study, we investigated spatial heterogeneity of disease infection, such as net blotch and scaled, in barley. Specifically, we aimed to address the following questions: (i) Was the significant fraction of disease infection explained by any spatial process? (ii) To what extent was the spatial variation explained by neighboring genotypic identity? (iii) Were there any significant QTL responsible for the neighbor genotypic effects on disease infection? To address these questions, we applied two methods of quantitative genetics, SpATS and Neighbor GWAS, for publicly available data deposited by the CIMMYT Australia ICARDA Germplasm Evaluation (CAIGE) project.

# Materials & Methods

## Dataset
Barley phenotype and genotype data were obtained from the website of CIMMYT Australia ICARDA Germplasm Evaluation (CAIGE) project (<https://www.caigeproject.org.au/>; see Table S1 for exact URLs).
More specifically, DArT-derived SNP data for 807 lines were downloaded from the Gigwa database.
Genotype data were imputed using BEAGLE3 [@ayres_beagle_2019] after exclusion of duplicated markers.
The phenotype data were downloaded from the disease screening webpage.
Datasets were curated with the following three criteria: (1) spatial information (i.e., rows and ranges of field plots) are available; (2) phenotypes are recorded for multiple years; (3) more than 500 individuals are available for statistical analysis. 
As a result, we were able to retrieve three-year data on three phenotypes, i.e, spot form net blotch, net form net blotch, and scald symptoms recorded at Horsham, Australia.
We combined the three-year datasets in which end-point damage levels (score variables) were considered a representative phenotype for each disease.
Each phenotype includes approximately 25,000 SNP markers and 500 individuals with 480 genotypes.
Details on sample sizes are summarized as a supplementary table (Table 1).  


## Spatial Analysis of Field Trials with Splines (SpATS)

We used the Spatial Analysis of Field Trials with Splines (SpATS) [@rodriguez-alvarez_correcting_2018] to quantify normal and extraneous spatial heterogeneity of plant damage by the net form net blotch, spot form net blotch, and scald.
**The SpATS method estimates the proportion of the phenotypic variation directed to spatial correlation by exhibiting the spatial dependency of the observations according to their closeness in the field. SpATS models the spatial effects using P-splines along and calculates the amount of phenotypic variation owing to spatial processes. This can also model intricate spatial structures by using smoothing splines for equal row and column displacements. SpATS also quantified broad-sense heritability described by plant’s own genotypic effects.**  

To apply the SpATS method to barley data, we utilized the SpATS package [@rodriguez-alvarez_correcting_2018] implemented in R version 4.3.0 [@Rcite], with the following arguments specified in the SpATS and other optional functions.
Damage levels (score variable) for the net form net blotch, spot form net blotch, and scald were separately analyzed as a response variable.
The study years and experimental blocks of field trials were considered non-genetic covariates and included as fixed effects.
Genotypes (i.e., the name of cultivars) and spatial positions (i.e., row and range) were considered random effects: the former was specified as "genotype.as.random = TRUE" and the latter was specified as "random = row + range" within the SpATS function.
We set "ANOVA = TRUE" within the SAP function of the SpATS package to enable variance components to be quantified among the random effects of genotypes and spatial positions [@rodriguez-alvarez_fast_2015].
The getHeritability function was also used to calculate a generalized broad-sense heritability $H^2$ [@oakey_joint_2006].
The estimated spatial heterogeneity was visualized using the plot.variogram.SpATS function, which depicted sample variograms based on displacements among rows, column and residuals [@gilmour_accounting_1997].  


## Neighbor GWAS

### Model description

We used the Neighbor GWAS method [@sato_neighbor_2021] to quantify (i) the proportion of phenotypic variation explained (PVE) by neighbor genotypic effects and (ii) perform GWAS of neighbor genotypic effects on disease symptoms.
In short, Neighbor GWAS consists of a two-factor linear mixed model that incorporates locus-wise identity (or similarity vice versa) of neighboring genotypes in addition to plants' own genotypes as follows:

$$y_i = \beta_0 + \beta_1x_i + \frac{\beta_2}{J}\sum_{j=1}^J{(x_ix_j)} + u_i + e_i~~~~~\text{Eq. 1}$$

where $y_i$ is a phenotype of $i$-th individual; $\beta_0$ is an intercept; $\beta_1$ is a fixed effect from plant's own genotype at a focal locus $x_i$; $\beta_2$ is a fixed effect from genotypes of neighboring individuals $x_j$ at the same locus ($j$ up to the number of neighboring individuals $J$); $u_i$ is a random effect; and $e_i$ is a residual.
For the two fixed effects $\beta_1$ and $\beta_2$, plant's own genotypic values $x_i$ are converted as -1, 0, and +1 for one homozygote, heterozygote, and another homozygote.
Accordingly, the mean allelic identity between the focal and neighboring plants $\sum_{j=1}^J{(x_ix_j)}/J$ takes from -1 (dissimilar) to +1 (similar), in which the sign of $\beta_2$ corresponded to negative or positive effects of allelic identity on a focal plant's phenotype $y_i$.
Therefore, statistical tests of $\beta_2$ and its estimates enable GWAS with the inference for the positive or negative allelic interactions among neighboring plants.
For the random effects $u_i$, two variance-covariance matrices related to plant's own and neighboring genotypes are considered as $u_i \sim \text{Norm}(0, \sigma^2_1\boldsymbol{K_1} + \sigma^2_2\boldsymbol{K_2})$, where a tilde means 'distributed as'. The two variance component parameters $\sigma^2_1$ and $\sigma^2_2$ respectively represents polygenic effects of plant's own and neighboring genotypes on a phenotype $y_i$, in which $\boldsymbol{K_1}$ is a kinship matrix and $\boldsymbol{K_2}$ represents neighbor genotypic similarity across a field (see Appendix S1).
The rest unexplained variation, i.e., residual, follows a normal distribution as $e_i \sim \text{Norm}(0, \sigma^2_e\boldsymbol{I})$. 
Net phenotypic variation explained (PVE) by neighboring genotypes can be quantified as PVE = $[(\sigma^2_1 + \sigma^2_2)/(\sigma^2_1 + \sigma^2_2 + \sigma^2_e)] - h^2$, where $h^2$ is a SNP heritability quantified by a standard GWAS model.
In short, variation partitioning can be performed by estimating two variance components $\sigma^2_1$ and $\sigma^2_2$ (see "Phenotypic variation explained by neighbor genotypes" below) while GWAS can be performed by testing the fixed effect $\beta_2$ (see "Genome-wide association study" below). 
All the relevant methods of Neighbor GWAS are implemented as the rNeighbor GWAS package v1.2.4 (<https://doi.org/10.32614/CRAN.package.rNeighborGWAS>), which depends on the gaston package [@Rgaston] and uses its lmm.aireml and lmm.diago functions to solve mixed models and perform GWAS, respectively.
Theoretical details are described in @sato_neighbor_2021.  


### Phenotypic variation explained by neighbor genotypes

We used the Neighbor GWAS package to estimate the variance components $\sigma^2_1$, $\sigma^2_2$, and $\sigma^2_e$ and examine how largely spatial variation can be explained by plants' own and neighboring genotypes. 
We examined two cut-off thresholds of minor allele frequency (MAF) at 5% or 1%, leaving approx. 20,578 and 14,568 SNPs, respectively (Table 1). 
The former cut-off percentage is often adopted in plant GWAS [@tibbs_cortes_status_2021] while the latter includes relatively rare but sometimes meaningful variants [@tibbs_cortes_status_2021; @xu_genome-wide_2023].
The damage severity score (from 1 to 9) of three disease symptoms were separately analyzed as a target phenotype: net form net blotch, spot form net blotch, and scald.
The end-point damage score was used as a representative phenotype for each year.
Non-genetic covariates were also considered for the differences of the three study years (2015, 2016, and 2017) and spatial positions (rows and ranges) of field plots.
Along the rows and ranges, SpATS analysis detected the non-linear spatial trends of disease phenotypic values among field plots (see Results below); therefore, the first to forth polynomials were considered for the non-genetic covariates of rows and ranges to correct for the non-linear spatial patterns.
Regarding the spatial range to be referred, we analyzed up to the fourth nearest neighbors in a field, which corresponds up to 4.2 Euclidean distance from focal plants.
This is because, when spatial range is too broad, plant's own genotypic value $x_i$ and neighbor genotypic values $\sum_{j=1}^J{(x_ix_j)/J}$ have a severe co-linearity [@sato_neighbor_2021; @sato_reducing_2024].
To address such a co-linearity, likelihood ratio tests were performed for Eq. 1 from simpler to complex models following @sato_reducing_2024.  


### Genome-wide association study (GWAS)

To identify QTLs responsible for neighbor genotypic effects on disease infection, we performed GWAS of the neighbor effect coefficient $\beta_2$ and depicted Manhattan plots.
The target phenotype and non-genetic covariates were the same as the PVE analysis above.
Each SNP was tested after diagonalization on a weighted kinship matrix $\boldsymbol{K'} = \hat{\sigma}^2_1\boldsymbol{K_1} + \hat{\sigma}^2_2\boldsymbol{K_2}$ [see @sato_neighbor_2021 for details].
GWAS was repeated up to the spatial distance at 4.2 and separately performed for the three phenotypes, namely net form net blotch, spot form net blotch, and scald.
To test whether QTLs overlapped between plant's own and neighbor genotypic effects, we also performed standard GWAS, which was a subset of the Neighbor GWAS model (Eq. 1) when $\beta_2$ and $\sigma^2_2$ were set at 0.
The standard GWAS was also performed using Neighbor GWAS, which internally uses the gaston package of R [@Rgaston].
We determined the statistical significance at $p$ = 0.05 and the marginal significance between $p$ = 0.05 and 0.1 throughout the present study.
To check if any genes are located near our focal SNPs, we refer to the genome annotation of Barley Morex V3 [@mascher_long-read_2021] through the GrainGenes database (<https://wheat.pw.usda.gov/GG3/genome_browser>).  

## Data availability
All the source code and input data are available at GitHub (<https://github.com/yassato/caige_barley>).
Supplementary Figure S1 presents GWAS QQ plots.
Supplementary Table S1 shows the list of exact URLs for the original input data.
Supplementary Table S2 and S3 include the exact $p$-values for the likelihood ratio tests shown in Figure 2.
All the supplementary figures and tables are available through Figshare at https://doi.org/xxxxxx.


# Results

## Spatial heterogeneity of disease infection
We used SpATS to distinguish genetic and spatial variation in the three disease phenotypes --- namely, net form net blotch, spot form net blotch, and scald --- among barley cultivars.
The broad-sense heritability $H^2$ was 0.78 for the net form net blotch; 0.68 for spot form net blotch; and 0.65 for scald, indicating that the moderate to high variation could be explained by plants' own genotypes.
Besides these genetic variations, there was spatial variation along the rows and columns of field plots (Table SX). 
Furthermore, spatial variograms display extraneous variation in unexplained residuals along the rows and columns, in which the spatial curves presented the wavy pattern for each disease (Fig. 1).
These results showed that the substantial spatial heterogeneity of disease infection was unexplained by plants’ own genotypes and smooth spatial trends, leaving a room to be explained by the other factors such as neighboring genotypes.

## Phenotypic variation explained by neighbor genotypes
Subsequently, we asked to what extent the spatial heterogeneity could be explained by neighbor genotypic effects. 
To address this question, we calculated phenotypic variation explained by neighbor genotype identity using the Neighbor GWAS model. 
All the three phenotypes of disease infection exhibited >20% SNP heritability $h^2_\text{SNP}$ regarding plant's own genotypic effects (blue bars in Fig. 2A-C).
Specifically, the net form net blotch showed x\% heritability at the 5\% significance level ($h^2_\text{SNP}$ = x, $\chi^2_1=x$, $p<0.05$: see Table S2 for exact test-statistics and $p$-values).
The spot form net blotch showed y\% heritability but at the marginally significance level ($\chi^2_1$ > xx, $p$ < 0.1).
The scald showed z\% heritability at the 5\% significance level ($h^2_\text{SNP}$ = x, $\chi^2_1=x$, $p<0.05$).
These SNP-based metrics of narrow-sense heritability were lower than the broad-sense heritability described above, but previous metrics also reported lower heritability for narrow-sense than broad-sense metrics (cite).
These results confirmed that our SNP-based analysis was able to detect heritable variation in the three disease phenotypes.  

More remarkably, we found significant contributions of neighbor genotypes to all the three disease phenotypes (red bars in Fig. 3A-C; likelihood ratio test, $\chi^2_1$ > xx, $p$ < 0.05 see Table S2 for exact test-statistics and $p$-values).
For instance, the influence of neighbor genotypes on the net form net blotch was significant ($p$<0.05) up to the second nearest neighbors and remained marginally significant ($p$<0.1 and $p$>0.05) up to the fourth nearest neighbors (Fig. 3A and Table S2A).
The spot form net blotch was significantly influenced by the first and second nearest neighbors, though this influence became non-significant for the distant neighbors (Fig. 2B and Table S2B).
The scald damage showed the most significant patterns among the three disease phenotypes, such that the influence of neighboring genotypes remained significant across a space (Fig. 2C and Table S2C).
These significant contributions of neighbor genotypes to the three disease phenotypes explained 9 to 30% of total phenotypic variation (red bars in Fig. 2).
The similar patterns were found even when the cut-off value of MAF was changed to 0.05 (Table S3A-C).
These variance component analyses showed that a significant fraction of damage variation was attributable to neighbor genotypic identity, which led us to further ask whether major-effect SNPs underlay this damage variation.  

## Genome-wide association study
Lastly, we used Neighbor GWAS to detect loci associated with neighbor genotypic effects on the three phenotypes of disease infection at the spatial scales from the first to forth nearest neighbors.
We detected two significant SNPs associated with neighbor genotypic effects at the spatial scale of the forth nearest neighbors (i.e., Euclidean distance = 4 from focal individuals).
One of these two significant SNPs was detected for the net form net blotch and another was for scald (Fig. 3B, C, D).
The significant SNP of neighbor genotypic effects on the net form net blotch was located on the tip of 7H chromosome (Chr7H at 610368438: Fig. 3B).
This significant SNP exhibited a positive sign of neighbor effect coefficient ($\beta_2$ = 2.77, MAF = 0.109, raw $p$-value = 4.66e-07), indicating that this SNP had positive allelic interactions to prevent the disease spread among neighboring plots.
Another significant SNP detected for scald was assigned as an un-anchored chromosome (Fig. 3F): thus, its QTL position remains unknown.
In addition to the two significant SNPs, a marginally significant SNP for the scald damage was found on the 7H chromosome (chr7H at 581517810: Fig. 3F).
This SNP had a positive sign of neighbor effect coefficient ($\beta_2$ = 3.24, MAF = 0.098, raw $p$-value = 4.19e-06, Bonferroni-corrected $p$-value = 0.086) and thus indicated positive allelic interactions at this locus to prevent the disease spread among neighboring plots.
These findings suggest the potential existence of QTLs responsible for positive genotype-genotype interactions that mitigate disease spreads.  

To examine whether neighbor genotypic effects shared the same QTLs with plant's own genotypic effects, we also conducted standard GWAS and compared it with Neighbor GWAS.
This standard GWAS did not find any significant SNPs for the three diseases ($p$ > 0.1 after Bonferroni correction) but found suggestive peaks.
_Such weak peaks were found for the damage by the net form and spot form net blotch and located on x chromosomes. (Fig. 3A and C)_.
Combined with the Neighbor GWAS results, these findings suggest that plant' own and neighbor genotypic effects on disease infection may have different genetic bases.  

# Discussion
Our quantitative genetic analyses revealed that substantial fractions of spatial heterogeneity was attributable to neighbor genotypes in barley diseases.
Similarly, studies on indirect genetic effects reported the influence of neighboring genotypes on the other individuals' phenotypes in _Arabidopsis thaliana_ [@montazeaud_indirect_2023], _Eucalyptus globulus_ [@silva_genetic_2013; @costa_e_silva_accounting_2013; @costa_e_silva_genetic-based_2017], and durum wheat _Triticum turgidum_ ssp. _durum_ [@montazeaud_cultivar_2022].
While these previous studies also quantified the phenotypic variation attributable to neighboring genotypes, few have identified genetic variants associated with those effects.
In this context, our Neighbor GWAS analysis detected a significant SNP associated with neighbor genotypic effects on the net blotch damage.
This is the first report for Neighbor GWAS to detect a significant QTL and, to our knowledge, one of few reports on significant QTLs associated with neighbor genotypic effects on agriculturally important traits [@montazeaud_cultivar_2022].  

## Genetic architecture of neighbor effects
Through marker-trait associations, GWAS can provide correlative evidence for candidate genes near significant SNPs. 
On the tip of the chromosome 7H, we specifically found a significant SNP at 610368438 for the net form net blotch; and a marginally significant SNP at 581517810 for scald. 
Within 30-kb near the 610368438 position, we did find the two loci HORVU.MOREX.r3.7HG0742860 and HORVU.MOREX.r3.7HG0742870 which encoded protein kinases.
Another SNP at 581517810 was located within 30 kb near the loci HORVU.MOREX.r3.7HG0731740, HORVU.MOREX.r3.7HG0731730, and HORVU.MOREX.r3.7HG0731700 which encoded a SCO1-like protein, lipid transfer protein, and transducin/WD40 repeat protein, respectively.
Among them, protein kinases and WD40 repeat proteins are known to involve barley resistance to abiotic and biotic stresses (**cites**).
Although such gene functions need to be validated, these candidate genes add functional inference to the long-distance neighbor genotypic effects on disease infection.  

Besides candidate genes, previous studies reported several net blotch-related QTLs were reported for the tip of the chromosome 7H (Tamang et al. 2015; Richard et al. 2017; Novakazi et al. 2019; Clare et al. 2019) near 581517810 and 610368438 bp positions.
While our normal GWAS did not find any significant SNPs on previously reported QTLs, those overlapped QTLs suggest their dual roles in plants' own and neighbor genotypic effects on disease resistance.
For example, Tamang et al. (2015) performed GWAS using 2062 barley accessions and identified a novel QTL associated with the damage by the New Zealand strain, NZKF2, of the spot form net blotch.
This QTL region ranged from 601275881 to 615403763 at the chromosome 7H (Tamang et al. 2015), including the SNP position of 610368438 for which we found long-range neighbor genotypic effects on the net form net blotch.
Another QTL reported by Tamang et al. (2015) ranged from 579216453 to 601275986 on the chromosome 7H, encompassing the marginally significant SNP at 581517810 for which we found long-range neighbor genotypic effects on the scald.
These QTLs may be a clue to design variety mixtures to prevent disease spread by optimizing genotype-genotype interactions.  

The influence of neighboring genotypes on another plant's infection could occur through dispersal from one plot to another since all the three fungal agents splash conidia by wind to cause secondary infection.
We found that the magnitude of neighbor genotypic effects differed among the three diseases, which may be attributed to two possibilities.
One possibility is because of data quantity.
The least significant phenotype, spot form net blotch, indeed had the sparsest data points (Fig. 1B); thus, the statistical power might be low for this phenotype.
For the other two phenotypes, another possibility concerns biological aspects of fungal life cycles and dispersal mode.
_The influence of neighboring genotypes depends not only on plant genetics but also on pathogen life histories, with respect to generation time and dispersal mode. Discussions on the generation time and dispersal model of NFNB, SFNB, and Scald (based on Iqra's literature survey) especially on temperature_
These differences in fungal life history may differentiate the influence of neighboring genotypes on disease infection.  

## Applicability and methodological limitation
In order to infer neighboring genotype-genotype interactions, our analysis showed the effective use of open data collected from a randomized block design of many plant genotypes.
As the randomized block design is often employed to conduct GWAS [e.g., @sato_reducing_2024], there should be other available data on various plant species.
In this context, Neighbor GWAS does not require manipulative experiments and thus widens the opportunity to study the genetic architecture of plant-plant interactions using open data [@sato_genetics_2024].
Meanwhile, we should note that open data may not be always complete.
For instance, detailed metadata, such physical distance between individual plots or plants, were not found in the barley open data.
This shortage of basic information could have made the interpretation of Neighbor GWAS difficult.
To solve this issue, pattern-based analyses, such as P-splines in SpATS, was used as a complementary tool to determine the upper limit of spatial heterogeneity in observed phenotypes.
A joint use of pattern-based and process-based modeling would be effective for overcoming potential limitations regarding data availability.  

## Conclusion 
Harnessing open data, we found significant phenotypic variation and genetic variant associated with neighbor genotypic effects on disease infection in barley.
Neighbor genotypic effects are linked to genotype mixtures [@sato_reducing_2024], providing one of promising ways for integrated pest management [@tooker_genotypically_2012].
Unlike a previous study on polygenic traits [@sato_reducing_2024], the identification of significant QTLs may enable us to optimize population-level pest damage with a few loci focused [@wuest_ecological_2021; @sato_genetics_2024].
For barley cultivars, we indeed detected a significant SNP that had positive effects of allelic mixture on damage, indicating a potential prevention of disease spread by allelic mixtures.
Beyond genotype mixture, allelic mixture is particularly suitable for crop varieties because intraspecific varieties can be subjected to breeding by crossing each other [@montazeaud_cultivar_2022].
Further studies are needed to validate these effects by comparing allelic monoculture and mixture at the candidate locus.  

# Author contributions
IA: investigation, formal analysis, funding acquisition, writing; RSI: supervision, funding acquisition, writing; YS: methodology, investigation, data curation, formal analysis, supervision, funding acquisition, writing

# Acknowledgement
The authors appreciate all efforts made by the data collectors of the CAIGE project. Thanks are also given to Lukas Rohr, a former master student at the University of Zurich, for pilot analyses during the initial stage. This study was supported by the Japan Science and Technology Agency (JST) FOREST program (grant no. JPMJFR233L to YS); Swiss National Science Foundation (SNSF) Spark program (CRSK-3_221418 to YS); and JST SPRING program (JPMJSP2119 to IA). The authors declare that there is no conflict of interest in this study.


# Figures


![Figure 1. SpATS for visualization of spatial heterogeneity- X-axis represents row displacement; Y-axis represents column displacement and Z-axis represents residual displacement of disease severity. The color gradient reflects disease severity/damage level where blue indicates low, green indicates moderate and yellow indicates high severity.](../figures/SpATS_draft.png)

![Figure 2. Proportion of phenotypic variation explained (PVE) by plant's own (self) and neighbor (neighbor) genotypic effects on on the three phenotypes of disease infections: (A) net form net blotch, (B) spot form net blotch, and (C) scald. PVE at the distance of zero corresponds to a coventional SNP heritability (blue). Additional fractions explained by neighbor genotypic identity (red) indicate a net contribution of neighbor genotypic effects  and are shown across the distances $\neq$ 0. Asterisks indicate \* $p<0.05$; \** $p<0.01$ with likelihood ratio test (see Table S2 for exact $p$-values).](../figures/PVE_fig.pdf) 


![Figure 3. GWAS Manhattan plots for plant's own or neighbor genotypic effects on the three phenotypes of disease infections in barley cultivars. Left (A, C, and E) and right (B, D, and F) panels display plant's own (self) or neighbor (neighbor) genotypic effects, respectively. Target phenotypes are the net form net blotch (A-B), spot form net blotch (C-D), and scald (E-F). Solid and dashed holizontal lines indicate genome-wide Bonferroni threshold at $p<0.05$ with MAF cut-off values at 0.01 and 0.05, respectively.](../figures/barleyMan.pdf)


# Tables

Table 1. Summary of data availability 

| **Phenotype** | **#Plants$^\dagger$** | **#Genotypes$^\dagger$** | **\%Missing** | **#SNPs (MAF=1%)** | **#SNPs (MAF=5%)** |
| ---- | ---- | ---- | ---- | ---- | ---- |
| Net form net blotch | 508 | 481 | 32 | 20578 | 14568 |
| Spot form net blotch | 507 | 485 | 25 | 20583 | 14570 | 
| Scald | 509 | 482 | 25 | 20527 | 14580 |  

$\dagger$Shown are the number after individuals whose genotype are unavailable (i.e., \%Missing) are excluded.

# Supplementary Materials

![Figure S1. Quantile-Quantile (QQ) plots of plant's own or neighbor genotypic effects on the three phenotypes of disease infections in barley cultivars. Upper (A, B, and C) and lower (D, E, and F) panels display plant's own (self) or neighbor (neighbor) genotypic effects, respectively. Target phenotypes are the net form net blotch (A-D), spot form net blotch (C-E), and scald (C-F). Observed -log~10~($p$) association scores are plotted against those of expected values. Dashed lines indicate random expectation as $y = x$.](../figures/barleyQQ.pdf)


Table S1. Exact links to the study data within the CAIGE website

| Data | URL | File name | Last access date |
| ---- | ---- | ---- | ---- |
| genotype-phenotype link (2013-2019) | <https://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/> | CAIGE-Barley-Disease-compilation-data_LZ.xlsx | 24-Oct-2024 |
| genotype | <http://52.64.175.84:8080/gigwa/?module=caigebarley&project=Barley_genotypic_data> | caigebarley__project1__2021-05-28__53355variants__VCF.zip | 23-Oct-2024 |
| phenotype (2015) | <https://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/disease-screening-2015/> | 2015_caigebarleydisease_14shipment_dedjtr_pm_sfnb_nfnb.xlsx | 31-May-2021 |
| phenotype (2016) | <https://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/disease-screening-2016/> | 2016_caigebarleydisease_15shipment_dedjtr_sfnb_nfnb.xlsx | 31-May-2021 |
| phenotype (2017) | <https://www.caigeproject.org.au/germplasm-evaluation/barley/disease-screening/disease-screening-2017/> | 2017_caigebarleydisease_16shipment_dedjtr_sfnb_nfnb.xlsx | 31-May-2021 | 
  

Table S2. The proportion of phenotypic variation explained (PVE) by plant's own (PVEself) or neighbor (PVEneighbor) genotypes at MAF = 0.01. For distance $\neq$ 0, likelihood ratio tests based on $\chi^2_1$-statistic were used to determine $p$-values of Neighbor GWAS models over a standard GWAS model. For distance = 0, likelihood ratio tests were performed over a null model, which made PVEself equivalent to a SNP heritability (see also Methods "Phenotypic variation explained by neighbor genotypes").  

(A) Net form net blotch

| **Distance** | **PVE(self)** | **PVE(neighbor)** | **$\chi^2_1$** | **$p$-value** |
|--------------|---------------|-------------------|----------|-----------|
| 0.00         | 0.366         | 0.000             | 5.012    | 0.025     |
| 1.00         | 0.366         | 0.145             | 5.684    | 0.017     |
| 1.42         | 0.366         | 0.143             | 4.029    | 0.045     |
| 2.00         | 0.366         | 0.188             | 3.741    | 0.053     |
| 2.84         | 0.366         | 0.188             | 3.064    | 0.080     |
| 3.00         | 0.366         | 0.192             | 2.661    | 0.103     |
| 4.00         | 0.366         | 0.193             | 2.979    | 0.084     |
| 4.25         | 0.366         | 0.103             | 0.552    | 0.457     |


(B) Spot form net blotch

| **Distance** | **PVE(self)** | **PVE(neighbor)** | **$\chi^2_1$** | **$p$-value** |
|----------------|-----------------|---------------------|------------|-------------|
| 0.00           | 0.228           | 0.000               | 2.913      | 0.088       |
| 1.00           | 0.228           | 0.146               | 2.734      | 0.098       |
| 1.42           | 0.228           | 0.199               | 4.366      | 0.037       |
| 2.00           | 0.228           | 0.303               | 6.938      | 0.008       |
| 2.84           | 0.228           | 0.198               | 2.305      | 0.129       |
| 3.00           | 0.228           | 0.222               | 2.033      | 0.154       |
| 4.00           | 0.228           | 0.141               | 0.625      | 0.429       |
| 4.25           | 0.228           | 0.127               | 0.410      | 0.522       |
  
(C) Scald

| **Distance** | **PVE(self)** | **PVE(neighbor)** | **$\chi^2_1$** | **$p$-value** |
|--------------|---------------|-------------------|----------|-----------|
| 0.00         | 0.591         | 0.000             | 14.659   | 0.00013   |
| 1.00         | 0.591         | 0.191             | 28.423   | 9.75E-08  |
| 1.42         | 0.591         | 0.098             | 14.040   | 0.00018   |
| 2.00         | 0.591         | 0.175             | 17.141   | 3.47E-05  |
| 2.84         | 0.591         | 0.101             | 6.129    | 0.0133    |
| 3.00         | 0.591         | 0.130             | 8.517    | 0.0035    |
| 4.00         | 0.591         | 0.161             | 9.944    | 0.0016    |
| 4.25         | 0.591         | 0.161             | 8.470    | 0.0036    |

  
Table S3. The proportion of phenotypic variation explained (PVE) by plant's own (PVEself) or neighbor (PVEneighbor) genotypes at MAF = 0.05. For distance $\neq$ 0, likelihood ratio tests based on $\chi^2_1$-statistic were used to determine $p$-values of Neighbor GWAS models over a standard GWAS model. For distance = 0, likelihood ratio tests were performed over a null model, which made PVEself equivalent to a SNP heritability (see also Methods "Phenotypic variation explained by neighbor genotypes").  

(A) Net form net blotch

| **Distance** | **PVE(self)** | **PVE(neighbor)** | **$\chi^2_1$** | **$p$-value** |
|--------------|---------------|-------------------|----------|-----------|
| 0.00         | 0.296         | 0.000             | 4.878    | 0.027     |
| 1.00         | 0.296         | 0.163             | 5.782    | 0.016     |
| 1.42         | 0.296         | 0.160             | 3.977    | 0.046     |
| 2.00         | 0.296         | 0.210             | 3.532    | 0.060     |
| 2.84         | 0.296         | 0.217             | 2.942    | 0.086     |
| 3.00         | 0.296         | 0.216             | 2.378    | 0.123     |
| 4.00         | 0.296         | 0.216             | 2.793    | 0.095     |
| 4.25         | 0.296         | 0.105             | 0.399    | 0.528     |
  

(B) Spot form net blotch

| **Distance** | **PVE(self)** | **PVE(neighbor)** | **$\chi^2_1$** | **$p$-value** |
|--------------|---------------|-------------------|----------|-----------|
| 0.00         | 0.166         | 0.000             | 2.598    | 0.107     |
| 1.00         | 0.166         | 0.145             | 2.449    | 0.118     |
| 1.42         | 0.166         | 0.207             | 4.117    | 0.042     |
| 2.00         | 0.166         | 0.313             | 5.776    | 0.016     |
| 2.84         | 0.166         | 0.212             | 1.881    | 0.170     |
| 3.00         | 0.166         | 0.227             | 1.448    | 0.229     |
| 4.00         | 0.166         | 0.093             | 0.150    | 0.699     |
| 4.25         | 0.166         | 0.060             | 0.044    | 0.833     |
  
(C) Scald

| **Distance** | **PVE(self)** | **PVE(neighbor)** | **$\chi^2_1$** | **$p$-value** |
|--------------|---------------|-------------------|----------|-----------|
| 0.00         | 0.511         | 0.000             | 14.292   | 0.0002    |
| 1.00         | 0.511         | 0.224             | 27.382   | 1.67E-07  |
| 1.42         | 0.511         | 0.118             | 13.395   | 0.0003    |
| 2.00         | 0.511         | 0.200             | 15.411   | 8.65E-05  |
| 2.84         | 0.511         | 0.124             | 5.958    | 0.0147    |
| 3.00         | 0.511         | 0.158             | 8.134    | 0.0043    |
| 4.00         | 0.511         | 0.193             | 9.314    | 0.0023    |
| 4.25         | 0.511         | 0.193             | 7.883    | 0.0050    |
  

- Table S4. List of top-hit SNPs at each spatial scale


# References
