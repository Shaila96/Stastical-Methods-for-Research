?read.csv()

#Method 1: Select the file manually
demographic_data <- read.csv(file.choose())
demographic_data


#Method 2: Set WD and Read Data
getwd()
setwd("T:\\Google Drive\\University of Houston\\CS - UH\\Research - CPL\\R Codes\\RCourse\\5. Data Frames")
getwd()

demographic_data <- read.csv("DemographicData.csv")
demographic_data


#---------------- Exploring Data
demographic_data
nrow(demographic_data)
ncol(demographic_data)

#Top 5/6 data
head(demographic_data)
head(demographic_data, n=10)
tail(demographic_data)

#Structure
str(demographic_data)
runif(demographic_data) # r uniform; like r norm
summary(demographic_data)


#---------------- Using the $ sign
#Find Birthrate of Angola
demographic_data
head(demographic_data)

#All are same below
#Angola is in 3rd row
demographic_data[3, 3]
demographic_data[3, "Birth.rate"]
demographic_data$Birth.rate[3]


demographic_data$Birth.rate
demographic_data[, "Birth.rate"]


levels(demographic_data$Income.Group)

#---------------- Basic Operations of Data Frame
#subsetting
demographic_data[1:10,]
demographic_data[3:6,]
demographic_data[c(4,100),]


demographic_data[1,]
is.data.frame(demographic_data[1,]) #no need for drop=F

demographic_data[,1]
is.data.frame(demographic_data[,1]) #need for drop=F
is.data.frame(demographic_data[,1,drop=F])

#Multiply Columns
head(demographic_data)
demographic_data$Birth.rate * demographic_data$Internet.users
demographic_data$Birth.rate + demographic_data$Internet.users

#Add Columns
demographic_data$New.column <- demographic_data$Birth.rate + demographic_data$Internet.users
head(demographic_data)

demographic_data$Testing.column <- 1:5
head(demographic_data, n=8)

#Remove Columns
head(demographic_data)
demographic_data$New.column <- NULL
demographic_data$Testing.column <- NULL


#---------------- Filtering Data Frames
head(demographic_data)
internet.filter <- demographic_data$Internet.users < 2
demographic_data[internet.filter,]


demographic_data[demographic_data$Birth.rate>40, ]
demographic_data[demographic_data$Birth.rate>40 & demographic_data$Internet.users<2,]
demographic_data[demographic_data$Income.Group == "High income",]


#---------------- Introduction to qplot()
library(ggplot2)

qplot(data = demographic_data, x=Internet.users)
qplot(data = demographic_data, x=Income.Group, y=Birth.rate)
qplot(data = demographic_data, x=Income.Group, y=Birth.rate, size=3)
qplot(data = demographic_data, x=Income.Group, y=Birth.rate, size=10)
qplot(data = demographic_data, x=Income.Group, y=Birth.rate, size=I(10))
qplot(data = demographic_data, x=Income.Group, y=Birth.rate, size=I(10), colour=I("Blue"))
qplot(data = demographic_data, x=Income.Group, y=Birth.rate, geom = "boxplot")


#---------------- Visualizing what we need
qplot(data = demographic_data, x=Internet.users, y=Birth.rate)
qplot(data = demographic_data, x=Internet.users, y=Birth.rate, size=I(3), colour=I("Red"))
qplot(data = demographic_data, x=Internet.users, y=Birth.rate, size=I(3), colour=Income.Group)
qplot(data = demographic_data, x=Internet.users, y=Birth.rate, size=I(3), colour=Income.Group)


#---------------- Creating Data Frames
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")

##Long Way
region_code_df <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(region_code_df)

colnames(region_code_df) <- c("Country", "Codes", "Regions")
colnames(region_code_df)

rm(region_code_df)


##Short Way
region_code_df <- data.frame(Country=Countries_2012_Dataset, Codes=Codes_2012_Dataset, Regions=Regions_2012_Dataset)
colnames(region_code_df)
head(region_code_df)
summary(region_code_df)



#---------------- Merging Data Frames
summary(demographic_data)
summary(region_code_df)
?merge()
merged_df <- merge(demographic_data, region_code_df, by.x = "Country.Name", by.y = "Country")
summary(merged_df) 

merged_df$Code <- NULL
str(merged_df)

#---------------- Visualizing with new split
qplot(data=merged_df, x=Internet.users, y=Birth.rate, colour=Regions, size=I(2))

#1.Shapes
qplot(data=merged_df, x=Internet.users, y=Birth.rate, colour=Regions, 
      size=I(2), shape=I(17))

#2.Transparency
qplot(data=merged_df, x=Internet.users, y=Birth.rate, colour=Regions, 
      size=I(5), shape=I(17), alpha=I(0.2))
qplot(data=merged_df, x=Internet.users, y=Birth.rate, colour=Regions, 
      size=I(5), shape=I(17), alpha=I(0.7))

#3.Title
qplot(data=merged_df, x=Internet.users, y=Birth.rate, 
      colour=Regions,size=I(5), 
      shape=I(17), alpha=I(0.6),
      main="Birth Rate vs. Internet Users")






