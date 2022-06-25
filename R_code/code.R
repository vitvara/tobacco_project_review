
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
getType <- function(data, class="1") {
  df = data
  n1 = 0
  n2 = 0
  df_t = as.data.frame(x = t(df), stringsAsFactors = FALSE)
  df_t <- cbind(type= rownames(df_t), df_t)
  for (i in 1:length(row.names(df_t))) {
    if (substr(df_t[i,1],1,1) == "B") {
      df_t[i,1] = 1
      n1 = n1 + 1
    } else {
      df_t[i,1] = 0
      n2 = n2 + 1
    }
  }
  return(list(n1, n2))
}
getModel <- function(data, class="1") {
  df = data
  n1 = 0
  n2 = 0
  df_t = as.data.frame(x = t(df), stringsAsFactors = FALSE)
  df_t <- cbind(type= rownames(df_t), df_t)
  for (i in 1:length(row.names(df_t))) {
    if (substr(df_t[i,1],1,1) == "B") {
      df_t[i,1] = 1
    } else {
      df_t[i,1] = 0
    }
  }
  f <- data.frame(df_t["type"])
  row.names(f) <- colnames(df)
  return(f)
}
data <- as.data.frame(train_burley)
index <- colnames(data)
listResult <- getType(data)
n1 = listResult[1]
n1 = as.numeric(n1)
n2 = listResult[2]
n2 = as.numeric(n2)
prot.norm <- Norm.qt.v4(data, n1=n1, n2=n2, plot=T)
pecten.norm <- Norm.qt(pecten, n1=6, n2=6, plot=TRUE)
ES.p <- ES.prot.v4(prot.norm, n1=n1, n2=n2, f=getModel(data))
ES.diff <- modT.Prot(ES.p, plot=T, fdr.thr = 0.2, method.fdr = "BH")
x
pecten.norm 
class(pecten)
data <- pecten
if (class(data) != "data.frame" & class(data) != "matrix") {print("hi")}
signature(x = "Matrix")

          