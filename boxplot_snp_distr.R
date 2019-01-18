setwd("F:/yangyang/projects/dangxiaojing/GATK_GWAS/²¹³ä¹¤×÷/")
myboxplot=read.table("Chr9_22401213_boxplot.txt")
head(myboxplot)
boxplot(V3~V2,data = myboxplot,col="lightgray")


table(myboxplot[,"V2"])

t.test(V3~V2,data = myboxplot)

target_snp<-read.table("associated_loci_distribution.txt")
library(ggplot2)
head(target_snp)
ggplot(target_snp, aes(x=V3, y=V4)) +
  geom_bar(position=position_dodge(), stat="identity",width = 4,color = "black")+ 
  facet_grid(V1~V2, margins=F)+
  theme(panel.grid =element_blank())+
  theme(axis.text = element_blank())+
  theme(axis.ticks = element_blank())+
  labs(x="",y="")



scales = "free_x"