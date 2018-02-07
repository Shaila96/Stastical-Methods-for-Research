getwd()
setwd("T:\\Google Drive\\University of Houston\\CS - UH\\@@Spring 2018\\Statistical Methods for Research\\RCourse\\6. GGPlot")
getwd()


movie_data_csv <- read.csv("Movie-Ratings.csv")
head(movie_data_csv)
colnames(movie_data_csv) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")

tail(movie_data_csv)
str(movie_data_csv)

summary(movie_data_csv)
movie_data_csv[movie_data_csv$BudgetMillions>200,]


#------------------ Factors
str(movie_data_csv)
#Film & Genre are Factors. 
#These are categorical variable.
#R automatically assigns string values to factors and numerical values to number type.
#R assigns some numbers for each different variable. 
#So, in Genre there are repeatation of numbers.(1,2,3....)

#R is showing year as other numerical values, not any categorical variable.
#We will learn how to convert a non-factor numerical variable to factor numeric variable
summary(movie_data_csv)

factor(movie_data_csv$Year)
movie_data_csv$Year <- factor(movie_data_csv$Year)

#Year is no longer a numerical valued columns, it is now categorical
summary(movie_data_csv)
str(movie_data_csv)



#------------------ Aesthetics
library(ggplot2)
ggplot(data = movie_data_csv, aes(x=CriticRating, y=AudienceRating))

#add geometry
ggplot(data = movie_data_csv, aes(x=CriticRating, y=AudienceRating)) + 
  geom_line()
