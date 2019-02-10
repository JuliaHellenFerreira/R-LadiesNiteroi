#R Commander

require(Rcmdr)

# 

Dados <- within(Dados, {
  Casado_ <- factor(Casado, labels=c('Solteiro','Casado'))
})

Dados <- within(Dados, {
  Inst_ <- factor(Inst, labels=c('Fundamental','Medio','Superior'))
})

Dados$Renda_ <- with(Dados, binVariable(Renda, bins=6, method='intervals', 
                                        labels=NULL))
Dados <- within(Dados, {
  Renda_Fac <- Recode(Renda, 
                      'lo : 8 = "Baixa"; 8 : 12 = "Medio"; 12 : hi = "Alto"', as.factor=TRUE)
})

Dados$Inst_Ord <- with(Dados, factor(Inst_, levels=c('Fundamental','Medio',
                                                     'Superior')))
save("Dados", file="D:/R Commander/Script1.RData")

with(Dados, Hist(Renda, scale="frequency", breaks="Sturges", 
                 col="darkgray"))

Boxplot(Renda~Inst_, data=Dados, id=list(method="y"))

with(Dados, qqPlot(Renda, dist="norm", id=list(method="y", n=2, 
                                               labels=rownames(Dados))))
with(Dados, Barplot(Inst_Ord, xlab="Escolaridade", ylab="Frequência", 
                    main="Grau de Instrução"))

with(Dados, pie(table(Inst_Ord), labels=levels(Inst_Ord), xlab="", ylab="", 
                main="Escolaridade", col=rainbow_hcl(3)))

with(Dados, plotMeans(Renda, Inst_Ord, error.bars="se", xlab="Instrução", 
                      ylab="Renda", main="Escolaridade e Renda", connect=TRUE))
