## Making Pizza
# Interactive programming
# We are using readline function in order to get data from the user.
# 
# This way we can create interactive programs
# where user gives input to the user.


customer_age <- readline(prompt = "How old are you: ")
class(customer_age)


# readline gets the value that is written to the console.
# But value returned is character!
# In order to get the age of the we have to
# cast character into integer value this way.


customer_age <- as.integer(customer_age)
customer_age


# Now write the code which will discount for elderly people
# who are older than 65 years old.


should_discount = F
if (customer_age > 65) {
  should_discount <- T
}


## Mushroom
# Lets ask customer for some mushrooms...


# Ask for mushroom
wants_mushroom <- readline(prompt = "Would you like to have mushroom(yes/no): ")
# single liner
wants_mushroom <- if(wants_mushroom == "yes") T else F
wants_mushroom


## Pepperoni??
# Now ask customer if he would like to have pepperoni
#  and if they do how much?
# They can ask for either:
#   
# ALOT
# some
# little
#
# Do NOT forget to save this information in order to be able to calculate total cost!
#   
# PS: Also, if they talk incomrehensively, assume to put some pepperoni


# Ask for pepperoni
customer_answer <- readline(prompt = "Would you like to have pepperoni(yes/no): ")
wants_pepperoni <- if(customer_answer == "yes") T else F
# Ask for pepperoni amount
if (wants_pepperoni) {
  pepperoni_amount <- readline(prompt = "How much would you like have(ALOT/some/little): ")
  if (pepperoni_amount == "ALOT") {
    pepperoni_amount <- 3
  } else if (pepperoni_amount == "some") {
    pepperoni_amount <- 2
  } else if (pepperoni_amount == "little") {
    pepperoni_amount <- 1
  } else {
    pepperoni_amount <- 2
    print("I cannot understand what you are talking about, I will put some...")
  }
}


## Bread
# Now ask for what kind of bread he would like to have...
# 
# They can ask for either:
#   
# ultra_thin
# thin
# normal
# cheese
# garlic


# Ask for bread
bread_type <- readline(prompt = "What kind of bread would you like(ultra_thin/thin/normal/cheese/garlic): ")
bread_types <- c("ultra_thin", "thin", "normal", "cheese", "garlic")
bread_type <- match(bread_type, bread_types)

if (is.na(bread_type)) {
  bread_type <- 3
}
bread_type


## Calculate the prize
# Calculate the price of the pizza
# 
# Baking pizza costs 6$
# Mashrooms for 2$
# Pepperoni
#   ALOT for 6$
#   some for 4$
#   little for 2$
# Breads are for
#   ultra_thin for 3$
#   thin 2$
#   normal 0$
#   cheese 4$
#   garlic 3$
# and print the prize.


# Cost of making pizza
pizza_prize <- 6

# Add mushroom prize
if (wants_mushroom) {
  pizza_prize <- pizza_prize + 2
}

# Add pepperoni prize
pepperoni_prizes <- c(6, 4, 2)
if (wants_pepperoni) {
  pizza_prize <- pizza_prize + pepperoni_prizes[pepperoni_amount]
}

# Add bread prize
bread_prizes <- c(3, 2, 0, 4, 3)
pizza_prize <- pizza_prize + bread_prizes[bread_type]

# Make discount if necessary
if (should_discount) {
  pizza_prize <- pizza_prize * 0.8
}

# Print the cost
cat("Your pizza costs", pizza_prize, "$")