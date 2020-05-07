getwd()
setwd("C:\\Users\\jack-\\documents\\UdemyRCourse")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)
summary(movies)


movies$Year <- factor(movies$Year)
summary(movies)
str(movies)
