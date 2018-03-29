# PS 8

############################################################################################
# A typical resident of the country of "Oburistan" consumes a simple basket of goods 
# consisting only of life’s essentials: Soda, Pizza, and Hamburger. 
# A year’s basket contains 1,000 sodas, 100 pizzas, and 50 hamburgers. 
# The price of these goods in each of the past three years is given in the following table:

#     [Soda] [Pizza] [Hamburger]
# [2015] 1      8       10    
# [2016] 1.5    8       10   
# [2017] 1.5    8.5     11  

# Task-1: Create a 3x3 matrix called "Oburistan" to store these prices.

Oburistan <-rbind(c(1,8,10), c(1.5,8,10), c(1.5,8.5,11))
Oburistan <-cbind(c(1,1.5,1.5), c(8,8,8.5), c(10,10,11))
Oburistan <- matrix(c(1, 8, 10, 1.5, 8, 10, 1.5, 8.5, 11), nrow=3, ncol=3)
# Nope.. which one was the first? row or column?
Oburistan <- matrix(c(1, 8, 10, 1.5, 8, 10, 1.5, 8.5, 11), nrow=3, ncol=3, byrow=TRUE)
# Now, ok.
Oburistan

# Task-2: Assign row and column names as shown in the table. 

rownames(Oburistan) <- c("2015","2016","2017")
colnames(Oburistan) <- c("Soda", "Pizza", "Hamburger")
Oburistan

# Task-3: Calculate Cost of basket (CoB) for each year according to: 
# Cost of Basket = 1000 x price of a soda + 100 x price of a pizza + 50 x price of a hamburger

CoB<- Oburistan[,1]*1000 + Oburistan[,2]*100 + Oburistan[,3]*50
CoB

# Task-4: Update Oburistan matrix by adding a «CoB» column to matrix with CoB values.

Oburistan <- cbind(Oburistan, CoB)
Oburistan

# Task-5: You have measured all values above in Oburistan currency (ORS) but you need to convert them to Turkish Lira.
# Create a function called "ORS_to_TRY" to convert ORS to TRY. (Assume "1 ORS = 2 TRY")

ORS_to_TRY <- function(x) {x*2}

# Task-6: Update Oburistan matrix by applying our function "ORS_to_TRY" to Oburistan matrix

apply(Oburistan, 1, ORS_to_TRY)
apply(Oburistan, 2, ORS_to_TRY)

# what was "2" above? Let's see
apply(Oburistan, 1, mean)
apply(Oburistan, 2, mean)
# ok, got it.. Then;

Oburistan <- apply(Oburistan, 2, ORS_to_TRY)

# Task-5: Write a function named "CPI_calculator" to calculate CPI according to:
# CPI = (CoB at current year / CoB at base year) x 100
# Note that: Use 2015's CoB value as a default base year.

CPI_calculator <- function(x, base=4600){
  (x/base)*100
}

# Task-6: Calculate CPI for each year using 2016 as base year.
CPI_calculator(Oburistan[,4])
CPI <- CPI_calculator(Oburistan[,4])

# Task-7: Update Oburistan matrix by adding a «CPI» column to matrix with CPI values.
cbind(Oburistan, CPI)
oburistan <- cbind(Oburistan, CPI)


# QUIZ QUESTION #############################################################################
# $matrix
#       [,1] [,2] [,3] [,4]
# [1,]    2    3    4    5
# [2,]    3    4    5    6
# [3,]    4    5    6    7
# [4,]    5    6    7    8

# $sum
# [1] 80

matrix_fnc <- function(x,y)
{
  special_matrix <- matrix(nrow = x, ncol = y)
  for (rw in 1:x){
    for(cl in 1:y){
      special_matrix[rw,cl] <- rw + cl 
    }
  }
  return(list(matrix=special_matrix, sum=sum(special_matrix)))
}

# What if... #############################################################################
# > my_func(3,4)
#       [,1] [,2] [,3] [,4]
# [1,]    1    1    1    1
# [2,]    1    0    0    1
# [3,]    1    0    0    1
# [4,]    1    0    0    1
# [5,]    1    1    1    1

