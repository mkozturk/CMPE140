# **DATA FRAMES**

# A "data frame" is a special type of list that has equally sized vectors - that may be of different types - as items 
# 
# Now let's create some vectors of equal length and of different types

names <- c("Ian", "Ritchie", "Jack", "Roger", "Jon", "Steve", "Don", "David")

homework <- c(95, 60, 40, 40, 100, 25, 50, 94)

midterm<-c(80, 62, 38, 20, 74, 56, 18, 67)

final<-c(87, 50, 62, 10, 72, 61, 27, 60)

attendance<-c(T, F, F, F, T, T, T, T)

names
class(names)

homework
class(homework)

midterm
class(midterm)

final
class(final)

attendance
class(attendance)

#create a data frame with the given information
results_1 <- data.frame(names, homework, midterm, final, attendance)
results_1

# Now, let's change the length of a vector

midterm_2 <- midterm[-1]
midterm_2
results_2<-data.frame(names, homework, midterm_2, final, attendance)
results_2

# Hmm did not recycle vectors of size 8 and 7

# Now let's try a similar thing

midterm_2 <- midterm[1:4]
midterm_2
results_2<-data.frame(names, homework, midterm_2, final, attendance)
results_2

# **See, when the vector lengths are multiples of one another, R recycles to get a data.frame**
# 
# **However when the lengths are not multiples, R throws an error and does not accept to recycle!**

# Now let's first create a list and then convert it into a data.frame

results_2 <- list(names = names, homework = homework, midterm = midterm, final = final, attendance = attendance)
results_2
attributes(results_2)
class(results_2)
length(results_2)

# Does it have a dimension attribute?

dim(results_2)

# Before taking a look at the attributes of a data frame, let's create a sample matrix - to see the differences and similarities, and get its length:

a <- matrix(1:40, nrow = 8)
a
length(a)

# See, a length of a matrix is the count of all cells, so it is basically (count of rows)*(count of columns)

# Now create a data frame with "as.data.frame" function and see its attributes and length.
# 
# Not that "stringsAsFactors = F" is supplied so that character values are not automatically converted to categoric variables

results_3 <- as.data.frame(results_2, stringsAsFactors = F)
results_3
attributes(results_3)
class(results_3)
length(results_3)

names(results_3)
colnames(results_3)
rownames(results_3)

# For the time being, the stringsAsFactors = F is necessary so that characters are not automatically converted to factor levels. One by one!
# 
# It looks like a matrix, does it behave like a matrix?
# 
# Length returns number of columns for a data.frame, however for a matrix it gives rows*columns.
# 
# So technically a data.frame is closer to a list than it is to a matrix, althogh the appearance resembles a matrix
# 
# What else? For example, does it have a dimension attribute?

dim(results_3)

# So a data frame is a list with dimension attribute. However it still has a length! Just like a list...

# Just as a matrix is a vector with a dimension attribute but still has a length, just as a vector!

# Let's convert it back to a list

as.list(results_3)

# Now, let's subset a data frame in different ways, and see the class of outputs

results_3[1]

class(results_3[1])

# Since a data frame is a list of equal length vectors with a dimension attribute, we can subset it with single brackets and a single index, just like a list
# 
# And the output is a data.frame!

# Now let's subset it with 2 indices, just like a matrix

results_3[1,1]

class(results_3[1,1])

# So when a df is subsetted with two indices, and items from a single column is returned, we get inside the object - the column

# How about that:

results_3[1,1:2]

class(results_3[1,1:2])

# When we subset two columns wtih two indices, the result is still a data.frame! 

# How about that:

results_3[1][1]

# You just subset the first column of a data frame that is itself a single column!

class(results_3[1][1])

# Now let's subset with double brackets, just like a list!

results_3[[1]]
class(results_3[[1]])

# So we get inside the object, just like list indexing with double brackets

# And we can chain subsetting operators to get into the items, just like in lists:

results_3[[1]][1]
class(results_3[[1]][1])

# How about subsetting with names

results_3$names[1]
class(results_3$names[1])

results_3[["names"]][1]
class(results_3[["names"]][1])

# What if we cbind a vector?

instruments <- c("vocals", "guitar", "drums", "bass", "hammond organ", "guitar", "hammond organ", "vocals")

results_4 <- cbind(results_3, instruments)
results_4
class(results_4)

# See it retains its data.frame status

# Now add a column by assignment

results_4 <- results_3
results_4
results_4$instruments <- instruments
results_4
class(results_4)

# Add a column by indexing

results_4 <- results_3
results_4[6] <- instruments
results_4
class(results_4)

results_4 <- results_3
results_4
results_4[[6]] <- instruments
results_4
class(results_4)

# They all work

# And to delete

results_5 <- results_4
results_5
results_5[6] <- NULL
results_5

results_5 <- results_4
results_5
results_5[[6]] <- NULL
results_5

# Now let's subset only vocals from the data frame

results_4 <- cbind(results_3, instruments)
results_4[results_4$instrument == "vocals",]

# And get only attendance values

results_4[results_4$instrument == "vocals","attendance"]

results_4[results_4$instrument == "vocals",]$attendance

results_4[results_4$instrument == "vocals",5]

results_4[results_4$instrument == "vocals",][5]

# The last one returns a data.frame, other ones return boolean vectors

# And we can subset with explicit boolean vectors - instead of boolean tests - of course

results_4[c(T,F,F,F,F,F,F,T),]

# Let's add a row

glenn <- c("Glenn", 93, 74, 85, TRUE, "bass")
glenn

results_6 <- rbind(results_4, glenn)
results_6

class(results_6$homework)

# See, since the numbers in the vector are coerced to characters, the related columns are also coerced to characters
# 
# So what should we do, to add a row, without messing up the column types?

glenn_2 <- list("Glenn", 93, 74, 85, TRUE, "bass")
glenn_2

results_6 <- rbind(results_4, glenn_2)
results_6

class(results_6$homework)

# Since data frame is a list, can we lapply or sapply through it?

lapply(results_6, class)

sapply(results_6, class)

# Yes SURELY we can!!!

### Exercise
# Let's create a simple data frame from 3 vectors. 
# Then, Order the entire data frame by the first column.

v <- c(45:41, 30:33)
b <- LETTERS[rep(1:3, 3)]
n <- c(1,6,3,5,2,4,6,9,2)

df <- data.frame(Age = v, Class = b, Grade = n)
df
order(df$Age)
df[order(df$Age), ]  

### Exercise
# Use the (built-in) dataset VADeaths.
# a) Make sure the object is a data frame, if not change it to a data frame.
class(VADeaths)
df <- as.data.frame(VADeaths)
class(df)

# b) Create a new variable, named Total, which is the sum of each row.
df$Total <- df[, 1] + df[, 2] + df[, 3] + df[, 4]
df

# c) Change the order of the columns so total is the first variable.
df <- df[, c(5, 1:4)]
df

### Exercise
# Use the (built-in) dataset state.x77.
# a) Make sure the object is a data frame, if not change it to a data frame.
state.x77
class (state.x77)
df <- as.data.frame(state.x77)

# b) Find out how many states have an income of less than 4300.
nrow(subset(df, df$Income < 4300))

df[df$Income < 4300, ]
# c) Find out which is the state with the highest income.
df[max(df$Income)==df$Income, ]

# If you need, you may found more exercises here :) 
# https://www.r-exercises.com/start-here-to-learn-r/


