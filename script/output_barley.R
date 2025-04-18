library(tidyverse)
library(patchwork)
source("./script/coord.R")

##################################
# Manhattan plot with line, QQ-plot

# load GWAS results
trait = "NFNB" # select the trait name: NFNB, SNFB, or Scald
prfx = paste0(trait,"_GWAS")
dir = "./output/"
dirfn = paste0(dir,prfx,".rds")
gwas = readRDS(dirfn)

# check the presence of significant SNPs 
for(k in 1:length(gwas)) {
  print(-log10(min(gwas[[k]]$p_nei)))
  print(-log10(min(gwas[[k]]$p_nei)) > -log10(0.05/nrow(gwas[[k]])))
}
th_maf1 = nrow(gwas[[k]])

# MAF filtering as 5%
for(k in 1:length(gwas)) {
  gwas[[k]] = filter(gwas[[k]], MAF>0.05)
  print(-log10(min(gwas[[k]]$p_nei)) > -log10(0.05/nrow(gwas[[k]])))
}

th_maf5 = nrow(filter(gwas[[1]], MAF>0.05))

out = gwas[[9]] # results at distance = 4
chr_rep = table(out$CHROM)
cols = rep(rep(c(grey(0.5,0.5),"black"),times=length(chr_rep)/2),times=chr_rep)
x = coord(out$CHROM,out$POS)
p = out$p_nei
man = ggplot(NULL,aes(x=x$coord,y=-log10(p))) + geom_point(colour=cols,alpha=0.5) + theme_classic() + 
  scale_x_continuous(name="Chromosomes", breaks=x$tic, labels=names(chr_rep)) + ylim(NA,7.5) +
  ylab(expression(-log[10]*(italic(p)))) + geom_hline(yintercept=-log10(0.05/th_maf1),lty=1,colour="grey") +
  geom_hline(yintercept=-log10(0.05/th_maf5),lty=2,colour="grey") + theme(
    panel.background = element_rect(fill = "transparent",color = NA),
    panel.grid.minor = element_line(color = NA), 
    panel.grid.major = element_line(color = NA),
    plot.background = element_rect(fill = "transparent",color = NA)
  )

ggsave(man,filename=paste0("./output/",prfx,"_man.pdf"),height=2,width=5,dpi=600)

o = -log(sort(p,decreasing=FALSE),10)
e = -log(ppoints(length(p)),10)
qq = ggplot(data=NULL, mapping=aes(x=e,y=o))+
  geom_point(alpha=0.5)+
  geom_abline(intercept=0,slope=1,linetype="dashed") + theme_classic()+
  xlab(expression("Expected "*-log[10](p)))+ylab(expression("Observed "*-log[10](p))) + theme(
    panel.background = element_rect(fill = "transparent",color = NA),
    panel.grid.minor = element_line(color = NA), 
    panel.grid.major = element_line(color = NA),
    plot.background = element_rect(fill = "transparent",color = NA)
  )

ggsave(qq,filename=paste0("./output/",prfx,"_qq.pdf"),height=3,width=3,dpi=600)

th_maf1
th_maf5

#################
# PVE bar plot: CSV outputs are created by "neiGWAS_barley.R"
out = read.csv(paste0(dir,"PVE_",trait,"_MAF1.csv"))
bar = ggplot(data=out,aes(x=scale,y=total)) + geom_col() + theme_classic() +
  geom_text(data.frame(x=out$scale[out$p_val<0.01],y=out$total[out$p_val<0.01]),mapping=aes(x=x,y=y),label="**",size=6) +
  geom_text(data.frame(x=out$scale[(out$p_val<0.05)&(out$p_val>0.01)],y=out$total[(out$p_val<0.05)&(out$p_val>0.01)]),mapping=aes(x=x,y=y),label="*",size=6) +
  ylab("PVE") + xlab("Euclidian distance from focal plants") + ylim(NA,1)

ggsave(bar,filename=paste0("./output/PVE_",trait,".pdf"),height=3,width=3)


out = read.csv("./output/PVE_NFNB_MAF1.csv")
chi2 = qchisq(1-out$p_val,1) # convert p-values into chi^2-statistics
h2 = rep(out$PVEself[1],length(out$PVEself))
netPVE = out$total - out$PVEself[1]
PVE = c(h2,netPVE)
dist = rep(out$scale,2)
type = c(rep("self",length(out$PVEself)),rep("neighbor",length(out$PVEnei)))
res1 = data.frame(dist,PVE,type)
bar1 = ggplot(data=res1,aes(x=dist,y=PVE,fill=type)) + geom_bar(stat="identity") + theme_classic() + 
  ylab("PVE") + xlab("Euclidian distance from focal plants") + 
  ylim(NA,1) + theme(legend.position=c(0.8,0.9)) #+ labs(subtitle="Net form net blotch")
  
