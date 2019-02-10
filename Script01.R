#R Commander

require(Rcmdr)

#Converter Variável Númerica para um Fator

Dados <- within(Dados, {
  Casado_ <- factor(Casado, labels=c('Solteiro','Casado'))
})

Dados <- within(Dados, {
  Inst_ <- factor(Inst, labels=c('Fundamental','Medio','Superior'))
})

#Agrupar em Classes uma Variável Numérica

Dados$Renda_ <- with(Dados, binVariable(Renda, bins=6, method='intervals', 
                                        labels=NULL))
#Recodificar Variáveis 

Dados <- within(Dados, {
  Renda_Fac <- Recode(Renda, 
                      'lo : 8 = "Baixa"; 8 : 12 = "Medio"; 12 : hi = "Alto"', as.factor=TRUE)
})

#Reordenar Níveis do Fatores

Dados$Inst_Ord <- with(Dados, factor(Inst_, levels=c('Fundamental','Medio',
                                                     'Superior')))
save("Dados", file="D:/R Commander/Script1.RData")

#Histograma 

with(Dados, Hist(Renda, scale="frequency", breaks="Sturges", 
                 col="darkgray"))
#Box Plot

Boxplot(Renda~Inst_, data=Dados, id=list(method="y"))

#Gráfico de Comparação de Quantis

with(Dados, qqPlot(Renda, dist="norm", id=list(method="y", n=2, 
                                               labels=rownames(Dados))))
#Gráfico de Barras

with(Dados, Barplot(Inst_Ord, xlab="Escolaridade", ylab="Frequência", 
                    main="Grau de Instrução"))

#Gráfico de Pizza

with(Dados, pie(table(Inst_Ord), labels=levels(Inst_Ord), xlab="", ylab="", 
                main="Escolaridade", col=rainbow_hcl(3)))

#Gráfico de Médias

with(Dados, plotMeans(Renda, Inst_Ord, error.bars="se", xlab="Instrução", 
                      ylab="Renda", main="Escolaridade e Renda", connect=TRUE))
