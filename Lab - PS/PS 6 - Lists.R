# WEEK 06 - PS
# LISTS
# What is a list in R?
#  A special kind of vector, items of which are any kind of R objects!
#  Let's first create a list:

john <- list("John",35,c("English","French"),TRUE)

names(john) <- c("name","age","speaks","married")

john

# Check the attributes, class, length and dimensions of the list

attributes(john)

class(john)

length(john)

# A list is much like a "set" in mathematics: It can include any other object, even other lists
# Now first subset this list in different methods
# First let's use the usual extract/subset operator "["

john13 <- john[1:3]
john13
class(john13)
length(john13)

# This is just a sublist, a portion of the original list object
# Now let's use the double bracket "[[" to take out a single item of the list

john3<- john[[3]]
john3
class(john3)
length(john3)

# Compare it with john[3]

john3l <- john[3]
john3l
class(john3l)
length(john3l)

# See a list is a collection of any type of R objects. Double bracket, takes out that single object. 
# It is a character vector in this example and john[[3]] is a character vector with 2 a length of 2
# john[3] is just a sublist of the original list. 
# It is still a list of one item (and that item is a character vector of length 2)
# Now subset 2:3 items of the list with "[[" operator

# john[[2:3]]

# We can subset only one item at a time with "[[" operator from a list
# Now subset the second item with the "$" operator:
  
john_sp <- john$speaks
john_sp
class(john_sp)
length(john_sp)  

# It works like "[[", takes out an item, not a sublist, but referred to by the object by the name
# We can use names with "[[" as well

john_sp <- john[["speaks"]]
john_sp
class(john_sp)
length(john_sp)

# It is identical to john[[3]]
# What about "[" and a name?

john_sp <- john["speaks"]
john_sp
class(john_sp)
length(john_sp)

# It is identical to john[3]
# Now create a list of 5 items, each holding values 1 to 5

list15 <- list(1:5)
list15
length(list15)

# It is not what I wanted??
# Any other try? 

as.list(1:5)
m <- as.list(1:5)
length(m)

# That's what I want!
# as.list converts the vector and makes each item of the vector into a separate vector that are items of a list
# Now let's create a list of 5 items each one being 1.

list15 <- rep(list(1), 5)
list15
class(list15[1])
class(list15[[1]])

# Now let's turn on to getting the classes of all items in the list
# But it was cumbersome to write the same line with different indices each time
# And we cannot use apply here, it doesn't have a margin
# Let's use sth similar, that is used for applying over list items:

classes <- lapply(john, class)
classes
class(classes)

# "lapply" iterates through list items and returns a list
# But what if I just want a vector?
#  There are two ways:
#  1.) list is a special kind of vector, so let's simplify it by unlisting it:

classes <- unlist(lapply(john, class))
classes
class(classes)

# 2.) Or use a variant that may or may not simplify the result to a vector to our liking:

classes <- sapply(john, class)
classes
class(classes)

# In fact we may tell sapply not to simplify - hence the same result as lapply

classes <- sapply(john, class, simplify = F)
classes
class(classes)

# Now let's come to some applications with R
# Let's write a very simple function: That takes a vector and returns the sum of the vector items
# But we want both of those objects: A vector of multiple values and a single value, and we want them so that they can be accessed separately!

vec_and_sum <- function(vec)
{
  a <- sum(vec)
  return(list(vec, a))
}
result <- vec_and_sum(1:5)
result
result[[1]][2]

# See we can use any of those two objects in our subsequent code by just subsetting single items from the result list

result[[1]]
result[[2]]

# We can hold vectors of different lengths w/o recycling

pencils <-  list(A=1:5,B=seq(3,12,2),C=6:3)

# And we can rearrange the items using basic building blocks
# Say, sort the list items according to their total sums

# The following code follows these three steps (inside --> out)
# Get the total sums of each list item
# Get their order (in ascending order by default)
# Subset the items of list in that order - hence sort it

pencils[order(sapply(pencils,sum))]

# Let's write a function that reduces 100 TL from the salaries of employees older than 50.
myemployees<-list(age=c(34,45,67,61,45,53,46), married=c(T,F,T,T,F,F,T),
                  salary=c(1500,3500,4000,1500,2100,4200,3000),names=c("a","b","c","d","e","f","g"))
myemployees
pencils

my_func<-function(list){
  for (x in 1:length(list$age)){
    if(list$age[x]>50){
      list$salary[x]<- list$salary[x]-100
    }
  }
  return(list)
}
my_func(myemployees)

# Now, write an R statement to split this string into two (word by word).

string <- "Grand Opening"
a <- strsplit(string," ")
list(a)
list(a[[1]][1], a[[1]][2])
