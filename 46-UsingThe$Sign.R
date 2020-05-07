
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
