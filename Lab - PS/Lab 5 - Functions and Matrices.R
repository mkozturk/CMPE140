# Do you like treasure hunts?
# Adapted from: http://users.csc.calpoly.edu/%7Ejdalbey/103/Projects/ProgrammingPractice.html
# 
# In this problem you are to write a program to explore
# the above array for a treasure.
# The values in the array are clues.
# 
# First a map of dimension n is created where each cell contains
# an integer between 11 and nn;
# For each value the ten's digit represents the row number and
# the unit's digit represents the column number of the cell
# containing the next clue.
# 
# Starting in the upper left corner (at 1,1),
# use the clues to guide your search of the array.
# 
# The treasure is a cell whose value is the same as its coordinates.
# 
# Your program should output the cells it visits during its search,
# ending with the location of the treasury
# 
# Note: In case the search visits a cell a second time,
# it means we are inside an endless loop, the code should stop and
# return the path (at the end of the second visit of a cell) and
# start of the circle in the path.
# 
# The size of the input matrix should be at least 2x2 and at most 9x9
# 
# For example:
# A map with a solution:
# 
# > a <- create_map(8)
# > a
#      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
# [1,]   54   61   44   48   23   56   46   37
# [2,]   16   56   84   46   33   25   45   41
# [3,]   14   76   25   47   67   31   78   83
# [4,]   47   38   16   28   75   42   22   38
# [5,]   14   38   37   56   37   56   12   18
# [6,]   17   32   23   85   53   26   82   61
# [7,]   11   28   35   47   86   64   54   13
# [8,]   76   82   16   53   65   26   86   13
# 
# > find_treasury(a)
# [1] 11 54 56
# A looping version with no solution:
# > a <- create_map(5)
# > a
#      [,1] [,2] [,3] [,4] [,5]
# [1,]   31   44   41   45   12
# [2,]   54   12   24   31   55
# [3,]   35   43   42   35   54
# [4,]   43   33   51   53   21
# [5,]   42   42   52   31   14
# 
# > find_treasury(a)
# [1] 11 31 35 54 31 2
# 
# How to solve
# Creating maps
# Create a function called create_map which
# accepts numeric argument dimm and generates a matrix
# with values among  [11,nn]  and returns it

create_map <- function(dimm = 5)
{
  # create an ordered map
  map1 <- outer(1:dimm, 1:dimm, function(x,y) 10 * x + y)
  
  # shuffle the map
  map2 <- matrix(sample(map1, replace = T), nrow = dimm)
  return(map2)
}

create_map()

# Solving clues
# Create a function that accepts an numeric arguments and
# returns a vector which contains numbers within the argument.
# This function is required to understand new location from clues
# as problem statement suggests.
# 
# > numbers <- split_number(21)
# > numbers
# [1] 2 1

split_number <- function(num) {
  # Variable to hold the array
  shards <- NULL
  # Finish until all numbers are extracted
  while(num != 0) {
    # Extend array with newly found number
    shards <- c(num %% 10, shards)
    # remove the number with smallest order
    num <- floor(num / 10)
  }
  return(shards)
}
split_number(21)

# Are we in a circle?
# Create a function accepts a vector and a numeric value and
# returns location of the numeric value within vector or NA.
# This function is required for detecting a loop, if you are in one.
# 
# > loc <- where(c(12, 21, 32, 45), 21)
# > loc
# [1] 2
# > loc <- where(c(12, 21, 32, 45), 64)
# > loc
# [1] NA

# define function with two arguments
where <- function(vec, num) {
  # Iterate over indices
  for(i in 1:length(vec)) {
    # Check if the next value in the vector equals the given variable
    if(vec[i] == num) {
      return(i)
    }
  }
  # Return NULL if num is not found in vec
  return(NULL)
}
print(where(c(12, 21, 32, 45), 21))
print(where(c(12, 21, 32, 45), 64))

# Finding the Treasure!
# Create a function that to find the treasure.
# This function should accept map which is a matrix with clues and
# return a vector which shows way to treasure.
#
# > map <- create_map(5)
# > map
# [,1] [,2] [,3] [,4] [,5]
# [1,]   31   44   41   45   12
# [2,]   54   12   24   31   55
# [3,]   35   43   42   35   54
# [4,]   43   33   51   53   21
# [5,]   42   42   52   31   14
# > find_treasure(map)
# [1] 11 31 35 54 31 2

# crawl through the map to find the treasury
find_treasure <- function(map) {
  # initiate empty path
  path <- NULL
  
  # starting clue
  clue <- 11
  # starting coordinates
  location <- split_number(clue)
  
  # while the next cell's value is not the same as current
  while (map[location[1], location[2]] != clue) {
    # append the value to the path
    path <- c(path, clue)
    
    # get the next clue
    clue <- map[location[1], location[2]]
    
    # get the next coordinates
    location <- split_number(clue)
    
    # check if we are in a circle
    circle_start <- where(path, clue)
    
    # If we have been in this location before
    # this means we are in a circle...
    if(!is.null(circle_start)) {
      return(c(path, circle_start))
    }
  }
  
  # return the path and last value
  return(c(path, clue))
}

# Test the solver...

map <- create_map()
print(map)
print(find_treasure(map))