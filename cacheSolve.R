cachesolve <- function(x,...){
  inv <- x$getinv()
  if(!is.null(inv)){
    message("getting cached inverse matrix")
    return(inv)
  }
  data<- x$get()
  inv <- solve(data,...)
  x$setinv(inv)
  inv
}