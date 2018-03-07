## PS, Week 5 ##
# FUNCTIONS
# Thanks to r development team, we have many useful functions that are promptly available.
# But what if we want to do sth new and untapped by the existing functions?
#  Write your own one...
# Now, write a simple function that takes a single value and adds 3 to that value

  add3 <- function(input)
  {
    input + 3
  }
  
# The "input" is the argument to the function. It can be any legal object name, and any number of arguments can be "passed" to the function
# Note that although you can create one-liner functions w/o curly braces, you need them for multi-line ones
# Run that function for let's say 10

add3(10)

# Now write a similar function that first adds 3 and then multiplies the result with an arbitrary number between 1 and 10, and execute the function with 10 as input

add3b <- function(input)
{
  output <- input + 3
  rand_num <- sample(10, 1)
  result <- output * rand_num
  return(result)
}

add3b(10)


# It is good practice to save intermediary steps into new objects and tell the function which object to return explicitly in the last line
# Now put two new lines after return: Get x1000 the result and return it again

add3c <- function(input)
{
  output <- input + 3
  rand_num <- sample(10, 1)
  result <- output * rand_num
  return(result)
  result <- 1000 * result
  return(result)
}

add3c(10)

# See, the execution stops at the first "return" line that R encounters, no further lines are interpreted in the function.
# So only the first "return" line that R interpreter encounters is executed and function stops there
# Now return the result and the rand_num together

add3d <- function(input)
{
  output <- input + 3
  rand_num <- sample(10, 1)
  result <- output * rand_num
  return(result, rand_num)
}

add3d(10)

# Why did it happen? Only one return line is executed and it can return only ONE object
# So how can we get both the result and the rand_num?

add3e <- function(input)
{
  output <- input + 3
  rand_num <- sample(10, 1)
  result <- output * rand_num
  return(c(result, rand_num))
}
add3e(10)

# Well, then make into a single object by "c" function!
# Now check the contents of add3e, output and rand_num

add3e
function (input) 
{
  output <- input + 3
  rand_num <- sample(10, 1)
  result <- output * rand_num
  return(c(result, rand_num))
}
add3e
output
rand_num

# We see there is the function add3e with its code but output and rand_num do not exist, why???
# Because they only exist in the scope of the function that they were defined.
# They do not exist outside the function
# They are created when the function is executed and deleted when the execution stops
# Now first create an object named output with a value 1e6 (shorthand for one million in scientific notation)
# Then run the function again and see the content of output

output <- 1e6
add3e(10)
output

# Although we provided a large value for output, it was disregarded inside the function which also had an output object, then we see that output still exists after the function was executed and with the original value we provided
# Objects with the same names can exist in different scopes - called environments - that do not interfere with each other.
# For the time being, just now that the objects created inside a function only exist there. And the objects created inside a function do not modify the objects created outside the function and with the same name
# Now provide a default value to argument input as 10, and run the function again without any arguments supplied

add3f <- function(input = 10)
{
  output <- input + 3
  rand_num <- sample(10, 1)
  result <- output * rand_num
  return(c(result, rand_num))
}

add3f()

# See, when you provide a default value to a function, that value is assumed when you don't pass a value explicitly
# Now, make the "10" in sample a second argument that you can change, and provide "10" as the default value

  add3f <- function(input = 10, sample_max = 10)
  {
    output <- input + 3
    rand_num <- sample(sample_max, 1)
    result <- output * rand_num
    return(c(result, rand_num))
  }

# Note that, we do not quote the parameter names, just as we do not quote created object names
# And note we use "=" sign to provide default values to arguments, not "<-" assignment operator
# Now run the function w/o any arguments passed
  
  add3f()

# Now provide 12 to the first argument

  add3f(12)
  add3f(12,)
  add3f(input=12)

# They are all accepted
# Now provide 20 to the second argument

  add3f(,20)
  add3f(sample_max = 20)
  
# Now provide 30 to the first and 50 to the second argument
  add3f(30, 50)
  add3f(input = 30, sample_max = 50)

# Now provide the arguments in reverse order
  add3f(sample_max = 50, input = 30)

