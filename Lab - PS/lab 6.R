################################################################################
# "split a vector into negative and positive numbers"

## John Kramer was thought to be dead, but he is returned now. He wants you to...
# Create a function which takes a vector(The length of it can be anything) as an input 
# and checks whether there are negative numbers in it or not.
# Then the function will create a list of two members and the first member will consist the negative numbers and the
# second one will have the other numbers (o or positive). 

# jigsaw <- function(input)
# {
#    negative <- NULL # collect numbers <= 0
#    positive <- NULL # collect numbers >= 0
	
	# Your code will be here #

#   return(endlist)
# }

# For example : jigsaw(c(-1,0,0,2,5,-3,-4)) will yield:

# [[1]]
# [1] -1 -3 -4

# [[2]]
# [1] 0 0 2 5

## ANSWER

jigsaw <- function(input)
{
  negative <- NULL # collect numbers <= 0
  positive <- NULL # collect numbers >= 0
  iter <- 1 # variable to iterate over the input vector
  
  while ( iter <= length(input) )
  {
    current_val <- input[iter] # get current value
    
    if (current_val < 0)
    {
      negative <- c(negative, current_val)
    } # close if1
    else
    {
      positive <- c(positive, current_val)
    } # close else1
    
    iter <- iter + 1 # incerement iterator variable
  } # close while1
  
  endlist <- list(negative, positive)
  
  return(endlist)
  
}

# Let's try for this vector:
vec <- sample((-10):10, 10, replace = T)
jigsaw(vec)


################################################################################
#Use while loop and write a function that checks whether the input is an Armstrong number.
#If sum of cubes of each digit of the number is equal to the number itself, then the number is called an Armstrong number.
#For example, 153=1^3+5^3+3^3 is an Armstrong number.

#If the input is an Armstrong number, then the output must be TRUE. 
#For example, 
# > armstrong_num(153)
# > TRUE

#If the input is not an Armstrong number, then the output must be FALSE.
#For example, 
# > armstrong_num(122)
# > FALSE  


#armstrong_num <- function(x)
#{
#	digits <- as.integer( unlist( strsplit( as.character(x), "") ) )
#
#	#Write your code here.
#    
#	return(answer)
#    
#}


## ANSWER 
armstrong_num <- function(x)
{
  # split the digits into a vector
  digits_vec <- as.integer( unlist( strsplit( as.character(x), "") ) )
  digits_len <- length(digits_vec) # get its length
  dig_ind <- 1 # initiate digit index
  summ <- 0 # initiate accumulator
  
  while(dig_ind <= digits_len) # while one, dig does not exceed the count of digits
  {
    summ <- summ + (digits_vec[dig_ind] ^ 3)
    dig_ind <- dig_ind + 1    
  } # close while 1
  
  answer <- (summ == x)
  
  return(answer)
  
}

armstrong_num(153)
armstrong_num(122)

