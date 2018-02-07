########################
## Distributions in R ##
########################


#--------------------- Distributions in R
help.search("distribution")

#http://www.stat.umn.edu/geyer/old/5101/rlook.html

# There are four commands for every distribution. 
# A letter is used to indicate their functionality
#
# p for "probability", the cumulative distribution function (c. d. f.)
# q for "quantile", the inverse c. d. f. (quantiles)
# d for "density", the height of probability density function (p. f. or p. d. f.)
# r for "random", a random generated number having the specified distribution 



#Functions associated with the normal distribution,
?Normal

#Probability value of the normal distribution at any point
dnorm(0)
dnorm(0,mean=3,sd=10)

dnorm(0)
pnorm(0)
qnorm(0)
rnorm(0)

# 0.5 means 50 percentile
# Probability of getting a value 0 or below is 50 Percentile
pnorm(0)
# For what value the percentile is 50
# Here, for 0 and the numbers below zero are 50 percentile
qnorm(0.5)


#Plotting the normal distribution
x = seq(-4, 4, length=100)
fx = dnorm(x)

# par(mfrow=c(1,1))
# type = l, p, h, s
# lty?
?plot
plot(x=x, y=fx, type="l", lty=2, xlab="x value",
     ylab="Density", main="Normal Distribution")



# ggplot - normal distribution
# Normal Distribution with mu = 0; sigma = 1
library(ggplot2)

?data.frame
?ggplot

df = data.frame(x=x, y=fx)
base_plot = ggplot(data=df, mapping=aes(x,y)) 

normal_distribution_plot = base_plot + 
  geom_line(linetype="dashed") + 
  ggtitle("Normal Distribution") +
  xlab("x value") + 
  ylab("Density") + 
  theme(text= element_text(size=14))

normal_distribution_plot

#Extra Decorating
normal_distribution_plot +
  theme(
      axis.title.x=element_text(colour="Dark Green", size=15),
      axis.title.y=element_text(colour="Red", size=15),
      axis.text.x=element_text(size=12),
      axis.text.y=element_text(size=12),
      
      legend.title=element_text(size=15),
      legend.text=element_text(size=12),
      legend.position=c(1,1),
      legend.justification=c(1,1),
      
      plot.title=element_text(colour="DarkBlue",
                              size=20,
                              family="Courier")
)


# Export png
current_dir = "T:\\Google Drive\\University of Houston\\CS - UH\\@@Spring 2018\\Statistical Methods for Research\\Class3\\Practice Code"

export_png = function(plot_name, directory, png_name) {
  setwd(directory)
  png(filename=png_name)
  
  plot(plot_name)
  #Device Off
  dev.off()
}

export_png(normal_distribution_plot, current_dir, "Normal_Distribution_Plot.png")


#--------------------- Normal Distribution Exercise
draw_line = function(y_val, lty_val, color) {
  lines(x=x, 
        y=y_val, 
        type="l", 
        lty=lty_val, 
        xlab="x value",
        ylab="Density", 
        main="Normal Distribution", 
        col=color)
}

y1 = dnorm(x, mean=0,sd=0.5)
y2 = dnorm(x, mean=0,sd=1)
y3 = dnorm(x, mean=0,sd=2)
y4 = dnorm(x, mean=-2,sd=0.75)


dev.off()

base_plot = plot(x=x, 
     y=y1, 
     type="l", 
     lty=1,
     xlab="x value", 
     ylab="Density",
     main="Normal Distributions with Different Parameters",
     col="red")

# draw_line(y1, "red")
base_plot = base_plot +
draw_line(y2, 2, "blue") +
draw_line(y3, 3, "green") +
draw_line(y4, 4, "yellow")

labels <- c('N(0, 0.5)', 'N(0, 1)', 'N(0, 2)', 'N(-2, 0.75)')
colors <- c('red','blue','green','yellow')
linetypes <- c(1, 2, 3, 4)
?legend


base_plot
legend('topright',
       inset=.02, 
       title="Distributions", 
       labels,
       lty=linetypes, 
       col=colors)


#####################################################################################
# Ask Geroge about exporting images  
# export_png(base_plot, current_dir, "Normal_Distribution_Diff_Parameters_Plot.png")
#####################################################################################


