data1 <- 1:5
data1

#Call names
names(data1)

#Assign names with same function!
names(data1) <- c("a", "b", "c", "d", "e")
data1

data1[4]
data1["d"]

names(data1) <- NULL
data1


#Naming of matices
temp_vect <- rep(c(3, 7, 2), each = 4)
temp_vect


?rbind()
?matrix
#matrix1 <- rbind(temp_vect, nrow(3))
matrix1 <- matrix(temp_vect, nrow = 3)
matrix1

rownames(matrix1)
rownames(matrix1) <- c("row1", "row2", "row3")
matrix1

colnames(matrix1)
colnames(matrix1) <- c("col1", "col2", "col3", "col4")
matrix1

matrix1[2, ]
matrix1[ ,4]

matrix1[2, 4]
matrix1["row2", "col4"]

matrix1["row2", "col4"] <- -99

matrix1[2, 4]
matrix1["row2", "col4"]

matrix1









