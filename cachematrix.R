## Make inverse matrix   
## 

## 
#make a "matrix" as list of functions from given matrix

makeCacheMatrix <- function(x = as.matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
        #x
    }
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}
#calculate inverse matrix with checking of existing value in cache
cacheSolve <- function(x, ...) {
    s <- x$getsolve()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    #tmp<-x$set(x)
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
}
