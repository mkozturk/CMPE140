# In the context of computer programming, a _function_ is a piece of code that takes _input arguments_, performs a specific task, and _returns its output_.
# 
# A first example
# ==============

# Let us define a function that returns the square of a given number.

square <- function(x) {
    return(x^2)
}

# We call the function by providing the input value as an argument. The function returns an output.

square(3)

# If we type a function's name and press Enter, we get back the definition of the function. 

square

# The syntax of a function definition
# =========
# 
# The general structure of a function definition is as follows:
# 
#     <function_name> <- function([<argument_1>, <argument_2>, ...]) {
#         <statements>
#         return(<return_value>)
#     }
# 
# Function arguments
# ==============
# The function can take any number of arguments.

f <- function(x,y,z){
    return(x+y*z)
}

f(1,2,3)

# It is possible to change the order of arguments by providing the names explicitly.

f(z=3,x=1,y=2)

# You can even omit some names, and the unnamed arguments will be matched in order.

f(z=3,1,2)

# Return values
# =============
# The _return value_ of the function can be any R object, such as a number, a vector, a matrix, a list, etc.

sumdiff <- function(x,y){
    return( c(x+y, x-y) )
}

sumdiff(5,8)

# The function returns the last expression in its block, even if we don't use `return` explicitly.

f <- function(x,y,z){
    x+y*z
}

f(1,2,3)

# A function itself is an R object, therefore we can easily write _functions that return functions_.

powerfun <- function(p){
    return(function(x) x^p)
}

sq <- powerfun(2)
cube <- powerfun(3)

sq(1.5)
cube(1.5)

# Vectorization of functions
# ===========
# The simple function `square()` defined above happens to work with vector arguments without any modification, because the returned statement `x^2` is valid for both numbers and vectors.

square <- function(x) {
    x^2
}
square(c(1,2,3))

# However, functions are not always vectorized. See the following counterexample:

addupto <- function(n){
    total <- 0
    for (i in 1:n)
        total <- total + i
    return(total)
}

addupto(10)

# When we call this function with a vector argument, only the first element is taken, and a warning message is issued

addupto(c(10,20))

# If you want this function to work with vector input, you can use a loop that iterates over the input vector.

addupto_vec <- function(nvec){
    result <- c()
    for (n in nvec){
        total <- 0
        for (i in 1:n)
            total <- total + i
        result <- c(result, total)
    }
    return(result)
}

addupto_vec(c(10,20))

# Alternatively, you can use the built-in `sapply()` function, which maps a function on each element of a vector.

sapply(c(10,20), addupto)

# Default arguments
# ==============
# When you define a function, you can set some of the arguments to default values. Then you don't have to specify them at each call.

f <- function(capital, interest_rate=0.1) {
    capital * (1+interest_rate)
}

# Without specifying the `interest_rate` value, 0.1 is assumed.

f(1000)

# But if you want to change it, you can provide it as an extra argument.

f(1000,0.2)

# If you want to change the order of the arguments, 

f(interest_rate = 0.2, 1000)

# Arbitrary number of arguments
# ====================
# The function definitions above take a fixed number of arguments. If desired, we can define the function for an arbitrary number of arguments, without specifying their name or how many they are.

f <- function(...) {
    total <- 0
    for (i in c(...)) {
        print(i)
        total <- i
    }
    total
}

f(1,2,6,2,5)

# This feature is commonly used if you want to pass some of the arguments to another function.

f <- function(x, y){
    cat("This is function f(). Here x =",x,"y=",y,"\n")
    return(x+y)
}

g <- function(z, ...){
    cat("This is function g(). Here z =",z,"\n")
    fresult <- f(...)
    return(z + fresult)
}

g(5,8,4)

g

# Variable scope
# ============

# The value of a variable defined outside a function (a _global variable_) can be accessed inside a function. However, a variable defined inside a function block is not recognized outside of it.
# We say that the _scope_ of the variable `b` is limited to the function `f()`.

rm(list = ls())

a <- 5

f <- function(){
    b <- 10
    cat("inside f(): a =",a,"b =",b,"\n")
}

f()
cat("outside f(): a =",a," ")
cat("b =",b)

a <- 5

f <- function(){
    b <- 10
    cat("inside f(): a =",a,"b =",b,"\n")
}

f()
cat("outside f(): a =",a," ")
cat("b =",b)

# A local variable temporarily overrides a global variable with the same name.

a <- 5
cat("before f(): a =",a,"\n")

f <- function(){
    a <- 10
    cat("inside f(): a =",a,"\n")
}

f()
cat("after f(): a =",a)

# R allows for nested function definitions. So we can define functions within functions, within functions. Scope rules apply in the same way: A variable is available in the current level, and all the levels below in the hierarchy, but not above it.

aaa <- 5
f <- function(){
    bbb <- 10
    g <- function(){
        ccc <- 10
        cat("\nInside g(): aaa =", aaa, "bbb =",bbb, "ccc =",ccc,"\n")
    }
    g()

    cat("\nInside f(): aaa =", aaa, "bbb =", bbb,"\n")
    cat("ccc exists?", exists("ccc"),"\n")
}
f()
cat("\nOutside f():\n")
cat("aaa exists?", exists("aaa"),"\n")
cat("bbb exists?", exists("bbb"),"\n")
cat("ccc exists?", exists("ccc"),"\n")

# Assigning values to upper-level variables
# ==========
# Although the values of variables defined in upper levels are available in lower levels, they cannot be modified in a lower level, because an attempt in assignment will create only a local variable with the same name.

a <- 5
cat("before f(): a =",a,"\n")

f <- function(){
    a <- 10
    cat("inside f(): a =",a,"\n")
}

f()
cat("after f(): a =",a)

# Using the _superassignment operator_ `<<-` it is possible to assign to a variable in the higher level.

a <- 5
cat("before f(): a =",a,"\n")

f <- function(){
    a <<- 10
    cat("inside f(): a =",a,"\n")
}

f()
cat("after f(): a =",a)

a <- 5
cat("before f(): a =",a,"\n")

f <- function(){
    g <- function(){
        a <<- 20
        cat("inside g(): a =",a,"\n")
    }
    cat("inside f(), before g(): a =",a,"\n")
    g()
    cat("inside f(), after g(): a =",a,"\n")
}

f()
cat("after f(): a =",a)

# Note that the superassignment affects all the levels above it.
