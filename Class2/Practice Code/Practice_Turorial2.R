##################################
## Introduction to R and ggplot ##
##################################


#------------------ Swirl
install.packages("swirl")
library("swirl")
swirl()


#------------------ Categorical Variable
sample_data <- sample(0:1, 20, replace=TRUE)
sample_data

is.factor(sample_data)
is.numeric(sample_data)


my_factor <- factor(sample_data, labels = c("low", "high"))
my_factor

is.factor(my_factor)

my_factor <- factor(sample_data, labels = c("low"))
my_factor





#------------------ Splitting
?rnorm
my_matrix <- matrix(rnorm(30), nrow = 5, ncol = 6)
my_matrix

# 1 means row and 2 means column
?apply
# Rowwise is 1 and Columnwise is 2
sum_matrix <- apply(my_matrix, 2, sum)
sum_matrix


#lapply - apply a function to each element of a list and get a list back

# Create a list with 2 elements
my_list = list(a = 1:10, b = 11:20)

# The mean of the values in each element
mean_list <- lapply(my_list, mean)
mean_list


#tapply - when you want to apply a function to subsets of a vector and 
#the subsets are defined by some other vector, usually a factor
x <- 1:20
letters = c("a", "b", "c", "d", "e")
x_factor <- factor(rep(letters, each = 4))
x_factor

x
tapply(x, x_factor, sum)
tapply(x, x_factor, mean)
?tapply


#------------------ Built-in data frame in R
#'mtcars' dataset - Motor Trend Car Road Tests
data(mtcars)
dim(mtcars)
str(mtcars)
structure(mtcars)
summary(mtcars)


?mtcars


mtcars[1,4]
mtcars["Mazda RX4", "hp"]
head(mtcars)
tail(mtcars, 5)


mtcars[1,]
mtcars[,4]
mtcars[,c(1,3)]
mtcars["AMC Javelin",]
mtcars[,"mpg"]



mtcars$mpg
names(mtcars)

mpg
attach(mtcars)
mpg


table(cyl)
table(mpg)
detach(mtcars)

mtcars[mtcars$mpg>mean(mtcars$mpg),]
mtcars[mtcars$mpg>mean(mtcars$mpg),"cyl"]


#------------------ Histogram
hist(mtcars$hp, xlab="hp",
     main="Histogram of horse power of cars")

hist(mtcars$hp, xlab="hp",
     breaks=seq(0, 350, by=10),
     main="Histogram of horse power of cars")
seq(0, 350, by=10)


#Probability Density: Set Frequency False
hist(mtcars$hp, xlab="hp",
     main="Histogram of horse power of cars", freq=FALSE)
lines(density(mtcars$hp))



#------------------ GGPLOT2
# 1. Data are the variables mapped to aesthetic features of the graph.
# 2. Geoms are the objects/shapes you see on the graph.
# 3. Stats are stastical transformations that summarize data, such as the
# mean or confidence intervals.
# 4. Scales define which aesthetic values are mapped to data values.
# 5. Legends and axes display these mappings.
# 6. Coordiante systems define the plane on which data are mapped on
# the graphic.
# 7. Faceting splits the data into subsets to create multiple variations of
# the same graph (paneling).

#install.packages("ggplot2")
library(ggplot2)

#For Quick Plot
qplot(data=mtcars, x=hp)

#For fine, granular control of everything
#Grammar of graphics

# data
# aesthetic mapping
# geometric object
# statistical transformations
# scales
# coordinate system
# position adjustments
# faceting

ggplot(data=mtcars, aes(hp)) + geom_histogram()
ggplot(data=mtcars, aes(hp)) + geom_histogram(binwidth=5)




#--------------------- Exercise 1
?par
par(mfrow=c(2,2))

hist_mpg=mtcars$mpg
yrange=c(0,15)

get_break<-function(break_val) {
  return(seq(0, 45, by=break_val))
}

draw_hist <- function(break_val) {
  hist(hist_mpg, xlab="mpg",
       breaks=get_break(break_val), ylim=yrange,
       main="Histogram with width ", break_val)
}


draw_hist(2)
draw_hist(3)
draw_hist(4)
draw_hist(9)

# hist(hist_mpg, xlab="mpg",
#      breaks=get_break(2), ylim=yrange,
#      main="Histogram with width 2")
# hist(hist_mpg, xlab="mpg",
#      breaks=get_break(3), ylim=yrange,
#      main="Histogram with width 3")
# hist(hist_mpg, xlab="mpg",
#      breaks=get_break(4), ylim=yrange,
#      main="Histogram with width 4")
# hist(hist_mpg, xlab="mpg",
#      breaks=get_break(9), ylim=yrange,
#      main="Histogram with width 9")




#--------------------- Exercise 2
par(mfrow=c(1,1))

boxplot(mtcars$mpg[mtcars$gear==5], xlab="mpg with gear=5")

attach(mtcars)
boxplot(mpg[gear==5], xlab="mpg with gear=5")

title("Boxplot of mpg with 5 gears")

means <- mean(mpg[gear==5])
points(means, col="red", pch=8)






#--------------------- Exercise 3
gear_factor <- factor(mtcars$gear, labels = c("fast", "medium", "slow"))
# gear_factor
# is.factor(gear_factor)


# par(mfrow=c(1,3))
# 
# draw_box_plot <- function(val) {
#   boxplot(mpg[gear==val], xlab=paste("gear is ", val))
#   
#   title("Boxplot of mpg with ", val," gears")
#   
#   means <- mean(mpg[gear==val])
#   points(means, col="red", pch=8)
# }
# draw_box_plot(3)
# draw_box_plot(4)
# draw_box_plot(5)



par(mfrow=c(1,1))
boxplot(data=mtcars, mpg~gear_factor, main="Car Milage Data",
        xlab="Gear Levels", ylab="Miles Per Gallon")
means <- tapply(mpg, gear_factor, mean)
points(means, col="red", pch=8)
  
  
  
  
#--------------------- Exercise 3 in ggplot  
give.n <- function(x){
  return(data.frame(y = max(x)+1,
                    label = paste0("n = ",length(x))))
}


plot <- ggplot(mtcars, aes(x=gear_factor, y=mpg))
plot + 
  geom_boxplot() +
  scale_x_discrete(name="Number of gears") +
  ggtitle("Boxplot of gears vs miles per gallon") +
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_summary(fun.y="mean", geom="point", size=2, pch=8, color="red") +
  stat_summary(fun.data = give.n, geom = "text") +
  theme(text = element_text(size=14))







#--------------------- Exercise 4
str(mtcars)
cylinder_factor = factor(mtcars$cyl, labels = c("4cyl", "6cyl", "8cyl"))
cylinder_factor

par(mfrow=c(2,2))
boxplot(data=mtcars, hp~cylinder_factor, main="Car Horse Power",
        xlab="Cylinder Type", ylab="Horse Power")
boxplot(data=mtcars, mpg~cylinder_factor, main="Miles Per Gallon",
        xlab="Cylinder Type", ylab="MPG")
boxplot(data=mtcars, gear~cylinder_factor, main="Gear",
        xlab="Cylinder Type", ylab="Gear")
boxplot(data=mtcars, wt~cylinder_factor, main="Weight",
        xlab="Cylinder Type", ylab="Weight")













