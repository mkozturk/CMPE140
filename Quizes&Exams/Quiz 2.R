# 02.03.2018
########################################################################## 
                               ## QUIZ_2 ##
########################################################################## 
# QUESTION 1 ############################################################# 

### STORY:   ############################################################# 
# There is a factory producing thousands of standardised glass bottles everyday.
# However sometimes there seems to be a problem concerning the weight of the bottles. 
# The factory owner who believes in the importance of standardisation 
# wants to eliminate those bottles which are either lighter or heavier
# (more than 2 grams) than the standard mean (which= 130 gr) from the production band.
# To do that he hired you and you should write a code.
# The code you write should state for a given list of bottles whether a bottle is approved or rejected.

### TASKS:   ############################################################# 
# Task1: Create a vector named "weights" holding this list of weights: 129, 130, 128.6, 127.9, 131, 133, 134.
# Task2: Write a "for loop" which assigns the weights in acceptance region to a vector "approved" and 
# assigns the weights out of the acceptance region to a vector "rejected". 

### SOLUTION:############################################################# 

weights<-c("1"=129,"2"=130,"3"=128.6,"4"=127.9,"5"=131,"6"=133,"7"=130,"8"=134)

rejected <- c()
approved <- c()

for (i in weights) {
  if  (i<132 & i>128){ 
    rejected <- c(rejected,i)
  } else
  {
    approved <- c(approved,i)
  }
}

## ANSWER ############################################################# 
# > weights
# 1     2     3     4     5     6     7     8 
# 129.0 130.0 128.6 127.9 131.0 133.0 130.0 134.0 
# > approved
# [1] 127.9 133.0 134.0
# > rejected
# [1] 129.0 130.0 128.6 131.0 130.0

##########################################################################
# QUESTION 2 ############################################################# 

## MAKING A NUMBER COUNTER
# Here, you have 100 random numbers between 1 and 6. 
# (6,5,5,5,4,6,5,3,3,3,5,3,5,4,1,5,4,6,5,3,1,3,4,4,6,1,2,3,6,1,2,1,4,6,3,6,3,6,5,1,3,4,6,4,3,6,2,5,4,4,4,2,2,5,4,2,2,2,2,6,5,5,1,4,3,4,4,1,4,1,2,3,2,6,2,1,3,6,4,6,1,4,5,4,2,5,5,2,2,1,1,1,2,3,5,2,2,3,5,4)
# Create a vector named "vec" holding these numbers.
# Then, create a vector "count" of length 6, holding HOW MANY 1,2,3,4,5 and 6's are in your sample.
# As an example, for a small sample of  " 1 1 4 3 1 4 5 6 6 6 1" , 
# you would have the "count" vector as " 4 0 1 2 1 3 " because there are 4 one's, 0 two's, just 1 three and so on.
# Just be sure that sum of the numbers in "count" vector should be 100 ;)

### SOLUTION:############################################################# 
vec <- c(6,5,5,5,4,6,5,3,3,3,5,3,5,4,1,5,4,6,5,3,1,3,4,4,6,1,2,3,6,1,2,1,4,6,3,6,3,6,5,1,3,4,6,4,3,6,2,5,4,4,4,2,2,5,4,2,2,2,2,6,5,5,1,4,3,4,4,1,4,1,2,3,2,6,2,1,3,6,4,6,1,4,5,4,2,5,5,2,2,1,1,1,2,3,5,2,2,3,5,4)
count <- c(0,0,0,0,0,0)
for(i in 1:100){
  for(k in 1:6){
    if(vec[i]==k){
      count[k]<- count[k]+1
    }
  }
}
print(count)
## ANSWER ############################################################# 
# > count
# [1] 14 18 16 20 18 14
