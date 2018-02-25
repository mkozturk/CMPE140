# # Vectors
# 
# ### HAVE FUN!!
# 
#  - Mert Tiftikci
# 
# Adapted from, Serhat ??evikel

# ## Vector Initialization
# 
# Create a vector worker_age with  Emre=25, Can=52, Ceren=33
# 
# Get the value and class
worker_age <- c(Emre = 26, Can = 52, Ceren = 33)

worker_age

class(worker_age)


# Create the same vector, putting each value in a separate line <p></p>Get the value and class
worker_age <- c(Emre = 25,
                Can = 52,
                Ceren = 33)

worker_age

class(worker_age)


# ## Named Vectors
# 
# Create the same vector, first assign the values and then assign the names separately
worker_age <- c(25, 53, 33)
names(worker_age) <- c("Emre", "Can", "Ceren")
worker_age


# Print the vector without the names
unname(worker_age)
worker_age


# ## Variable Naming
# 
# Get info on c function
?c


# Get the contents (code) of the c function
c


# Create an object named "c" and assign an arbitrary value to it
c <- 1


# Now try to get the contents (code) of the c function
c


# Now create a vector of numeric values 2 and 3 by using function c, w/o assignment
c(2, 3)


# See, when you create an object whose name coincides with a built-in function, the function still works, but you won't be able to see the inner workings of the function when needed and will create a confusion and inconvenience. For good R style, don't use built-in function names for your own objects

# ## Indexing
# 
# Create a vector worker_income with Emre=36000, Can=38500, Ceren=40700
# 
# Get the values and class
worker_income <- c(Emre = 36000, Can = 38500, Ceren = 40700)

worker_income

class(worker_income)


# Create a vector of values 2 and 3 by c() function, w/o assignment
c(2, 3)


# Create a vector of values from 2 to 3 by using the colon operator ":", w/o
2:3


# Get information on the colon operator
?":"


# Create a vector of FALSE, TRUE and TRUE values, w/o assignment
c(F, T, T)


# Get the ages of Can and Ceren by combining relevant indices using c function
worker_age[c(2, 3)]


# Get information on subsetting or extracting operator "[" 
?"["


# Now assign the vector created by c(2,3) to indices_1 object
indices_1 <- c(2, 3)


# Get the same values by using indices_1 vector
worker_age[indices_1]


# Get the ages of Can and Ceren by combining relevant indices using ":" colon operator
worker_age[2:3]


# When the indices are consecutive or with same distances apart, you can use the colon operator to create a vector of indices

# Now assign 2:3 to indices_2 object
indices_2 <- 2:3


# Get the ages using indices_2 object
worker_age[indices_2]


# Get the ages of Can and Ceren by using a boolean vector that says which items to include (T) or exclude (F)
worker_age[c(F, T, T)]


# Now assign the boolean vector to object bool_1
bool_1 <- c(F, T, T)


# Get the ages using this boolean vector
worker_age[bool_1]


# Now subset the worker_age vector with just one TRUE value. Does it return only the first item?
worker_age[T]


# Why did it return the whole vector although we supplied a single logical value?
# <p></p>R automatically recycled the vector wtih single T value to the length of the worker_age vector.<p></p>Now subset it with all T logical values
worker_age[c(T,T,T)]


# Now do the same thing but intentionally confuse [ with (
worker_age(c(T,T,T))


# Why? Because "(" must come after a function and there is no function named worker_age

# Now get the ages by using Can's and Ceren's names, w/o combining them with c
worker_age["Can", "Ceren"]


# See, when the indices are not combined into an object (whether assigned or not), they are treated as separate arguments. And since a vector has only one dimension, the second argument gives an error

# Now get the ages using names, combining them with c
worker_age[c("Can", "Ceren")]


# Now assign Can and Ceren names to a vector called names_1
names_1 <- c("Can", "Ceren")


# And get the ages using names_1 vector
worker_age[names_1]


# See, you can subset or extract items from a vector by multiple ways: A vector of indices, a vector of boolean/logical values, a vector of names (if the vector items are named)

# ### Review: Classes
# 
# Now get the classes of all vectors that we used for subsetting worker_age
class(indices_1)

class(indices_2)

class(bool_1)

class(names_1)


# See, c(2,3) creates a numeric object while 2:3 creates an integer object

# ## Attributes
# 
# Now list the names of the items in worker_age
names(worker_age)


# Now get all the attributes of worker_age
attributes(worker_age)


# See, our worker_age vector's only attribute is names of items

# Get info on attributes function
?attributes


# Get the length of worker_income object
length(worker_income)


# ## Element Removal
# 
# Show the worker_income object w/o Can's income
worker_income[-2]


# Check whether the worker_income object still has Can's income
worker_income


# See, unless we make an assignment back to the object, it is not updated. Without assignment, R objects are "immutable", unchangeable

# Now assign the worker_income vector without Can's income to worker_income_2
worker_income_2 <- worker_income[-2]


# Check worker_income_2
worker_income_2


# New create a copy of worker_income object as worker_income_3
worker_income_3 <- worker_income


# Now delete Can's income in worker_income_3 object by excluding the item. Check the vector
worker_income_3 <- worker_income_3[-2]

