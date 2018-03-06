# Making decisions
# ===========
# 
# * The `if` statement executes a block of code if a condition is `TRUE`.
# * _Conditional execution_: Common in all programming languages.
# * General structure:
# 
# 
#     if(<condition>) {
#         <statements 1>
#     } else {
#         <statements 2>
#     }
# * The value of the last statement in the executed block is returned.

# The if statement
# =========
# 
# * Users enter their grade to ask about whether they passed the course.
# * If the grade is greater then 50, the student passes the course.

x <- as.integer(readline(prompt = "Enter your grade: "))
if(x>50)
    "Passed!"

x <- as.integer(readline(prompt = "Enter your grade: "))
if(x>50)
    "Passed!"

# * If we have more than one statement inside an if-block, we must use braces to indicate the limits of the block.
# * The `if` statement is actually a function, and it returns the value of the last statement in the if-block.

x <- 70
y <- 0
if (x>50) {
    y <- y + 1
    "Passed"
}
y

# Note that if we omit the braces, the code still works but it gives the wrong result.

x <- 40
y <- 0
if (x>50) 
    y <- y + 1
    "Passed"

y

# This occurs because, without braces, this code is equivalent to:
# 
#     x <- 40
#     y <- 0
#     if (x>50) {
#         y <- y + 1
#     }
#     "Passed"
#     y
# So that the message `"Passed"` appears even though the condition is `FALSE`, but `y` is not incremented.

# The if-else statement
# ===========
# 
# * In the example above, we get an answer only when the grade is greater than 50.
# * Suppose we want to get the answers "Passed" or "Failed", depending on the grade.
# 
# One way:

x <- as.integer(readline("Enter your grade: "))
if (x>50) {
    "Passed!"
}
if (x <= 50) {
    "Failed"
}

x <- as.integer(readline("Enter your grade: "))
if (x>50) {
    "Passed!"
}
if (x <= 50) {
    "Failed"
}

# Better way: Using the `else` statement together with `if`.

x <- as.integer(readline("Enter your grade: "))
if (x>50) {
    "Passed!"
} else {
    "Failed"
}

# if-else one liner
# -----------------
# The if-else statement is actually a function, returning the last statement in the executed block. We can use this feature to capture the output of the if-else and store it in a variable.

x <- 45
status <- if (x>50) "Passed" else "Failed"

status

# Relational operators
# ===========
# 
# In the examples above, we have used the `>` (greater than) operator. There are several such operators for comparing values. Each of these expressions return Boolean (True/False) values.
# 
# |operation|meaning|
# |:--------|:------|
# | a == b | a is equal to b |
# | a != b | a is not equal to b |
# | a < b | a is less than b |
# | a <= b | a is less than or equal to b |
# | a > b | a is greater than b |
# | a >= b | a is greater than or equal to b |
# 
# * Equality check is done with **two** equal signs.
# * Mind the syntax: `<=` is correct, `=<` is incorrect.
# * With strings, these operations test for alphabetical ordering

2 < 5
2 >= 5
1 == 2
1 != 2

# You should not check the equality of floating-point numbers directly. The limits of internal representation (truncation error and roundoff error) sometimes make some numbers differ, even though they should be theoretically the same. The `all.equal()` function is designed to check for almost-equality, within the errors of the machine.

x <- 10.1 - 10
y <- 0.1
x == y

all.equal(x,y)

# When used with vectors, these operations are applied elementwise, and a Boolean vector is returned.

x <- c(2,3,4)
y <- c(6,1,4)
x >= y

# Note that the `if()` statement expects a single True/False value as an argument. When it receives a Boolean vector, it uses only the first element to make the comparison.

if (x>=y) "foo" else "bar"

# If you want to check if the relation holds for every pair of elements in x and y, you should use the `all()` function.

x <- c(2,3,4)
y <- c(1,0,3)
if(all(x>=y)) "foo" else "bar"

# Logical operators
# ==========
# Often, we need to combine two or more conditions in order to get a more complicated condition. For example
# 
#     IF (you are younger than 18) AND (you are male) THEN (you are a boy).
#     IF (you have heart condition) OR (you are pregnant) THEN (you should not drink alcohol).
#     IF (you are older than 18) AND (you are NOT married) THEN (you can get married).
# 
# Every logical condition can be expressed by combining AND, OR, and NOT operators.
# 
# |operation|meaning|
# |:--------|:------|
# | a & b | Boolean AND for vectors |
# | a &#124; b | Boolean OR for vectors |
# | !a | Boolean negation |
# | a && b | Boolean AND for scalars |
# | a &#124;&#124; b | Boolean OR for scalars |

x <- c(T, F, T, F)
y <- c(F, T, T, F)
x & y
x | y
get_ipython().system('x')

# As seen above, `&` and `|` operators can take vector operands, and return a vector of Booleans. In contrast, `&&` and `||` operators work with scalars and return _only a single Boolean value_. If vectors are given to them as operands, they use _only the first elements_ of these vectors.

(1>2) && (3<5)

c(T,F) || c(F,F)  # same as T || F

# This distinction exists because `if()` should take only a single Boolean value for comparison. It would not be correct to use `&` with `if`, though it will give us an answer based on the first elements.

x <- c(TRUE, FALSE, TRUE)
y <- c(TRUE, TRUE, FALSE)
if (x[1] && y[1]) "Both True!"

if (x & y) "Both TRUE"

# Vectorized if-else: The ifelse() function
# =========
# We see that `if` requires a single Boolean expression as its condition. Now suppose we have a vector of ages. Based on this, we want to create a list with two values: `"Child"` or `"Adult"`.

ages <- c(Ali=16, Fatma=9, Mehmet=65, Elif=41, Zehra=12)
ages

# The usage `if(ages<18)` does not work because `if` expects a single True/False value, while `ages<18` is a vector.

if(ages<18) "Child" else "Adult"

# To get a vector consisting of desired values, we use the vectorized function `ifelse()`.

ages<18

ifelse(ages<18, "Child","Adult")

# Nested if-else statements
# ============
# Any kind of statements can be put into an `if`-block, including other `if` statements. This allows us to make successive decisions. For example, here is a code that prints the level of a grade.

x <- as.integer(readline("Enter your grade: "))
if (x>75) {
    "Top"
} else if (x>50) {
    "Middle"
} else if (x>25) {
    "Low"
} else {
    "Bottom"
}

# The same structure can also be written in one line, but it would not be very readable.

x <- readline("Enter your grade: ")
if (x>75) "Top" else if (x>50) "Middle" else if (x>25) "Low" else "Bottom"

# Here is a nested `if-else` structure that determines the region where a given point belongs.

x <- 5
y <- -3
if(x>0) {
    if(y>0) {
        "upper right"
    } else {  # y<=0
        "lower right"
    }
} else {  # x<=0
    if(y>0) {
        "upper left"
    } else { # y<=0
        "lower left"
    }
}

# As another example, let us read an integer, and produce a response according to whether it is negative, divisible by two, or divisible by three.

n <- as.numeric(readline("Enter an integer: "))
if (n<0) {
    "Negative."
} else {
    if (n%%2 == 0) {
        "Divisible by 2."
    } else {
        if (n%%3 == 0) {
            "Divisible by 3."
        } else {
            "Nonnegative, not divisible by 2 or 3."
        }
    }
}
