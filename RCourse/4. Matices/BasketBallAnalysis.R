#Subset plotting

#Global Settings
picture_arr = 15:18
color_vector = c(1:4, 6)

data_range <- 3 
plot_matrix(MinutesPlayed, data_range)


data_range <- 1:5
plot_matrix(MinutesPlayed, data_range)


plot_matrix(Points, data_range)

#Function
plot_matrix <- function(matrix_name, data_range=1:10) {
  data <- matrix_name[data_range,,drop=F]
  matplot(t(data), type = "b", pch = picture_arr, col = color_vector)
  legend("bottomleft", inset = 0.01, legend = Players[data_range], pch = picture_arr, col = color_vector, horiz = F)
}


#Basketball Data Analysis
plot_matrix(Salary)

#Some anomalies are showed in the plot
plot_matrix(Salary/Games)
plot_matrix(Salary/FieldGoals)

#In-Game Matrics
plot_matrix(MinutesPlayed)
plot_matrix(Points)

#Data Normalization to remove anomalies
plot_matrix(FieldGoals/Games)
plot_matrix(FieldGoals/FieldGoalAttempts)
plot_matrix(FieldGoalAttempts/Games)
plot_matrix(Points/Games)

#interesting observations
plot_matrix(MinutesPlayed/Games)
plot_matrix(Games)

#Goal per time
plot_matrix(FieldGoals/MinutesPlayed)

#Player style
plot_matrix(Points/FieldGoals)



