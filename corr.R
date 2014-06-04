corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  files_list <- dir(directory,full.names=T)
  n<-length(files_list)
  cr <- numeric()
  datafilter <- subset(complete(directory),nobs>=threshold)
  ##print(datafilter)
  id <- unclass(datafilter)$id
  ##print(id)
  for (i in id){
    data <- read.csv(files_list[i])
    datacomplete <- subset(data,data$sulfate != "NA" & data$nitrate != "NA")
    cal <- cor(datacomplete$sulfate,datacomplete$nitrate)
    cr <- c(cr,cal)    
  }
  return(cr)
}