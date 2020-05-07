setwd("C:\\Users\\jack-\\documents\\UdemyRCourse")
getwd()

movies <- read.csv("Section6-Homework-Data.csv")

head(movies)

#Filter the data
filt <- (movies$Genre == "action") | (movies$Genre == "adventure") | (movies$Genre == "animation") | (movies$Genre == "comedy") | (movies$Genre == "drama")
filt2 <- movies$Studio %in% c("Buena Vista Studios","WB","Fox","Universal","Sony","Paramount Pictures") 


mov2 <- movies[filt & filt2,] 
mov2

#Visualisation
library(ggplot2)

#Prepare the plot data and aes layers

p <- ggplot(data = mov2, aes(x=Genre,y=Gross...US))
p

#Add geometries
q <- p + 
  geom_jitter(aes(size=Budget...mill.,colour=Studio)) +
  geom_boxplot(alpha=0.7,outlier.color = NA) 

q

#Non data ink
q <- q + xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross Percentage By Genre")

q

#Theme
q <- q + theme(
  axis.title.x = element_text(colour = "Blue", size = 30),
  axis.title.y = element_text(colour = "Blue", size = 30),
  axis.text.x = element_text(size = 30),
  axis.text.y = element_text(size = 30),
  
  plot.title = element_text(size = 40),
  
  legend.title = element_text(size=20),
  legend.text = element_text(size=20),
  
  text = element_text(family = "Comic Sans MS")
  )

q

#Final touches
q$labels$size = "Budget $M"