worker_income_3


# Now repeat the same asignment and check the vector
worker_income_3 <- worker_income_3[-2]

worker_income_3


# Update Emre's income to 39000 and check the vector
worker_income[1] <- 39000
worker_income


# Append Selin's age which is 27 at second position of worker_age vector. Check the vector
worker_age <- c(worker_age[1], Selin=27, worker_age[2:3])
worker_age


# Now create a copy of worker_age_2, append a new person with age 50 and name "Naim". Check the vector
worker_age_2 <- worker_age
worker_age_2[5] <- 50
names(worker_age_2)[5] <- "Naim"
worker_age_2


# See, you can append an item to the end of the vector as if that item already exists and you update that value

# ## Vector Filtering
# 
# Create a vector of boolean/logical values for whether age values are smaller than 40
worker_age < 40


# Get workers which are younger than 40
worker_age[worker_age < 40]


# Now assign the boolean values of "worker_age > 40" to object bool_1, and check the vector
older_30 <- worker_age > 30
older_30


# Now assign the boolean values of "worker_age < 40" to object bool_2, and check the vector
younger_40 <- worker_age < 40
younger_40


# Now get the workers older than 30
worker_age[older_30]


# Now get the workers younger than 40
worker_age[younger_40]


# ### Boolean Operators
# 
# **AND Operator (" & ")**
# 
# Find which workers younger than 40 and older than 30
younger_40 & older_30

worker_age[younger_40 & older_30]


# **Not Operator (" ! ")**
# 
# Find which workers are older than 40
! younger_40

worker_age[! younger_40]


# **OR Operator (" | ")**
# 
# Find workers that are older than 40 and younger than 30
! younger_40 | ! older_30

worker_age[! younger_40 | ! older_30]


# ## Sorting
# 
# Sort worker's income in ascending order
sort(worker_income)


# See whether worker_income vector is sorted by that action
worker_income


# Unless you make an assignment to that object, they are "immutable", the actions do not alter the objects

# Sort worker's income in descending order

# Get information on sort function
?sort

sort(worker_income, decreasing = TRUE)


# Now let's do something more demanding: <p></p>Increase by 10% the income of workers who have an income of less than 40000. Check the vector
worker_income[worker_income < 40000] <- worker_income[worker_income < 40000] * 1.1
worker_income


# See the "* 1.1" operation is executed on all selected values (income less than 40K) at once. We do not have to iterate over each value. This is called "vectorization" and the power of R comes from vectorization

# ## Order
# 
# Remember worker_age vector again and get order of worker's ages
worker_age
order(worker_age)


# What does this output mean? Get info on order function
?order


# Now delete Selin's age, remember age and income vector, get the order of ages again and sort incomes of workers by their age (why delete Selin?)
worker_age <- worker_age[-2]
worker_age
worker_income
order(worker_age)
worker_income[order(worker_age)]


# Now do the sort in descending order of ages
worker_income[order(-worker_age)]


# Create a monthly_income vector, check the vector
monthly_income <- worker_income / 12
monthly_income


# ### Some Math Operations
# 
# Round the values in monthly_income (to closest integer)
round(monthly_income)


# Round down monthly_income values
floor(monthly_income)


# Round up monthly_income values
ceiling(monthly_income)


# Find the average monthly income
mean(monthly_income)


# ## Rank
# 
# Create a vector named sample_1 which has randomly selected 10 numbers between 1 and 20 (without repetition). Check the vector
sample_1 <- sample(20, 10)
sample_1

?sample


# Now first get the order of items and the rank of items. Are they different? Why?
order(sample_1)

rank(sample_1)


# Get information on rank function
?rank


# Order gives the indices of items so that if we pick the items in that order they will be sorted <p></p> Rank gives the rank of each item if the vector were sorted

# ## Coercion
# 
# Create a vector of integer values 1 to 10 and assign to vector_1. Get the values and class
vector_1 <- 1:10
vector_1
class(vector_1)


# Now update 2nd item to string "cmpe". Get the vector again and its class
vector_1[2] <- 'cmpe'
vector_1
class(vector_1)

vector_1[2] <- 2
vector_1


# A vector is an object that hold the values of the same type. And its type is dynamic: As the vector is updated with values of other types, the type/class of whole vector is changed: When only one value is changed to a character, the whole vector is "coerced" into a character vector

# Now create a vector of lower case letters a to e and assign to vector_2. Check the vector and its class
vector_2 <- letters[1:5]
vector_2
class(vector_2)


# Now assign number 1 to 2nd item. Check the vector again and its class
vector_2[2] <- 1
vector_2
class(vector_2)


# See, a number can act as a character but a character cannot act as a number. So the class of vector stays as character, it is not coerced into numeric after the assignment

# ## Sample
# 
# First create a vector of values selected from 1 to 20 and with a random length, assign it to object sample_1
# 
# 1. get the last item of that vector
# 2. get all but the last item of that vector
# 
# Note that, you don't know the index of the last item before hand!
sample_1 <- sample(20, sample(20, 1))

sample_1[length(sample_1)]

sample_1[-length(sample_1)]


# Get info on sample function
?sample

