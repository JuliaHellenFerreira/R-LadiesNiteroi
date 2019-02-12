#R Commander

require(Rcmdr)

#Estamos usandoo Banco de Dados:Notas do SISU, para os calculos.

#Resumos Numéricos - 2014.1

numSummary(DadosSISU[,"CH1.2014.1", drop=FALSE], statistics=c("mean", "sd", 
                                                              "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))

#Resumos Numéricos - 2014.2

numSummary(DadosSISU[,"CH1.2015.1", drop=FALSE], statistics=c("mean", "sd", 
                                                              "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))

#Gráfico de Dispersão

scatterplot(CH1.2014.1~CH1.2014.2, regLine=FALSE, smooth=FALSE, 
            boxplots=FALSE, data=DadosSISU)

#Diagrama de ramo-e-Folhas, ano 2014

with(DadosSISU, stem.leaf(CH1.2014.1, na.rm=TRUE))

#Diagrama de ramo-e-Folhas, ano 2015


with(DadosSISU, stem.leaf(CH1.2015.1, na.rm=TRUE))

#Box Plot, ano 2015

Boxplot( ~ CH1.2015.1, data=DadosSISU, id=list(method="y"))

#Box Plot, ano 2014


Boxplot( ~ CH1.2014.1, data=DadosSISU, id=list(method="y"))