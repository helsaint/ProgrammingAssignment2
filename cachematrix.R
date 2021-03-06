## For a large matrix computing the inverse can be time consuming. 
## This is amplified if the inverse of the matrix has to be computed several times.
## The two functions below reduces the computation time by making one computation of the inverse
## and then storing the matrix and its inverse in cache.

## The makeCacheMatrix gets a matrix x using the function matrix().
## It also sets the inverse of the matrix calculated in cacheSolve.
## It also returns the inverse of the matrix stored in cache in the getinverse() function

## eg: matrix1 <- makeCacheMatrix(matrix(c(4,2,7,6), nrow=2,ncol=2)) ##creates a matrix and caches it

makeCacheMatrix <- function(x = matrix()) {
	## Sets inv as Null. Thus when a new matrix is created to be cached the cacheSolve() will
	## resolve that this is a new matrix and find the inverse for this new matrix
	inv <- NULL
	## Sets the value of a new matrix and sets inv = Null to indicate a new matrix has been created
            set <- function(y) {
                    x <<- y
                    inv <<- NULL
            }
	    ## used to show the matrix in cache
            get <- function() x
	    ## can be used to manually set the inverse
            setinverse <- function(inverse) inv <<- inverse
	    ## used to show the inverse stored in cache
            getinverse <- function() inv
            list(set = set, get = get,
                 setinverse = setinverse,
                 getinverse = getinverse)
}


## This function uses the solve() to calculate the inverse of a matrix.
## However, if the matrix and its inverse were already calculated it
## simply retrieves the value from cache

## cacheSolve(matrix1) ##returns the inverse of matrix1 and stores the value in cache
## using the makeCacheMatrix function setinverse()
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getinverse()
	## checks to see if the inverse of the matrix was previously calculated
	## if yes then just retrieves that value
            if(!is.null(inv)) {
                    message("getting cached data")
                    return(inv)
            }
	    
            data <- x$get()
	    ##calculates the inverse
            inv <- solve(data, ...)
	    ## stores the inverse in cache
            x$setinverse(inv)
            inv
}
