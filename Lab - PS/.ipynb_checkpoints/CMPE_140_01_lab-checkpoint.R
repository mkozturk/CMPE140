# HAVE FUN!!
# Serhat Çevikel

# Print number 1 on the screen

1

# Print the word cmpe on the screen

cmpe

# That may have given an error. Why? 
# 
# Now print the word cmpe within quotes on the screen

"cmpe"

# Print a capital letter T in quotes on the screen

"T"

# Print a capital letter T w/o quotes on the screen

T

# Why did that happen? Now print capital letter F w/o quotes on the screen

F

# Now let's do some math: Calculate 1+5 w/o spaces

1+5

# Now do the same thing with spaces like 1 + 5

1 + 5

# Nothing changes. But it is good style to separate objects from each other with spaces

# Now, calculate 3 x 4 + 2

3 x 4 + 2

# That gave an error possibly. Why? Now do it again with the correct operator. Don't use parantheses!

3 * 4 + 2

# Now do it again with parantheses around the multiplication

(3 * 4) + 2

# Possibly the same output. Now put parantheses around (4 + 2)

3 * (4 + 2)

# So R interpreter applies the usual operator precedence. If you want to calculate sth different, use parantheses

# Calculate 8 / 3 - 2

8 / 3 - 2

# Calculate 8 / (3 - 2)

8 / (3 - 2)

# Again precedence applies and parantheses matters

# Now get the square of 6

6 ^ 2

# Now get the remainder from 8 / 3

8 %% 3

# "%%" is called modulo operator and quite useful. You can use it in order to check divisibility or to manipulate cyclical data structures

# Question: There are only 3 states of weather occuring sequentially and in a cycle: 0 is rainy, 1 is cloudy, 2 is sunny
# 
# Today was rainy (so state 0). What will be the state of the weather 1237 days later?

1237 %% 3

# So it will be cloudy that day!

# Write the word pi with quotes on the screen

"pi"

# Now write the same word w/o quotes

pi

# So R has some built-in constants that are used in mathematics

# Now divide 1 and -1 by 0

1 / 0

-1 / 0

# So Inf and -Inf are also mathematical built-ins in R

# Is there a way to print the famous euler's number "e" (2.71828) that we use as the base for natural logarithm on the screen?

exp(1)

# An calculate the natural logarithm of 1

log(1)

# Calculate the natural logarithm of the euler's number

log(exp(1))

# So you can nest function calls inside other function calls

# Calculate the square root of 9 using the "^" operator

9 ^ 0.5

# Calculate the square root of 9 using a dedicated function

sqrt(9)

# Calculate the square root of 8 + 1

sqrt(8 + 1)

# You see, you can "chain" mathematical operations by nesting inside parantheses and functions

# Get the absolute value of -4

abs(-4)

# Get some information on how the "log" function is used

?log

# Now create a new "variable" with name "a" and assign number 1 to it

a <- 1

# Why did it not return anything? Now check whether our variable was created

a

# Check the type of the value that was assigned to a

class(a)

# Now assign 1L to object a, get its value and check its type

a <- 1L

a

class(a)

# Although it looks like an integer, by default, R treats numbers as numeric (float or like 1.0). The L suffix "coerces" the number to integer. Integer occupies less place in memory. We'll see that later

# Now assign the letter "a" to object "a", get its value and check its type

a <- "a"

a

class(a)

# Now assign the integer 1 to object a again

a <- 1L

# Divide object a and assign the result to a new object named "b"

b <- a / 2

# So you can use already existing objects in assignments. Note that ASSIGNMENTS OCCUR FROM RIGHT TO LEFT!!! 

# Check the values and classes of objects a and b

a

class(a)

b

class(b)

# So the division operator "coerces" the integer value to numeric

# Now divide 8L by 2L and get the class of the result immediately

class(8L / 2L)

# So division always coerces the result to numeric

# Now assign the capital letter T to object a

a <- T

# Get its value and class

a

class(a)

# Now add 1L to a and assign it to object d

d <- a + 1L

# Get the value and its class

d

class(d)

# So logical values TRUE and FALSE can be used as integer values 1 and 0

