
# a simple base code to process the string of vins. 

GETvin<- function(data){
  tmp<-tempfile()
  download.file(paste0("https://vpic.nhtsa.dot.gov/api/vehicles/decodevinextended/",data[,"VIN"],"?format=csv"),destfile=tmp, method="curl")
  data<-read_csv(tmp)
  return(data)
}