# When arguments are passed by their names order is not important
# If the names are not provided, order is important, and any skipped arguments should be delimited by commas if they are followed by any arguments for which we pass a value
# See: To skip the second one, comma was not necessary:
  add3f(10)
# To skip the first one, comma is necessary:
  add3f(,20)
# IT IS GOOD PRACTICE TO PASS ARGUMENTS BY NAME AS MUCH AS POSSIBLE TO MAKE YOUR CODE MORE COMPREHENSIVE AND READABLE
# AND PROVIDE SELF-EXPLANATORY ARGUMENT NAMES - JUST LIKE WE RECOMMENDED FOR THE OBJECT NAMES
# Now let's write comments to the function, so a newcomer can easily understand what it is meant for:

# add 3 to input, create an arbitrary number <= sample_max and multiply them
add3f <- function(input = 10, sample_max = 10)
{
  output <- input + 3 # add 3 to input
  rand_num <- sample(sample_max, 1) # get a single random number between 1 and sample_max
  result <- output * rand_num # multiply output and the rand_num
  return(c(result, rand_num)) # return the result and rand_num
}

# The curly braces can be combined with the previous or next lines provided they stay between those lines
# Like:
# add3f <- function(input = 10, sample_max = 10) {
# output <- input + 3

# add3f <- function(input = 10, sample_max = 10)
# { output <- input + 3


# However it is good practice to keep them separate in another line:
# Note that, some advanced text editors (like vim) can automatically detect curly braces as blocks and with some tools/extensions easily fold/unfold them to your liking with simple commands, so you can better arrange/view/edit longer codes
# Indents in R are not obligatory and they do not alter how the code is interpreted unlike Python in which indents are crucial for how the blocks are interpreted
# However good indentation is critical for code readability and editability
# Now create a function which takes a matrix, a vector and a single value as arguments
# Adds the matrix and vector
# And multiplies with the single value
# Let the default values be mat_4a, 1:4 and 2
# And run it with default values ...
# Note that function names must be explanatory (at least to you) just as other objects names should be

################################################################################################
# Exercise 1
# Create a function that will return the sum of 2 integers.

func_sum <- function(x,y){
  r <- x+y
  return(r)
}
func_sum(3,4)

################################################################################################
# Exercise 2
# Create a function to print class of an argument

Class.Finder<-function(arg){
  return(class(arg))
}

value<-c(1,2,3,4,5)
Class.Finder(value)


################################################################################################
# Exercise 3
# Create a user defined function to accept a name from the user

userread <- function()
{
  str <- readline(prompt="Enter the Name: ")
  return(as.character(str))
}

userread()

################################################################################################
# Exercise 4
# Create a function that given a vector and an integer will return 
# how many times the integer appears inside the vector.

f.count <- function (v, x) {
  count <- 0
  
  for (i in 1:length(v)) {
    if (v[i] == x) {
      count <- count + 1
    }
  }
  count
}
f.count(c(1:9, rep(10, 100)), 10)


################################################################################################
# Exercise 5
# Create a function that given an integer will calculate how many divisors it has (other than 1 and itself).
# Make the divisors appear by screen.

f.div <- function(n) {
  i <- 2
  counter <- 0
  
  while(i <= n/2) {
    if(n%%i==0) {
      counter <- counter + 1
      cat (i ,"\n")
    }
    i <- i + 1
  }
  counter
}
f.div(13)
f.div(16)


################################################################################################
# Exercise 6
# Create a function that given a vector will print by screen the mean and the standard deviation,
# it will optionally also print the median.

desi <- function(x, med=FALSE) {
  
  mean <- round(mean(x), 1)
  stdv <- round(sd(x), 1)
  cat("Mean is:", mean, ", SD is:", stdv, "\n")
  
  if(med) {
    median <- median(x)
    cat("Median is:", median , "\n")
  }
}
desi(1:10, med=TRUE)


################################################################################################
# Exercise 7
# Create a function that given a data frame, 
# and a number or character will return the data frame with the character or number changed to NA.

f.na <- function (df, otherna) {
  for(i in 1:ncol (df)) {
    for(j in 1:nrow (df)) {
      if(df[j,i] == otherna) {
        df[j,i] <- NA
      }
    }
  }
  df
}
cars
f.na(cars, 10)
