#Install RCommander
install.packages("Rcmdr")
#Open the RCommander
require(Rcmdr)
#Import date
rladies <- 
  readXL("C:/Users/jorge/Desktop/Estatística - UFF/Pojeto - Estatística é com R/R Commander/Apresentação - Oficial/R-Ladies (rladies).xlsx",
         rownames=TRUE, header=TRUE, na="", sheet="Plan1", stringsAsFactors=TRUE)
save("rladies", file="C:/Users/jorge/Desktop/Bussab.RData")
rladies <- within(rladies, {
  Casado_ <- factor(Casado, labels=c('Solteiro','Casado'))
})
rladies <- within(rladies, {
  Inst_Ord <- factor(Inst, labels=c('Fundamental','Medio','Superior'))
})
rladies$Renda_ <- with(rladies, binVariable(Renda, bins=6, 
  method='intervals', labels=NULL))
rladies <- within(rladies, {
  Renda_Fac <- Recode(Renda, 
  'lo:8 = "Baixo"; 8:12 = "Medio"; 12:hi = "Alto"', as.factor=TRUE)
})
rladies <- within(rladies, {
  Inst_ <- factor(Inst, labels=c('Fundamental','Medio','Superior'))
})
with(rladies, Hist(Renda, scale="frequency", breaks="Sturges", 
  col="darkgray"))
Boxplot(Renda~Inst_Ord, data=rladies, id=list(method="y"))
with(rladies, qqPlot(Renda, dist="norm", id=list(method="y", n=2, 
  labels=rownames(rladies))))
with(rladies, Barplot(Inst_Ord, xlab="Escolaridade", ylab="Frequ?ncia", 
  main="Grau de Instru??o"))
library(colorspace, pos=17)
with(rladies, pie(table(Inst_Ord), labels=levels(Inst_Ord), xlab="", 
  ylab="", main="Escolaridade", col=rainbow_hcl(3)))
with(rladies, plotMeans(Renda, Inst_Ord, error.bars="se", xlab="Instru??o", 
  ylab="Renda", main="Escolaridade e renda", connect=TRUE))

 
