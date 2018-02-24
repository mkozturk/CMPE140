### 21.02.2018
### Prepared by Merve Bet??l G??k??e for PS2 of CMPE140 

##########################################################################
# Exercise 1
# Create an R script that prints the absolute value of an integer vector x of length one.

x <- -10
# or, x <- as.numeric(readline("Enter an integer: "))
abs <- x
if (x < 0) {
  abs = -x
}
cat("The absolute value of ", x, " is ", abs , "\n" )

##########################################################################
# Exercise 2
# Create an R script that calculates the square root of a given integer vector x of length one, 
# if the value contained in x is negative it should return NA.

x <- as.numeric(readline("Enter an integer: "))
if (x >= 0) {
  cat("The square root is", sqrt(x))
} else cat("The square root is", NA)

# Even writing else without curly brackets is correct
# IF THERE IS ONLY ONE STATEMENT as shown above
# it is better to use them always. Reduces the mistakes and improves readability!

if (x >= 0) {
  cat("The square root is", sqrt(x))
} else {
  cat("The square root is", NA)
}

##########################################################################
# Exercise 3
# Create an R script that prints the maximum value out of the elements of a numeric vector x of length 2.

x <- c(2, 3)
if(x[1] >= x[2]) {
  print(x[1])
  # or,cat("Max value is", x[1], "\n")
} else {
  print(x[2])
}

##########################################################################
# Exercise 4
# Create an R script that prints TRUE if the elements of a vector x,
# with length 3, are strictly increasing.

x <- c(1, 4, 3)

if(x[1] < x[2] && x[2] < x[3]) print(TRUE) else print(FALSE)

# Again both if and else only has ONE STATEMENT so code above is correct
# BUT it is better to write them like below

if(x[1] < x[2] && x[2] < x[3]) {
  print(TRUE)
} else {
  print(FALSE)
}

##########################################################################
# Exercise 5
# Create an R script that prints the max value of a vector x with length 3.

x <- c(5, 6, 8)

if(x[2] < x[1] && x[3] < x[1]) {
  print(x[1]) 
} else if(x[3] < x[2] && x[1] < x[2]) {
  print(x[2]) 
} else {
  print(x[3])
}

##########################################################################
# Exercise 6
# Create an R script that, given a numeric vector x with length 3,
# will print the elements by order from high to low.

x <- c(30, 120, 100)

if (x[1] > x[2]){
  fir <- x[1]
  sec <- x[2]
} else {
  fir <- x[2]
  sec <- x[1]
}
if (x[3] > fir & x[3] > sec) {
  thi <- sec
  sec <- fir
  fir <- x[3]
} else if (x[3] < fir & x[3] < sec) {
  thi <- x[3]
} else {
  thi <- sec
  sec <- x[3]
}
cat (fir, sec, thi, "\n")

##########################################################################
## Extra Question 1 ##
# Determine whether a given year is a leap year or NOT using nested if and logical operators.

x <- as.numeric(readline(prompt = "Enter the year: "))

if (x %% 4 != 0) {
  print("it is a common year")
} else if (x %% 100 != 0) {
  print("it is a leap year")
} else if (x %% 400 != 0) {
  print("it is a common year")
} else {
  print("it is a leap year")
}

##########################################################################
## Extra Question 2 ##
# Find all the leap years between 1600-2400 using ifelse() and seq. (filtering can be needed)

years <- seq(1600, 2400, 1)
ifelse(years %% 4 == 0, years, 0)

##########################################################################
## Extra Question 3 ##
# Draw a decision tree and write the code for the problem below using nested if-else:
# If grade is less than 60, the student will "fail".
# If grade is above 60, then the student will "pass" and the corresponding "letter grade" will be asigned.

grade <- 82
if(grade < 60) {
  print("fail")
} else {
  print("pass")
  if(grade < 65){
    print("DD")
  } else if(grade < 70) {
    print("DC")
  } else if(grade < 75) {
    print("CC")
  } else if (grade < 80) {
    print("CB")
  } else if(grade < 85) {
    print("BB")
  } else if(grade < 90) {
    print("BA")
  } else {
    print("AA")
  }
}

