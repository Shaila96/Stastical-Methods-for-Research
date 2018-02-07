#---- matrix()
?matrix()

my.data <- 1:20
my.data

M <- matrix(my.data, nrow = 2)
M

N <- matrix(my.data, nrow = 2, byrow = TRUE)
N


#---- rbind()
r1 <- c("a", "b", "c")
r2 <- c(3, 6, 9)
r3 <- c(0.1, 0.5, 0.2, 0.7)

R <- rbind(r1, r2, r3)
R



#---- rbind()
c1 <- 1:5
c2 <- -1:-5

C <- cbind(c1, c2)
C
colnames(C) <- c("a", "b")
rownames(C) <- c("m", "n", "o", "p", "q")
C

C[1, 2]
c[1, 'b']

C[, 2]

