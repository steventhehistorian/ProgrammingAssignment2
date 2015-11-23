

####  THANK YOU FOR REVIEWING MY WORK!  ############

##   This script creates a pair of functions that cache the inverse of a matrix:

##      1.  makeCacheMatrix(): This function creates a special "matrix" object that can cache its inverse. (It's actually a list.)

##      2.  cacheSolve(): This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

##      If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should
##      retrieve the inverse from the cache and notify you that it's doing that.


## This is the makeCacheMatrix function:
        
        makeCacheMatrix <- function(x = matrix()) {
                i <- NULL
                        set <- function(y) {
                                x <<- y
                                i <<- NULL
                        }
                
                get <- function() x
                setinverse <- function(inverse) i <<- inverse
                getinverse <- function() i
                
                list(set = set, get = get,
                     setinverse = setinverse,
                     getinverse = getinverse)
                
        }


        
## This is the cacheSolve function:
        
        cacheSolve <- function(x, ...) {
                
                i <- x$getinverse()
                        
                        # Checks if i is in the cache
                        if(!is.null(i)) {
                                
                                message("getting cached matrix data")
                                return(i)
                           
                        # If not, calculate the inverse and store it        
                        } else {
                
                data <- x$get()
                i <- solve(data)
                x$setinverse(i)
                
                        
                ## Return a matrix that is the inverse of 'x'
                          i                
              
                }
        }
        



        
        #################### VERIFYING THAT THE CODE WORKS: ####################

        
        
        # Here we create a 5*5 matrix with random numbers
        
                testMatrix <- matrix(rnorm(25), 5, 5)     
        
        # Then, we run the matrix through the first function to create a list of functions ls => (get, set, getinverse, setinverse)
        
                testMakeCache <- makeCacheMatrix(testMatrix)
        
        # Call cacheSolve, using the list created from the last step as the input... 
        
                cacheSolve(testMakeCache)
        
        # Finally, you can verify that the output is correct by manually calling the inverse of your test matrix.

                solve(testMatrix) == cacheSolve(testMakeCache)
        
        
