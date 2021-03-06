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


p <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating, 
                             colour=Genre,size=BudgetMillions)) 

#Points
p + geom_point()

#Lines
p + geom_line()

#Multiple layers
p + geom_point() + geom_line() 
p + geom_line() + geom_point()


#---------- Overriding aestetics---------

q <- ggplot(data = movies, aes(x=CriticRating,y=AudienceRating,colour=Genre,
                               size=BudgetMillions))

#Add geom layer
q + geom_point()

#Overriding aestetics - Example 1
q + geom_point(aes(size=CriticRating))

#Overriding aestetics - Example 2
q + geom_point(aes(colour=BudgetMillions))

#Q remains the same 
q + geom_point()

#Overriding aestetics - Example 3
q + geom_point(aes(x=BudgetMillions)) +xlab("Budget Millions $")

#Overriding aestetics - Example 4
q + geom_line() + geom_point()
q + geom_line(size=1) + geom_point()


