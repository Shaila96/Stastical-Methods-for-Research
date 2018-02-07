n <- 10000000
counter <- 0

#Remember: i is not the index here
#i is one of the values among n random numbers
for (i in rnorm(n)) {
  
  if (i <= 1 & i >= -1) {
    counter <- counter + 1
  }
}

result <- counter/n
result

#warnings()

rnorm(100)