ggplot(data = movie_data_csv, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()

#add colour
ggplot(data = movie_data_csv, aes(x=CriticRating, 
                                  y=AudienceRating, 
                                  colour=Genre)) + geom_point()

#add size
ggplot(data = movie_data_csv, aes(x=CriticRating, 
                                  y=AudienceRating, 
                                  colour=Genre,
                                  size=Genre)) + geom_point()


#add size - betterment
ggplot(data = movie_data_csv, aes(x=CriticRating, 
                                  y=AudienceRating, 
                                  colour=Genre,
                                  size=BudgetMillions)) + geom_point()



#------------------ Plotting with layers

#plt is the object
plt <- ggplot(data = movie_data_csv, aes(x=CriticRating, 
                                         y=AudienceRating, 
                                         colour=Genre,
                                         size=BudgetMillions))
#point
plt + geom_point()

#line
plt + geom_line()


#multiple layers
plt + geom_point() + geom_line()
plt + geom_line() + geom_point()



#------------------ Overriding Aesthetics

plt + geom_point(aes(size=CriticRating))
plt + geom_point(aes(colour=BudgetMillions)) 

#It's the same as before
plt + geom_point()

plt + geom_point(aes(x=BudgetMillions))

#Chaning the x label
plt + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $$$")



#multiple layers
plt + geom_line() + geom_point()
plt + geom_line(size=1) + geom_point()



#------------------ Mapping vs. Setting

#Mapping
plt + geom_point(aes(colour=Genre)) 
#Setting
plt + geom_point(colour="DarkGreen") 
#Error in setting
plt + geom_point(aes(colour="DarkGreen"))


#Mapping
plt + geom_point(aes(size=BudgetMillions)) 
#Setting
plt + geom_point(size=10) 
#Error in setting
plt + geom_point(aes(size=10)) 



#------------------ Histogram and Density Charts
#Histogram
hist_plt <- ggplot(data = movie_data_csv, aes(x=BudgetMillions))
hist_plt + geom_histogram(binwidth=10)

hist_plt + geom_histogram(binwidth=10, fill="Red")
hist_plt + geom_histogram(binwidth=10, aes(fill=Genre))
hist_plt + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

#Density
density_plt <- ggplot(data = movie_data_csv, aes(x=BudgetMillions))
density_plt + geom_density()
density_plt + geom_density(aes(fill=Genre))
density_plt + geom_density(aes(fill=Genre), position="stack")


#------------------ Starting Layer Tips
hist_plt <- ggplot(data = movie_data_csv, aes(x=AudienceRating))
hist_plt + geom_histogram(binwidth=10, fill="Grey", colour="Black")

hist_plt <- ggplot(data = movie_data_csv)
hist_plt + geom_histogram(aes(x=AudienceRating), 
                          binwidth=10, 
                          fill="Grey", 
                          colour="Black")

hist_plt + geom_histogram(aes(x=CriticRating), 
                          binwidth=10, 
                          fill="Grey", 
                          colour="Black")



#------------------ Statistical Transformation
#Smoothing
?geom_smooth

plt <- ggplot(data = movie_data_csv, aes(x=CriticRating, 
                                         y=AudienceRating, 
                                         colour=Genre))
plt + geom_point()
plt + geom_point() + geom_smooth()
plt + geom_point() + geom_smooth(fill=NA)


#Boxplots
box_plt <- ggplot(data = movie_data_csv, aes(x=Genre, 
                                             y=AudienceRating, 
                                             colour=Genre))
box_plt + geom_point()
box_plt + geom_boxplot()
box_plt + geom_boxplot(size=1.2)
box_plt + geom_boxplot(size=1.2) + geom_point()

#Tips
box_plt + geom_boxplot(size=1.2) + geom_jitter()

box_plt + geom_jitter() + geom_boxplot(size=1.2)
box_plt + geom_jitter() + geom_boxplot(size=1.2, alpha=0.4)

#Same plot for CriticRating
box_plt + 
  geom_jitter() + 
  geom_boxplot(size=1.2, alpha=0.4, aes(y=CriticRating))



#------------------ Using Facets
hist_plt <- ggplot(data = movie_data_csv, 
                   aes(x=BudgetMillions))
hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black")
#Facets
#xxx~.
#By Row
hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black") + 
  facet_grid(Genre~.)

#~.xxx
#By Column
hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black") + 
  facet_grid(.~Genre)


#Scaling Facets
hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black") + 
  facet_grid(Genre~.)

hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black") + 
  facet_grid(Genre~., scales="free")


#Scatter Plot
scatter_plt <- ggplot(data = movie_data_csv, 
                      aes(x=CriticRating,
                          y=AudienceRating,
                          colour=Genre))

scatter_plt + geom_point(size=3)

#Scatter Plot Facets
scatter_plt + geom_point(size=3) + facet_grid(Genre~.)
scatter_plt + geom_point(size=3) + facet_grid(.~Year)

scatter_plt + geom_point(size=3) + facet_grid(Genre~Year)

scatter_plt + 
  geom_point(aes(size=BudgetMillions)) + 
  facet_grid(Genre~Year) +
  geom_smooth()


#------------------ Coordinates
#Limit
plt <- ggplot(data = movie_data_csv, 
              aes(x=CriticRating,
                  y=AudienceRating,
                  colour=Genre))

plt + geom_point()
plt + 
  geom_point() + 
  xlim(50, 100) +
  ylim(50, 100)



#Limit doesn't work well always
hist_plt <- ggplot(data = movie_data_csv, 
                   aes(x=BudgetMillions))
hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black")
#Works well
hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black") + xlim(0,50)
#Does not work well
#Some data is missing
hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black") + ylim(0,50)
hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black") + ylim(50,100)



#Zooming
hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black") +
  coord_cartesian(ylim=c(50,100))

hist_plt + geom_histogram(binwidth=10, 
                          aes(fill=Genre), 
                          colour="Black") +
  coord_cartesian(ylim=c(0,50))




#Improvement:
scatter_plt + 
  geom_point(aes(size=BudgetMillions)) + 
  facet_grid(Genre~Year) +
  geom_smooth()

scatter_plt + 
  geom_point(aes(size=BudgetMillions)) + 
  facet_grid(Genre~Year) +
  geom_smooth() +
  coord_cartesian(ylim=c(0,100))





#------------------ Theme
plt <- ggplot(data = movie_data_csv, 
              aes(x=BudgetMillions))
hist_plt <- plt + geom_histogram(binwidth=10, 
                                 aes(fill=Genre), 
                                 colour="Black")


hist_plt + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="Dark Green", size=30),
        axis.title.y=element_text(colour="Red", size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20))


?theme

#Legend Formatting
hist_plt + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x=element_text(colour="Dark Green", size=15),
        axis.title.y=element_text(colour="Red", size=15),
        axis.text.x=element_text(size=12),
        axis.text.y=element_text(size=12),
        
        legend.title=element_text(size=15),
        legend.text=element_text(size=12),
        legend.position=c(1,1),
        legend.justification=c(1,1),
        
        plot.title=element_text(colour="DarkBlue",
                                size=20,
                                family="Courier")
  )
















