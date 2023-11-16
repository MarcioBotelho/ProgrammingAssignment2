 
# Function to create a special matrix object that caches its inverse
makeCacheMatrix <- function(x = matrix()) {
  # Create an environment to store the inverse and matrix
  cache <- new.env(hash = TRUE)
  
  # Function to calculate and store the inverse
  calcularInversa <- function() {
    invX <- solve(x)
    cache$inverse <- invX
    cat("Inverse calculated and cached.\n")
    return(invX)
  }
  
  # Function to retrieve the inverse from the cache
  obterInversa <- function() {
    if (exists("inverse", envir = cache)) {
      cat("Inverse retrieved from cache.\n")
      return(cache$inverse)
    } else {
      return(calcularInversa())
    }
  }
  
  # Return a list of functions
  return(list("obterInversa" = obterInversa, "calcularInversa" = calcularInversa))
}


 
# Function to compute the inverse of the special matrix, using the cache if available
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  x$obterInversa()
}
