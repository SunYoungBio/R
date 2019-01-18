library(ggplot2)
setwd("F:/yangyang/projects/dangxiaojing/fst/fst_100kWindow50kStep/")
F<-list.files(pattern=".fst$")
#F=list.files(pattern = "indica_japonica.windowed.weir.fst")
for(i in 1:length(F)){
  mydata<-read.table(F[i], header=T)
  mydata$CHROM=factor(mydata$CHROM,
                      levels=c("Chr1","Chr2","Chr3","Chr4","Chr5","Chr6",
                               "Chr7","Chr8","Chr9","Chr10","Chr11","Chr12"))
  prefixion<-strsplit(F[i],split="\\.")[[1]][1]
  myfilename=paste(prefixion,".pdf",sep="")
  #pdf(file=filename, width = 20, height = 10)
  p=ggplot(mydata, aes(x=BIN_START, y=MEAN_FST)) +
    geom_line()+ 
    facet_grid(CHROM~., scales = "free_x",space = "free_x")+
    theme(panel.grid =element_blank())+
    theme(axis.text.x = element_blank())+
    theme(axis.ticks = element_blank())+
    #theme(panel.background = element_blank())+
    ggtitle(prefixion)+
    scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) +
    scale_y_continuous(breaks=seq(0,0.8,0.2)) +
    labs(x="",y="")
  #dev.off()
  ggsave(p,filename = myfilename, width = 20, height = 10)
}
