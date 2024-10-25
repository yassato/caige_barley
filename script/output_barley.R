library(tidyverse)
library(patchwork)
source("./script/coord.R")

##################################
# manhattan plot with line, QQ-plot

# load GWAS results
trait = "SFNB"
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
# for(k in 1:length(gwas)) {
#   gwas[[k]] = filter(gwas[[k]], MAF>0.05)
#   print(-log10(min(gwas[[k]]$p_nei)) > -log10(0.05/nrow(gwas[[k]])))
# }

th_maf5 = nrow(filter(gwas[[1]], MAF>0.05))

out = gwas[[3]]
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

ggsave(man,filename=paste0("./figures/",prfx,"_man.pdf"),height=2,width=5,dpi=600)

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

ggsave(qq,filename=paste0("./figures/",prfx,"_qq.pdf"),height=3,width=3,dpi=600)

th_maf1
th_maf5

#################
# PVE bar plot
out = read.csv(paste0(dir,"PVE_",trait,"_MAF1.csv"))
bar = ggplot(data=out,aes(x=scale,y=total)) + geom_col() + theme_classic() +
  geom_text(data.frame(x=out$scale[out$p_val<0.01],y=out$total[out$p_val<0.01]),mapping=aes(x=x,y=y),label="**",size=6) +
  geom_text(data.frame(x=out$scale[(out$p_val<0.05)&(out$p_val>0.01)],y=out$total[(out$p_val<0.05)&(out$p_val>0.01)]),mapping=aes(x=x,y=y),label="*",size=6) +
  ylab("PVE") + xlab("Euclidian distance from focal plants") + ylim(NA,1)

ggsave(bar,filename=paste0("./figures/PVE_",trait,".pdf"),height=3,width=3)


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
  ylim(NA,1) + theme(legend.position=c(0.8,0.9)) + labs(subtitle="Net form net blotch")
  
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
  ylim(NA,1) + theme(legend.position="none") + labs(subtitle="Spot form net blotch")

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
  ylim(NA,1) + theme(legend.position="none") + labs(subtitle="Scald")

bar = (bar1 | bar2 | bar3) + plot_annotation(tag_levels = "A")
ggsave(bar,filename="./figures/PVE_all.pdf",height=3,width=10)




