# Section 1 Question
# You are given a dataframe as below
# 
# Names <- c("Ayse","Burak","Cem","Deniz","Elif","Fatma","Hasan","Kaan","Mehmet","Tarik")
# Education <- c("HighSc","College","College","College","HighSc","Primary","College","College","Primary","HighSc")
# Wages <- c(2500,5000,7000,6000,4000,1000,4500,9000,4500,3500)
# 
# df <- data.frame(Names, Education, Wages, stringsAsFactors = F)
# 
# You are asked to create a factor object with name Educ_fac with
# ordered three levels: “Primary”, “HighSc” and “College”.
# 
# Create a dataframe with name df_new using vectors Names, Educ_fac and Wages.
# Be sure that class of Educ_fac is factor, Names is character and Wages is numeric.
# You may check by summary(df_new) and should get an output as below:
#   
# > summary(df_new) 
# Names              Educ_fac     Wages
# Length:10          Primary:2   Min.   :1000
# Class :character   HighSc :3   1st Qu.:3625
# Mode  :character   Collage:5   Median :4500
# Mean   :4700
# 3rd Qu.:5750
# Max.   :9000
# 
# Draw a plot which has Primary, HighSc, and College in its X-axes and
# corresponding “Wages” in its Y-axes. Do not forget to put the title “Education and Wages”
# and labels “Education Status” and “Wages” for x and y axes.

Names <- c("Ayse","Burak","Cem","Deniz","Elif","Fatma","Hasan","Kaan","Mehmet","Murat")
Education <- c("HighSc","College","College","College","HighSc","Primary","College","College","Primary","HighSc")
Wages <- c(2500,5000,7000,6000,4000,1000,4500,9000,4500,3500)

df <- data.frame(Names, Education, Wages, stringsAsFactors = F)

Educ_fac <- factor(Education, levels = c("Primary", "HighSc", "College"), ordered = TRUE)

df_new <-  data.frame(Names, Educ_fac, Wages, stringsAsFactors = F)

plot(Educ_fac, Wages, main="Education and Wages", xlab="Education Status", ylab="Wages")

# Section 2 Question
# You are given a dataframe as below
# 
# Names <- c("Ayse","Burak","Cem","Deniz","Elif","Fatma","Hasan","Kaan","Mehmet","Murat")
# Employment <- c("Unemp","Emp","Unemp","Emp","Emp","Unemp","Emp","Emp","Unemp","Emp")
# Wages <- c(1000, 5000, 1000, 7000, 4000, 1000, 4500, 9000, 1000, 3500)
# df <- data.frame(Names, Employment, Wages, stringsAsFactors = F)
# 
# You are asked to create a factor object with name Emp_fac with
# ordered two levels: “Unemp”, “Emp”.
# 
# Create a dataframe with name df_new using vectors Names, Emp_fac and Wages.
# Be sure that class of Emp_fac is factor, Names is character and Wages is numeric.
# You may check by summary(df_new) and should get an output as below:
#   
#   > summary(df_new)
# Names            Emp_fac      Wages     
# Length:10          Unemp:4   Min.   :1000  
# Class :character   Emp  :6   1st Qu.:1000  
# Mode  :character             Median :3750  
# Mean   :3700  
# 3rd Qu.:4875  
# Max.   :9000
# 
# Write a function with name Emp_fnc. You should NOT change any part
# except for removing the line where “write your code here” is written.
# Write your code after removing that line as explained below.
# 
# Emp_fnc <- function(data) {
#   
#   *** write your code here ***
#     
#     return(Emp_people)
#   
# }
# 
# The input of Emp_fnc is any dataframe with three columns Names, Emp_fac, and Wages.
# 
# This function subsets the Names and Wages of Employed people in a given dataframe;
# assigns it to a dataframe named Emp_people and returns Emp_people as an output.
# 
# Example usage of the function Emp_fnc with data df_new is given here:
#   
# > Emp_fnc(df_new)
# 
# Names  Wages
# 2  Burak  5000
# 4  Deniz  7000
# 5   Elif  4000
# 7  Hasan  4500
# 8 Serkan  9000
# 10 Tarik  3500

Names <- c("Ayse","Burak","Cem","Deniz","Elif","Fatma","Hasan","Kaan","Mehmet","Murat")
Employment <- c("Unemp","Emp","Unemp","Emp","Emp","Unemp","Emp","Emp","Unemp","Emp")
Wages <- c(1000, 5000, 1000, 7000, 4000, 1000, 4500, 9000, 1000, 3500)

df <- data.frame(Names, Employment, Wages, stringsAsFactors = F)

Emp_fac <- factor(Employment, levels = c("Unemp","Emp"), ordered=TRUE)

df_new <-  data.frame(Names, Emp_fac, Wages, stringsAsFactors = F)

Emp_fnc <- function(data) {
  
  Emp_people <- data[Emp_fac=="Emp",-2]
  
  return(Emp_people)
}

Emp_fnc(df_new)