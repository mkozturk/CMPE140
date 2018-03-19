# We've seen that every element of a vector in R must have the same mode
# (number, character, etc.). This has the advantage of efficiency,
# and provides fast computations. However, we cannot store
# more complicated data structures, such as
# 
#     Name: Fatma
#     Salary: 5624.25
#     Full time: yes
# 
# _Lists_ provide a generalization of the basic vector structure.
# A list's elements can be of different types, allowing for
# more complicated data representations. They form the bridge between vectors
# and _data frames_, which we'll see later.
# 
# Creating lists
# ===
# In the simplest form, a list can be created with the `list()` function call.

ftm <- list("Fatma", 5624.25, TRUE)

# We can display the contents of the list we've created.

ftm

# In this form we see the elements together with their numeric indices in the list.
# We can access them separately, if we want.

ftm[[1]]

ftm[[2]]

# Note that we use double brackets `[[]]` to refer to a list element,
# not single brackets `[]` as in vectors.
# 
# However, the better practice is to use component names (called _tags_) in lists.

ftm <- list(name="Fatma", salary=5624.25, fulltime=TRUE)

ftm

# A list can also contain multiple-element vectors and lists as elements.

list(1, c(2,3), list("abc",4))

# List indexing
# ===
# When a list is created with tags, tags can be used to refer to list elements,
# using the `listname$tag` syntax.

ftm <- list(name="Fatma", salary=5624.25, fulltime=TRUE)
ftm$name

ftm$fulltime

# Alternatively, the tag can be used with the double bracket syntax.

ftm[["salary"]]

# Numeric indices are always available.

ftm[[2]]

# Selecting a range of indices
# ----
# A range of indices can be selected using the familiar vector syntax _with a single bracket_.

ftm[1:2]

ftm[c(1,3)]

# However, when we use double brackets, we can only give single indices.

ftm[[1:2]]

# Difference between indexing with single and double brackets
# ----
# The availability of two types of brackets for list indexing can be confusing.
# They can be distinguished by their rturn types:
#     * `[]` returns an object of type list
#     * `[[]]` returns a single list component, whose type is the type of
#           the particular component.

ftm[1]  # returns a list with a single component.

ftm[[1]]  # returns a one-element vector

mode(ftm[1])
mode(ftm[[1]])

# Adding and deleting list elements
# ====
# 
# Adding elements
# ---
# You don't have to provide all the elements when creating the list.
# It is possible to add them later.

ftm <- list(name="Fatma", salary=5624.25)
ftm

ftm$fulltime <- TRUE
ftm

# New list elements can also be added via vector indices.

ftm[[4]] <- 28
ftm[5:7] <- c(FALSE,TRUE,TRUE)
ftm

# This last example also shows that a list can have both tagged and untagged elements.
# 
# Delete elements
# ----
# You can delete an element by setting it to `NULL`.

ftm$fulltime <- NULL
ftm

# Note that after deletion, all elements below the deleted one are moved up
# and indices are decreased by one.

ftm[[3]] <- NULL
ftm

ftm[3:5] <- NULL
ftm

# Concatenating lists
# ----

c( list("abc", 32, T), list(5.1))

c(list(name="Fatma", salary=5624.25, fulltime=TRUE), list(hobby="painting"))

# Getting information on lists
# ===
# To get the number of elements in a list, we can use the `length()` function.

ftm <- list(name="Fatma", salary=5624.25, fulltime=TRUE)
length(ftm)

# To get the tags in a list, we use the `names()` function.

names(ftm)

# To obtain the values as a vector, we can use the `unlist()` function.

unlist(ftm)

# Note that this function returns a vector, and the numeric and
# the Boolean values are converted to strings. The reason is that
# in a vector every element must be of the same type,
# and strings are the only common denominator here.
# Applying functions to lists
# ===

# The `lapply()` function applies a function to each element of a list,
# and returns the results as a list.

lapply(list(2,3.5,4), sqrt)

# List elements can be tagged as well.

grades_1 = c(10,12,11,14,8,12)
grades_2 = c(13,11,10,11,9)
allgrades = list(section1=grades_1, section2=grades_2)
lapply( allgrades, mean)

# The `sapply()` (simple apply) function returns a vector or a matrix resulting
# from the application of the function.

sapply(allgrades, mean)

# We can define our own functions to specify what to do with each element.

mult_by2 <- function(x) {2*x}