out = read.csv("./output/PVE_SFNB_MAF1.csv")
chi2 = qchisq(1-out$p_val,1)
h2 = rep(out$PVEself[1],length(out$PVEself))
netPVE = out$total - out$PVEself[1]
PVE = c(h2,netPVE)
dist = rep(out$scale,2)
type = c(rep("self",length(out$PVEself)),rep("neighbor",length(out$PVEnei)))
res2 = data.frame(dist,PVE,type)
bar2 = ggplot(data=res2,aes(x=dist,y=PVE,fill=type)) + geom_bar(stat="identity") + theme_classic() + 
  ylab("PVE") + xlab("Euclidian distance from focal plants") + 
  ylim(NA,1) + theme(legend.position="none") #+ labs(subtitle="Spot form net blotch")

out = read.csv("./output/PVE_Scald_MAF1.csv")
chi2 = qchisq(1-out$p_val,1)
h2 = rep(out$PVEself[1],length(out$PVEself))
netPVE = out$total - out$PVEself[1]
PVE = c(h2,netPVE)
dist = rep(out$scale,2)
type = c(rep("self",length(out$PVEself)),rep("neighbor",length(out$PVEnei)))
res3 = data.frame(dist,PVE,type)
bar3 = ggplot(data=res3,aes(x=dist,y=PVE,fill=type)) + geom_bar(stat="identity") + theme_classic() + 
  ylab("PVE") + xlab("Euclidian distance from focal plants") + 
  ylim(NA,1) + theme(legend.position="none") #+ labs(subtitle="Scald")

neip = ggplot(data=NULL,aes(x=rep(1:7,10),y=rep(1:7,each=10))) + geom_point() + 
  ylab("Row") + xlab("Range") + theme_bw()

bar = (neip | bar1) / (bar2 | bar3) #+ plot_annotation(tag_levels = "A")
ggsave(bar,filename="./output/PVE_all.pdf",height=6,width=6)

####################
# Supp figure: Raw data point along the ranges and rows
pdf("./output/barley_plot.pdf",width=10,height=5)
par(mfcol=c(3,3),mai=c(0.6,0.6,0.3,0.3))
barley_nfnb <- read.csv("./output/NFNB_merged.csv")
for(i in as.numeric(levels(factor(barley_nfnb$Experiment_Number)))) {
  plot(barley_nfnb[barley_nfnb$Experiment_Number==i,"Row"],
       barley_nfnb[barley_nfnb$Experiment_Number==i,"Range"],
       #xlim=c(min(barley_nfnb$Row),max(barley_nfnb$Row)),
       #ylim=c(min(barley_nfnb$Range),max(barley_nfnb$Range)),
       las=1,ylab="Range",xlab="Row",col=grey(0.5,0.5),pch=1,cex=0.5)
}

barley_sfnb <- read.csv("./output/SFNB_merged.csv")
for(i in as.numeric(levels(factor(barley_sfnb$Experiment_Number)))) {
  plot(barley_sfnb[barley_sfnb$Experiment_Number==i,"Row"],
       barley_sfnb[barley_sfnb$Experiment_Number==i,"Range"],
       #xlim=c(min(barley_sfnb$Row),max(barley_sfnb$Row)),
       #ylim=c(min(barley_sfnb$Range),max(barley_sfnb$Range)),
       las=1,ylab="Range",xlab="Row",col=grey(0.5,0.5),pch=1,cex=0.5)
}

barley_scald <- read.csv("./output/Scald_merged.csv")
for(i in as.numeric(levels(factor(barley_scald$Experiment_Number)))) {
  plot(barley_scald[barley_scald$Experiment_Number==i,"Row"],
       barley_scald[barley_scald$Experiment_Number==i,"Range"],
       #xlim=c(min(barley_scald$Row),max(barley_scald$Row)),
       #ylim=c(min(barley_scald$Range),max(barley_scald$Range)),
       las=1,ylab="Range",xlab="Row",col=grey(0.5,0.5),pch=1,cex=0.5)
}
dev.off()

