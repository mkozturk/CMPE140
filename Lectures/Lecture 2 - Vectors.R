# Data vectors in R
# ==========
# 
# * The fundamental data type in R is the _vector_.
# * The single-number objects we have seen so far are one-element vectors.
# * Vectors allow us to deal with data sets directly, instead of using separate variables for each instance.
#     
#         height1 <- 1.70
#         weight1 <- 65
#         bmi1 <- weight1 / height1^2
#         height2 <- 1.75
#         weight2 <- 66
#         bmi2 <- weight2 / height2^2
# * We'd rather create data vectors to hold the height and weight values.

# Creating vectors
# =========
# The most general way to create data vectors is to use the `c()` function (_concatenate_).

heights <- c(1.70, 1.75, 1.62)
weights <- c(65, 66, 61)

heights

weights

# Vectors can also be created with the _colon operator_ (:)

x <- 2:10
x

# Extending vectors
# ==========
# The function `c()` can also be used to add new elements to vectors.
# 
# First, suppose we have height data from only two people:

heights <- c(1.70, 1.75)

# Now extend the vector with an additional data point.

heights <- c(heights, 1.62)

heights

# Modes
# =====
# 
# * R variable types are called _modes_.
# * Modes include: "numeric", "character", "logical", "complex", and so on.
# * All elements in a vector must be of the same mode.

mode(2)
mode("abc")
mode(TRUE)
mode(2+4i)

# Missing data
# ========
# * In many data sets, we often have some missing data, i.e., observations for which the values are missing.
# * In R, missing values are denoted with `NA`.
# * Any vector can contain missing values.

weights <- c(65, NA, 61)
names <- c("Can","Cem",NA)

# Vector element names
# ===========
# For readability, we can assign name labels to the elements of a data vector.

heights <- c(Can=1.70, Cem=1.75, Hande=1.62)
heights

weights <- c(Can=65, Cem=66, Hande=61)
weights


# We can retrieve these names with the `names()` function.

names(heights)

# We can assign names to the elements of a vector that already exists.

heights <- c(1.70, 1.75, 1.62)
heights

names(heights) <- c("Can","Cem","Hande")
heights

# If for some reason we want to remove the names, we use the `unname()` function.

unname(heights)

# The original vector is not changed with this function call, because we did not assign the result to `heights`.

heights

# Vector indexing
# =========
# We can access a single element of a vector by providing the index of the element in square brackets.

heights

heights[1]  # first element

heights[3] # third element

# We can select a slice of the vector by providing a range inside brackets.

heights[1:2]  # select from element 1 to element 2, inclusive.

# We can also give a vector consisting of element indices.

heights[c(1,3)]  # select elements 1 and 3.

# The indices do not have to be in order:

heights[c(2,1,3)]

# We can provide a Boolean (true/false) vector for indexing. This will select only elements with corresponding `TRUE` values.

heights

heights[c(T,F)]  # T is a shorthand for TRUE, F is for FALSE.

# We can select the same element more than once.

heights[c(1,1,3,2,3)]

# We can **exclude** elements using negative indices.

heights[-1]  # exclude first element.

heights[c(-1,-3)]  # exclude 1st and 3rd elements

# Using names to select elements
# =======================
# If the elements are given names consisting of strings, we can use these names in brackets instead of indices.

heights["Can"]

heights[c("Can","Can","Hande","Cem","Hande")]

# Modify element values in a vector
# =================

heights

heights[1] <- 1.72

heights

heights[1] <- 1.70

# Insert values to an existing vector
# ============
# A vector's size is determined at its creation, and its elements are stored contiguously (side-by-side) in memory. Therefore it is really not possible to add or remove an element in a vector. However, we can reassign the identifier to a new one.

heights

heights <- c(heights[1:2], Lale=1.76, heights[3])

heights

# Delete elements from vector
# ==========
# Again, we cannot directly remove an element from an existing vector, but we can create a new vector without the element we want to delete, and reassign to the name.

heights

heights <- heights[-3]  # exclude element 3

heights

# Getting the length of a vector
# ==========
# We can get the number of elements in a vector using the `length()` function.

10:17

length(10:17)

# Data vector filtering
# ===========
# 
# * The idea is to apply a Boolean function (e.g., greater than, less than, ...) to each element of the vector.
# * Returns a Boolean vector according to the result on each element.

heights

heights > 1.65

# Using this Boolean vector, we can select data points satisfying the condition.

tall_people <- heights>1.65
heights[tall_people]

# Obviously, this can be done in a single line, too.

heights[heights>1.65]

# One can also filter a vector according to another vector's values.

heights

weights

weights[ heights > 1.65 ]  # weights of people who are taller than 1.65

# Modify a vector by filtering
# =========
# * We can use filtering to selectively change only the elements that satisfy a condition.
# * **Example**: For people who weigh more than 65 kg, decrease the weight by 1 kg.

weights

weights[weights > 65] <- weights[weights > 65] - 1
weights

weights["Cem"] <- 66

# Get indices of elements that satisfy a condition
# ===========
# The `which()` function returns the indices (and labels, if available) of elements in a vector for which a Boolean function returns `TRUE`.

heights

which(heights > 1.65)

# Using all() and any()
# ==========
# * We use the `all()` function to check if **all** elements in a vector are `TRUE`.
# * We use the `any()` function to check if **any one** of the elements in a vector are `TRUE`.

heights

all(heights > 1.60)

all(heights > 1.70)

any(heights > 1.70)

# Generating sequences with seq()
# ==========
# The `seq()` function generates a vector of numbers in arithmetic progression. It is a generalization of the colon(`:`) operator.

seq(4,9)  # same as 4:9

seq(from=12, to=30, by=3)

seq(from=1.1, to=2, length.out=10)

# Sorting a vector
# =========

sort(heights)

sort(weights, decreasing = TRUE)

# * Often we need to sort a vector according to the values of another vector.
# * First we compute an _ordering_.

heights

order(heights)

# Then we use this ordering with the other vector:

weights[order(heights)]  # return the weights of people ordered by their heights.
