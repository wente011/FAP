
library(magrittr)
library(tidyverse)


#Not used, appears to be issues with the Batch download function. 
#GETvin<- function(vins){
#  tmp<-tempfile()
#  download.file(paste0("https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVINValuesBatch/",vins,"?format=csv"),destfile=tmp, method="curl")
#  data<-read_csv(tmp)
#  return(data)
#}

GETvin<- function(vins){
  tmp<-tempfile()
  download.file(paste0("https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVINValues/",vins,"?format=csv"),destfile=tmp, method="curl")
  data<-read_csv(tmp)
  return(data)
}


#here is a sample vector of VINs. Should be a character string. 

sample<-c("1FAHP2MK4FG173211","1FAHP2MK4FG173213","1FAHP2MK4FG204263","1FAHP2MK4FG204277", "1FAHP2MK4FG204280", "1FAHP2MK4GG105654")

#sample should be entibbled 

#purrr's possibly is a nice error flagger - for the errors that the NHSTA web service cannot handle. 

pos_GETvin<-possibly(GETvin,otherwise=NA_real_)


download<- sample %>% enframe() %>% mutate(vindata=map(.$value,pos_GETvin)) %>% select_at("vindata") %>% unnest() %>% bind_rows()  # pos_GETvin() 


