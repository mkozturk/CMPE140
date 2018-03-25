# Flight distances
# We have latitude or longitude values for all 81 provinces and
# we have to calculate distances between them.
# 
# Get Coordinates
# Copy this method below to load coordinates.csv file into the flights DataFrame first.

coordinates <- read.csv("coordinates.csv", row.names = 1)
head(coordinates)

# Calculate Distance
# In order to calculate distance between two points on earth we use the function below:
#   
#    a = sin2(Δφ/2) + cosφ1 ∗ cosφ2 ∗ sin2(Δλ/2)
#    c = 2 ∗ atan2(√a, √1-a)
#    d = R * c
# 
# where  φφ  is latitude and  λλ  is longitude, and  RR  represents radius which is 6.371km.
# 
# We will write a function named calculate_distance which will calculate
# the distance between two points on earth using the formula above.
# 
#    Δ  means the difference (between latitude or longitude values)
#    d  is the distance we try to find
# Note: Function above works on radians but given coordinates are in degrees.
#       In order to conver them, you should use r = d ∗ π/180 where
#       d is degree and r is radians.
# 
# Hint:
#   
#   Function in R
#   atan2()

# http://www.movable-type.co.uk/scripts/latlong.html
calculate_distance <- function(prov1, prov2)
{
  rad_earth <- 6371 # radius of earth
  
  coor1 <- prov1 * pi / 180
  coor2 <- prov2 * pi / 180
  
  lat1 <- coor1[[1]]
  lng1 <- coor1[[2]]
  
  lat2 <- coor2[[1]]
  lng2 <- coor2[[2]]
  
  dlat <- lat1 - lat2
  dlng <- lng1 - lng2
  
  a <- sin(dlat / 2)^2 + cos(lat1) * cos(lat2) * sin(dlng / 2)^2
  
  cc <- 2 * atan2(sqrt(a), sqrt(1-a))
  
  distance <- rad_earth * cc
  
  return(distance)
}

# Generate Distance Matrix
# We will write the function distance_mat_gen which will calculate all the distances
# of a given coordinates and return them as a data frame. In our case, column and row names
# should be corresponding provinces.

distance_mat_gen <- function(coordinates)
{
  nprov <- nrow(coordinates)
  # Generate an empty dataframe with proper row names
  distance_mat = as.data.frame(matrix(nrow = nprov, ncol = nprov),
                               row.names=row.names(coordinates))
  # Set column names of generated empty data frame
  colnames(distance_mat) <- row.names(coordinates)
  # Iterate over provinces
  for(row in 1:nprov) {
    # Since symmetric matrix, calculating one side is enough
    for(col in row:nprov) {
      actual_dist <- calculate_distance(coordinates[row,], coordinates[col,])
      # since distances are symmetric...
      distance_mat[row, col] <- actual_dist
      distance_mat[col, row] <- actual_dist
    }
  }
  
  return(distance_mat)
}

# Another Solution with New Representation

calculate_distance2 <- function(prov1, prov2, coordinates1 = coordinates)
{
    rad_earth <- 6371 # radius of earth

    coor1 <- coordinates1[prov1,] * pi / 180
    coor2 <- coordinates1[prov2,] * pi / 180

    lat1 <- coor1[[1]]
    lng1 <- coor1[[2]]

    lat2 <- coor2[[1]]
    lng2 <- coor2[[2]]

    dlat <- lat1 - lat2
    dlng <- lng1 - lng2

    a <- sin(dlat / 2)^2 + cos(lat1) * cos(lat2) * sin(dlng / 2)^2

    cc <- 2 * atan2(sqrt(a), sqrt(1-a))

    distance <- rad_earth * cc

    return(distance)
}

calculate_distanceV <- Vectorize(calculate_distance2)

distance_mat_gen2 <- function(coordinates1 = coordinates)
{
    nprov <- nrow(coordinates1)
    distance_mat <- outer(1:nprov, 1:nprov, calculate_distanceV)

    return(distance_mat)
}

melt_distances <- function(distance_mat)
{
    nprov <- nrow(distance_mat)
    combinations <- t(combn(nprov, 2))
    
    dists <- apply(combinations, 1, function(x) distance_mat[x[1],x[2]])

    distance_mat_long <- cbind(combinations, dists)

    return(distance_mat_long)
}

distance_matt2 <- distance_mat_gen2()
melted_dist <- melt_distances(distance_matt2)
head(distance_matt2)
head(melted_dist)
