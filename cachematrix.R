## Write a short comment describing this function.

# 'makeCacheMatrix' is a function that returns a list of additional functions.
# The purpose is storing a matrix and a cached value of the inverse of the 
# matrix. The following are the included functions with a brief explanation 
# of what they do:

# setMatrix      Set the value of a matrix;
# getMatrix      Get the value of a matrix;
# cacheInverse   Set the cached value (inverse of the matrix);
# getInverse     Get the cached value (inverse of the matrix).


#The following part breaks down the function in detail:

makeCacheMatrix <- function(x = numeric()) {
# Hold the cached value (alternatively, NULL if nothing is cached).
  
  cache <- NULL
# Initially nothing is cached, so we set it to NULL.
  
  setMatrix <- function(newValue) {
    x <<- newValue
# Store a matrix.
    
    cache <<- NULL
# Since the matrix is assigned a new value, we flush the cache.
  }
  
  getMatrix <- function() {
    x
# Return the stored matrix.
  }
  
  cacheInverse <- function(solve) {
    cache <<- solve
# Cache the given argument.
  }
  
  getInverse <- function() {
    cache
# Get the cached value.
  }
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
# Return a list where each named element of the list is a function.
}


## The following function calculates the inverse of a "special" matrix created with 
# makeCacheMatrix.

cacheSolve <- function(y, ...) {
# Get the cached value.
  
  inverse <- y$getInverse()
# If a cached value exists, return it.
  
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
# Otherwise, get the matrix, calculate the inverse, and store it in
# the cache.
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
# Return the inverse.
  inverse
}