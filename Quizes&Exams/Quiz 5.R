# Section 1 Question
# Your plot should include three subplots. They should be placed vertically in given order.
# 
# Line plot: showing the changes in merchandise exports (csh_x) with a blue line and
# residual trade (csh_r) with a red line over time (year).
  # Title should be “csh_x & csh_r“
  # x-axes should be labeled as “Years“
  # y-axes should be labeled as “Shares“
# Histogram: Histogram should represent government consumption (csh_g).
  # Title should be “Histogram“
  # x-axes should be labeled as “Government Consumption“
  # It should have 7 breaks and the bars should be colored green
  # x-axes should be limited by 0.05 and 0.25
# Pie chart: This plot should be the absolute of averages of shares labeled
# with the name of the header. For example, “csh_m” labeled slice of the pie chart
# has the value of 0.08966396.
  # Title should be “Pie Chart“

data <- read.table("CGDPo.tsv", dec = ",", header = T)

par(mfrow=c(3,1))

plot(data$year, data$csh_x, 
     type="l", 
     col="blue", 
     main="csh_x & csh_r",
     xlab="Years", 
     ylab="Shares")
lines(data$year, data$csh_r, col="red")


hist(data$csh_g, 
     breaks =7,
     col="green", 
     xlab="Government Consumption",
     main="Histogram", 
     xlim=c(0.05,0.25))


total <- abs(apply(data, 2, mean)[-1])
pie(total, main="Pie Chart")

# Section 2 Question
# Your plot should include four subplots in 2×2 shape which are described below in top-to-bottom and left-to-right.
# 
# Box Plot: Plot the government consumption which has the title csh_g in the data.
# This plot should have title Box Plot above.
#
# Scatter Plot: This plot should represent household consumption
# which has the title csh_c in the data. Points should be green circles.
# It should have title Index on below, Consumption on left, and Plot above.
# 
# Histogram: This plot should also represent the government consumption data.
# Bars should be colored red. Bar count should be 4.
# The plot should be titled Government Consumption below and Histogram above.
#
# Strip Plot: This plot should represent government consumption again.
# Points should be blue circles. The plot should be titled Strip Chart above.

data <- read.table("CGDPo.tsv", dec = ",", header = T)

par(mfrow=c(2,2))

boxplot(data$csh_g, main = "Box Plot")

plot(data$csh_c, col = "green", xlab = "Index", ylab = "Consumption", main = "Plot")

hist(data$csh_g, col = "red", breaks = 3,
     xlab = "Government Consumption", main = "Histogram")

stripchart(data$csh_g, pch = 1, col = "blue", main = "Strip Chart")
