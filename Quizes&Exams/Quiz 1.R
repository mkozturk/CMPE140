# Calculate BMI of given people

# Initialize "heights" for Mert, Can, Cem and Hande
# who have heights 1.70, 1.78, 1.75, 1.62 respectively (IN GIVEN ORDER!)

# Replace Can with Lale, who has the height of 1.76 and put it into the
# variable named "correct_heights" WITHOUT CHANGING "heights"

# Initialize "weights" for Mert, Lale, Cem and Hande who have weights
# 73, 60, 69, 61 respectively (IN GIVEN ORDER!)

# Calculate the BMI of using the formula bmi = weight / height^2
# and put them to the variable named "bmi"

# underweight (BMI less than 18.5)
# normal weight (BMI between 18.5 & 24.9)
# overweight (BMI between 25.0 & 29.9)
# obese (BMI 30.0 and above)

# Since we know intervals for weight categories,
# find underweighted people and put them into variable named "underweight"
# find normal weighted people and put them into variable named "normal_weight"
# find overweighted people and put them into variable named "overweight"

heights <- c(Mert=1.78, Can=1.70, Cem=1.75, Hande=1.62)

correct_heights <- c(heights[1], Lale=1.76, heights[3:4])

weights <- c(Mert=75, Lale=56, Cem=80, Hande=61)

bmi <- weights / correct_heights ** 2

underweight <- bmi[bmi < 18.5]
normal_weight <- bmi[bmi > 18.5 & bmi < 25]
overweight <- bmi[bmi > 25]

# Revenue

# Initialize "capitals" for Mert, Can, Cem and Hande
# who have capital values of 10000, 70, 3500, 7000 respectively (IN GIVEN ORDER!)

# Replace Can with Lale, who has the capital of 5000 and
# put it into the variable named "correct_capitals" (WITHOUT CHANGING "capitals")

# Initialize "interest_rates" for Mert, Lale, Cem and Hande
# who have rates 0.02, 0.1, 0.05, 0.07 respectively (IN GIVEN ORDER!)

# Calculate the revenue of using the formula revenue = capital * interest_rate and
# put them to the variable named "revenue"

# Earning Categories:
# High revenue, earning more than 300
# Medium revenue, earning more than 20 and less than 300
# Low revenue, earning less than 20

# And finally, using the earning categories above:
# find high earning people and put them into the variable named "high_revenue"
# find medium earning people and put them into the variable named "mid_revenue"
# find low earning people and put them into the variable named "low_revenue"

capitals <- c(Mert=10000, Can=70, Cem=3500, Hande=7000)

correct_capitals <- c(capitals[1], Lale=5000, capitals[3:4])

interest_rates <- c(Mert=0.02, Lale=0.1, Cem=0.05, Hande=0.07)

revenue <- capitals * interest_rates

high_revenue <- revenue[revenue > 300]
mid_revenue <- revenue[revenue > 20 & revenue < 300]
low_revenue <- revenue[revenue < 20]