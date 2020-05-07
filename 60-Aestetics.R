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

#-------------- Aesthetics -----------------
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating,y=AudienceRating))

#Add geometry
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating)) +
  geom_point()

#Add colour
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating, 
                        colour=Genre,)) +
  geom_point()

#Add size 
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating, 
                        colour=Genre,size=Genre)) +
  geom_point()

#Add size - better way
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating, 
                        colour=Genre,size=BudgetMillions)) +
  geom_point()

#>>>> This is number 1 (we will improve it)
