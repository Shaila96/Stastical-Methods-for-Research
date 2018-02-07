x <- c("a", "b", "c", "d", "e")
x

#Vector subsetting
x[c(1,5)]
x[1]


#Matrix subsetting
Games
Games[1:3, 6:10]

Games[c(1,10),]
Games[c("KobeBryant","LeBronJames"),]

Games[,c(4,5,8)]
Games[,c("2008","2009","2012")]

#Not a matrix
#When the data is one dimensional, R takes as a vector instead of matrix
Games[1,]
is.matrix(Games[1,])
is.vector(Games[1,])

Games["KobeBryant","2009"]
is.matrix(Games["KobeBryant","2009"])
is.vector(Games["KobeBryant","2009"])

#dropping the dimension of array, set to false
#R will not guess the type based on the dimension
Games[1,,drop=F]
is.matrix(Games[1,,drop=F])
is.vector(Games[1,,drop=F])

Games[1,5,drop=F]
is.matrix(Games[1,5,drop=F])
is.vector(Games[1,5,drop=F])


#Subset plotting
picture_arr = 15:18
color_vector = c(1:4, 6)

data_range <- 1:3
data <- MinutesPlayed[data_range,]
plot_matrix(data, data_range)

#Problem with this range
#Because R takes this as vector
#So, add drop when initialize data
data_range <- 3 
data <- MinutesPlayed[data_range,,drop=F]
plot_matrix(data, data_range)


data_range <- 1:5
data <- MinutesPlayed[data_range,,drop=F]
plot_matrix(data, data_range)


data <- Points[data_range,,drop=F]
plot_matrix(data, data_range)


#Function
plot_matrix <- function(data, data_range=1:10) {
  matplot(t(data), type = "b", pch = picture_arr, col = color_vector)
  legend("bottomleft", inset = 0.01, legend = Players[data_range], pch = picture_arr, col = color_vector, horiz = F)
}


