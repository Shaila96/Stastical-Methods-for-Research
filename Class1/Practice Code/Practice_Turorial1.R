########################
##       Basics       ##
########################

#Variable assignment
a = 1
a

#Functions - invoked by name
c(1, 2, 3)

#Install packages
install.packages()


#Create vector
z = c(1:10)
z

vector = c(2, 9, 1, "a")

#Read from keyboard
y = scan()
y

#Help
#c -> Combine Values into a Vector or List
?c
help(c)

#Case Sensitive
Help(c)




#########################
## Workspace and Files ##
#########################


#list is different from vector; it cannot have different type
current_dir = getwd()
current_dir

dir.create("testdir")
list.files()

setwd("testdir")
current_dir = getwd()
current_dir

dirname(dirname(current_dir))
setwd(dirname(dirname(current_dir)))
current_dir = getwd()
current_dir

#If recursive is FALSE; the directory will not be deleted, not even empty ones.
unlink("testdir")
list.files()

unlink("testdir", recursive = TRUE)
list.files()

dir.create("testdir2/testdir3", recursive = TRUE)
list.files()
unlink("testdir2", recursive = TRUE)
list.files()





#########################
##   Basic Data Types  ##
#########################


#---------------- Numeric Types
#Decimal values are called numerics
#Default computational data type
x = 5
class(x)
is.integer(x)
is.numeric(x)

y1 = as.integer(3.25)
is.integer(y1)
y1

y2 = as.integer("3.25")
is.integer(y2)
y2

y3 = as.integer("abc")
is.integer(y3)
y3

is.integer(1:10)
is.integer("a":"c")




#---------------- Complex Number
z = 1 + 2i
z

#It will return error
z <- sqrt(-1)
Z

#Solution1
z <- sqrt(-1+0i)
z

#Solution2
z <- sqrt(as.complex(-1))
z




#---------------- Logical Operations
x=4
y=10
z=6

comparison1 = x > y
comparison1

comparison2 = y > z
comparison2

comparison1 | comparison2


bool = T
bool



#---------------- Character Variables
x = as.character(5.16)
x
class(x)


fname = "Shaila"; lname="Zaman"
paste(fname, lname)

#Use collaspe if you want a space
paste0(fname, lname, 3)
sprintf("%s has %d dollars", "Sam", 100)


#---------------- Sequences
seq1 = rep(c(1,2), each=3)
seq1

seq2 = rep(c(1,2), times=3)
seq2
sort(seq2)

sort(seq2) == seq1
seq1 == seq2


identical(seq1, seq2)
identical(seq1, sort(seq2))



#---------------- Vectors
x = c(5.4, 3.6, 3.2, 1.4, 14, 22.7)

temp = x > 13
temp

x = x * 2 + 100
x
y = sqrt(x)
x
y

recycling = c(1,2,3,4,5,6) + c(0,10)
recycling

paste(LETTERS, 1:4, sep="-")

my_char = c("my","name","is")
paste(my_char, collapse=" ")



#---------------- Subsetting a vector
#Index starts with 1
s = c(11, 22, 33, 44, 55)
s[2:4]
s[1,2:4]  #It is not any vector, will return error
s[c(4,5,1)]
s[c(2, 4:5)]
s[rep(3,3)]
s[c(TRUE, FALSE)]
length(s)



#---------------- Missing Values
x = c(1:5,NA)
x
indices = is.na(x)
indices


0/0
Inf
is.infinite(Inf)
is.na() #for both NA and NaN
is.nan()

#Discard of NA
x = c(1:5,NA)
y = sort(x)
y



#---------------- Matrices - single class of data
z=1:20

#Dimension
dim(z) = c(4,5) 
z
which(z<10)

my_mat = matrix(c(1:20), nrow=4, ncol=5)
my_mat

identical(my_mat, z)

nrow(z)
ncol(z)

for(i in 1:ncol(z)) {
 print("a")
}





#---------------- Data Frames
patients = c ("a", "b", "c", "d")
cbind(patients, my_mat)  #Converts into character matrix
class(my_mat)

my_data = data.frame(patients, my_mat)
my_data

class(my_data)

cnames = c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) = cnames



#---------------- List
x = c(1,2,3)
y = c(44,55,66)
z = c("d", "e", "f")

a = c(x,y,z)
b = list(x,y,z)

#All data type converted to char type
a
#List seperates the vectors and their data types
b


#Named Members
v = list(alan=c(1,2,3), james=c("ab", "cd"))
v

summary(x)
mean(x)
sd(x)



#---------------- BoxPlot
x=c(1,2,3,4,5,5,5,6)
boxplot(x, xlab="x label", ylab="y label")
title("Boxplot Figure")


#---------------- Linear Regression
?lm











