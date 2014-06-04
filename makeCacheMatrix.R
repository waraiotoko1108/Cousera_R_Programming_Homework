makeCacheMatrix<- function(x=matrix()){
  inv <- NULL
  set <- function(y){
    if(class(y) != 'matrix'){
      print('Must be a matrix!!')
    }
    else{
      x <<- y
    }
  }
  get <- function() x
  setinv <- function(m){
    inv <<- m
  }
  getinv <- function() inv
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}