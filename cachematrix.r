## Gabriel Deards
## Assignment 2

## Notes from assignment:
## Matrix inversion is usually a costly computation and there may be some benefit 
## to caching the inverse of a matrix rather than compute it repeatedly 
## (there are also alternatives to matrix inversion that we will not discuss here). 
## Your assignment is to write a pair of functions that cache the inverse of a matrix.

## Write the following functions:
## makeCacheMatrix: 
## This function creates a special "matrix" object that can cache its inverse.
## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
## Computing the inverse of a square matrix can be done with the solve function in R. 
## For example, if X is a square invertible matrix, then solve(X) returns its inverse.


## Write a short comment describing this function
## makeCacheMatrix generates a matrix object that stores a list of functions.
## These functions set/get the value of the matrix, then set/get the value of the inverse matrix.

makeCacheMatrix <- function(x = matrix()) { ##structure based on makeVector
        
        i <- NULL ## sets cache i (for inverse)
        
        set <- function(y) {
                
                x <<- y ##assigns input matrix to x (in parent environment)
                i <<- NULL ## resets cache to null (in parent environment)
                
        }
        
        get <- function() x ## return filled matrix
        setInv <- function(inv) i <<- inv ## set cache to inverse of x
        getInv <- function() i ## return filled inverse matrix.
        
        list(set = set,
             get = get,
             setInv = setInv,
             getInv = getInv)
}

## Write a short comment describing this function
## cacheSolve reads in the same matrix object generated by makeCasheMatrix, and generates its inverse.
## In the event that this inverse has already been calculated, it retrieves this value from the cache.
## Otherwise, it calculates the inverse matrix using setInv.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        i <- x$getInv()
        
        if (!is.null(i)) {
        
                message("getting cached data")
                return(i)
        }
        
        mat <- x$get()
        i <- solve(mat, ...)
        x$setInv(i)
        i
        
}
