library(datasets)
library(ggplot2)

data(airquality)
airquality


hist_plot1 <- ggplot(airquality, aes(x = Ozone))
hist_plot1 + geom_histogram()


hist_plot1 +
  geom_histogram(aes(y = ..density..)) +
  stat_function(fun = dnorm, colour = "red",
                arg = list(mean = mean(airquality$Ozone, na.rm = TRUE),
                           sd = sd(airquality$Ozone, na.rm = TRUE)))



barfill <- "#4271AE"
barlines <- "#1F3552"

hist_plot1 +
  geom_histogram(aes(y = ..count..), binwidth = 5,
                 colour = barlines, fill = barfill) +
  scale_x_continuous(name = "Mean ozone in\nparts per billion",
                     breaks = seq(0, 175, 25),
                     limits=c(0, 175)) +
  scale_y_continuous(name = "Count") +
  ggtitle("Frequency histogram of mean ozone")







#Two y axis
x <- 1:5
y1 <- rnorm(5)
y2 <- rnorm(5,20)
par(mar=c(5,4,4,5)+.1)
plot(x,y1,type="p",col="red")
par(new=TRUE)
plot(x, y2,type="p",col="blue",xaxt="n",yaxt="n",xlab="",ylab="")
axis(4)
mtext("y2",side=4,line=3)
legend("topleft",col=c("red","blue"),lty=1,legend=c("y1","y2"))













criminal_justice_df = read.csv("T:/Google Drive/University of Houston/CS - UH/@@Spring 2018/Statistical Methods for Research/HW1/Criminal Justice Expenditures.csv")
criminal_justice_df

library(ggplot2)

qplot(data=criminal_justice_df, 
      x=POP, 
      y=EXPEND, 
      size=I(3), 
      colour=I("Red"),
      main="Population vs. Expenditures")


#plt_total is the object
plt_total <- ggplot(data = criminal_justice_df, aes(x=POP, 
                                                    y=EXPEND, 
                                                    color=I("Red")))
#line + point
plt_total + geom_point()
plt_total + geom_line() + geom_point()


#plt_total is the object
plt_total <- ggplot(data = criminal_justice_df, aes(x=POP, 
                                                    y=EXPEND/POP, 
                                                    color=I("Red")))
#line + point
plt_total + geom_point()
plt_total + geom_line() + geom_point()


attach(criminal_justice_df)
per_capita_expenditures=EXPEND/POP
per_capita_expenditures

# per_capita_expenditures_df <- data.frame(per_capita_expenditure=EXPEND/POP)
# merged_data <- merge(criminal_justice_df, per_capita_expenditures_df)
# merged_data

qplot(data=criminal_justice_df, x=POP, y=EXPEND/POP, size=I(2), colour=I("BLUE"))

