# Looping
# ======
# 
# "Looping" (also known as the repetition structure) refers to repeating a block of code as long as a condition is true. It is one of the fundamental structures making up programs, along with _sequential execution_ and _branching_ (decisions).
# 
# In this notebook we will describe loops in the general sense, as used in many programming languages. However, in R you don't need to use loops as often as in other languages, mostly because they are hidden inside the functions we call. For example, the `mean()` function takes a vector, adds up all elements by using a loop over it, and returns their mean. All vectorized operations have loops hidden inside them.

# The while loop
# --------------
# 
# Here is a simple example: Print the squares of 1, 2, ... 10.

i <- 1 # initialization
while (i<=10) {  # condition
    cat(i,i^2,"\n")
    i <- i+1  # update
}

# The general structure of the `while` loop is as follows:
# 
#     <initialization>
#     while( <condition> ) {
#         <statements>
#         <update variables>
#     }
# 
# The `<condition>` is a Boolean expression, usually involving existing variables. First, the condition is evaluated. If true, the block is executed (this is called one _iteration_). When the block is completed, the condition is reevaluated and the block is re-executed if necessary.
# 
# In general, we want the condition to become false eventually (except for infinite loops -- see below). So, the variables of the program must be updated within the block to ensure that. Without this update the loop would not terminate.
# 
# <h3>Example: Find the sum of elements in a vector</h3>

mydata <- c(1,4,2,5,1,4,6,2,0)
sum <- 0
i <- 1
while (i<=length(mydata)){
    sum <- sum + mydata[i]
    i <- i + 1
}
sum

# Example: Find the maximum element in a vector

mydata <- c(1,4,2,5,1,4,6,2,0)
max <- mydata[1]
i <- 2
while (i<=length(mydata)){
    if(mydata[i]>max)
        max <- mydata[i]
    i <- i + 1
}
max

# Example: Read numbers from keyboard, store in a vector

n_data <- as.numeric(readline("How many data points? "))
mydata <- c()
i <- 1
while (i<=n_data){
    x <- as.numeric(readline("Enter a number: "))
    mydata <- c(mydata,x)
    i <- i+1
}
mydata

# The for loop
# -----------
# This is an alternative repetition structure. The `for` statement does not take a Boolean condition. Instead, it takes elements from a vector one by one, and runs the loop body with the current element. The loop terminates when the last element is used.

for(i in 1:10) {
    cat(i,i^2,"\n")
}

# In many cases `for` is simpler than `while`, especially when you need to iterate over the elements of a vector. We can rewrite the previous examples with `for` as follows:

mydata <- c(1,4,2,5,1,4,6,2,0)
sum <- 0
for (d in mydata)
    sum <- sum + d
sum

# The line `for(d in mydata)` means that `d` is first assigned to `mydata[1]`, then to `mydata[2]`, etc, until all the elements in `mydata` are used up.
# 
# Here is the `for` implementation of the code that finds the maximum value in a vector.

mydata <- c(1,4,2,5,1,4,6,2,0)
max <- mydata[1]
for(d in mydata) if(d>max) max <- d
max

# Note that by using `for` you don't need to keep track of the element index. This is OK if you are interested in the element values only, but it might not work if the element's location is relevant, such as the following example.
# 
# Example: Find the index of the maximum value in a vector

mydata <- c(1,4,2,5,1,4,6,2,0)
max <- mydata[1]
maxindex <- 1
i <- 2
while (i<=length(mydata)){
    if(mydata[i]>max){
        maxindex <- i
        max <- mydata[i]
    }
    i = i + 1
}
cat(maxindex, max)

# The break statement
# ---------------
# 
# When the program encounters a `break` statement, it terminates the loop. The remainder of the block is skipped over.

i <- 1
while(i<=10){
    if(i==7)
        break
    cat("i =",i,"\n")
    i <- i+1
}

for(i in 1:10){
    if (i==7)
        break
    cat("i =",i,"\n")
}

# Example: Determine if a given number is prime

n <- 118876487131
prime <- TRUE # assume prime unless proven otherwise
i <- 2
while (i*i <= n){  # check only up to the square root of n
    if (n%%i == 0){
        prime <- FALSE
        break
    }
    i <- i+1
}
if (!prime) cat(n,"is not prime;",i,"divides it.")

# Example: Read numbers from keyboard, store in a vector

