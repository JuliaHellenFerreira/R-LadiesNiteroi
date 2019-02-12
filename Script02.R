#R Commander

require(Rcmdr)

#Resumos Numéricos

library(abind, pos=17)
library(e1071, pos=18)
numSummary(Dados[,"Renda", drop=FALSE], statistics=c("mean", "sd", "IQR", 
                                                     "quantiles"), quantiles=c(0,.25,.5,.75,1))

#Contar Observações Faltantes

sapply(Dados, function(x)(sum(is.na(x)))) # NA counts

#Distribuição de Frequências

local({
  .Table <- with(Dados, table(Casado_))
  cat("\ncounts:\n")
  print(.Table)
  cat("\npercentages:\n")
  print(round(100*.Table/sum(.Table), 2))
})

#Matriz de Correlção - Não é possível realizar o calculo de matriz de correlação com este banco de dados.

#Teste de Normalidade

normalityTest(~Renda, test="shapiro.test", data=Dados)