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


#----------------- Mapping Vs Setting 

r <- ggplot(data = movies, aes(x=CriticRating,y=AudienceRating))
r + geom_point()

#Add colour
#1. Mapping (What we have done so far)
r + geom_point(aes(colour=Genre))

#2. Setting
r + geom_point(colour = "Dark Green")

#Error 
#r + geom_point(aes(colour="Dark Green"))



#1. Mapping 
r + geom_point(aes(size=BudgetMillions))

#2. Setting 
r + geom_point(size=10)

#Error 
#r + geom_point(aes(size=10))

#------------- Histograms and Density Charts ----------

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#Add colour
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#Add a border
s + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black")
#>>>> 3 (We will improve it)


#Density charts
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre),position="Stack")

#------- Starting layer tips --------

t <- ggplot(data = movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill = "White",colour = "Blue")

#Another way:

t <- ggplot(data = movies)
t + geom_histogram(binwidth = 10, aes(x=AudienceRating), fill = "White", colour = "Blue")

#>>>>> 4

t + geom_histogram(binwidth = 10, aes(x=CriticRating), fill = "White", colour = "Blue")

#>>>> 5


t <- ggplot()


#---------- Statistical Transformations ---------

?geom_smooth()
u <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#Boxplot
u <- ggplot(data = movies, aes(x = Genre,y = AudienceRating, colour = Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2)  + geom_point()

#Tip / hack

u + geom_boxplot(size=1.2)  + geom_jitter()

#Another way;
u + geom_jitter() + geom_boxplot(size=1.2,alpha=0.5)
#>>>> 6

#Mini challenge
u <- ggplot(data = movies, aes(x = Genre,y = CriticRating, colour = Genre))
u + geom_jitter() + geom_boxplot(size=1.2,alpha=0.5)

#---------- Using Facets -----------

v <- ggplot(data = movies, aes(x = BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black")

#Facets:
v + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black") +
  facet_grid(Genre~.,scales="free")

#scatterplots
w <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,colour=Genre))
w + geom_point(size=3)

#Facets
w + geom_point(size=3) + facet_grid(Genre~.)

w + geom_point(size=3) + facet_grid(.~Year)

w + geom_point(size=3) + facet_grid(Genre~Year)

w + geom_point(size=3) + facet_grid(Genre~Year) + geom_smooth()

w + geom_point(aes(size=BudgetMillions)) + facet_grid(Genre~Year) + geom_smooth()
#>>>> 1 (But still will remove)

#------------- Coordinates ---------
#Today:
#Limits
#Zoom

m <- ggplot(data = movies, aes(x=CriticRating,y=AudienceRating,size=BudgetMillions,colour=Genre))

m + geom_point()

m + geom_point() + xlim(50,100) + ylim(50,100)

#Won't always work well
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") + ylim(0,50)

#Instead
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") + coord_cartesian(ylim=c(0,50))

#Improve #1
w + geom_point(aes(size=BudgetMillions)) + facet_grid(Genre~Year) + geom_smooth() + coord_cartesian(ylim=c(0,100))

#---------- Theme ------------
o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black")

#Axes Label
h + xlab("Money Axis") + ylab("Number of Movies")

#Label formatting
h + xlab("Money Axis") + ylab("Number of Movies") + theme(axis.title.x = element_text(colour="Dark Green",size=30),
                                                          axis.title.y = element_text(colour = "Red",size=30))

#Tick mark formatting 
h + xlab("Money Axis") + ylab("Number of Movies") + 
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
  axis.title.y = element_text(colour = "Red", size=30),
  axis.text.x = element_text(size=20),
  axis.text.y = element_text(size=20))

?theme()

#Legend formatting 
h + xlab("Money Axis") + ylab("Number of Movies") + 
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
        axis.title.y = element_text(colour = "Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))

#Title
h + xlab("Money Axis") + ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
        axis.title.y = element_text(colour = "Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="Dark Blue",size="40"))

