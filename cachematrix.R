# Introduction
This second programming assignment will require you to write an R function that is able to cache potentially time-consuming computations. For example, taking the inverse of a numeric vector is typically a fast operation. However, for a very long vector, it may take too long to compute the inverse, especially if it has to be computed repeatedly (e.g. in a loop). If the contents of a vector are not changing, it may make sense to cache the value of the inverse so that when we need it again, it can be looked up in the cache rather than recomputed. In this Programming Assignment you will take advantage of the scoping rules of the R language and how they can be manipulated to preserve state inside of an R object.
# Assignment
Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly The assignment is to write a pair of functions that cache the inverse of a matrix.
# makeCacheMatrix function
This function creates a special “matrix” object that can cache its inverse.
```
makeCacheMatrix <- function(x = matrix()) {
        inv = NULL
        set = function(y) {
        # use `<<-` to assign a value to an object in an environment 
        # different from the current environment. 
        
                x <<- y
                inv <<- NULL
        }
        get = function() x
        setinv = function(inverse) inv <<- inverse 
        getinv = function() inv
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}
```
# cacheSolve function
This function computes the inverse of the special “matrix” returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cacheSolve should retrieve the inverse from the cache.
```
cacheSolve <- function(x, ...) {      
  inv = x$getinv()
  # if the inverse has already been created
  
  if (!is.null(inv)){
  # get it from the cache and skips the computation.
    
    message("getting cached data")
    return(inv)
  }
  
  # else, create the inverse matrix
  
  mat.data = x$get()
  inv = solve(mat.data, ...)
  
  # sets the value of the inverse in the cache
  
  x$setinv(inv)
  
  return(inv)
}
```