data <- c()
while (TRUE){
    x <- as.numeric(readline("Enter a number: "))
    if (is.na(x))
        break
    data <- c(data,x)
}
data

# The next statement
# -----------------

# When a `next` statement is encountered, the program returns to the beginning of the loop, skipping over the remaining statements. Caution: If the update statement is located after the `next`, the loop may not terminate.

i<-0
while(i<=10){
    i <- i+1
    if( i%%3==0 )
        next
    cat(i, "")
}

# Example: Rejecting invalid values at input

mydata <- c()
while (TRUE){
    x <- as.numeric(readline("Enter a number: "))
    if (is.na(x))
        break
    if(x<0 || x>100){
        print("Invalid range: Must be between 0 and 100.")
        next
    }
    mydata <- c(mydata,x)
}
mydata

# The repeat loop
# ------------
# Above we set up an _infinite loop_ with `while(TRUE){...}`, and used a `break` statement to end the loop. The `repeat` statement provides the same functionality. It does not take any test for repetition. To terminate it, you must `break` out of it.

i <- -2
repeat {
    i <- i + 3
    cat(i,"")
    if(i>10) break
}

# The `next` statement works in the same way in `repeat` loops.

i <- -2
repeat {
    i <- i + 1
    if (i%%3==0) next
    cat(i,"")
    if(i>10) break
}

# Nested loops
# -----------
# 
# A loop body can contain anything, including other loops. As an example, consider two vectors, and list all products of numbers where the first factor comes from the first vector, and the second vector comes from the second vector. 

a <- 2
b <- 7
cat(a, "*", b, "=", a*b, "\n")

a <- 2
b_vector <- c(7,8,9)
for (b in b_vector){
    cat(a, "*", b, "=", a*b, "\n")    
}

a_vector <- c(2,3,4,5,6)
b_vector <- c(7,8,9)
for (a in a_vector){
    for (b in b_vector){
        cat(a, "*", b, "=", a*b, "\n")
    }
}

# Example: List Pythagorean triples
# A _Pythagorean triple_ consists of three integers a,b,c such that $a^2 + b^2 = c^2$ holds. Let us determine all Pythagorean triplets such that $a,b<100$.

for (a in 1:100)
    for(b in a:100)
        for(c in b:150)
            if (a*a + b*b == c*c)
                cat(a,b,c,"\n")

# **Question.** We get repetitions such as `3 4 5` and `4 3 5`, which are really not different. How do we remove such repetitions?

# Example: Print a triangle of characters

for (row in 1:10){
    for (col in 1:row)
        cat("*")
    cat("\n")
}

for (row in 1:10){
    for (col in row:10)
        cat("*")
    cat("\n")
}

# Further examples
# --------------
# Fibonacci sequence
# A _Fibonacci sequence_ starts with 1 and 1, and each new value is the sum of the two previous values. Formally:
#
# F_1 = 1
# F_2 = 1
# F_n = F_n-1 + F_n-2
# 
# Each number in this sequence is called a _Fibonacci number_. Let us write R code that displays the first 20 Fibonacci numbers.

f1 <- 1
f2 <- 1
cat(f1,"\n")
cat(f2,"\n")
for (i in 3:20){
    temp <- f1
    f1 <- f2
    f2 <- f2 + temp
    cat(f2,"\n")
}

# Compound interest

account_balance <- 10000
interest_rate <- 0.1
years <- 10
for (y in 1:years){
    account_balance <- account_balance * (1+interest_rate)
    cat("After",y,"years your account balance is",account_balance,"\n")
}

# Series sum
# Evaluate the sum  for given 1/2 + 1/(2^2) + 1/(2^3) + ... + 1(2^n) for a given n.

n <- 5
total <- 0
for (i in 1:n) {
    total <- total + 1/2^i
}
total

n <- 10
total <- 0
for (i in 1:n) {
    total <- total + 1/2^i
}
total

# As n goes infinity, the sum must approach 1. To see this, let us wrap another loop around the code to change n.

for (n in 2:20){
    total <- 0
    for (i in 1:n) {
        total <- total + 1/2^i
    }
    cat("n =",n,", series total =",total,"\n")
}

n=1000
for (i in 1:n){
    x <- runif(1,-1,1)
    y <- runif(1,-1,1)
    if (x*x + y*y <= 1)
        total <- total + 1
}
total / n
