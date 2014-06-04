pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  #setwd(directory)
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  foo = NULL
  file_list <- dir(directory,full.names=T)
  for(i in id){   
      data<-read.csv(file_list[i])
      temp<-unclass(data)
      if(pollutant=='sulfate'){
        x<-temp$sulfate
        
      }else if(pollutant=='nitrate'){
        x<-temp$nitrate
      }     
      xx<-x[!is.na(x)]
      foo<-c(foo,xx)
  }
  mean <- round(mean(foo),3)
  ##print(data)
  return(mean)
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}

