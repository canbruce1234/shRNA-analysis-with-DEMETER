# Initial env't and functions
set.seed(4321)
# list all packages and install any missing ones as well as load them
list_of_CRAN_packages <- c("uuid","knitr","rmarkdown", "data.table","argparser","ggplot2","optparse")
list_of_BioC_packages <- c("edgeR")

new_packages <- list_of_CRAN_packages[!(list_of_CRAN_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) {
  if (!require(package)) install.packages(new_packages, repos="http://cran.rstudio.com/", dependencies = TRUE)
  suppressMessages(library(package))
}
source("https://bioconductor.org/biocLite.R")

new_packages <- list_of_BioC_packages[!(list_of_BioC_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) {
  suppressMessages(biocLite(new_packages, suppressUpdates=T,ask=F))
}

for(i in c(list_of_CRAN_packages,list_of_BioC_packages)) {
  suppressMessages(library(i,character.only=TRUE))
}

# generally structure folders into
# project
# |---  src
#         |--- R
#         |--- python
# |---  data
# |---  figures

knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(message = FALSE)
opts_knit$set(R.dir = normalizePath(getwd()))
opts_knit$set(src.dir = normalizePath(".."))
opts_knit$set(proj.dir = normalizePath("../.."))
opts_knit$set(data.dir = normalizePath("../../data"))
opts_knit$set(repo.dir = normalizePath("../../.."))
opts_knit$set(demeter.dir = normalizePath("../demeter"))
opts_knit$set(uuid = UUIDgenerate(TRUE))
R_dir <- opts_knit$get("R.dir")
data_dir <- opts_knit$get("data.dir")
data_dir
proj_dir <- opts_knit$get("proj.dir")
src_dir <- opts_knit$get("src.dir")
demeter_dir <- opts_knit$get("demeter.dir")
uuid <- opts_knit$get("uuid")

#all input and output will be relative to proj.dir:
opts_knit$set(root.dir = "../.." )

