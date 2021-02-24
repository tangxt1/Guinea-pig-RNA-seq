library(ggplot2)
pathway = read.table("KEGGGP.txt",header=T,sep="\t")
p = ggplot(pathway,aes(GeneRatio, Description))
p=p + geom_point()
p=p + geom_point(aes(size=Count))
pbubble = p + geom_point(aes(size=Count,color=pvalue))
pbubble =pbubble+ scale_colour_gradient(low="red",high="green")
pr = pbubble + scale_colour_gradient(low="red",high="green") + 
        labs(color=expression(pvalue),size="Count", x="GeneRatio",y="Pathway name")
pr=pr + theme_bw()
pr
ggsave("KEGGGP.pdf")