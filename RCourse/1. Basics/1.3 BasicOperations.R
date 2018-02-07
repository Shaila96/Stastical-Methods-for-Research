var1 = 4.5
var2 = 8.7

result = var1/var2
result

result = sqrt(57)
result

str1="Hello"
str2="Tui"

#This will add an extra space!
result = paste(str1, str2)
result

#logical operand
result = 4<5
isTRUE(result)


while(!result){
  print("Hello")
}

while(result){
  print("Hi Hi")
}

counter <- 1
while(counter<11) {
  print(counter)
  counter <- counter + 1
}


for(i in 1:5) {
  print("kini")
}

for(i in 3:8) {
  print("kini")
}

# -2, -1, 0, 1, 2
rm(answer)
x <- rnorm(1)
if(x > 1) {
  answer <- "x is greater than 1"
} else if (x >= -1) {
  answer <- "x is betwwen -1 and 1"
} else {
  answer <- "x is less than -1"
}