# plot(x=x, y=y1, type="l", lty=2, xlab="x value",
#      ylab="Density", main="Normal Distribution", col="Red")
# lines(x=x, y=y2, type="l", lty=2, xlab="x value",
#       ylab="Density", main="Normal Distribution", col="blue")
# lines(x=x, y=y3, type="l", lty=2, xlab="x value",
#       ylab="Density", main="Normal Distribution", col="green")
# lines(x=x, y=y4, type="l", lty=2, xlab="x value",
#       ylab="Density", main="Normal Distribution", col="yellow")




#--------------------- Normal Distribution Exercise with ggplot
?data.frame
d1 = data.frame(D='N(0, 0.5)', x, y=dnorm(x,0,0.5))
d2 = data.frame(D='N(0, 1)', x, y=dnorm(x))
d3 = data.frame(D='N(0, 2)', x, y=dnorm(x,0,2))
d4 = data.frame(D='N(-2, 0.75)', x, y=dnorm(x,-2,0.75))
d = rbind(d1, d2, d3, d4)

?ggplot
base_nd_ggplot = ggplot(data=d, mapping=aes(x, y, col=D))
base_nd_ggplot + 
  geom_line(aes(linetype=D)) + 
  xlab("x value")  + 
  ylab("Density") + 
  theme(legend.justification=c(1,1),
        legend.position=c(1,1),
        legend.background = element_rect(fill="transparent"))






#--------------------- The Normal Distribution - pnorm
#pnorm(x) computes the probability that a normally distributed random number < x
#Cumulative Distribution Function - c.d.f

?pnorm
pnorm(0)
pnorm(0, mean=2, sd=3)
pnorm(1)

#To find the probability that a number is larger than the given number,
#use the lower.tail option:
pnorm(1, lower.tail=FALSE)


#--------------------- The Normal Distribution - qnorm
#qnorm() is the inverse of pnorm()
#Given a probability, qnorm() returns the number whose cumulative
#distribution matches the probability.

qnorm(0.5)
qnorm(0.5,mean=1,sd=2)
qnorm(0.5,mean=2,sd=2)


#--------------------- The Normal Distribution - rnorm
rnorm(4)
rnorm(4,mean=3,sd=3)

#Plotting
y <- rnorm(200000)
hist(y, main="Histogram of rnorm")
qplot(y, binwidth=0.5)
qplot(y, binwidth=0.1)


#--------------------- Exercise 1 & 2
pnorm(1) - pnorm(-1)
pnorm(2) - pnorm(-2)


x=seq(-4,4,length=200)
y=dnorm(x)
plot(x,y,type="l", lwd=2, col="violet")
x1=seq(-2,2,length=200)
y1=dnorm(x1)
polygon(c(-2,x1,2),c(0,y1,0),col="light gray")

?ploygon



# ggplot
shade = data.frame(x=c(-2,x1,2),y=c(0,y1,0))
ggplot(df, aes(x,y)) + 
  geom_line() + 
  geom_polygon(data=shade, aes(x,y), fill="light blue")



#--------------------- Exercise 3

#d is for exact match
#p is for less than equals to
dbinom(4, size=10, prob=0.25)


dbinom(4, size=10, prob=0.25) +
  dbinom(3, size=10, prob=0.25) +
  dbinom(2, size=10, prob=0.25) +
  dbinom(1, size=10, prob=0.25) +
  dbinom(0, size=10, prob=0.25)

pbinom(4, size=10, prob=0.25)


#--------------------- Poissions Distribution
#If ?? is the average number of successes occurring in a given time interval or region 
#in the Poisson distribution, then the mean and the variance of the Poisson distribution 
#are both equal to ??. Note: In a Poisson distribution, 
#only one parameter, ?? is needed to determine the probability of an event.

dpois(11, lambda=10)
#Therefore, there is approximately 11% chance that exactly 11 cars
#would approach the tollbooth in a minute.



?pnorm
pnorm(85, mean=79, sd=13.1)

#Since we would like to find the percentages of students whose score is greater than or 
#equal to 85, we are interested in the upper tail of the normal distribution
pnorm(85, mean=79, sd=13.1, lower.tail=FALSE)
#Hence, the percentage of students scoring 85 or more in the exam is 32:3%




#--------------------- Null Hypothesis Exercise
xbar=9900
mu0=10000
sigma=120
n=30

z=(xbar-mu0)/(sigma/sqrt(n))
z


alpha=.05
z.alpha=qnorm(1-alpha)
-z.alpha