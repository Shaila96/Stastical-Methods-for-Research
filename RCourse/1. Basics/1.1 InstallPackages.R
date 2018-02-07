#install.packages("ggplot2")
#install.packages("swirl")
#install.packages("gdata")


?qplot()
?ggplot()
?diamonds

library(ggplot2)

qplot(data = diamonds, carat, price, 
      colour = clarity, facets = .~clarity)
