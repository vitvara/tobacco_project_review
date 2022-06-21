
library(limma)
library(DT)
library(tidyverse)
library(gt)
library(tidyverse)
BiocManager::install(c("Biobase", "Mulcom", "qvalue"))
library(prot2D)
library("edgeR")
remove.packages("prot2D")
df = as.data.frame(x = t(FlettenUpscaled), stringsAsFactors = FALSE)
df <- cbind(type = rownames(df), df)

for (i in 1:nrow(df)) {
  if (substr(df[i,1][1], start=1, stop=1) == "1") {
    df[i,1] <- 1
  } else {
    df[i,1] <- 0
  }
}
co
data(pecten)
data(pecten.fac)
View(pecten)
View(pecten.fac)
View(fc)

pecten.norm <- Norm.qt(pecten, n1=6, n2=6, plot=TRUE)
ES.p <- ES.prot(pecten.norm, n1=6, n2=6, f=pecten.fac)
pecten.norm 
class(pecten)
data <- pecten
if (class(data) != "data.frame" & class(data) != "matrix") {print("hi")}
signature(x = "Matrix")

          