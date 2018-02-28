### 28.02.2018
### Week 4
### Prepared by _MerveBetul_ for PS4 of CMPE140 
################################################################################
## Agenda of This Week ##
# The while loop
# The next statement
# The break statement
# Infinite loops (with while and break)
# The repeat loop
# The for loop
# Nested loops

################################################################################
# The repeat{} loop processes a block of code until the condition specified by the break statement, 
# (that is mandatory within the repeat{} loop), is met.

#The structure of a repeat{} loop is:
#  repeat {
#    commands
#    if(condition) {
#      break
#    }
#  }

# Exercise 1
# Write a repeat{} loop that prints all the even numbers from 2 – 10, via incrementing the variable, “i <- 0“.

i <- 0

repeat{
  i <- i + 2
  print(i)
  if(i == 10){
    break
  }
}

################################################################################
# Exercise 2
#Using the following variables:
# Write a repeat{} loop that breaks off the incrementation of, “i“, after 5 loops, and prints “msg” at every increment.

msg <- c("Hello")
i <- 1

repeat{
  i <- i+1
  print(msg)
  if(i>5){
    break
  }
}

################################################################################

# while() loop will repeat a group of commands until the condition ceases to apply. 
# The structure of a while() loop is:
  
#  while(condition) {
#    commands
#  }


################################################################################
# Exercise 3
# With, i <- 1, write a while() loop that prints the odd numbers from 1 through 7.

i <- 1

while(i <= 7){
  print(i)
  i <- i + 2
}

################################################################################
# Exercise 4
# Write a while() loop that increments the variable, “i“, 6 times, and prints “msg” at every iteration.

msg <- c("Hello")
i <- 1

while(i <= 6){
  print(msg)
  i <- i + 1
}

################################################################################

# The for() loop repeats commands until the specified length of the condition is met. 
# The structure of a for() loop is:
#  for(condition) { commands }

################################################################################
# Exercise 5
# Write a for() loop that prints the first four numbers of this sequence: x <- c(7, 4, 3, 8, 9, 25)

x <- c(7, 4, 3, 8, 9, 25)
for(i in 1:4) {
    print(x[i])
}

# or, here another way:

for(a in x[1:4]) {
    print(a)
}

################################################################################
# Exercise 6
# Write a for() loop that prints all the letters in y <- c("q", "w", "e", "r", "z", "c").

y <- c("q", "w", "e", "r", "z", "c")
for(element in y) {
  print(element)
}

# or, here another way:

y <- c("q", "w", "e", "r", "z", "c")
for(i in 1:6) {
  print(y[i])
}

################################################################################

# The break statement is used within loops to exit from the loop. 
# If the break statement is within a nested loop, the inner loop is exited, and the outer loop is resumed.

################################################################################
# Exercise 7
# Using i <- 1, write a while() loop that prints the variable, “i“, (that is incremented from 1 – 5), 
# and uses break to exit the loop if “i” equals 3.

i <- 1

while(i < 6){
  i <- i + 1
  if(i == 3){
    break
  }
  print(i)
}

################################################################################
# Exercise 8
# Write a nested loop, where the outer for() loop increments “a” 3 times, 
# and the inner for() loop increments “b” 3 times. 
# The break statement exits the inner for() loop after 2 incrementations. 
# The nested loop prints the values of variables, “a” and “b“.

for(a in 1:3){
  for(b in 1:3){
    print(c(a,b))
    if(b == 2){
      break
    }
  }
}

################################################################################
# The next statement is used within loops in order to skip the current evaluation,
# and instead proceed to the next evaluation.

################################################################################
# Exercise 9
# Write a while() loop that prints the variable, “i“, that is incremented from 2 – 5, 
# and uses the next statement, to skip the printing of the number 3.

i <- 1

while(i < 5){
  i <- i + 1
  if(i == 3){
    next
  }
  print(i)
}


################################################################################
# Exercise 10
# Write a for() loop that uses next to print all values except “3” in the following variable: i <- 1:5

i <- 1:5
for(val in i){
  if(val == 3){
    next
  }
  print(val)
}

################################################################################
################################################################################
                            ## Suggested Problems ##
################################################################################
################################################################################
# Q1. Write a code that finds the "divisors" of a given number.

x <- 35
for(i in 1:x){
  if(x%%i == 0){
    print(i)
  }
}

################################################################################
# Q2. Write a code that finds whether a given number is "prime or not".

x <- 196
x_minus <- x-1

for(i in 2:x_minus){
  if(x%%i==0){
    prime_dummy<-0
    break
  }
  prime_dummy<-1
}

if(prime_dummy==0){
  print("not prime!")
}else{
  print("yes prime!")
}

################################################################################
#Q3 Write a code that finds the "prime factors" of a given number.

num <- sample(200, 1)
print(num)

factors <- NULL
for(divisor in 2:ceiling(sqrt(num))) {
  while(num %% divisor == 0) {
    factors <- c(factors, divisor)
    num <- as.integer(num / divisor)
  }
}
factors <- if(num > 2) c(factors, num) else factors

print(factors)


################################################################################