matrix_fnc <- function(x,y)
{
  special_matrix <- matrix(nrow = x, ncol = y)
  for (rw in 1:x){
    for(cl in 1:y){
      if(rw==1 || cl==1){
        special_matrix[rw,cl] <- 1
      }
    else if(rw==x || cl==y){
        special_matrix[rw,cl] <- 1
      }
      else{
        special_matrix[rw,cl] <- 0
      }
    }
  }
  return(list(matrix=special_matrix, sum=sum(special_matrix)))
}

# What if...Try to solve yourself ############################################################################# 
# > my_func(3,4)
#       [,1] [,2] [,3] [,4]
# [1,]    1    0    1    0
# [2,]    0    1    0    1
# [3,]    1    0    1    0


# QUESTION #################################################################################
# Write a function which sums the odd vector elements' squares using the control "next"

#Examples:

# a <- c(2,3,5,7,8)
# math(a)
# 83

# b< -c(1,2,4,6,12,24)
# math(b)
# 1

# d <-c(1,3,5,7)
# math(d)
# 84

# ANSWER

math <- function(vec)
{
  summ <- 0 
  
  for (x in vec) 
  {
    
    if( x %% 2 == 0 ) 
    {
      next 
    }
    
    summ <- summ + x ^ 2 
  }
  
  return(summ)
  
}

# QUESTION #################################################################################

# We have seen some functions throughout the course like mean(),sum(),sqrt() etc.
# Can you create a function which can do what length() function does without using length function ?
# You are required to use a while loop
# Hint: And you can just play on how "mean" is calculated
# Note that, the input should not be a vector sum of which is 0

#my_length_fx <- function(input)
#{
#		
#	# Your code will be here  #
#
#    return(length_ver2)
#  
#}

# ANSWER

my_length_fx <- function(input)
{
  i <- 1 # an iterator
  
  while( mean(input) != sum(input) / i) # while two mean definitions are not equal
  { 
    i <- i + 1 # increment i
  }
  
  return(i)
  
}

my_length_fx(c(1,5,3,5,2,35,46,9,4))

# Alternatively:

length_calculator <- function(vec){
  a <-0
  for(i in vec){
    a <- a + 1
  }
  return(a)
}

length_calculator(c(1,5,3,5,2,35,46,9,4))

############################################################################################

#Suppose you are working for a travel company.
#The company organizes a trip to Rome and they sell eveything included packages for 100TL for 1 person. 
#They also give group discounts, which works the following way:
#For a purchase of more than 1 person, the per person package price becomes:
# 100-(the number of people in the group). 
#For example, if you buy the package for 2 people, you pay: 2*(100-2) = 196TL in total.
#The maximum discount you can get this way is 50TL per person.
#So, for more than 50 people you still get 50TL discount per person.
#For example, for 60 people the total price is 60*(100-50)= 3000TL
#Write a function f(x), which calculates total cost given the number of people in the group.
#The function should work for the case of only 1 person too.

f=function(x){
  if(x==1){return(100)
  }else{
    if(x<51){
      return(x*(100-x))
    }else{
      return(x*50)
    }
  }
}


############################################################################################

# Create "conj_verbes_avec_une_base list containing French verb endings for verbs with 1 base for present tense
# For je(I), it is "e"; for tu(you), it is "es"; For elle(she), it is "e";
# For nous (we), it is "ons"; For vous(you), it is "ez"; For ils(they), it is "ent"
# Create a list "les_bases_des_verbes" containing the bases of verbs such as cherch (to search), regard (to watch), port (to wear)
# Create a function "conjugaison" that will take the base of the verb as an input and would return the conjugations for the six subjects
# The function should give the result below
# > conjugaison("travaill")
#[1] "travaille"   "travailles"  "travaille"   "travaillons" "travaillez" "travaillent"
# Hint: You may want to check the arguments for paste function
# Apply "conjugaison" function to "les_bases_des_verbes" list and get the result as a list

add <- list(je="e", tu="es", elle="e", nous="ons", vous="ez", ils="ent")

conjugaison <- function(verb)
{
  conj <- c()
  for(i in 1:6)
  {
    conj <- c(conj, paste(verb[1],add[i], sep = ""))
  }
  return(conj)   
}
conjugaison("travaill")

verbs <- list(to_search="cherch", to_watch="regard", to_wear="port")
lapply(verbs, conjugaison)