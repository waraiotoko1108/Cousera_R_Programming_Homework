complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitorta ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  files_list <- dir(directory,full.names=T)
  filecom<-vector()
  for(i in id){
    data<-read.csv(files_list[i])
    data2<-data[,2:3]
    cc<-sum(complete.cases(data2))
    filecom<-rbind(filecom,c(i,cc))
  }
  colnames(filecom)<-c("id","nobs")
  return (as.data.frame(filecom))
}