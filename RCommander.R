#Install RCommander
install.packages("Rcmdr")
#Open the RCommander
require(Rcmdr)
#Import date
Bussab <- 
  readXL("C:/Users/jorge/Desktop/Estatística - UFF/Pojeto - Estatística é com R/R Commander/Apresentação - Oficial/R-Ladies (Bussab).xlsx",
         rownames=TRUE, header=TRUE, na="", sheet="Plan1", stringsAsFactors=TRUE)
save("Bussab", file="C:/Users/jorge/Desktop/Bussab.RData")
#Convert 
