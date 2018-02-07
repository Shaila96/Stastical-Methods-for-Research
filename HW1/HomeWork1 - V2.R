#--------------------------#
#        Question 1        #   
#--------------------------#

criminal_justice_df = read.csv("T:/Google Drive/University of Houston/CS - UH/@@Spring 2018/Statistical Methods for Research/HW1/Criminal Justice Expenditures.csv")
criminal_justice_df

structure(criminal_justice_df)
str(criminal_justice_df)


is.numeric(criminal_justice_df$STATE)
is.factor(criminal_justice_df$STATE)

is.numeric(criminal_justice_df$POP)
is.numeric(criminal_justice_df$EXPEND)

#------------------------------------------------------- 1.a
#Density Function - Skewed or not
#Kernel Density Plot
?density
d <- density(criminal_justice_df$EXPEND) # returns the density data
plot(d)

#Mean, SD, Median
mean(criminal_justice_df$EXPEND)
median(criminal_justice_df$EXPEND)
mode(criminal_justice_df$EXPEND)
sd(criminal_justice_df$EXPEND)


#------------------------------------------------------- 1.b
d <- density(criminal_justice_df$EXPEND/criminal_justice_df$POP) # returns the density data
plot(d)



#------------------------------------------------------- 1.c

#Set or Query Graphical Parameters
?par
#mar: margin size
#mar sequence: (down, left, up, rigth)
#mgp: axis label locations
#las: axis label orientation

graph_size_vector=c(6.5,6.5,3,6)+.1 

par(mar=graph_size_vector)
plot(x=criminal_justice_df$POP,
     y=criminal_justice_df$EXPEND,
     type="p",
     col="red")
par(new=TRUE)
plot(x=criminal_justice_df$POP,
     y=criminal_justice_df$EXPEND/criminal_justice_df$POP,
     type="p",
     col="blue",
     xaxt="n",
     yaxt="n")
axis(4)






#--------------------------#
#        Question 2        #   
#--------------------------#
down_syndrome_df = read.csv("T:/Google Drive/University of Houston/CS - UH/@@Spring 2018/Statistical Methods for Research/HW1/Down Syndrome-Australia.csv")
down_syndrome_df
# attach(down_syndrome_df)

head(down_syndrome_df)
str(down_syndrome_df)

#Total.Number.of.Births is factor here
is.factor(down_syndrome_df$Total.Number.of.Births)
is.numeric(down_syndrome_df$Total.Number.of.Births)

#Converting to numeric
down_syndrome_df$Total.Number.of.Births <- as.numeric(gsub(",", "", down_syndrome_df$Total.Number.of.Births)) 
str(down_syndrome_df)
is.numeric(down_syndrome_df$Total.Number.of.Births)


################################
## ADD xlab, ylab, main title ##
################################
#------------------------------------------------------- 2.a
bar_plot <- ggplot(down_syndrome_df, 
                   aes(x=Age.Group..Years, 
                       y=Total.Number.of.Births))
#stat_count() must not be used with a y aesthetic, so used stat("identity")
bar_plot + geom_bar(stat="identity")


#------------------------------------------------------- 2.b
bar_plot <- ggplot(down_syndrome_df, 
                   aes(x=Age.Group..Years, 
                       y=Number.of.Mothers.of.Down.Syndrome.Patients))
bar_plot + geom_bar(stat="identity")



#------------------------------------------------------- 2.c
#Describe what you found


#------------------------------------------------------- 2.d
scatter_plot <- ggplot(down_syndrome_df, 
                   aes(x=Total.Number.of.Births, 
                       y=Number.of.Mothers.of.Down.Syndrome.Patients))
scatter_plot + geom_point()








#--------------------------#
#        Question 4        #   
#--------------------------#

# 10% below 60
# Means, 60 is 10 percentile
qnorm(0.1)
# Ans. -1.281552


# 10% above 90
# Means, 90% below 90
# Means, 90 is 90 percentile
qnorm(0.9)
# Ans. 1.281552























