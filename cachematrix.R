## The function, makeCacheMatrix creates a special "vector"
## It is List containing functions to
##    1. set matrix
##    2. get matrix
##    3. set inverse
##    4. get inverse

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

## The function creates the inverse of the special "vector" created with the above function.
## The funnction first checks to see if the inverse has already been created.
## If so, it gets the inverse from the cache and skips the computation.
## Otherwise, it creates the inverse of the matrix.

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
