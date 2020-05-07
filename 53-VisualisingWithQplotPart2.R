
?read.csv()

#Method 1: Select the file manually
stats <- read.csv(file.choose())
stats

#Method 2: Set WD and read data
getwd()
setwd("C:\\Users\\jack-\\Documents\\UdemyRCourse")
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")
stats

#----------- Exporing data -----------------

stats
nrow(stats)
ncol(stats)
head(stats,n=10)
tail(stats,n=8)
str(stats)
summary(stats)

#----------- Using the dollar sign ---------

stats
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
stats["Angola","Birth.rate"] #Angola is not a name but a column
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)

#----------- Basic operations with a data frame ------
stats[1:10,] #Subsetting
stats[3:9,]
stats[c(4,100),]

#Remember how the [] work
is.data.frame(stats[1,]) #No need for drop=F
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])

#Multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#Add column
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

#Test of knowledge 
stats$xyz <- 1:4
head(stats,n=12)

#Remove a column
head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)

#--------------- Filtering data frames ---------
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]


stats[stats$Birth.rate>40,]
stats[stats$Birth.rate>40 & stats$Internet.users<2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)


stats[stats$Country.Name == "Malta",]


#-------------- Introduction to qplot() -----------
library(ggplot2)
?qplot()

qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(3))
qplot(data=stats,x=Income.Group,y=Birth.rate,size=I(3),colour=I("blue"))
qplot(data=stats,x=Income.Group,y=Birth.rate,geom="boxplot")

#------------- Visualising what we need ----------
qplot(data=stats,x=Internet.users,y=Birth.rate)
qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(4))
qplot(data=stats,x=Internet.users,y=Birth.rate,colour=I("red"),size=I(4))
qplot(data=stats,x=Internet.users,y=Birth.rate,colour=Income.Group,size=I(4))


#------------- Creating data frames --------------
mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <- c("Country","Code","Region")
#head(mydf)
rm(mydf)


mydf <- data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf) 

#----------- Merging data frames -------------------
head(stats)
head(mydf)

merged <-merge(stats,mydf,by.x="Country.Code",by.y="Code")
head(merged)

merged$Country = NULL
str(merged)
tail(merged)


#----------- Visualising with new split ----------
qplot(data=merged,x=Internet.users,y=Birth.rate)
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region)
#1. Shapes
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,size=I(5),shape=I(23))

#2. Transparency
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,size=I(5),shape=I(19),
      alpha=I(0.6))

#3. Title
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,size=I(5),shape=I(19),
      alpha=I(0.6),main="Birth Rate vs Internet Users")


