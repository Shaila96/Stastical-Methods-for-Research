?matplot


matplot(Games[,1], Games[,2])
matplot(FieldGoals)

FieldGoals
#Transpose of the matrix
t(FieldGoals)

matplot(t(FieldGoals))


picture_arr = 15:18
color_vector = c(1:4, 6)
matplot(t(FieldGoals/Games), type = "b", pch = picture_arr, col = color_vector)

?legend()
legend("bottomleft", inset = 0.01, legend = Players, pch = picture_arr, col = color_vector, horiz = F)


#Most accurate player
matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch = picture_arr, col = color_vector)
legend("bottomleft", inset = 0.01, legend = Players, pch = picture_arr, col = color_vector, horiz = F)


