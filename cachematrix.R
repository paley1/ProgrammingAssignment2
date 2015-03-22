

## this function works creating a list of 4 member functions(set,get,setmatrix,getmatrix)
## <<- is used to change variable from outside environment to internal

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setmatrix<-function(solve) m<<- solve
  getmatrix<-function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}


## solves for the inverse matrix

cacheSolve <- function(x, ...) {
  m<-x$getmatrix()
  if(!is.null(m)){ ##message for getting cache data if inversion successful
    message("getting cache")
    return(m)
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m ##returns matrix
}