firstVector <- c(2, 9, 8)
is.numeric(firstVector) #TRUE
is.integer(firstVector) #FALSE
is.double(firstVector) #TRUE


secondVector <- c("a", "2", "d", 98)
is.character(secondVector)

#Other functions
seq() #sequence - like ':'
rep() #replicate

seq(1, 4)
seq(1:5)
1:5 

#Benefit of sequence function is the step number
#x = 1, 3, 5, 7....
x <- seq(1, 18, 2)
x

rep(2, 5)
rep("kini", 10)

y <- c(2, 4, 6, 8)
z <- rep(y, 3)
z

x
x[2]
x[-2] #return the array without the 2nd element
x[2:5]
x[-2:-5]
x[c(4,6,7)]
x[c(-4,-6,-7)]

#Odd cases
x[0] #numeric(0)
x[120] #NA
x[-120] #x = 1  3  5  7  9 11 13 15 17