# Now assign string cmpe w/o quotes to object a

a <- cmpe

# A string should have quotes around to be treated as a string. Otherwise it will be treated as an object name and returns an error if it has not been created yet. Do not use quotes around object names in assignments

# Now do the same assignment with quotes, get the value and the class

a <- "cmpe"

a

class(a)

# Assign any arbitrary value to an object name "1a"

1a <- 1

# Got an error? Object names cannot start with numbers

# Now assign any arbitrary value to objects a1, a.1, a_1 and a-1. Which of them caused trouble?

a1 <- 1

a.1 <- 2

a_1 <- 3

a-1 <- 4

# So provided that it starts with an allowed character, you can use numbers (0-9), dots (.) and underscores (_) in object names but not a hypen (-)

# By the way it is good practice to use longer, comprehensive and self explanatory names for objects. It is good for you to remember what the purpose of the object is, and others who try to decrypt your code!

# And also do not use the names of reserved functions for your own variables. It works but may cause confusion and inconvenience (when you try to debug, etc)

# Now assign value 1 to object named "variable_1" and value 2 to object names "variable_2" but in one line

variable_1 <- 1; variable_2 <- 2

# Now get the values of those two variables in one line

variable_1; variable_2

# Although ";" operator allows you to input more than one statements or commands in one line, it will show your code more complex and cryptic, so avoid this practice 

# Now assign the value 1 to object variable_3 but accidentially forget the hypen "-" in the assignment operator

variable_3 < 1

# An error, why? R interpreter tries to make a comparison between two objects but cannot find the first one! This is a common source of bug

# So there are some other operators in R. "less than" (<) is one of them.

# Now assign value 1 to object var_4 but with "=" operator, and check whether it is ok

var_4 = 1

var_4

# See it works, but you are strongly discouraged to use "=" as an assignment operator, since it may create some confusion in more complex code. So always use "<-" for assignment!

# Now, see that there are some additional operators, like "<" which means "smaller than". Now let's do it, check whether 1 is smaller than 2

1 < 2

# Now check whether 2 is smaller than 1

2 < 1

# Now check whether 2 is equal to 2

2 == 2

# Now check whether 2 is equal to 1

2 == 1

# Now check whether 2 is NOT equal to 1

2 !=1

# Now check whether 2 is NOT equal to 2

2 != 2

# Now NEGATE the TRUE value

!T

# Now negate the FALSE value

!F

# Now check whether 2 is equal to 2 but accidentially forget one of the equal signs in the "==" operator

2 = 1

# Confusing "=" and "==" is a very common source of bug

# Now first assign string "NULL" to object var_5 and check its value and class

var_5 <- "NULL"

var_5

class(var_5)

# And then assign string NULL w/o quotes to the same object, check value and class 

var_5 <- NULL

var_5

class(var_5)

# So NULL is some reserved object name for NOTHING

# <a href="https://www.youtube.com/watch?v=KnmIoF_2Q4Y">My offer is this: NOTHING!</a>

# NULL is nothing, something not defined or empty, but exists. And it can create an object! Get more info on NULL

?NULL

# Now assign NULL to a new variable var_6

var_6 <- NULL

var_6

class(var_6)

# Now assign string "NA" with quotes to var_7, check value and class

var_7 <- "NA"

var_7

class(var_7)

# Now assign string NA w/o quotes to var_7, check value and class

var_7 <- NA

var_7

class(var_7)

# NA is used for some missing value, it doesn't mean "nothing" or "empty" but "missing". Get more information on NA

?NA

# So what's the difference between NA and NULL. length() function return the number of items in an object. Now get the length of var_6 which is NULL and var_7 which is NA

length(var_6)

length(var_7)

# So a null object is like an empty set in mathematics

# But making an object NULL does not mean that it removes the object. Now remove var_6 with rm() and check whether it is removed

rm(var_6)

var_6

# Now list all the objects you created and not deleted in this session with ls()

ls()

# What if you only typed ls instead of ls()

ls

# Why did it happen? 
#  Because "ls()" with parantheses is a FUNCTION CALL to ls while "ls" without parantheses just shows the code for the function as an object!