lapply( list(1,2,3,4,5), mult_by2)

# Examples
# ===
# Calculate weekly payrolls
# ---
# Set up a list of staff members, where each element is a list consisting of names,
# wages and number of hours worked.

staff <- list(
    id000=list(name="Fatma", wage=12.5, hours=20),
    id001=list(name="Ekrem", wage=11.7, hours=30),
    id002=list(name="Deniz", wage= 13.3, hours=25)
)

# Define a function that takes one person as defined above, and returns the weekly pay.

payroll <- function(person){person$wage * person$hours}

# Now apply this function to every staff member on the list `staff`.

lapply(staff, payroll)

sapply(staff, payroll)

# Count the occurrences of numbers in a vector
# -----
# We have a vector of numbers where numbers are repeated.

data = c(1,2,3,4,1,2,3,4,1,2)

# We want to keep the count of each number in a list, such that `counts[[i]]`
# stores how many times the number `i` occurs in `data`.
# 
# Initialize the `counts` list with zeros.

counts = list(0,0,0,0)

# Now loop over the data vector, and increase the count of the appropriate number.

for (x in data) {
    counts[[x]] <- counts[[x]] + 1
}
counts

# Count the occurrences of words in a text
# -----
# Here is a simple application of textual analysis. Consider the following (short) text. We have preprocessed it to remove punctuation marks and uppercase letters.

sometext <- "my dear fellow said sherlock holmes as we sat on either side of the fire in his lodgings at baker street life is infinitely stranger than anything which the mind of man could invent we would not dare to conceive the things which are really mere commonplaces of existence if we could fly out of that window hand in hand hover over this great city gently remove the roofs and peep in at the queer things which are going on the strange coincidences the plannings the cross purposes the wonderful chains of events working through generations and leading to the most outr?? results it would make all fiction with its conventionalities and foreseen conclusions most stale and unprofitable"

print(sometext)

# Our objective is to create a list `wordcounts` such that `wordcounts[[word]]` gives the number of occurrences of `word` in the given text.
# 
# This problem is similar to the example above where we counted the occurrences of numbers. However, we don't know in advance what words and how many words we are going to encounter. So we cannot initialize the counts to zero.

wordcounts <- list()

# We will approach the problem as follows:
# 
#     for every word in the word list
#         if the word is already in the list, increase the count by 1.
#         otherwise, add this word with a count of 1.
# 
# If an element is not in a list, the list returns `NULL`.
# This can be used to check for the existence of an element in a list.

wordcounts[["sherlock"]]

is.null(wordcounts[["sherlock"]])

# So, beginning with the first word, we add it to our list:

word <- "my"
if (is.null(wordcounts[[word]])){
    wordcounts[[word]] <- 1
} else {
    wordcounts[[word]] <- wordcounts[[word]] + 1
}

# Similarly, the second word:

word <- "dear"
if (is.null(wordcounts[[word]])){
    wordcounts[[word]] <- 1
} else {
    wordcounts[[word]] <- wordcounts[[word]] + 1
}

# And now the list contains the elements we gave, and nothing more.

wordcounts

# We can't go word by word manually. The better solution is to loop over
# every word in the text. We need to find a way to convert the large string
# of text to a vector, so that we can take the words one by one.
# 
# The `strsplit()` function does that for us:

strsplit(sometext, split=" ")

# Note that `strsplit()` returns a list. The first element of this list
# is the vector of strings we look for.

wordsintext = strsplit(sometext, split=" ")[[1]]

for (word in wordsintext){
    if (is.null(wordcounts[[word]])){
        wordcounts[[word]] <- 1
    } else {
        wordcounts[[word]] <- wordcounts[[word]] + 1
    }
}

wordcounts

# Get the words that occur more than twice
# ---

wordcounts[unlist(wordcounts) > 2]

# Sort the list, most frequent word first
# -----

unlist(wordcounts)

order(unlist(wordcounts),decreasing = T)

wordcounts[order(unlist(wordcounts),decreasing = T)]

# Location of words
# -----

sometext

wordlocations <- list()

for (i in 1:length(wordsintext)){
    word <- wordsintext[i]
    wordlocations[[word]] <- c(wordlocations[[word]],i)
}
wordlocations

# Counts of words, revisited
# ----
# Using the `wordlocations` list, we can get the number of occurrences
# of words without passing over the data again. We only need to apply
# the `length()` function to the list.

lapply(wordlocations, length)
