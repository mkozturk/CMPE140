# In R, a matrix is a vector that has two additional attributes:
# * Number of rows
# * Number of columns
# 
# As with vectors, every element of a matrix must be of the same _mode_;
# either purely numeric, or purely text, etc.
# 
# Creating a matrix from a vector
# ===============
# 
# One way to create a matrix is to begin with a specific vector that holds the values.
# When we specify the number of rows and columns in the desired matrix,
# R can create a matrix structure to hold them.

m <- matrix( c(1,2,3,4), nrow=2, ncol=2)
m

attributes(m)

dim(m)

class(m)

# Note that the vector is broken into `ncol` number of _columns_,
# each of size `nrow`. The values from the vector `c(1,2,3,4)` are put in a columns.
# This is called the _column-major order_.
# 
# We can instead force a _row-major order_ by setting the `byrow` parameter to `TRUE'.

matrix( c(1,2,3,4), nrow=2, ncol=2, byrow=TRUE)

# If we specify only `nrow` or only `ncol`, and the unspecified one will be determined
# using the length of the vector.

matrix( 1:6, nrow=2 )

matrix( 1:6, ncol=3 )

# If the specified matrix sizes are not compatible with the vector's length,
# the vector is _recycled_ until it fills the matrix.

matrix( 1:5, nrow=2, ncol=3)

# The same recycling is done also when one of the shape parameters is omitted.

matrix( 1:5, nrow=2 )

# Accessing matrix elements
# ======
# Once we have data stored in a matrix, we may want to access its elements, rows, or columns. 

# Accessing individual elements
# ----------------
# The element in the `r`-th row and the `c`-th column of a matrix `m` can be accessed
# with the `m[r,c]` notation.

m <- matrix(1:6, nrow=2)
m

m[1,1]

m[2,3]

# Row and column access
# ----------
# We may instead want to access the `r`-th row in its entirety.
# Then, we use the `m[r,]` notation. Similarly, `m[,c]` gives all entries in column `c`.

m <- matrix(1:6, nrow=2)
m

m[1,] # first row, all columns

m[,1]  # first column, all rows

# Accessing ranges of rows/columns
# --
# You may have noticed that the notation to access elements is similar
# between vectors and matrices. As in matrices, we can provide a vector of indices
# to specify rows and columns.

m <- matrix( 1:12, nrow=3 )
m

# Select rows 1 and 2, all columns:

m[1:2,]

# select rows 1 and 2, second column only.

m[1:2, 2]

# Select rows 1 and 2, and columns 1,4 and 3, in that order.

m[1:2, c(1,4,3)]

# Excluding some rows and columns
# ---
# As seen in the context of vectors, negative indices can be used to
# get a new matrix with some rows/columns removed.

m <- matrix( 1:12, nrow=3 )
m

# Remove 3rd row.

m[-3,]

# Remove 2nd column

m[,-2]

# Remove 1st row and 3rd column

m[-1,-3]

# Remove columns from 1 to 2.

m[,-1:-2]

# Setting and getting row and column names
# ==
# As with vectors, we can provide names to the rows and to the columns of a matrix.

m <- matrix( 1:6, nrow=2)
m

# The functions `rownames()` and `colnames()` are used to set the names
# for rows and columns, respectively.

rownames(m) <- c("row I", "row II")
colnames(m) <- c("col a", "col b", "col c")
m

# When called without an assignment, they return the existing names.

rownames(m)
colnames(m)

# These names provide an alternative method to access matrix elements.

m["row I", "col b"]

m["row I",]

m[,"col a"]

# Create a matrix by setting individual elements
# =============
# Sometimes we may not have all the data at hand at once. It is possible to start
# with an empty matrix, and fill it up element-by-element.

m <- matrix(nrow=2, ncol=2)
m[1,1] <- 1
m[2,1] <- 2
m[1,2] <- 3
m[2,2] <- 4
m

# Create a matrix by combining columns or rows
# =========
# When we have several different vectors, we can combine them in
# _columns_ using `cbind()`, or by _rows_ using `rbind()`.

cbind( c(1,2), c(3,4) )

rbind( c(1,2), c(3,4) )

# Add a row or a column to an existing matrix
# ===
# The functions `cbind()` and `rbind()` can also be used to extend an existing matrix.

m <- matrix( 1:4, nrow = 2)
m

# Add a new column at the end of the matrix.

cbind(m, c(10,11))

# Add a new column at the beginning of the matrix.

cbind(c(10,11), m)

# Add a new row at the end of the matrix

rbind(m, c(10,11))

# Add a new row at the beginning of the matrix.

rbind(c(10,11), m)

# Insert a row or a column into a matrix
# ===============
# Another application of `cbind()` and `rbind()` is inserting
# columns and rows to existing matrices. As with vectors,
# such insertion is not done on the original matrix.
# We generate a new matrix using existing rows/columns,
# combine them with `rbind()`/`cbind()`, and reassign to the variable.

m <- matrix( 1:9, nrow=3, ncol=3)
m

# Insert a row between second and third rows.

rbind(m[1:2,], c(-1, -2, -3), m[3,])

# Insert a column between first and second columns

cbind( m[,1], c(-4,-5,-6), m[,2:3] )

# Assign new values to submatrices
# ==
# A matrix can be changed in-place by selecting a submatrix
# using index notation, and assigning a new matrix to it.

m <- matrix( 1:9, nrow=3 )
m

m[ c(1,2), c(2,3) ] <- matrix(c(20,21,22,23))
m

# Removing rows and columns
# ====
# To remove some selected rows or colums, we just use the index notation to
# specify the rows and columns we want to keep,
# and assign the result to the variable's name.

m <- matrix( 1:9, nrow=3 )
m

# Remove 2nd row.

m <- m[c(1,3),]
m

# Remove 1st column.

m <- m[, c(2,3)]
m

m[ c(1,3), c(2,3)]

# Filtering on matrices
# ========

m <- matrix( c(2,9,4,7,5,3,6,1,8) , nrow=3 )
m

m >= 5

m[m>=5]

m[m[,1]>=5]

m[ m< 5] <- 0
m

# Matrix recycling
# ==========
# Remember that when two vectors of different lengths are combined in an operation,
# the shorter one is _recycled_ (i.e., elements repeated until the desired length).

c(1,1,1,1,1) + c(1,2,3)  # converted to c(1,1,1,1,1) + c(1,2,3,1,2)

# The same procedure also applies to matrices.

m1 <- matrix(1:9, nrow=3)
m2 <- matrix( c(1,2,3), nrow=3,ncol=3)
m2
m1 + m2

# Matrix operations
# =========

# transpose
# ----------

m <- matrix(1:4, nrow=2)
m

t(m)

# elementwise product
# --

m

m * m

# matrix multiplication
# --

m

m %*% m

# multiply by a scalar
# --

m

3 * m

# matrix addition
# --

m

m + m

# Functions on matrices
# ==============

m <- matrix( 1:9, nrow=3 )
m 

rowSums(m)

rowMeans(m)

colSums(m)

colMeans(m)

# The apply() function
# ------
# The `apply()` function and its relatives are quite common in R programming.
# Here, we provide a function to apply to rows or columns, and the resulting vector
# of numbers is returned.

m <- matrix( 1:9, nrow=3)
m

apply(m, 1, mean) # same as rowMeans()

apply(m, 2, mean) # same as colMeans()

# We can also use `apply()` with user-defined functions.

alt_inverse_sum <- function(x) {return(sum(c(1,-1)/x))}

m <- matrix(1:12, nrow=3)
m

apply(m,1,alt_inverse_sum)

apply(m,2,alt_inverse_sum)
