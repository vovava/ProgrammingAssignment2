## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function converts matrix x to new object (list) with certain
## useful properties, such as storing its inverse

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() {x}
    set_inverse <- function(inv) inverse <<- inv
    get_inverse <- function() inverse
    list(set = set, get = get, set_inverse = set_inverse,
         get_inverse = get_inverse)
}


## Write a short comment describing this function
## This function checks whether inverse has already been calculated
## and then 1) returns the inverse or 2) calculates and then returns 
## the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inverse <- x$get_inverse()
    if (!is.null(inverse)) {
        message('getting cached data')
        return(inverse)
    }
    inverse <- solve(x$get())
    x$set_inverse(inverse)
    inverse
}
