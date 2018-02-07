#------------------- 1st Example
x <- rnorm(8)

#--- Vectorized approach ---#
#Clear way to do for loop
for(item in x) {
  print(item)
}

#---De-vectorized approach---#
for(j in 1:8) {
  print(x[j])
}


#------------------- 2nd Example
N <- 10000000
a <- rnorm(N)
b <- rnorm(N)


#---Vectorized approach---#
#Faster and Cleaner approach
c <- a*b


#---De-vectorized approach---#
#Initialize array
d <- rep(NA, N)

for(i in 1:N) {
  d[i] <- a[i]*b[i]
}



