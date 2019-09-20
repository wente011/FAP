library(tidyverse)
library(magrittr)


#purrr's possibly is a nice error flagger - for the errors that the NHSTA web service cannot handle. 

pos_GETvin<-possibly(GETvin,otherwise=NA_real_)   
