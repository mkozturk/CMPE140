# Section 1 Question
#
# First, import the file “USA_data.csv" into R. 
# 
# Then plot UNEMPLOYMENT and INFLATION on the same graph against TIME.
# 
# You will use plot( ) and lines( ) functions.
# 
# Label the x-axis as “Years” and limit x axis by 1960 and 2018.
# Label the x-axis as "Unemp & Inf” and limit y axis by 0 and 15.
# Set the color for Unemployment to “blue”.
# Set the color for Inflation to “red”.
# Set the title of the figure as "Philips Curve”.

mydata <- read.csv("USA_data.csv")

plot(mydata$TIME , mydata$UNEMPLOYMENT, col="blue", type="l",lwd=3, 
     xlab="Years", ylab="Unemp & Inf", xlim=c(1960,2018), ylim=c(0,15))

lines(mydata$TIME , mydata$INFLATION, col="red", type="l",lwd=3)

title("Philips Curve")

# Section 2 Question
#
# First, import the file "Sales.csv" into R. 
# 
# Make a probability density plot of “Quantity” using hist( ) function and
# add a density curve on this plot by using the lines( ) function
# 
# Set the title of the figure as "Histogram for Sales”.
# Label the x-axis as “Sales”. 
# Set the color to “green”.
# 
# Hint: Use probabilities in your histogram.
# Hint: lines( ) function will include density( ) of the relevant data.

mydata <- read.csv("Sales.csv")

hist(mydata$Quantity, breaks = 15, col = "green", freq = F,
     main = "Histogram for Sales", xlab = "Sales")

lines(density(mydata$Quantity))
