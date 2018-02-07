#Read Csv File On Fly
diamondData <- read.csv(file.choose())
diamondData


library(ggplot2)

ggplot(data=diamondData[diamondData$carat<2.5,], 
       aes(x=carat, y=price, colour=clarity)) + 
  geom_point(alpha=0.1) +
  geom_smooth(method = "auto")

qplot(data = diamonds, carat, price, 
      colour = clarity, facets = .~clarity)

#geom_smooth:
#Default: (method = "auto")
#Others: (method = "gam")

getwd() 

