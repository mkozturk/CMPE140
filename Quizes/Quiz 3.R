###################################################################
#                              QUIZ 3                             #
###################################################################
## QUESTION 1 (Section 1)

# Write a function with name "matrix_fnc" which takes the number of columns and the number of rows as inputs;
# and generates a special matrix.
# Each element of this matrix should be equal to the sum of the subscript numbers of corresponding row and column.
# The function "matrix_fnc" should return a list including two items:
#  I. "matrix"
# II. "sum" which is an integer holding the sum of all elements of this matrix 

# Example: For 4 rows and 4 columns;
matrix_fnc <- function(x=4,y=4) {
  
  # your code here should include a nested for loop (two for loops: one outer, one inner)
  
}

# Your code will give this output:

# $matrix
# [,1] [,2] [,3] [,4]
# [1,]    2    3    4    5
# [2,]    3    4    5    6
# [3,]    4    5    6    7
# [4,]    5    6    7    8

# $sum
# [1] 80

######################################################################
## ANSWER (Section 2)

matrix_fnc <- function(x,y)
{
  
  # empty matrix
  special_matrix <- matrix(nrow = x, ncol = y)
  
  for (rw in 1:x) # for1 iterate thru rows
  {
    
    for(cl in 1:y) # for2 iterate thru cols
    {
      special_matrix[rw,cl] <- rw + cl # update the cell
    } # close for2
    
  } # close for1
  
  return(list(matrix=special_matrix, sum=sum(special_matrix)))
  
}

#######################################################################
#######################################################################
## QUESTION 2

# Write a function with name "matrix_fnc" which takes a number as an input, which will be equal to number of rows and columns;
# and generates a special matrix.
# Each element of this matrix should be equal to the multiplication of the subscript numbers of corresponding row and column.
# The function "matrix_fnc" should return a list including two items:
#  I. "matrix"
# II. "sum" which is an integer holding the sum of all elements of this matrix 

# Example:
matrix_fnc <- function(x=4) {
  
  # your code here should include a nested for loop (two for loops: one outer, one inner)
  
}

# Your code will give this output:

# $matrix
# [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4
# [2,]    2    4    6    8
# [3,]    3    6    9   12
# [4,]    4    8   12   16

# $sum
# [1] 100

#######################################################################

matrix_fnc <- function(x)
{
  
  # empty matrix
  special_matrix <- matrix(nrow = x, ncol = x)
  
  for (rw in 1:x) # for1 iterate thru rows
  {
    
    for(cl in 1:x) # for2 iterate thru cols
    {
      special_matrix[rw,cl] <- rw * cl # update the cell
    } # close for2
    
  } # close for1
  
  return(list(matrix=special_matrix, sum=sum(special_matrix)))
  
}
