
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
