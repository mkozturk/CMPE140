# 02.03.2018
########################################################################## 
                              ## LAB_4 ##
########################################################################## 
## QUESTION 1 ############################################################
########################################################################## 
# "x" is a number given in base 2. 
# Convert "x" to "y" which is the corresponding value in base 10.

x <- c(1,0,0,1,1,0)   # explicitly: (2^0)*x[6]+(2^1)*x[5]+(2^2)*x[4]+(2^3)*x[3]+(2^4)*x[2]+(2^5)*x[1]
y <- 0   # just to initialize 

for(i in 0:5){
  y <- y + (2^i)*x[6-i]
}
print(y)

########################################################################## 
## QUESTION 2 ############################################################
########################################################################## 
a<- seq(from = 10, to = 20, by = 2)
b<- c()
for (i in 1:length(a)) {
  if(a[i] %% 4 == 0) {
    b[i] <- a[i]
  } else {
    b[i] <- i + 8
  }
}
print(b)

#If we run the code above, what would be output?
#Answer: [1]  9 12 11 16 13 20

##########################################################################
## QUESTION 3 ############################################################
########################################################################## 

# Population is a vector containing age data of 10000 customers of a telecommunications company.
# In order to identify its customer profile better, 
# company wants to classify the data as young(18-35), middle aged(36-55) and older(56+). 
# After this, company also wants to see how many people are there in each category respectively. 
# Start with obtaining a random sample of length 10000 between ages 18 and 75.

population <- sample(18:75 , 10000 , replace = T)

young <- NULL
mid_age <- NULL
old <- NULL

for(i in population){
  if(i  < 36){
    young <- c(young , i)
  } else {
    if(i < 56){
      mid_age <- c(mid_age , i)
    } else {
      old <- c(old , i)
    }
  }
}

print(c(length(young) ,  length(mid_age) , length(old)))

##########################################################################
## QUESTION 4 ############################################################
########################################################################## 
# You are given a "letters" vector.
# You are asked to create a vector named "howmany" counting the number of letters in vector "letters".
# letters <- c("a","a","b","a","b","b","a","b","c","b")
# Hint: you will find "4 5 1" at the and.

letters <- c("a","a","b","a","b","b","a","b","c","b")
howmany <- c(0,0,0)
for(i in 1:10){
  if(letters[i]=="a"){
    howmany[1]<-howmany[1]+1
  }else if(letters[i]=="b"){
    howmany[2]<-howmany[2]+1
  }else{
    howmany[3]<-howmany[3]+1
  }
}
print(howmany)
